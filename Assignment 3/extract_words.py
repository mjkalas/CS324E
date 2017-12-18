# Create word dictionary from the comprehensive word list 
word_dict = {}
def create_word_dict ():
  word_list = open('./words.txt','r')
  word_dict = set()
  i = 0
  for line in word_list:
    word_dict.add(line.rstrip('\n'))
  word_list.close()
  return word_dict
  
# Removes punctuation marks from a string
def rem_punc(st):
  if len(st) == 0:
    return st
  if st[0].isalpha():
    if st[-1].isalpha():
      return st
    return rem_punc(st[:-1])
  return rem_punc(st[1:])

def parseString (st):
  Lst = []
  for word in st.replace('-',' ').split():
    if not word.isalpha():
      word = rem_punc(word).replace("'s",'')

    if word:
      Lst.append(word)
  return Lst

# Returns a dictionary of words and their frequencies
def getWordFreq ():
  #open file
  f = open('./TheThreeMusketeers.txt', 'r')
  words = {}
  words2 = ""
  for line in f:
    # convert line to lowercase
    line = line.lower()

    # strip all whitespace chars from the end
    Lst = parseString(line.rstrip('\n'))

    # use word as key to array; update its count
    # this gets each word and its frequency
    for word in Lst:
      try:
        words[word] += 1
      except:
        words[word] = 1

    # add each word to words2 followed by a newline
    # this just splits the input file into a single word file split by newlines
    for word in Lst:
      words2 += str(word)
      words2 += '\n'

  #get outfiles
  outFile_all = open('allwords.txt', 'w')
  outFile_all.write(words2)
  outFile_all.close()

  unique_words = [] # this is a list
  outFile_unique = open('uniquewords.txt', 'w')
  for word in words:
    if words[word] == 1:
      unique_words.append(word)
  unique_word_string = "\n".join(unique_words)
  outFile_unique.write(unique_word_string)
  outFile_unique.close()

  #Having trouble getting the frequency portion of this assignment.  all_words & unique_words works
  #This prints the frequencies with the words next to it, but the words are supposed to be a count
  outFile_frequency = open('wordfrequency.txt', 'w')
  freq_dict = {}
  for word in words:
    # this contains the frequency of each word
    freq = words[word]

    try:
      freq_dict[freq] += 1
    except:
      freq_dict[freq] = 1

  for word in freq_dict:
    outFile_frequency.write(str(word) + ":" + str(freq_dict[word]) + "\n")
  outFile_frequency.close()

  #close file
  f.close()

def main():
  # Create word dictionary from comprehensive word list
  create_word_dict()

  # Get the frequency of words used by the two authors
  wordFreq1 = getWordFreq ()

main()
