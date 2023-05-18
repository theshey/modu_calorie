import 'package:flutter/material.dart';

import '../components/app_bar_buttons/app_bar_button.dart';
import '../components/buttons/logo_button.dart';

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

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final _formKey = GlobalKey<FormState>();
    String username;
    String email;
    String password;

    void _tryValidation() {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();
      }
    }

    // touch the screen to unfocus the TextFormField.
    return GestureDetector(
      onTap: () {
        Future.delayed(Duration(milliseconds: 100), () {
          FocusScope.of(context).requestFocus(FocusNode());
        });
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarButton(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.of(context).pushNamed('SignInPage');
            },
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
              padding:
                  const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
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
                    TextFormField(
                      controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: '유저명'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return '유저명을 입력해주세요.';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        username = value!;
                      },
                      onChanged: (String value) {
                        username = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: 'Email'),
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
                      onChanged: (String value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "비밀번호",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureTextPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureTextPassword = !_obscureTextPassword;
                            });
                          },
                        ),
                      ),
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
                      onChanged: (String value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        hintText: '비밀번호 확인',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureTextConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureTextConfirmPassword =
                                  !_obscureTextConfirmPassword;
                            });
                          },
                        ),
                      ),
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
                    ElevatedButton(
                      onPressed: () {
                        _tryValidation();
                        Navigator.of(context).pushNamed('SignedInPage');
                      },
                      child: Text('로그인'),
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
    );
  }
}
