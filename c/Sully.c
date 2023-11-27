#include <stdio.h>
#include <stdlib.h>

#define FORMAT "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$c#define FORMAT %3$c%4$s%3$c%1$c%1$cstatic char buffer[256];%1$c%1$cstatic void run(int i)%1$c{%1$c%2$csnprintf;%1$c%2$csystem(buffer);%1$c}%1$c%1$cstatic void compile(int i)%1$c{%1$c%2$csnprintf;%1$c%2$csystem(buffer);%1$c}%1$c%1$cstatic void duplicate(int i)%1$c{%1$c%2$csnprintf;%1$c%1$c%2$cFILE *f = fopen;%1$c%2$cfprintf(f, FORMAT, 10, 9, 34, FORMAT, i - 1);%1$c%2$cfclose(f);%1$c}%1$c%1$cint main(void)%1$c{%1$c%2$cint i = %5$d;%1$c}%1$c"

static char buffer[256];

static void run(int i)
{
	snprintf(buffer, sizeof(buffer), "./Sully_%1$d", i);
	system(buffer);
}

static void compile(int i)
{
	snprintf(buffer, sizeof(buffer), "cc Sully_%1$d.c -o Sully_%1$d", i);
	system(buffer);
}

static void duplicate(int i)
{
	snprintf(buffer, sizeof(buffer), "Sully_%1$d.c", 1);

	FILE *f = fopen(buffer, "w");

	fprintf(f, FORMAT, 10, 9, 34, FORMAT, i - 1);
	fclose(f);
}

int main(void)
{
	int i = 5;

}
