# Write a method that returns true if its argument looks like a URL, false if it does not.

def url?(string)
  string.match?(/\Ahttps?:\/\/\S+\z/)
end


# Write a method that returns all of the fields in a haphazardly formatted string.
# A variety of spaces, tabs, and commas separate the fields, with possibly multiple
# occurrences of each delimiter.

def fields(string)
  string.split(/[\s,]+/)
end

#or

def fields(string)
  string.split(/[ \t,/]+/)
end


# Write a method that changes the first arithmetic operator (+, -, *, /) in a string to
# a '?' and returns the resulting string. Don't modify the original string.

def mystery_math(string)
  string.sub(/[\+\-\*\/]/, '?')
end


# Write a method that changes every arithmetic operator (+, -, *, /) to a '?' and
# returns the resulting string. Don't modify the original string.

def mysterious_math(string)
  string.gsub(/[\+\-\*\/]/, '?')
end


# Write a method that changes the first occurrence of the word apple, blueberry, or cherry
# in a string to danish.

def danish(string)
  string.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end


# Challenge: write a method that changes strings in the date format 2016-06-17 to the
# format 17.06.2016. You must use a regular expression and should use methods described in this section.

def format_date(date_string)
  date_string.sub(/(\A\d{4})-(\d{2})-(\d{2})\z/, "\\3.\\2.\\1") # use single quotes in the replacement string to avoid the need for two \\ on the back reference
end


# Challenge: write a method that uses regex to change dates in the format 2016-06-17 or 2016/06/17 to the format 17.06.2016.

def formatDate(date_string)
  date_string.sub(/(\A\d{4})([\/\-])(\d{2})\2(\d{2})\z/, "\\4.\\3.\\1")
end

# or

def format_date(original_date)
  original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
               .sub(/\A(\d\d\d\d)\/(\d\d)\/(\d\d)\z/, '\3.\2.\1')
end