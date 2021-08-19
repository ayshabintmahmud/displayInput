import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Display User Input',
      home: DisplayUserInput(),
    );
  }
}

class DisplayUserInput extends StatefulWidget {
  const DisplayUserInput({Key? key}) : super(key: key);

  @override
  _DisplayUserInputState createState() => _DisplayUserInputState();
}

class _DisplayUserInputState extends State<DisplayUserInput> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display User Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            entryField(
              'Enter Your Name',
              controller: myController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Row(
                        children: [
                          Text('Hello'),
                          Text(
                            ' ${myController.text}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          Text(
                            '! I wish you the best.',
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget entryField(
  String label, {
  bool isPassword = false,
  bool hide = false,
  String? hint,
  TextInputType? inputType,
  TextInputAction? textInputAction,
  TextEditingController? controller,
  String? errorText,
  bool enabled = true,
  int? maxline,
  String? Function(String?)? onSaved,
  String? Function(String)? onChanged,
}) {
  return TextFormField(
    autofocus: true,
    obscureText: isPassword,
    textInputAction: textInputAction,
    maxLines: maxline,
    enabled: enabled,
    textCapitalization: TextCapitalization.sentences,
    keyboardType: inputType,
    controller: controller,
    textAlign: TextAlign.left,
    onChanged: onChanged,
    onSaved: onSaved,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      color: enabled ? Color(0xff0D0D0D) : Colors.grey,
    ),
    decoration: InputDecoration(
      errorText: errorText,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Color(
            0xff828282,
          ),
          width: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.grey[400]!,
          width: 1.0,
        ),
      ),
      hintText: hint,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      labelText: label,
      labelStyle: TextStyle(
        color: Color(0xff0A459F),
      ),
      border: InputBorder.none,
      fillColor: Colors.white,
      filled: true,
    ),
  );
}
