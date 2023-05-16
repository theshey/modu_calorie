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

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    String username = '';
    String email = '';
    String password = '';

    void _tryValidation() {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();
      }
    }

    // touch the screen to unfocus the TextFormField.
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
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
                child: Form(
                  key: _formKey,
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
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return '유저명을 입력해주세요.';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          username = value!;
                        },
                      ),
                      const SizedBox(height: 20),
                      EmailTextFormField(
                        controller: _emailController,
                        hintText: 'Email',
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email 주소를 입력해주세요.';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value!)) {
                            return '유효한 Email 주소를 입력해주세요.';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          email = value!;
                        },
                      ),
                      const SizedBox(height: 20),
                      PasswordTextFormField(
                        controller: _passwordController,
                        hintText: '비밀번호',
                        textInputAction: TextInputAction.next,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return '비밀번호를 입력해주세요.';
                          }
                          if (value.length > 20 || value.length < 8) {
                            return '8-20자의 비밀번호를 입력해주세요.';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          password = value!;
                        },
                      ),
                      const SizedBox(height: 20),
                      ConfirmPasswordTextFormField(
                        controller: _confirmPasswordController,
                        hintText: '비밀번호 확인',
                        textInputAction: TextInputAction.send,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return '비밀번호를 입력해주세요.';
                          }
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            return "비밀번호가 서로 일치하지 않습니다.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        onPressed: () {
                          _tryValidation();
                        },
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
        ),
      ),
    );
  }
}
