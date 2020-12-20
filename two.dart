// Day two of advent of code 2020
import 'dart:async';
import 'dart:io';

/** Get the counts of each letter in a string */
Map<String, num> getLetterCounts(String s) {
  final stringList = s.split('');
  final letterCounts = new Map<String, num>();
  for (String c in stringList) {
    letterCounts[c] = letterCounts.containsKey(c) ? letterCounts[c] + 1 : 1;
  }

  return letterCounts;
}

void main(List<String> args) async {
  final inputFile = new File('two.txt');
  final lines = await inputFile.readAsLines();

  // Iterate over each line, get if it's a valid password
  final isValidPassword = lines.map((line) {
    final splitLine = line.split(' ');

    // Get the min/max value of character occurences
    final minMax =
        splitLine[0].split('-').map((element) => num.tryParse(element));
    final min = minMax.elementAt(0);
    final max = minMax.elementAt(1);

    // Get the letter we are checking
    final letter = splitLine[1][0];

    // Get the count of each letter in the password
    final letterCounts = getLetterCounts(splitLine[2]);

    return (letterCounts[letter] ?? 0) <= max &&
        (letterCounts[letter] ?? 0) >= min;
  });

  final numberOfValidPasswords =
      isValidPassword.fold(0, (sum, isValid) => isValid ? sum + 1 : sum);

  print(numberOfValidPasswords);
}
