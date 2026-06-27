import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {
  const CustomTextFormFields({
    super.key,
    required this.icon,
    required this.title,
    required this.controller,
    this.validator,
    this.hintText,
    this.maxLines = 1,
    this.obscureText = false,
  });

  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final String? hintText;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
