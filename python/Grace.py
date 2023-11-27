#!/usr/bin/env python3

FORMAT = "#!/usr/bin/env python3{1}{1}FORMAT = {0}{2}{0}{1}PROGRAM = {0}with open('Grace_kid.py', 'w') as f: print(FORMAT.format(chr(34), chr(10), FORMAT), file=f){0}{1}MAIN = exec{1}{1}{0}{0}{0}{1}    no macros? :({1}{0}{0}{0}{1}{1}MAIN(PROGRAM)"
PROGRAM = "with open('Grace_kid.py', 'w') as f: print(FORMAT.format(chr(34), chr(10), FORMAT), file=f)"
MAIN = exec

"""
    no macros? :(
"""

MAIN(PROGRAM)
