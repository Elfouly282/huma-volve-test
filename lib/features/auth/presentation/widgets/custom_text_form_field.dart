import 'package:flutter/material.dart';

Color mainColor = const Color.fromARGB(255, 80, 52, 1);
Map<String, Icon> icons = {
  'username': Icon(Icons.person, color: mainColor),
  'email': Icon(Icons.email_outlined, color: mainColor),
  'phone': Icon(Icons.phone_outlined, color: mainColor),
  'password': Icon(Icons.lock_outline, color: mainColor),
  'password again': Icon(Icons.lock_outline, color: mainColor),
};

class CustomTextFormField extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '${widget.text} is required';
        }
        return null;
      },
      obscureText: widget.text.contains('password') ? isHidden : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        hintText: 'enter your ${widget.text}',
        prefixIcon: icons[widget.text],
        suffixIcon: widget.text.contains('password')
            ? IconButton(
                onPressed: () => setState(() {
                  isHidden = !isHidden;
                }),
                icon: isHidden
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
