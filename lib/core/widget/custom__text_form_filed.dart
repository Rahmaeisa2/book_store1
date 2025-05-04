import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String? hintText;
  final Icon? prefixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;




  CustomTextFormField({
    super.key,
    required this.title,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,  required this.controller,  this.validator,

  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 7),
        TextFormField(
          controller:widget.controller,

          validator:widget.validator,

    //عشان اخليه لما اكتب الباسورد يبقي علي ارقام بس!z
          keyboardType: widget.title == "Password" ? TextInputType.number : TextInputType.emailAddress,

          obscureText: widget.isPassword ? !_passwordVisible : false,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )
                : null,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.pink),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
