// Day one of advent of code 2020
import 'dart:async';
import 'dart:io';

Future<void> main(List<String> args) async {
  final inputFile = new File('one.txt');
  final lines = await inputFile.readAsLines();
  final numbers = lines.map((elem) => int.tryParse(elem));

  /** Different between each item and 2020 */
  final differenceMap = Map.fromIterable(numbers,
      key: (element) => element, value: (element) => 2020 - element);

  // Find the number match
  final matchingNumbers = differenceMap.entries
      .firstWhere((element) => differenceMap.containsKey(element.value));

  // Once we find the two numbers that exist in the list and add to
  // 2020 we return the multiplication of them
  print(matchingNumbers.value * matchingNumbers.key);
}
