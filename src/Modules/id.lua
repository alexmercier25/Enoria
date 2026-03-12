local SystemID = {}

SystemID.letters = {
	"a", "b", "c", "d", "e",
	"f", "g", "h", "i", "j",
	"k", "l", "m", "n", "o",
	"p", "q", "r", "s", "t",
	"u", "v", "w", "x", "y", "z"
}

SystemID.numbers = {
	"0", "1", "2", "3", "4",
	"5", "6", "7", "8", "9"
}

SystemID.chars = {
	"-", "]", "[", "|", "_", "@"
}

SystemID.chances = {
	"letters", "letters",
	"numbers", "numbers",
	"chars",
}

function SystemID.getChar()
	local pool = SystemID[SystemID.chances[math.random(1, #SystemID.chances)]]
	return pool[math.random(1, #pool)]
end

function SystemID.randomString(nChars)
	local parts = {}
	for i = 1, nChars do
		parts[i] = tostring(SystemID.getChar())
	end
	return table.concat(parts)
end

return SystemID
