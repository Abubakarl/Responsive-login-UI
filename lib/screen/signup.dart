import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_login_ui/theme.dart';
import 'package:responsive_login_ui/widgets/shared_widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
        _buildSignUpForm(context),
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
            child: _buildSignUpForm(context),
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
              child: _buildSignUpForm(context),
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

  Widget _buildSignUpForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Create Account",
          style: TextStyle(
            fontSize: CustomTheme.titleFontSize,
            fontFamily: "SmoochSans",
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Join us and start your journey",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CustomTheme.bodyLargeFontSize,
          ),
        ),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildTextField(
          icon: CupertinoIcons.person,
          hintText: "Full Name",
        ),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildTextField(
          icon: CupertinoIcons.mail,
          hintText: "Email Address",
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildTextField(
          icon: CupertinoIcons.lock,
          hintText: "Password",
          isPassword: true,
        ),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildTextField(
          icon: CupertinoIcons.lock,
          hintText: "Confirm Password",
          isPassword: true,
        ),
        SizedBox(height: CustomTheme.normalGap),
        _buildSignupButton(),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildDividerWithText("Or Sign Up With"),
        SizedBox(height: CustomTheme.normalGap),
        SharedWidgets.buildSocialButton(
          "google",
          "assets/google 1@1x.png",
          "Sign up",
        ),
        SizedBox(height: CustomTheme.smallGap),
        SharedWidgets.buildSocialButton(
          "Facebook",
          "assets/facebook 1@1x.png",
          "Sign up",
        ),
        SizedBox(height: CustomTheme.normalGap),
        _buildLoginLink(context),
      ],
    );
  }

  Widget _buildSignupButton() {
    return Container(
      decoration: BoxDecoration(
        color: CustomTheme.black,
        borderRadius: BorderRadius.circular(CustomTheme.fieldBorderRadius),
      ),
      height: CustomTheme.fieldsHeight,
      child: Center(
        child: Text(
          "Sign Up",
          style: TextStyle(
            color: CustomTheme.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(
            color: CustomTheme.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Login",
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
