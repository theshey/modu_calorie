import 'package:flutter/material.dart';
import 'package:modu_calorie/components/text_form_fields/username_text_form_field.dart';

import '../components/app_bars/app_bar_button.dart';
import '../components/buttons/custom_button.dart';
import '../components/buttons/logo_button.dart';
import '../components/text_form_fields/confirm_password_text_form_field.dart';
import '../components/text_form_fields/email_text_form_field.dart';
import '../components/text_form_fields/password_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: AppBarTranslucentButton(
            icon: Icons.arrow_back,
            onPressed: () {},
          ),
        ),
        extendBodyBehindAppBar: true,
        // when the keyboard pops up,
        // the whole page in the SingleChildScrollView
        // that has screen sized SizedBox as a child
        // moves up along with the keyboard
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // title and description
                  const Text(
                    '가입하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '계정을 만들어 보세요. 얼마 걸리지 않을 겁니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  UsernameTextFormField(
                    controller: _usernameController,
                    hintText: '유저명',
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  EmailTextFormField(
                    controller: _emailController,
                    hintText: 'Email',
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  PasswordTextFormField(
                    controller: _passwordController,
                    hintText: '비밀번호',
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  ConfirmPasswordTextFormField(
                    controller: _confirmPasswordController,
                    hintText: '비밀번호 확인',
                    textInputAction: TextInputAction.send,
                    confirmationErrorText: '비밀번호가 틀렸습니다.',
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPressed: () {},
                    text: '회원가입',
                  ),
                  const SizedBox(height: 5.0),
                  // or sign in with
                  Row(
                    children: const <Widget>[
                      SizedBox(width: 30),
                      Expanded(
                        child: Divider(thickness: 1.5, color: Colors.grey),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '혹은 SNS 로그인',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  // social login buttons
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: LogoButton(
                          onPressed: () {},
                          imagePath: 'images/google_logo.png',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: LogoButton(
                          onPressed: () {},
                          imagePath: 'images/apple_logo.png',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: LogoButton(
                          onPressed: () {},
                          imagePath: 'images/kakao_logo.png',
                          color: const Color(0xFFFFE812),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
