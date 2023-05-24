import 'package:flutter/material.dart';
import 'package:modu_calorie/widgets/app_bar_translucent_button.dart';
import 'package:modu_calorie/widgets/background_image.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureTextPassword = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarTranslucentButton(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.of(context).pushNamed('EntryPage');
            },
          ),
        ),
        extendBodyBehindAppBar: true,
        // when the keyboard pops up,
        // the whole page in the SingleChildScrollView
        // that has screen sized SizedBox as a child
        // moves up along with the keyboard
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenHeight,
              child: Stack(
                children: [
                  // background image
                  const BackgroundImage(
                    imagePath: 'images/background_image_sign_in_page.jpg',
                  ),
                  // bottom sheet
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30.0),
                        ),
                      ),
                      // bottom sheet contents
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 60.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                // title and description
                                const Text(
                                  '돌아오셨군요!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '이메일과 비밀번호를 입력해주세요.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                const SizedBox(height: 40),
                                TextFormField(
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintText: 'Email 입력',
                                  ),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Email 주소를 입력해주세요.';
                                    }
                                    if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]",
                                    ).hasMatch(value!)) {
                                      return '유효한 Email 주소를 입력해주세요.';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    email = value!;
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  controller: _passwordController,
                                  textInputAction: TextInputAction.send,
                                  decoration: InputDecoration(
                                    hintText: '비밀번호 입력',
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
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    password = value!;
                                  },
                                ),
                                const SizedBox(height: 40.0),
                                ElevatedButton(
                                  onPressed: () {
                                    _tryValidation();
                                  },
                                  child: Text('로그인'),
                                ),
                                const SizedBox(height: 30.0),
                                // bottom texts
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    '비밀번호를 잊어버리셨나요?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '처음이신가요? ',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('SignUpPage');
                                      },
                                      child: Text(
                                        '회원가입',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red[700],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
