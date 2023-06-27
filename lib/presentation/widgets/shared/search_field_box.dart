import 'package:flutter/material.dart';

class SearchFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  SearchFieldBox({
    super.key,
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {

    final FocusNode focusNode = FocusNode();
    final textController = TextEditingController();

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
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        final newValue = textController.value.text;
        onValue(newValue);
      },
    );
  }
}