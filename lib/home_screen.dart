import 'package:bravo/bravo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            'ايه الانجاز عملته انهارده ؟',
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: defaultFormFieldF(
              controller: textController,
              type: TextInputType.text,
              validate: (value) {},
              label: '',
              contentPadding: const EdgeInsets.all(2.0),
            ),
          ),
          const SizedBox(height: 40),
          defaultButton(
            text: 'Submit',
            isUpperCase: false,
            width: MediaQuery.of(context).size.width / 2,
            height: 40.0,
            function: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const BravoScreen()));
              textController.clear();
            },
          ),
        ],
      ),
    );
  }

  Widget defaultButton({
    double width = double.infinity,
    Color background = Colors.deepOrange,
    double height = 45.0,
    bool isUpperCase = true,
    double radius = 10.0,
    VoidCallback? function,
    required String text,
  }) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
  }

  TextFormField defaultFormFieldF({
    required TextEditingController controller,
    required TextInputType type,
    required FormFieldValidator<String>? validate,
    required String label,
    String? text,
    IconData? iconPrefix,
    IconData? suffix,
    FocusNode? focusNodes,
    Widget? suffixIcon,
    ValueChanged<String>? onSubmit,
    ValueChanged<String>? onChanged,
    bool isPassword = false,
    bool isClicked = true,
    bool autoFocused = false,
    EdgeInsetsGeometry? contentPadding = const EdgeInsets.all(4.0),
    double radiusEnable = 25.0,
    double radiusBorder = 25.0,
    int maxLinesL = 1,
    Color colorE = Colors.blueGrey,
    double radiusWidth = 2.0,
    TextAlignVertical? textAlignVertical = TextAlignVertical.top,
  }) {
    return TextFormField(
      maxLines: maxLinesL,
      controller: controller,
      keyboardType: type,
      enabled: isClicked,
      textAlignVertical: textAlignVertical,
      autofocus: autoFocused,
      focusNode: focusNodes,
      validator: validate,
      onChanged: onChanged,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        label: Text(label),
        hintText: text,
        prefixIcon: Icon(iconPrefix),
        suffix: Icon(suffix),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusEnable),
          borderSide: BorderSide(
            color: colorE,
            width: radiusWidth,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusBorder),
          borderSide: const BorderSide(
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
