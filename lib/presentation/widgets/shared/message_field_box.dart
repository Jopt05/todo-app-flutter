import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;
  bool isEditing;
  TextEditingController textController;

  MessageFieldBox({
    super.key,
    required this.onValue,
    required this.isEditing,
    required this.textController
  });

  @override
  Widget build(BuildContext context) {

    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent
      ),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      hintText: 'Introduce your todo',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon( Icons.send_outlined ),
          onPressed: () {
            final String textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
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
        textController.clear();
        onValue(value);
      },
    );
  }
}