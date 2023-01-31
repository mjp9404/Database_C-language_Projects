#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//Show menu and get selection
int getMenuSelection()
{
	int selection=0;
	printf("1. Add name \n");
        printf("2. Delete name\n");
        printf("0. Quit\n");
	scanf("%d",&selection);
	
	return selection;
	//1. Show menu options: 1. Add name, 2. Delete name, 0. Quit

	//2. Get input from user (number of number option).

	//3. If number entered is not 1, 2 or 0 then go back and ask again until it is.

	//4. Return menu selection value.
}

//Add new name to array, return new name count
int addName(char* names[10], int numNames)
{

	for(int i=numNames; i<=numNames; i++)
   	{
        printf("Enter new name: \n");
        scanf(" %[^\n]", names[i]);
	        
	}
	numNames++;

	//4. Return numNames value.
	return numNames;
	//1. Allocate 21 bytes of memory to hold the new name.

	//2. Prompt the user to enter a new name.

	//3. Get name from user, store in newly-allocated memory.

	//4. Store address of newly-allocated memory at next free elements in names array.

	//5. Increment numNames parameter value.

	//6. Return incremented numNames value.

}

//Show list of names in array
void showNames(char* names[10], int numNames)
{
	printf( "\nList of names:\n" );{

	for (int i=0; i<=numNames; i++){
		printf("%s\n",names[i]);
	}
	
	}
	//1. Print out list heading: LIST OF NAMES

	//2. Loop through names array, output all the names.
	//DO NOT OUTPUT THE VALUES IN UNUSED ELEMENTS!

	//3. Print out a newline to create a blank line between the end of the names list,
	//and the menu.
}

//Delete a name from the list
int delName(char* names[10], int delIndex, int numNames)
{

	int length = sizeof(names);
	printf("\nIndex of name to delete:");
	scanf("%s", &delIndex);

	if (delIndex >= length){
	printf("\n Deletion is impossible");	
	}else{
		for(int i = delIndex; i<length; i++){
			names[i]= names[i+1];
		}
		
	

	}
	numNames--;

	
	return numNames;
	//1. Deallocate the memory allocated to the name being deleted.

	//2. Move all the addresses above the deleted one down one element in the array.
	//Note: You only need to do this for elements that are being used (not unconditionally for the whole array).
	
	//3. Decrement numNames parameter value.

	//4. Return decremented numNames parameter value.

}


int main(void)
{
	//Variable and array declarations.
	char* names[10]; //One-D array: stores pointers to up to ten C strings.
	int numNames=0; //Keeps track of the number of names in the names array.
	int menuSelection=0; //Value of menu selection made by user.
	int delIndex=0; //Index of name to delete.
	
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
		//1. Show menu and get selection from user.
	
		//2. Run relevant function.
		
		//3. Show list of names.
		
	} while (menuSelection!=0); //4. Loop until user enters 0 at the menu.


	return 0;
}
