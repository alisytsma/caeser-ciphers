program CaeserCipher;

//function to encrypt the string
procedure encrypt(var input: string);
var i: integer;
BEGIN
	//for the length of the string, shift each character
	for i := 1 to length(input) do
	case input[i] of
		//If character is between A and Z, get its alphabetical value by subtracting it from char A and adding an offset to encrypt.
		//Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char A's value to get the actual character
		'A'..'Z': input[i] := chr(ord('A') + (ord(input[i]) - ord('A') + 16) mod 26);
		//If character is between a and z, get its alphabetical value by subtracting it from char a and adding an offset to encrypt.
		//Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char a's value to get the actual character
		'a'..'z': input[i] := chr(ord('a') + (ord(input[i]) - ord('a') + 16) mod 26);
	 END;
END;

//function to decrypt the string
procedure decrypt(var input: string);
var i: integer;
BEGIN
    //for the length of the string, shift each character
	for i := 1 to length(input) do
	case input[i] of
		//If character is between A and Z, get its alphabetical value by subtracting it from char A and adding 26 minus the offset to decrypt.
		//Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char A's value to get the actual character
		'A'..'Z': input[i] := chr(ord('A') + (ord(input[i]) - ord('A') + 10) mod 26);
		//If character is between a and z, get its alphabetical value by subtracting it from char a and adding 26 minus the offset to decrypt.
		//Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char a's value to get the actual character
		'a'..'z': input[i] := chr(ord('a') + (ord(input[i]) - ord('a') + 10) mod 26);
	END;
END;
   
//function to print every possible shift value and result for input string
procedure solve(var input: string);
   var i: integer;
   var j: integer;
   BEGIN
      for j := 1 to 25 do
      BEGIN
         for i := 1 to length(input) do
            case input[i] of
			   //If character is between A and Z, get its alphabetical value by subtracting it from char A and adding an iterating j offset to get
			   //every possible combination. Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char A's value to get the 
			   // actual character
               'A'..'Z': input[i] := chr(ord('A') + (ord(input[i]) - ord('A') + j) mod 26);
			   //If character is between a and z, get its alphabetical value by subtracting it from char a and adding an iterating j offset to get
			   //every possible combination. Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char a's value to get the 
			   // actual character
               'a'..'z': input[i] := chr(ord('a') + (ord(input[i]) - ord('a') + j) mod 26);
               
          END;
		  //print the offset and the solved string
          writeln(j, ': ', input);
       END;
            
   END;

var input: string;
   
//begin actual program
BEGIN
   //set input string, print its encrypted, decrypted, and solved values
   input := 'Wibbly wobbly timey wimey';
   encrypt(input);
   writeln('Encrypted input: ', input);
   decrypt(input);
   writeln('Decrypted input: ', input);
   writeln('Solved input: ');
   solve(input);
END.