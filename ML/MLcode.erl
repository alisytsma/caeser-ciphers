(* ML *)

(* Function to encrypt a string *)
fun encrypt (str : string, shiftAmount : int) : string =
    (* Break string into a list, then shift by the shift amount, then concatenate back into a string *)
	String.implode(map (fn x => chr (((ord (Char.toUpper x) - 65 + shiftAmount) mod 26) + 65)) (String.explode(str)));

(* Function to decrypt a string *)
fun decrypt (str : string, shiftAmount : int) : string =
    (* Encrypt by negative shift amount to get original *)
	encrypt (str, shiftAmount * ~1);

(* Function to print all encryptions of a string *)
fun solve(str, maxShiftAmount) = (
	print("Caesar " ^ Int.toString(maxShiftAmount) ^  ": " ^ encrypt(str, maxShiftAmount) ^ "\n");
	(* Recursively call solve maxShiftAmount of times *)
	if maxShiftAmount > 0 then solve(str, maxShiftAmount - 1) else NONE )

(* output *)
val str = "supercalifragilisticexpialidocious";
print("Original string: "^str);
val encStr = encrypt(str, 4);
print("Encrypted string: "^encStr);
val decStr = decrypt(encStr, 4);
print("Original string: "^decStr);
solve(encStr, 26);