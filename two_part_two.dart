// Day two part two of advent of code 2020
import 'dart:async';
import 'dart:io';

/** Determine if a password is valid but seeing if XOR for if the character is at the space in the string*/
bool isValid(
    String s, String character, num firstPosition, num secondPosition) {
  return (s[firstPosition] == character || s[secondPosition] == character) &&
      (s[firstPosition] != s[secondPosition]);
}

void main(List<String> args) async {
  final inputFile = new File('two.txt');
  final lines = await inputFile.readAsLines();

  // Iterate over each line, get if it's a valid password
  final isValidPassword = lines.map((line) {
    final splitLine = line.split(' ');

    // Get the min/max value of character occurences
    final positions =
        splitLine[0].split('-').map((element) => num.tryParse(element));
    final firstPosition = positions.elementAt(0) - 1;
    final secondPosition = positions.elementAt(1) - 1;

    // Get the letter we are checking
    final letter = splitLine[1][0];

    //Get the password String
    final s = splitLine[2];

    return isValid(s, letter, firstPosition, secondPosition);
  });

  final numberOfValidPasswords =
      isValidPassword.fold(0, (sum, isValid) => isValid ? sum + 1 : sum);

  print(numberOfValidPasswords);
}
