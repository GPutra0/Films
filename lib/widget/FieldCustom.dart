import 'package:flutter/material.dart';

Padding textFieldCustom(ttl, ctrl) {
  return Padding(
    padding: const EdgeInsetsDirectional.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ttl ,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 5),
        Container(
          width: 300,
          height: 35,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: ctrl,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Input tidak boleh kosong!';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 2.0))),
          ),
        )
      ],
    ),
  );
}
