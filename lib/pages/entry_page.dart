import 'package:flutter/material.dart';
import 'package:modu_calorie/widgets/background_image.dart';
import 'package:modu_calorie/widgets/logo_button.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background
          const BackgroundImage(
            imagePath: 'images/background_image_entry_page.jpg',
          ),
          // contents
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 60.0,
                horizontal: 30.0,
              ),
              child: Column(
                children: [
                  // title and description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        '모두의 칼로리',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        '음식의 칼로리가 궁금하세요? 레시피가 궁금하세요? '
                        '사진 한번 촬영으로 음식에 대한 모든 정보를 찾아볼 수 있어요.',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  // sign in buttons
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // log in button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('SignInPage');
                            },
                            child: const Text('로그인'),
                          ),
                          const SizedBox(height: 5.0),
                          // or sign in with
                          Row(
                            children: const <Widget>[
                              SizedBox(width: 10),
                              Expanded(
                                child:
                                    Divider(thickness: 1.5, color: Colors.grey),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '간편하게 SNS 로그인',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey,),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child:
                                    Divider(thickness: 1.5, color: Colors.grey),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 5.0),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
