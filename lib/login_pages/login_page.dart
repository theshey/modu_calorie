import 'package:flutter/material.dart';
import 'package:modu_calorie/components/background_image.dart';
import 'package:modu_calorie/components/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    // when the keyboard pops up, the whole page
    // in the SingleChildScrollView(that has screen sized SizedBox as a child)
    // moves up along with the keyboard
    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            // background image
            const BackgroundImage(
              imagePath: 'images/background_image_login_page.jpg',
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
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 15.0),
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
                        const Text(
                          '이메일과 비밀번호를 입력해주세요.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // e-mail
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email 또는 ID',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        // password
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: '비밀번호',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        // for login button to be on the same place
                        // with ones of other pages,
                        // login button and the widgets below are contained in
                        // the Container that has height of 180.0
                        // and aligned to the top of it.
                        Container(
                          height: 180.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // login button
                              CustomButton(
                                onPressed: () {},
                                text: '로그인',
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
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
