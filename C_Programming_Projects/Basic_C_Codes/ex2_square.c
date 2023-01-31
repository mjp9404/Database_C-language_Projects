#include <stdio.h>


int main(int argc, char* argv[])
{
	int x=0;

	printf("Enter size of square: ");
	scanf("%d", &x);
	
	int i, j;
    	for (i = 1; i <= x; i++)
    	{
        	for (j = 1; j <= x; j++)
        	{
            	if (i==1 || i==x || j==1 || j==x)           
                printf("*");           
            	else
                printf(" ");           
        	}
        	printf("\n");
    	}


	return 0;	

}
