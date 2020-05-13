library cupertino_radio_choice;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoRadioChoice extends StatefulWidget {
  CupertinoRadioChoice(
      {@required this.choices,
      @required this.onChange,
      @required this.initialKeyValue,
      this.selectedColor = CupertinoColors.systemBlue,
      this.notSelectedColor = CupertinoColors.inactiveGray,
      this.enabled = true});

  final Function onChange;
  final String initialKeyValue;
  final Map<String, String> choices;
  final Color selectedColor;
  final Color notSelectedColor;
  final bool enabled;

  @override
  _CupertinoRadioChoiceState createState() => new _CupertinoRadioChoiceState();
}

/// State of the widget
class _CupertinoRadioChoiceState extends State<CupertinoRadioChoice> {
  String _selectedKey;

  @override
  void initState() {
    super.initState();
    if (widget.choices.keys.contains(widget.initialKeyValue))
      _selectedKey = widget.initialKeyValue;
    else
      _selectedKey = widget.choices.keys.first;
  }

  Widget buildSelectionButton(String key, String value,
      {bool selected = false}) {
    return new Flexible(
        child: new CupertinoButton(
            disabledColor:
                selected ? widget.selectedColor : widget.notSelectedColor,
            color: selected ? widget.selectedColor : widget.notSelectedColor,
            padding: const EdgeInsets.all(10.0),
            child: new Text(value),
            onPressed: !widget.enabled || selected
                ? null
                : () {
                    setState(() {
                      _selectedKey = key;
                    });

                    widget.onChange(_selectedKey);
                  }));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttonList = [];
    for (var key in widget.choices.keys) {
      buttonList.add(buildSelectionButton(key, widget.choices[key],
          selected: _selectedKey == key));
    }
    return new Wrap(
      children: buttonList,
      spacing: 10.0,
      runSpacing: 5.0,
    );
  }
}
