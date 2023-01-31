#include <stdio.h>
#include <string.h>

//Encode string
void encode(char plaintext[21], char ciphertext[21], int shiftBy)
{
	printf("Enter number of places to shift by: ");
	scanf("%d", shiftBy);
		
	for (int i = 0; i <= strlen (ciphertext); i++)  {  
	if (ciphertext[i] >= 65 && ciphertext[i] <= 90)  
 	ciphertext[i] = ciphertext[i] + (32+ shiftBy); 
 	} 
	printf("%s encodes to %s, when shifted right by %d place(s)", plaintext, ciphertext, shiftBy);
	//1. Loop through each character in the "plaintext" array:

		//1.1 Add the shiftBy value to the character value to move it in the alphabet (in C a char is 
		//a data type that holds the ASCII value of a character as am integer number, so we can add 
		//or subtract with it).
		//Note: you will need to handle the "wrapping around" of characters, e.g. "z" becomes "a" when shifted
		//right by 1. A look at the ASCII character set and % will help you with this.

		//1.2 Store the shifted characters in the "ciphertext" array.
	

	//2. Add a null character to the end of the ciphertext string ('\0').
	
}


int main(void)
{
	//Array and variable declarations.
	char plaintext[21];
	char ciphertext[21];
	int shiftBy=0;

	printf("Enter a message to encode: ");
	scanf("%s", plaintext);

	for (int i = 0; i <= strlen (plaintext); i++)  {  
	if (plaintext[i] >= 65 && plaintext[i] <= 90)  
 	plaintext[i] = plaintext[i] + 32; 
 	}  
	strcpy(ciphertext, plaintext);
	encode(plaintext,ciphertext,shiftBy);
	



	//1. Prompt the user for the message to encode (up to 20 characters).

	//2. Read in the message into the plaintext array.


	//3. Prompt the user for the number of places to shift the letters in plaintext by in
	//the alphabet. Positive numbers only.

	//4. Read the number into the shiftBy variable.

	//5. Call the encode() function, giving it the plaintext, ciphertext and shiftBy values.

	//6. Print out the message: "<plaintext>" encodes to "<ciphertext>", when shifted to the right by <shiftBy> place(s).

	return 0;
}
