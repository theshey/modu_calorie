import 'package:flutter/material.dart';
import 'package:modu_calorie/components/background_image.dart';
import 'package:modu_calorie/components/social_login_button.dart';
import 'package:modu_calorie/components/custom_button.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // background
        const BackgroundImage(
          imagePath: 'images/background_image_entry_page.jpg',
        ),
        // contents
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // title and description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    '모두의 칼로리',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    '음식의 칼로리가 궁금하세요? 레시피가 궁금하세요? '
                    '사진 한번 촬영으로 음식에 대한 모든 정보를 찾아볼 수 있어요.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 100.0),
                ],
              ),
            ),
            // sign in buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              // for login button to be on the same place
              // with ones of other pages,
              // login button and the widgets below are contained in
              // the Container that has height of 180.0
              // and aligned to the top of it.
              child: Container(
                height: 180.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // log in button
                    CustomButton(
                      onPressed: () {},
                      text: '로그인',
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
                          '간편하게 SNS 로그인',
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
            ),
          ],
        ),
      ],
    );
  }
}
