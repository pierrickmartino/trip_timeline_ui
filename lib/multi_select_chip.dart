import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  const MultiSelectChip({Key key, this.reportList, this.onSelectionChanged})
      : super(key: key);

  final List<String> reportList;
  final dynamic Function(List<String>) onSelectionChanged;

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];

  List<Widget> _buildChoiceList() {
    final List<Widget> choices = [];

    for (final item in widget.reportList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
