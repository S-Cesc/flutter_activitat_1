import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:pair/pair.dart';
import 'package:english_words/english_words.dart';

class PeopleList extends StatefulWidget {
  const PeopleList({super.key});

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final _suggestions = <Pair<String, String>>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final randomNames = RandomNames(Zone.catalonia);
  final randomWords = generateWordPairs(safeOnly: false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i >= _suggestions.length) {
          for (var k = 0; k < 10; k++) {
            _suggestions.add(
              Pair(randomNames.fullName(),
                  randomWords.take(1).first.asLowerCase),
            );
          }
        }
        return Column(
          children: [
            ListTile(
              title: Text(
                _suggestions[i].key,
                style: _biggerFont,
              ),
              subtitle: Text(
                _suggestions[i].value,
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
