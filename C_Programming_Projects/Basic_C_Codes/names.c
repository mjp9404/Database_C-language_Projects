//BEGIN BY LOOKING AT THE main() FUNCTION AT THE BOTTOM OF THIS FILE.

#include <stdio.h>
#include <string.h>

//Show menu and get selection
int getMenuSelection(int selection)
{
	selection=0;
	printf("1. Add name \n");
        printf("2. Delete name\n");
        printf("0. Quit\n");
	scanf("%d",&selection);
	//1. Show menu options: 1. Add name, 2. Delete name, 0. Quit
	
	//2. Get input from user (number of number option).

	//3. If number entered is not 1, 2 or 0 then go back and ask again until it is.

	//4. Return menu selection value.
	return selection;
}

//Add new name to array, return new name count
int addName(char names[10][21], int numNames)
{
	//1. Prompt user to enter a new name.
	//for(int i=0; i<10; i++){
	//printf("Enter new name: \n");
	//scanf("%s", &names);
	//}
	//fgets (names, sizeof(char), stdin);

	
	for(int i=numNames; i<=numNames; i++)
   	{
        printf("Enter new name: \n");
        scanf(" %[^\n]", names[i]);
        }

	//2. Get name, store it in the next available element in the names array.

	//3. **Increment the numNames parameter value** so the program knows how many array elements are now in use.
	numNames++;

	//4. Return numNames value.
	return numNames;

}

//Show list of names in array
void showNames(char names[10][21], int numNames)
{
	//1. Print out list heading: LIST OF NAMES
	printf( "\nList of names:\n" );{

	for (int i=0; i<=numNames; i++){
		printf("%s\n",names[i]);
	}
	
	}
	//2. Loop through names array, output all the names.
	//DO NOT OUTPUT THE VALUES IN UNUSED ELEMENTS!

	//3. Print out a newline to create a blank line between the end of the names list,
	//and the menu.
	
}

//Delete a name from the list
int delName(char names[10][21], int delIndex, int numNames)
{
	int length = sizeof(names);
	printf("\nIndex of name to delete:");
	scanf("%s", &delIndex);

	if (delIndex >= length){
	printf("\n Deletion is impossible");	
	}else{
		for(int i = delIndex; i<length; i++){
			*names[i]= *names[i+1];
		}
		
	

	}
	//1. Move all the values above the deleted one down one element in the array.
	//You will need to use the strcpy() function to do this.

	//2. **Decrement the numNames parameter value** so the program knows the new number of names in the array.
	numNames--;
	//3. Return the decremented numNames value.
	
	return numNames;

}


int main(void)
{
	//Variable and array declarations
	char names[10][21]; //2D array: stores up to ten string of 20 characters each (plus room for trailing null)
	int numNames=0; //Keeps track of the number of names in the names array
	int menuSelection=0; //Number of menu option selected by user.
	int delIndex=0; //Index of name to be deleted from the array.
	
	do
	{
		int selection=0;
		menuSelection=getMenuSelection(selection);
		
		switch(menuSelection){
		case 1: addName(names, numNames);
			showNames(names, numNames);
			break;
		case 2: delName(names, delIndex, numNames);
			break;
		case 0: 
		showNames(names, numNames);
		}	
		//1. Show menu and get user selection into "menuSelection" variable.
	
		//2. Call relevant function, depending upon which menu option the user entered.
		//Look at function headers/signatures to see what parameters each one needs to be given, and 
		//what return value a function provides, if any.
		
		//3. Show list of names currently in array
		
	} while (menuSelection!=0); //4. Loop until user enters "0" at the menu


	return 0;
}
