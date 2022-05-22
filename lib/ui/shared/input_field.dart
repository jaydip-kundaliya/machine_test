import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.textEditingController,
    this.maxLines = 1,
    this.inputFormatters = const [],
    this.placeholder,
    this.validator,
  }) : super(key: key);

  final String? placeholder;
  final TextEditingController? textEditingController;
  final int maxLines;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.multiline,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFE5E5E5),
          ),
        ),
      ),
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
      },
    );
  }
}
