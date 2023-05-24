import 'package:flutter/material.dart';
import 'package:modu_calorie/widgets/background_image.dart';

class SignedUpPage extends StatelessWidget {
  const SignedUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background image
          const BackgroundImage(
            imagePath: 'images/background_image_sign_in_page.jpg',
          ),
          // contents
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  '가입을\n축하합니다!',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  '바로 로그인해서 레시피를 검색해볼까요?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 100.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('SignInPage');
                  },
                  child: const Text('바로 로그인 하기'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('EntryPage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    '처음으로 돌아가기',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
