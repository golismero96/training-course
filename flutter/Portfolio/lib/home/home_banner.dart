import 'package:Portfolio/constants.dart';
import 'package:Portfolio/screens/main/components/my_build_animated_text.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/bg.jpeg", fit: BoxFit.cover,),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Discover my Amazing \nArt Space!",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white)
                ),
                const MyBuildAnimatedText(),
                const SizedBox(height: defaultPadding),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Explore Now", style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2,
                      vertical: defaultPadding,
                    ),
                    backgroundColor: primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
