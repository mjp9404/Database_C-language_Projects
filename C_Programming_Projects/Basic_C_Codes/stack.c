#include <stdio.h>
#include <string.h>

//Forward declaration of functions
void getFirstName(char* fn);
void getLastName(char* ln);
void readFromKeyboard(char* str);
void createFullName(char* full, char* fn, char* ln);
void showAge(int x);


int main(void)
{
	int age=0;
	
	char firstname[10] = {};
	char lastname[10] = {};
	char fullname[20] = {};
	
	getFirstName(firstname);
	getLastName(lastname);
	createFullName(fullname, firstname, lastname);
	
	printf("The full name is '%s'\n", fullname);
	showAge(age);
	printf("Your age in main() is %d\n", age);

	return 0;
}

void getFirstName(char* fn)
{
	printf("Enter first name: ");
	readFromKeyboard(fn);
}

void getLastName(char* ln)
{
	printf("Enter last name: ");
	readFromKeyboard(ln);
}

void readFromKeyboard(char* str)
{
	scanf("%s", str);
}

void createFullName(char* full, char* fn, char* ln)
{
	strcpy(full, fn);
	strcat(full, " ");
	strcat(full, ln);
}

void showAge(int x)
{
	printf("Your age is %d\n", x);
}
