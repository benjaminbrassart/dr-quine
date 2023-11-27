#include <stdio.h>
/*
	some comment idk
*/
#define FORMAT "#include <stdio.h>%1$c/*%1$c%2$csome comment idk%1$c*/%1$c#define FORMAT %3$c%4$s%3$c%1$c#define PRINT(File, Format) fprintf(File, Format, 10, 9, 34, Format)%1$c#define MAIN() int main(void) { FILE *f = fopen(%3$cGrace_kid.c%3$c, %3$cw%3$c); if (f == NULL) { fputs(%3$ccannot write to Grace_kid.c%3$c, stderr); return 1; } PRINT(f, FORMAT); fclose(f); }%1$c%1$cMAIN()%1$c"
#define PRINT(File, Format) fprintf(File, Format, 10, 9, 34, Format)
#define MAIN() int main(void) { FILE *f = fopen("Grace_kid.c", "w"); if (f == NULL) { fputs("cannot write to Grace_kid.c", stderr); return 1; } PRINT(f, FORMAT); fclose(f); }

MAIN()
