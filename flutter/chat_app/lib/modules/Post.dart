// ignore_for_file: file_names

import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/UserWidget.dart';
import 'package:chat_app/screens/BankPage.dart';
import 'package:chat_app/screens/LearnPage.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/modules/MyProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool heart = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UserWidget('avatars/150-1.jpg', 'Selma',
                            hAvatarBox: 35, wAvatarBox: 35, showFamily: false),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                CategoryTitle('Selma', Colors.black87, 17,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.verified,
                                    color: Colors.blue, size: 18)
                              ],
                            ),
                            const CategoryTitle(
                                'Mashad, Iran', Colors.black87, 14,
                                fontWeight: FontWeight.w300),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BankPage()));
                        },
                        child: Icon(Icons.more_horiz,
                            size: 28,
                            color: context.watch<MyProvider>().theme ==
                                    Themdata.dark
                                ? Colors.white
                                : Colors.grey[700]))
                  ],
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/Icon-192.png'))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            icon: heart
                                ? Icon(CupertinoIcons.heart,
                                    color: Colors.grey[700], size: 26)
                                : const Icon(CupertinoIcons.heart_fill,
                                    color: Colors.redAccent, size: 26),
                            onPressed: () {
                              setState(() {
                                heart = !heart;
                              });
                            }),
                        IconButton(
                            icon: Icon(CupertinoIcons.chat_bubble_text,
                                color: Colors.grey[700], size: 26),
                            onPressed: () {}),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LearnPage()));
                              },
                              child: Icon(Icons.send_outlined,
                                  size: 28,
                                  color: context.watch<MyProvider>().theme ==
                                          Themdata.dark
                                      ? Colors.white
                                      : Colors.grey[700])),
                        )
                      ],
                    ),
                    IconButton(
                        icon: Icon(Icons.more_horiz,
                            color: Colors.grey[700], size: 26),
                        onPressed: () {}),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        icon: Icon(Icons.save_alt_rounded,
                            color: Colors.grey[700], size: 26),
                        onPressed: () {}),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        CategoryTitle('48,337 Likes', Colors.black87, 14,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        UserWidget('avatars/150-1.jpg', 'Selma',
                            hAvatarBox: 27, wAvatarBox: 27, showFamily: false),
                        CategoryTitle(
                            'Liked by Hamide_ashore. and ', Colors.black87, 14,
                            fontWeight: FontWeight.w500),
                        CategoryTitle('124 others', Colors.black45, 13,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        CategoryTitle(
                            'View all 115 comments ...', Colors.black45, 12,
                            fontWeight: FontWeight.w400),
                        CategoryTitle('More ', Colors.black87, 13,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// class Post extends StatelessWidget {
//   const Post({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool heart = false;
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const UserWidget('avatars/150-1.jpg', 'Selma',
//                             hAvatarBox: 35, wAvatarBox: 35, showFamily: false),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: const [
//                                 CategoryTitle('Selma', Colors.black87, 17,
//                                     fontWeight: FontWeight.w600),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Icon(Icons.verified,
//                                     color: Colors.blue, size: 18)
//                               ],
//                             ),
//                             const CategoryTitle(
//                                 'Mashad, Iran', Colors.black87, 14,
//                                 fontWeight: FontWeight.w300),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Icon(Icons.more_horiz,
//                         size: 28,
//                         color:
//                             context.watch<MyProvider>().theme == Themdata.dark
//                                 ? Colors.white
//                                 : Colors.grey[700])
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 300,
//                 padding: const EdgeInsets.all(2),
//                 decoration: BoxDecoration(
//                     color: Colors.blueGrey[50],
//                     image: const DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('images/125.png'))),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         IconButton(
//                             heart ? 
//                             icon: Icon(CupertinoIcons.heart,
//                                 color: Colors.grey[700], size: 26),
//                             onPressed: () {
//                               setState((){
//                                 heart = !heart;
//                               });
//                             }),
//                         IconButton(
//                             icon: Icon(CupertinoIcons.chat_bubble_text,
//                                 color: Colors.grey[700], size: 26),
//                             onPressed: () {}),
//                         IconButton(
//                             icon: Icon(Icons.send_outlined,
//                                 color: Colors.grey[700], size: 26),
//                             onPressed: () {}),
//                       ],
//                     ),
//                     IconButton(
//                         icon: Icon(Icons.save_outlined,
//                             color: Colors.grey[700], size: 26),
//                         onPressed: () {}),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
