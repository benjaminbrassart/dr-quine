#include <stdio.h>
#define PRINT(file, format) fprintf(file, format, 10, 34, format)
#define MAIN() int main(void){FILE *f=fopen("Grace_kid.c", "w");if(f==0){fputs("cannot write to Grace_kid.c", stderr);return 1;}char const fmt[]="#include <stdio.h>%1$c#define PRINT(file, format) fprintf(file, format, 10, 34, format)%1$c#define MAIN() int main(void){FILE *f=fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c);if(f==0){fputs(%2$ccannot write to Grace_kid.c%2$c, stderr);return 1;}char const fmt[]=%2$c%3$s%2$c;PRINT(f, fmt);fclose(f);}%1$c%1$cMAIN()%1$c";PRINT(f, fmt);fclose(f);}

MAIN()
