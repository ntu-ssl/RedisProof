from tree_sitter import Parser, Language
import tree_sitter_c
from pathlib import Path

parser = Parser()
parser.language = Language(tree_sitter_c.language())

def find_functions(node):
    def find_functions_recur(node, tally):
        if node.type == "function_definition":
            # start_line = node.start_point[0] + 1
            # end_line = node.end_point[0] + 1
            # loc = end_line - start_line + 1

            declarator = node.child_by_field_name("declarator")
            name = "unknown"

            if declarator:
                # Get the function name from the declarator text
                name = code[
                    declarator.start_byte:declarator.end_byte
                ].decode(errors="ignore")

            tally.append(name.split("(")[0])

        for child in node.children:
            find_functions_recur(child, tally)

    tally = []
    find_functions_recur(node, tally)
    return tally

def get_stat(node):
    functions = find_functions(node)
    loc = node.end_point[0] - node.start_point[0] + 1

    return {"functions": functions, "loc": loc}


if __name__ == '__main__':
    path = "../redis"
    tally = {}
    for c_file in Path(path).glob("*.c"):
        if str(c_file) == "Redis.c":
            continue

        with open(c_file, "rb") as f:
            code = f.read()
            tree = parser.parse(code)

            tally[str(c_file)] = get_stat(tree.root_node)

    total_fs = 0
    total_loc = 0
    for k, v in tally.items():
        fs = len(v["functions"])
        loc = v["loc"]
        total_fs += fs
        total_loc += loc
        print(f"- {k}")
        print(f"    loc: {loc:<5}| functions: {fs}")

    print(total_fs, total_loc)
