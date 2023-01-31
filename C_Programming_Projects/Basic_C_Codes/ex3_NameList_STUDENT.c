#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	int numNames=0;
	char* names[10];
	char name[10];
	
	
	printf("Enter number of names to store: ");
	scanf("%d", &numNames);
	int j=1;
    	for (int i = 1; i <= numNames; i++)
    		{
		
        	printf("Enter name#%d: ", i);
		scanf("%s", &name);
		
		names[i] = name;
		
		
		}
	
	for(int i=1; i<=numNames; i++){
		printf("Name #%d: %s\n", i, names[i]);
		
	}
	

	return 0;
}
