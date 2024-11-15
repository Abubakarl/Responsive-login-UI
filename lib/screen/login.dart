import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_login_ui/screen/signUp.dart';
import 'package:responsive_login_ui/theme.dart';
import 'package:responsive_login_ui/widgets/shared_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          bool isTablet =
              constraints.maxWidth >= 600 && constraints.maxWidth < 1200;

          return Stack(
            children: [
              if (!isMobile)
                Positioned(
                  bottom: 0,
                  left: -70,
                  child: Image.asset(
                    "assets/Vector@1x.png",
                  ),
                ),
              SingleChildScrollView(
                padding:
                    EdgeInsets.all(isMobile ? 20 : CustomTheme.outerPadding),
                child: isMobile
                    ? _buildMobileLayout(context)
                    : isTablet
                        ? _buildTabletLayout(context)
                        : _buildDesktopLayout(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40),
        _buildLoginForm(context),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(CustomTheme.borderRadius),
          child: SizedBox(
            height: 200,
            width: width - (2 * CustomTheme.outerPadding),
            child: Image.asset(
              "assets/Rectangle 1@1x.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: CustomTheme.normalGap),
        Center(
          child: SizedBox(
            width: width * 0.7,
            child: _buildLoginForm(context),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.5 - CustomTheme.outerPadding,
          child: Center(
            child: SizedBox(
              width: 400,
              child: _buildLoginForm(context),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.5 - CustomTheme.outerPadding,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(CustomTheme.borderRadius),
            child: Image.asset(
              "assets/Rectangle 4@1x.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
            fontSize: CustomTheme.titleFontSize,
            fontFamily: "SmoochSans",
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "We are glad to see you back with us",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CustomTheme.bodyLargeFontSize,
          ),
        ),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildTextField(
          icon: CupertinoIcons.person,
          hintText: "Username",
        ),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildTextField(
          icon: CupertinoIcons.lock,
          hintText: "Password",
          isPassword: true,
        ),
        SizedBox(height: CustomTheme.normalGap),
        _buildLoginButton(),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildDividerWithText("Login with Others"),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildSocialButton(
          "google",
          "assets/google 1@1x.png",
          "Login",
        ),
        SizedBox(height: CustomTheme.smallGap),
        SharedWidgets.buildSocialButton(
          "Facebook",
          "assets/facebook 1@1x.png",
          "Login",
        ),
        SizedBox(height: CustomTheme.normalGap),
        _buildSignUpLink(context),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      decoration: BoxDecoration(
        color: CustomTheme.black,
        borderRadius: BorderRadius.circular(CustomTheme.fieldBorderRadius),
      ),
      height: CustomTheme.fieldsHeight,
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
            color: CustomTheme.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: CustomTheme.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: CustomTheme.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
