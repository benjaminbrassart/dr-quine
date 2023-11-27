#!/usr/bin/env python3

"""
wow
"""

def colleen():
    """
    such piton
    """

    s = "#!/usr/bin/env python3{1}{1}{0}{0}{0}{1}wow{1}{0}{0}{0}{1}{1}def colleen():{1}    {0}{0}{0}{1}    such piton{1}    {0}{0}{0}{1}{1}    s = {0}{2}{0}{1}{1}    print(s.format(chr(34), chr(10), s)){1}{1}def main():{1}    colleen(){1}{1}if __name__ == {0}__main__{0}:{1}    main()"

    print(s.format(chr(34), chr(10), s))

def main():
    colleen()

if __name__ == "__main__":
    main()
