#include <stdio.h>
/*
	hello :)
*/
void colleen(char const *f){
	/*
		10 is line feed, 9 is tabulation and 34 is double quote
	*/
	printf(f, 10, 9, 34, f);
}
int main(void){
	char const s[] = "#include <stdio.h>%1$c/*%1$c%2$chello :)%1$c*/%1$cvoid colleen(char const *f){%1$c%2$c/*%1$c%2$c%2$c10 is line feed, 9 is tabulation and 34 is double quote%1$c%2$c*/%1$c%2$cprintf(f, 10, 9, 34, f);%1$c}%1$cint main(void){%1$c%2$cchar const s[] = %3$c%4$s%3$c;%1$c%2$ccolleen(s);%1$c}%1$c";
	colleen(s);
}
