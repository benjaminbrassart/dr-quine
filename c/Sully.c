#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FORMAT "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$c#define FORMAT %3$c%4$s%3$c%1$c%1$cstatic char buffer[256];%1$c%1$cstatic void run(int i)%1$c{%1$c%2$csnprintf(buffer, sizeof(buffer), %3$c./Sully_%%d%3$c, i);%1$c%2$csystem(buffer) == 0 || (exit(1), 0);%1$c}%1$c%1$cstatic void compile(int i)%1$c{%1$c%2$csnprintf(buffer, sizeof(buffer), %3$ccc Sully_%%1$d.c -o Sully_%%1$d%3$c, i);%1$c%2$csystem(buffer) == 0 || (exit(1), 0);%1$c}%1$c%1$cstatic void duplicate(int i)%1$c{%1$c%2$csnprintf(buffer, sizeof(buffer), %3$cSully_%%d.c%3$c, i);%1$c%1$c%2$cFILE *f = fopen(buffer, %3$cw%3$c);%1$c%1$c%2$cfprintf(f, FORMAT, 10, 9, 34, FORMAT, i - 1);%1$c%2$cfclose(f);%1$c}%1$c%1$cint main(void)%1$c{%1$c%2$cint i = %5$d;%1$c%1$c%2$cif (i <= -1)%1$c%2$c%2$creturn 0;%1$c%1$c%2$cduplicate(i);%1$c%2$ccompile(i);%1$c%2$cif (i > 0)%1$c%2$c%2$crun(i);%1$c}%1$c"

static char buffer[256];

static void run(int i)
{
	snprintf(buffer, sizeof(buffer), "./Sully_%d", i);
	system(buffer) == 0 || (exit(1), 0);
}

static void compile(int i)
{
	snprintf(buffer, sizeof(buffer), "cc Sully_%1$d.c -o Sully_%1$d", i);
	system(buffer) == 0 || (exit(1), 0);
}

static void duplicate(int i)
{
	snprintf(buffer, sizeof(buffer), "Sully_%d.c", i);

	FILE *f = fopen(buffer, "w");

	fprintf(f, FORMAT, 10, 9, 34, FORMAT, i - 1);
	fclose(f);
}

int main(void)
{
	int i = 5;

	if (i <= -1)
		return 0;

	duplicate(i);
	compile(i);
	if (i > 0)
		run(i);
}
