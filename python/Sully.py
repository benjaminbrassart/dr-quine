#!/usr/bin/env python3

import os

FORMAT = "#!/usr/bin/env python3{1}{1}import os{1}{1}FORMAT = {0}{2}{0}{1}{1}def duplicate(i):{1}    with open(f{0}Sully_{{i}}.py{0}, {0}w{0}) as f:{1}        print(FORMAT.format(chr(34), chr(10), FORMAT, i), file=f){1}{1}def run(i):{1}    os.system(f{0}/usr/bin/env python3 Sully_{{i}}.py{0}) == 0 or exit(1){1}{1}if __name__ == {0}__main__{0}:{1}    i = {3}{1}{1}    if os.path.basename(__file__) != {0}Sully.py{0}:{1}        i -= 1{1}{1}    duplicate(i){1}    if i > 0:{1}        run(i)"

def duplicate(i):
    with open(f"Sully_{i}.py", "w") as f:
        print(FORMAT.format(chr(34), chr(10), FORMAT, i), file=f)

def run(i):
    os.system(f"/usr/bin/env python3 Sully_{i}.py") == 0 or exit(1)

if __name__ == "__main__":
    i = 5

    if os.path.basename(__file__) != "Sully.py":
        i -= 1

    duplicate(i)
    if i > 0:
        run(i)
