import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final bool isPassword;
  final IconData? icon;
  final TextInputType keyboardType;
  final Color borderColor;
  final double borderRadius;

  const CustomTextfield({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.isPassword = false,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.borderColor = Colors.black,
    this.borderRadius = 10,
  });

  @override
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<CustomTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,

          /// Border Default
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),

          /// Border Ketika Fokus
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),

          /// Password Icon Toggle
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
