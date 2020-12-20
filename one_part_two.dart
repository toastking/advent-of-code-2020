// Day one of advent of code 2020 part 2
import 'dart:async';
import 'dart:io';
import 'package:tuple/tuple.dart';

Tuple3<num, num, num> getNumbers(List<num> numbers) {
  // Brute force solution, a better solution would be a binary search
  for (final firstNum in numbers) {
    for (final secondNum in numbers) {
      for (final thirdNum in numbers) {
        if (firstNum + secondNum + thirdNum == 2020) {
          return new Tuple3(firstNum, secondNum, thirdNum);
        }
      }
    }
  }
  return new Tuple3(0, 0, 0);
}

Future<void> main(List<String> args) async {
  final inputFile = new File('one.txt');
  final lines = await inputFile.readAsLines();

  // Get the numbers and sort them
  final numbers = lines.map((elem) => int.tryParse(elem)).toList();

  Tuple3<num, num, num> solution = getNumbers(numbers);

  print(solution.item1 * solution.item2 * solution.item3);
}
