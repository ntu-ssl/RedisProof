import re
import matplotlib.pyplot as plt
from collections import defaultdict


# TODO:
# add stblib  layer
# fix memcpy and memset
# spoq2

def should_ignore(fn):
    targets = [
        "printf",
        "fprintf",
        "vfprintf",
        "fflush",
        "llvm.va_start",
        "llvm.va_end",
        "test",
        "_dictPrintStatsHt",
        "dictPrintStats"
    ]
    return fn in targets or fn.startswith("llvm.dbg")


def parse_llvm_ir(file_path, bot_fns=[], top_fns=[]):
    with open(file_path, 'r') as f:
        ir = f.read()

    # Regex match, group one is function name, group two is function block
    func_pattern = re.compile(r'define\s+.*?@([\w\.]+).*?\{([\s\S]*?)\}')
    functions = func_pattern.findall(ir)

    # Build call graph
    call_graph = defaultdict(set)
    call_graph_rev = defaultdict(set)
    # orphans = set()
    for fn, body in functions:
        call_graph[fn] = set()
        if fn not in bot_fns:
            # Find call instructions
            calls = re.findall(r'call\s+.*?@([\w\.]+)\s*\(', body)
            # if not calls:
            #     orphans.add(fn)
            for cfn in calls:
                # if cfn in orphans:
                #     orphans.remove(cfn)
                if should_ignore(cfn):
                    continue
                call_graph[fn].add(cfn)
                call_graph_rev[cfn].add(fn)

    # Calculate layer
    unvisited = set(call_graph.keys())
    layer_data = dict()

    # Find external layer
    external_layer = re.findall(r'declare\s+.*?@([\w\.]+)', ir)

    # Implementation
    def calculate_layer_recur(fn, trace):
        depth = 0 if fn in bot_fns or fn in external_layer else 1
        for cfn in call_graph[fn]:
            # Detect loop
            if cfn in trace:
                return 10000
                print("loop detected", " -> ".join(trace + [cfn]))
                return 
                # raise ValueError()
            trace.append(cfn)

            # Remove targets
            if cfn in unvisited:
                unvisited.remove(cfn)
            
            # Calculate depth (recursive)
            if cfn in layer_data:
                depth = max(depth, layer_data[cfn] + 1)
            else:
                depth = max(depth, calculate_layer_recur(cfn, trace) + 1)
            
            # Update trace
            trace.pop()

        layer_data[fn] = depth
        return depth
    
    # Move to top recrusive
    def move_to_top_recur(fn, n):
        layer = n
        for caller in call_graph_rev[fn]:
            layer = min(layer, move_to_top_recur(caller, n) - 1)
        layer_data[fn] = layer
        return layer

    # Generate layer
    while len(unvisited) != 0:
        fn = unvisited.pop()
        trace = [fn]
        calculate_layer_recur(fn, trace)

    print(call_graph)
    exit(1)
    for k, v in layer_data.items():
        print(k, v)

    # Move to top
    n = max(layer_data.values())
    # for fn in top_fns:
    #     if fn in layer_data:
    #         move_to_top_recur(fn, n)

    return call_graph, layer_data, external_layer


def visualize_graph(call_graph, layer_data, top_fns):
    import networkx as nx
    G = nx.DiGraph()

    # Add node
    layer_count = defaultdict(int)
    for fn, n in layer_data.items():
        print(fn)
        G.add_node(fn, pos=(n, layer_count[n]))
        layer_count[n] += 1

    # Add edge
    for caller, callees in call_graph.items():
        for callee in callees:
            G.add_edge(caller, callee)

    # Visualization
    plt.figure(figsize=(20, 20))
    pos = nx.get_node_attributes(G,'pos')
    nx.draw(G, pos, with_labels=True, node_size=600, node_color='lightblue', font_size=6)
    options = {"edgecolors": "tab:gray", "node_size": 600, "alpha": 0.9}
    nx.draw_networkx_nodes(G, pos, nodelist=top_fns, node_color="tab:blue", **options)
    plt.title("LLVM IR Call Graph")
    plt.show()


def write_layer(f, proj, name, prims):
    f.write(
        f"Section {name}.\n"
        "    Definition LAYER_DATA := RData.\n"
        "    Definition LAYER_CODE: string := \"./" + proj + ".json\".\n"
        "    Definition LAYER_LOAD: string := \"load_RData\".\n"
        "    Definition LAYER_STORE: string := \"store_RData\".\n"
        "    Definition LAYER_ALLOC : string := \"alloc\".\n"
        "    Definition LAYER_GET_REG: string := \"get_reg_RData\".\n"
        "    Definition LAYER_SET_REG: string := \"set_reg_RData\".\n"
        "    Definition LAYER_PRIMS: list string :=\n"
        + "\n".join(prims) + "\n        nil.\n\n"
        f"End {name}.\n\n"
    )


if __name__ == "__main__":
    file_path = "RedisFull.ll"
    bot_fns = [
        "zmalloc",
        "zfree",
        "timeInMilliseconds",
        "_dictPanic"
    ]
    top_fns = [
        "dictCreate",
        "dictExpand",
        "dictAdd",
        "dictReplace",
        "dictDelete",
        "dictDeleteNoFree",
        "dictRelease",
        "dictFind",
        "dictFetchValue",
        "dictResize",
        "dictGetIterator",
        "dictNext",
        "dictReleaseIterator",
        "dictGetRandomKey",
        "dictGenHashFunction",
        "dictEmpty",
        "dictEnableResize",
        "dictDisableResize",
        "dictRehash",
        "dictRehashMilliseconds"
    ]

    call_graph, layer_data, external_fns = parse_llvm_ir(file_path, bot_fns, top_fns)
    print(layer_data)
    external_fns = []

    visualize_graph(call_graph, layer_data, top_fns)

    # # Generate proof.v
    # proj_name = file_path.split(".")[0]
    # with open("proof.v", "w") as f:
    #     n = max(layer_data.values())

    #     # Bottom
    #     layer_prims = list(
    #         map(lambda x: f"        \"{x[0]}\" ::",
    #         filter(lambda x: x[1] == 0 and x[0] not in external_fns,
    #         layer_data.items())))
    #     write_layer(f, proj_name, "Bottom", layer_prims)

    #     # External
    #     layer_prims = list(
    #         map(lambda x: f"        \"{x[0]}\" ::",
    #         filter(lambda x: x[0] in external_fns,
    #         layer_data.items())))
    #     write_layer(f, proj_name, "External", layer_prims)

    #     # Rest
    #     for i in range(1, n + 1):
    #         layer_prims = list(
    #             map(lambda x: f"        \"{x[0]}\" ::",
    #             filter(lambda x: x[1] == i,
    #             layer_data.items())))
    #         write_layer(f, proj_name, f"Layer_{i}", layer_prims)

