import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
   CustomFormField({
     required this.hint,
     this.onChanged,
     this.inputType,
     this.value,
    Key? key,
  }) : super(key: key);

   Function (String)? onChanged;
   String hint;
   TextInputType? inputType;
   String? value;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      child: TextField(
        onChanged: onChanged,
        controller: TextEditingController(text: value),
        keyboardType:inputType ,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}