import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final String label;
  final String hint;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(15)
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0,5)
          )
        ]
      ),
    
      child: TextFormField(
        // onChanged: (value) {
        //   widget.controller.text = value;
        // },
        controller: widget.controller,
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold, 
            fontSize: 15
          ),
          enabledBorder: border,
          focusedBorder: border,
          isDense: true,
          label: Text(widget.label),
          hintText: widget.hint,
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 16
          ),
          focusColor: Colors.yellowAccent,
        ),
      ),
    );
  }
}
