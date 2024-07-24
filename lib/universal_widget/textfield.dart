import 'package:flutter/material.dart';
import 'package:provider_test/utils/text_style.dart';

class CustomTextField extends StatefulWidget {
  final String? text;
  final String? hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxlines;
  final ValueChanged<String> onChanged;
  final bool? isPasswordField;

  const CustomTextField({
    super.key,
    this.text,
    this.hintText,
    this.textInputType,
    this.maxlines,
    this.textInputAction,
    required this.onChanged,
    this.isPasswordField,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController controller;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topCenter,
            height: (MediaQuery.sizeOf(context).height * 0.065) *
                widget.maxlines!.toDouble(),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Theme.of(context).dividerColor)),
            child: setField()),
      ],
    );
  }

  setField() {
    if (widget.isPasswordField == true) {
      return TextFormField(
        onChanged: widget.onChanged,
        controller: controller,
        style: TextStyles.textField(context),
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        maxLines: widget.maxlines,
        cursorColor: Theme.of(context).primaryColor,
        obscureText: !_passwordVisible,
        obscuringCharacter: "*",
        decoration: InputDecoration(
            suffixIcon: InkWell(
                onTap: () {
                  _passwordVisible = !_passwordVisible;
                  setState(() {});
                },
                child: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                )),
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            hintText: widget.hintText,
            hintStyle: TextStyles.textFieldHint(context),
            border: InputBorder.none),
      );
    } else {
      return TextFormField(
        onChanged: widget.onChanged,
        controller: controller,
        style: TextStyles.textField(context),
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        maxLines: widget.maxlines,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            hintText: widget.hintText,
            hintStyle: TextStyles.textFieldHint(context),
            border: InputBorder.none),
      );
    }
  }
}
