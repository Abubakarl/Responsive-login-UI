import 'package:flutter/material.dart';
import 'package:responsive_login_ui/theme.dart';

class SharedWidgets {
  static Widget buildTextField({
    required IconData icon,
    required String hintText,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return SizedBox(
      height: CustomTheme.fieldsHeight,
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor: CustomTheme.lightGrey,
          filled: true,
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CustomTheme.fieldBorderRadius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  static Widget buildDividerWithText(String text) {
    return Row(
      children: [
        Flexible(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: CustomTheme.titleMediumFontSize,
            ),
          ),
        ),
        Flexible(child: Divider())
      ],
    );
  }

  static Widget buildSocialButton(
      String platform, String imagePath, String action) {
    return Container(
      height: CustomTheme.fieldsHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomTheme.fieldBorderRadius),
        border: Border.all(color: CustomTheme.buttonBorderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 30,
            width: 30,
          ),
          SizedBox(width: 10),
          RichText(
            text: TextSpan(
              text: "$action with ",
              style: TextStyle(
                color: CustomTheme.black,
              ),
              children: [
                TextSpan(
                  text: platform,
                  style: TextStyle(
                    color: CustomTheme.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
