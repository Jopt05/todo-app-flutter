import 'package:flutter/material.dart';

class SearchFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;
  final String currentFilter;

  SearchFieldBox({
    super.key,
    required this.onValue,
    required this.currentFilter
  });

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textController.text = currentFilter != "" ? currentFilter : "";

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent
      ),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      hintText: 'Search todos',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        prefixIcon: const Icon(
          Icons.search
        ),
      );

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        final newValue = textController.value.text;
        onValue(newValue);
      },
    );
  }
}