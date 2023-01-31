#include <stdio.h>

int main(int argc, char* argv[])
{
	int number=0;
	int total=0;

	do {
		
		
		
		printf("Enter number <negative to end>: ");
		scanf("%d", &number);
		if(number >=0){	
		total += number;
		} 
	}	
	while (number>=0);

	printf("The sum of the numbers you entered is %d", total);

	return 0;	

}
