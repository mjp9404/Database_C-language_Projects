#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void getString(char* s)
{

	printf("Enter string: ");
	scanf("%s", s);

	for (int i = 0; i <= strlen (s); i++)  {  
	if (s[i] >= 65 && s[i] <= 90)  
 	s[i] = s[i] + 32; 
 	}  
	 
}

void cleanString(char* original, char* cleaned)
{
	strcpy(cleaned, original);
}

void reverseString(char* cleaned, char* reversed)
{
	int strSize = strlen(cleaned);
	for (int i = strSize - 1; i >= 0; --i) {
        reversed[strSize - 1 - i] = cleaned[i];
   	}
}

int isPalindrome(char* cleaned, char* reversed)
{
	int result=0; //0 is false.
	if(strcmp(cleaned, reversed) == 0){
	result=1;
	}
	else {
	result=0;	
	}

	return result;
	
}

int main(void)
{
	char original[20]={};
	char cleaned[20]={};
	char reversed[20]={};

	getString(original);
	
	cleanString(original,cleaned);
	
	reverseString(cleaned, reversed);

	if (isPalindrome(cleaned, reversed))
		printf("%s is a palindrome\n", original);
	else
		printf("%s is NOT a palindrome\n", original);

	return 0;
}
