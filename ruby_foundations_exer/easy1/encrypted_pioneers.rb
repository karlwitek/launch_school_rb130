# Write a program that deciphers and prints each of the names. (encrypted names)

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

ROT = { 'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q', 'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
        'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y', 'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
        'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g', 'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k',
        'y' => 'l', 'z' => 'm'  }

def decipher(name)
  new_string = ''
  array_chars = name.chars
  array_chars.each do |char|
    if char == ' '
      new_string << ' '
    elsif char == '-'
      new_string << '-'
    elsif char =~ /[A-Z]/
      new_string << ROT[char.downcase].upcase
    else
      new_string << ROT[char]
    end
  end
  puts new_string
end

# decipher('Nqn Ybirynpr')# Ada Lovelace


arr = ['Nqn Ybirynpr', 'Tenpr Ubccre', 'Nqryr Tbyqfgvar', 'Nyna Ghevat', 'Puneyrf Onoontr', 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss', 'Ybvf Unvog', 'Pynhqr Funaaba', 'Fgrir Wbof', 'Ovyy Tngrf', 'Gvz Orearef-Yrr', 'Fgrir Jbmavnx',
'Xbaenq Mhfr', 'Fve Nagbal Ubner', 'Zneiva Zvafxl', 'Lhxvuveb Zngfhzbgb', 'Unllvz Fybavzfxv', 'Tregehqr Oynapu']


# arr.each do |name|
#   decipher(name)
# end

# Ada Lovelace
# Grace Hopper
# Adele Goldstine
# Alan Turing
# Charles Babbage
# Abdullah Muhammad bin Musa al-Khwarizmi
# John Atanasoff
# Lois Haibt
# Claude Shannon
# Steve Jobs
# Bill Gates
# Tim Berners-Lee
# Steve Wozniak
# Konrad Zuse
# Sir Antony Hoare
# Marvin Minsky
# Yukihiro Matsumoto
# Hayyim Slonimski
# Gertrude Blanch

# LS:

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

arr.each do |encrypted_name|
  puts rot13(encrypted_name)
end

# Instead of using a lookup table with a hash to solve, we use a description on Rot13 directly.
# ('rotate' each character by 13)
# use #rot13 to decrypt each name in the list, one at a time, and within that method, we use
# decipher_character to decrypt each character. Use String#each_char and Enumerable#reduce to
# iterate through the characters in encrypted_text, and construct the decrypted return value.
# Use a case statement that breaks the decryption problem into 3 parts. The letters between 'A'
# and 'M', the letters between 'N' and 'Z', and everything else. We check for upper and lower
# case letters. First group is shifted 13 places forward with String#ord and Integer#chr which
# convert a character to a numeric value and vice versa. The second group is shifted left by 13
# places. Everything else is returned unchanged.
# Once all the components are in place, iterate through our list of encrypted names and print each
# decrypted name.
# FE: lookup names of the pioneers.
#