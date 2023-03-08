import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final illustration = 'https://ouch-cdn2.icons8.com/KbFaioMDLAFQADTQMG6Ty2ZcXBX3i9pTAmuu7KwbvgM/rs:fit:512:512/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDgv/YTBkN2RjMDItNzZl/Mi00YzBiLWJkYTYt/NWFkYWE2ODNhZmJj/LnBuZw.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Image.asset('images/1.png'),
                  FadeInUp(
                      child: Square(),
                      duration: Duration(milliseconds: 1400),
                      animate: true
                  )
                ],
              )
          ),
        )
    );
  }
}
class Square extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
      ),
    );
  }
}