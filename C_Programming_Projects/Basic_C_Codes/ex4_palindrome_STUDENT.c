#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	char original[20]={};
	char cleaned[20]={};
	char reversed[20]={};

	printf("Enter string: ");
	scanf("%s", original);

	for (int i = 0; i <= strlen (original); i++)  {  
	if (original[i] >= 65 && original[i] <= 90)  
 	original[i] = original[i] + 32; 
 	}  	

	int strSize = strlen(original);

	strcpy(cleaned, original);

	for (int i = strSize - 1; i >= 0; --i) {
        reversed[strSize - 1 - i] = cleaned[i];
   	}
 
  
   	if (strcmp(cleaned, reversed) == 0) {
        printf("%s is a palindrome\n", original);
    	}
    	else {
        printf("%s is NOT a palindrome\n", original);
    	}

	return 0;
}
