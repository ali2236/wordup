import 'package:flutter/material.dart';
import 'package:wordup/domain/domain.dart';

class WordResultListTile extends StatelessWidget {
  final WordResult word;
  final VoidCallback? onTap;
  const WordResultListTile(this.word, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(word.word, style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: word.otherForms.isNotEmpty ? Text(word.otherForms.join(', ')) : null,
      trailing: Text('#${word.rank}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
      onTap: onTap,
    );
  }
}
