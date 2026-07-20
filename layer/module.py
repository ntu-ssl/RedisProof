import os
import re
import networkx as nx
import matplotlib.pyplot as plt
from tree_sitter import Parser, Language
import tree_sitter_c
from collections import defaultdict

parser = Parser()
parser.language = Language(tree_sitter_c.language())

def walk(node):
    """DFS traversal of tree-sitter nodes."""
    yield node
    for child in node.children:
        yield from walk(child)


def get_functions_and_calls(tree):
    functions = []
    calls = []

    for node in walk(tree.root_node):
        if node.type == "function_definition":
            # Extract function name
            func_name = None
            declarator = node.child_by_field_name("declarator")

            if declarator:
                for n in walk(declarator):
                    if n.type == "identifier":
                        func_name = n.text.decode()
                        break

            if func_name:
                functions.append(func_name)

            # Extract calls inside this function
            for child in walk(node):
                if child.type == "call_expression":
                    fn = child.child_by_field_name("function")
                    if fn:
                        calls.append(fn.text.decode())

    return functions, calls


def build_call_graph(directory, ignores=[]):
    """
    Build file-level call graph.
    """

    file_functions = {}

    # Parse all C files
    for filename in os.listdir(directory):
        if filename.endswith(".c") and not any(filename.endswith(n) for n in ignores):
            path = os.path.join(directory, filename)
            name = os.path.split(path)[-1]
            with open(path, "rb") as f:
                code = f.read()
                tree = parser.parse(code)
                funcs, calls = get_functions_and_calls(tree)
                file_functions[name] = {
                    "functions": funcs,
                    "calls": calls
                }


    # Map function -> file
    function_to_file = defaultdict(list)

    for filename, data in file_functions.items():
        for func in data["functions"]:
            function_to_file[func].append(filename)


    # Create graph
    G = nx.DiGraph()

    # Add all files as nodes
    for filename in file_functions:
        G.add_node(filename)

    # Add edges
    for src_file, data in file_functions.items():
        for called_func in data["calls"]:
            for dst_file in function_to_file[called_func]:
                # Ignore self calls
                if src_file != dst_file:
                    G.add_edge(src_file, dst_file)


    return G

def visualize_graph(G):
    import matplotlib.pyplot as plt
    import networkx as nx

    # Ensure graph is directed
    if not G.is_directed():
        G = nx.DiGraph(G)

    plt.figure(figsize=(14, 10))

    # Hierarchical layout
    try:
        pos = nx.nx_agraph.graphviz_layout(G, prog="dot")
    except:
        pos = nx.spring_layout(G, k=2, iterations=100)

    # Draw nodes
    nx.draw_networkx_nodes(
        G,
        pos,
        node_color="lightblue",
        node_size=3000,
        edgecolors="black"
    )

    # Draw labels
    nx.draw_networkx_labels(
        G,
        pos,
        font_size=10,
        font_weight="bold"
    )

    # Draw edges with visible arrowheads
    nx.draw_networkx_edges(
        G,
        pos,
        edge_color="black",
        width=2,
        arrows=True,
        arrowstyle="->",
        arrowsize=30,
        node_size=3000,
        min_source_margin=15,
        min_target_margin=15
    )

    plt.title("C File Call Graph")
    plt.axis("off")
    plt.show()


if __name__ == "__main__":

    c_directory = "../redis"   # directory containing .c files
    ignores = ["Redis.c", "redis-cli.c", "linenoise.c", "redis-check-dump.c", "redis-check-aof.c"]

    graph = build_call_graph(c_directory, ignores)

    visualize_graph(graph)