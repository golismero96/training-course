import 'package:flutter/material.dart';


class UserWidget extends StatelessWidget {
  final String image;
  final String family;
  final bool? showFamily;
  final double? hAvatarBox;
  final double? wAvatarBox;
  const UserWidget(this.image, this.family, {Key? key, this.showFamily = true, this.hAvatarBox = 55, this.wAvatarBox = 55}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Container(
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Container(
                    height: hAvatarBox ?? 55,
                    width: wAvatarBox ?? 55,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(45),
                        image: DecorationImage(image: AssetImage('images/$image'))
                    ),
                  ),
                )
            )
        ),
        const SizedBox(height: 10,),
        if(showFamily ?? true)
          Text(family, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54))
      ],
    );
  }
}
