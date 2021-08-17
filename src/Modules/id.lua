local SystemID = {}
SystemID.letters =  {
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

SystemID.next_char = nil

function SystemID.getChar()
    local index = math.random(1, #SystemID.chances)

    if SystemID.chances[index] == "letters" then
        local random = math.random(1, #SystemID.letters)
        return SystemID.letters[random]
    end

    if SystemID.chances[index] == "numbers" then
        local random = math.random(1, #SystemID.numbers)
        return SystemID.numbers[random]
    end

    if SystemID.chances[index] == "chars" then
        local random = math.random(1, #SystemID.chars)
        return SystemID.chars[random]
    end

end

function SystemID.randomString(nChars)
    local result = ""
    for i = 0, (nChars-1), 1 do
        SystemID.next_char = tostring(SystemID.getChar())
        result = result .. SystemID.next_char
    end
    return result
end

return SystemID
