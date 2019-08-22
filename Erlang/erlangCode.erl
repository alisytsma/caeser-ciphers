% Erlang
-module(helloworld).
-export([start/0]).

% shift character a shiftAmount number of times
shift(Char, ShiftAmount)  ->
    if 
        % if not a space, shift character by ShiftAmount
        Char /= " " ->
    	    ToAscii = fun([Character]) -> Character end,
    	    (((ToAscii(Char) - 65 + ShiftAmount) rem (26) + 26) rem 26) + 65;
        % Otherwise, just return the character
	    true -> % acts as else
	        Char
	end.
	
% encrypt a string
encrypt(Str, ShiftAmount) ->
	ShiftAmounted = lists:map(fun(Char) -> shift([string:to_upper(Char)], ShiftAmount) end, Str),
	io:format("~s~n", [ShiftAmounted]),
	ShiftAmounted.

% decrypt a string by sending the negative of the shiftAmount to encrypt
decrypt(Str, ShiftAmount) ->
	encrypt(Str, -1 * ShiftAmount).

% function to print all encryptions of a string
solve(Str, MaxShiftAmount) ->
    if
    % if we haven't reached max shift amount
        MaxShiftAmount > 0 ->
            % print maxShiftAmount and encrypt with that value
            io:format("Caesar ~p: ", [MaxShiftAmount]),
        	encrypt(Str, MaxShiftAmount),
        	% loop back subtracting 1 from MaxShiftAmount
            solve(Str, (MaxShiftAmount - 1))
    end.

% main program
start() ->
	Str = "Beam Me Up Scotty",
	io:fwrite("Original string: " ++ Str),
	io:fwrite("\nEncrypted string: "),
	% get encrypted string and flatten it into a string again
	EncStr = lists:flatten(encrypt(Str, 10)),
	io:fwrite("Decrypted string: "),
	% decrypt and solve encrypted string
	decrypt(EncStr, 10),
	solve(EncStr, 26).