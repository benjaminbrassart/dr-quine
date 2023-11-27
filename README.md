# dr-quine

Quines at 42 Paris.
The mandatory part requires C (and optionally, assembly).
The bonus part requires another language of our choice.
I chose Python 3 and Perl 5 for the bonus part (cuz why not).

---

### Quines?
That's a great question, me who's writing this readme right now!

A quine is a program that outputs its own source code.
That's it.
Reading the source code (either at compile time or an runtime) is considered cheating.

Quines can be quite complex, in multiple language sometimes (multiquines and polyglots). The [Wikipedia article](https://en.wikipedia.org/wiki/Quine_(computing)) sums up pretty well what all this is about.

---

### How it works

The quines that we are required to write are pretty simple. They rely on a format string that formats itself, among other values.

```c
char const s[] = "s = \"%s\"";

printf(s, s);

/*
 * output:
 *
 * s = "s = "%s"" // no line feed
 */
```

They also rely on character escaping (or rather character non-escaping).

```c
printf("%c\n", 34);  // 34 = ascii value of double quote

/*
 * output:
 *
 * "
 */
```

Lastly, they rely on positional argument formatting.

```c
printf("%2$s %1$s\n", "Hello", "world!");

/*
 * output
 *
 * world! Hello
 */
```

POSIX requires `printf()` to support positional arguments. It is an extension
of the C standard (see [here](https://pubs.opengroup.org/onlinepubs/9699919799/functions/printf.html)).

With these three components, we have all we need to build a simple quine.

```c
#include <stdio.h>

int main(void)
{
    /*
        the ability to speak does not make you intelligent.
    */
    char const s[] = "#include <stdio.h>%1$c%1$cint main(void)%1$c{%1$c    /*%1$c        the ability to speak does not make you intelligent.%1$c    */%1$c    char const s[] = %2$c%3$s%2$c;%1$c%1$c    printf(s, 10, 34, s);%1$c}%1$c";

    printf(s, 10, 34, s);
}
```

Check:
```sh
#!/usr/bin/env sh
clang -Wall -Wextra -Werror quine.c -o quine
./quine > output.log
diff --color=auto output.log quine.c
```

In this example, `%1$c` expands to 10 (which is `'\n'`) in the ASCII table, `%2$c` expands to 34 (which is `'"'` in the ASCII table), and `%3$s` expands to `s`.

Basically, you have to rewrite your program while taking care of passing character that need escaping through `printf()`.

---

MIT license
