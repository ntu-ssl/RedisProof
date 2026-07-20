import os
import re
import networkx as nx
import matplotlib.pyplot as plt


def extract_functions_and_calls(filepath):
    """
    Extract function definitions and function calls from a C file.
    Returns:
        functions: set of defined function names
        calls: set of called function names
    """

    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        code = f.read()

    # Remove comments
    code = re.sub(r"//.*?$|/\*.*?\*/", "", code, flags=re.MULTILINE | re.DOTALL)

    # Find function definitions
    # Example:
    # int foo(int x) {
    # void bar() {
    func_pattern = r"\b[a-zA-Z_]\w*\s+\**([a-zA-Z_]\w*)\s*\([^;]*\)\s*\{"

    functions = set(re.findall(func_pattern, code))

    # Find function calls
    # Anything followed by '(' that isn't a control keyword
    call_pattern = r"\b([a-zA-Z_]\w*)\s*\("

    calls = set(re.findall(call_pattern, code))

    keywords = {
        "if", "for", "while", "switch",
        "return", "sizeof", "typedef",
        "struct"
    }

    calls -= keywords

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

            funcs, calls = extract_functions_and_calls(path)

            file_functions[filename] = {
                "functions": funcs,
                "calls": calls
            }


    # Map function -> file
    function_to_file = {}

    for filename, data in file_functions.items():
        for func in data["functions"]:
            function_to_file[func] = filename


    # Create graph
    G = nx.DiGraph()

    # Add all files as nodes
    for filename in file_functions:
        G.add_node(filename)


    # Add edges
    for src_file, data in file_functions.items():

        for called_func in data["calls"]:

            if called_func in function_to_file:
                dst_file = function_to_file[called_func]

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
    ignores = ["Redis.c", "redis-cli.c", "linenoise.c", "redis-check-dump.c", "redis-check-aof.c", "lzf_d.c", "lzf_c.c"]

    graph = build_call_graph(c_directory, ignores)

    visualize_graph(graph)