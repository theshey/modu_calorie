import 'package:flutter/material.dart';
import 'package:modu_calorie/components/custom_button.dart';
import 'package:modu_calorie/components/social_login_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    // when the keyboard pops up, the whole page
    // in the SingleChildScrollView(that has screen sized SizedBox as a child)
    // moves up along with the keyboard
    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                decoration: InputDecoration(
                  hintText: '사용자명',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email 또는 ID',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '비밀번호 확인',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // for login button to be on the same place
              // with ones of other pages,
              // login button and the widgets below are contained in
              // the Container that has height of 180.0
              // and aligned to the top of it.
              SizedBox(
                height: 180.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // log in button
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
                          child: Divider(
                              thickness: 1.5,
                              color: Colors.grey),
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
                          child: SocialLoginButton(
                            onPressed: () {},
                            imagePath: 'images/google_logo.png',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: SocialLoginButton(
                            onPressed: () {},
                            imagePath: 'images/apple_logo.png',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: SocialLoginButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
