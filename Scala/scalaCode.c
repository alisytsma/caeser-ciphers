//Scala

object Caesar { 
    
    //main body, where we make function calls
	def main(args: Array[String]) {
	    var input = "Let me guess, someone stole your sweet roll?"
	    var key = 12
	    var encStr = encrypt(input, key)
	    //print original and encrypted strings
        println("Original string: " + input)
        println("Encrypted string: " + encStr)
        //print decrypted string by subtracting the key from 26 and encrypting it
        println("Decrypted string: " + encrypt(encStr, 26 - key))
        println("Solve: ")
        solve(encStr, 25)        
    }
    
    //function to print all encryptions up to maxShiftAmount of times
    def solve(str: String, maxShiftAmount: Int): Unit = {
      //print maxShiftAmount and the string shifted by that amount
      println("Caesar " + maxShiftAmount + ": " + encrypt(str, maxShiftAmount))
      //if we haven't reached the maxShiftAmount, keep going
      if(maxShiftAmount > 0){
        solve(str, maxShiftAmount - 1)
      }
    }
    
    //function to encrypt a string
    def encrypt(str: String, shiftAmount: Int) = {
	  var input : String = str.toUpperCase()
	  input.map(x => shift(x, shiftAmount))
	}
    
    //function to shift a letter shiftAmount of times
    def shift(letter: Char, shiftAmount: Int): Char = {
      //if letter is an actual letter and not a special character, shift it
      if(letter.isLetter)
       return (((letter.toInt - 65 + shiftAmount) % 26) + 65).toChar
      //otherwise, just return the special character
      else
        return letter
    }
    
}