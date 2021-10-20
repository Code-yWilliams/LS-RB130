# The following list contains the names of individuals who are pioneers
# in the field of computing or that have had a significant influence on
# the field. The names are in an encrypted form, though, using a
# simple (and incredibly weak) form of encryption called Rot13.
# In Rot13, each letter is rotated 13 spaces in the alphabet.

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

# Write a program that deciphers and prints each of these names.

require "pry-byebug"

ALPHABET = ("A".."Z").to_a

encrypted_pioneers = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
]

def capitalize_full_name(name_array)
  name_array.map do |full_name|
    names = full_name.split(" ")
    names.each { |name| name.capitalize! }
    names.join(" ")
  end
end

def decipher_rot13(encrypted_array)
  result = []
  encrypted_array.each do |name|
    deciphered_name = ""
    chars = name.upcase.split("")
    #binding.pry
    chars.each do |char|
      if !ALPHABET.include?(char)
        deciphered_name << char
        next
      else
        # binding.pry
        index = ALPHABET.index(char)
        new_index = (index + 13) % 26
        deciphered_name << ALPHABET[new_index]
      end
    end
    result << deciphered_name
  end
  capitalize_full_name(result)
end

puts decipher_rot13(encrypted_pioneers)