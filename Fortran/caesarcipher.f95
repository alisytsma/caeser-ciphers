program CaesarCipher
	implicit none
    
    !declare string to be encrypted
    character(55) :: input = "Your entire life has been a mathematical error"
	write(*,*) "Original input: ", input
	call encrypt(input, 16)
	write(*,*) "Encrypted input: ", input
    call decrypt(input, 16)
	write(*,*) "Decrypted input: ", input
    write(*,*) "Solved input: "
    call solve(input, 25)

contains

!function to encrypt the string
subroutine encrypt(input, shiftAmount)
	character(*), intent(inout) :: input
    integer :: shiftAmount
  	integer :: i

  	do i = 1, len(input)
    	select case(input(i:i))
        	!If character is between A and Z, get its alphabetical value by subtracting it from char A and adding an offset to encrypt.
			!Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char A's value to get the actual character
      		case ('A':'Z')
        		input(i:i) = achar(modulo(iachar(input(i:i)) - iachar('A') + shiftAmount, 26) + iachar('A'))
            !If character is between a and z, get its alphabetical value by subtracting it from char a and adding an offset to encrypt.
			!Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char a's value to get the actual character
     	    case('a':'z')
      			input(i:i) = achar(modulo(iachar(input(i:i)) - iachar('a') + shiftAmount, 26) + iachar('a'))
		end select
    end do
!end encrypt
end subroutine

!function to decrypt the string
subroutine decrypt(input, shiftAmount)
	character(*), intent(inout) :: input
    integer :: shiftAmount
  	integer :: i

  	do i = 1, len(input)
    	select case(input(i:i))
        	!If character is between A and Z, get its alphabetical value by subtracting it from char A and adding 26 minus the offset to decrypt.
			!Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char A's value to get the actual character
      		case ('A':'Z')
        		input(i:i) = achar(modulo(iachar(input(i:i)) - iachar('A') + (26 - shiftAmount), 26) + iachar('A'))
            !If character is between a and z, get its alphabetical value by subtracting it from char a and adding 26 minus the offset to decrypt.
			!Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char a's value to get the actual character    
     	    case('a':'z')
      			input(i:i) = achar(modulo(iachar(input(i:i)) - iachar('a') + (26 - shiftAmount), 26) + iachar('a'))
		end select
    end do
!end decrypt
end subroutine

!function to print every possible shift value and result for input string
subroutine solve(input, maxShiftAmount)
	character(*), intent(inout) :: input
    integer :: maxShiftAmount
    
  	integer :: i
    integer :: j
	
	do j = 0, maxShiftAmount
  		do i = 1, len(input)
    		select case(input(i:i))
                !If character is between A and Z, get its alphabetical value by subtracting it from char A and adding an iterating j offset to get
			    !every possible combination. Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char A's value to get the 
			    !actual character
      			case ('A':'Z')
        			input(i:i) = achar(modulo(iachar(input(i:i)) - iachar('A') + j, 26) + iachar('A'))
                !If character is between a and z, get its alphabetical value by subtracting it from char a and adding an iterating j offset to get
			    !every possible combination. Then, modulus it by 26 to make sure it stays between 1 and 26. Last, re-add char a's value to get the 
			    !actual character
                case('a':'z')
      	 			input(i:i) = achar(modulo(iachar(input(i:i)) - iachar('a') + j, 26) + iachar('a'))
			end select
    	end do
        !print the offset and the solved string
        write(*,*) j, ": ", input
    end do
!end solve
end subroutine

end program CaesarCipher