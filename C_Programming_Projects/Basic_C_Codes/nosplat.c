#include <stdio.h>
#include <string.h>

int main(void)
{
	int age=21;
	char name[5];
	char ch=0;
	
	printf("Enter your name: ");
	//scanf("%s",name);
	
	fgets(name, sizeof(name), stdin);
	if(strlen(name)==4)
		while((ch=fgetc(stdin)) !=EOF && ch != '\n');

	if (name[strlen(name)-1] == '\n')
		name[strlen(name)-1]='\0';

		
	
	printf("Your name is %s and your age is %d\n", name, age);

	
	return 0;

	
}
