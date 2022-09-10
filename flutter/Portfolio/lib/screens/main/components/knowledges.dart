import 'package:Portfolio/constants.dart';
import 'package:Portfolio/screens/main/components/knowledge_text.dart';
import 'package:flutter/material.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text('Knowledge', style: Theme.of(context).textTheme.subtitle2),
        ),
        const KnowledgeText(text: 'Flutter, Dart'),
        const KnowledgeText(text: 'Style, Lass, Less'),
        const KnowledgeText(text: 'Gulp, Webpack, Grunt'),
        const KnowledgeText(text: 'NPM, Yarn, Babel, SWC'),
        const KnowledgeText(text: 'React, React-Router'),
        const KnowledgeText(text: 'Redux, Redux-Toolkit'),
        const KnowledgeText(text: 'Django, Rest Framework'),
        const KnowledgeText(text: 'Docker, Git, Github, Gitlab'),
        const KnowledgeText(text: 'Linux, Windows, Mac'),
        const KnowledgeText(text: 'Jest, Selenium'),
        const KnowledgeText(text: 'Bootstrap, Tailwind'),
        const KnowledgeText(text: 'Material-UI, Ant-Design'),
        const KnowledgeText(text: 'Figma, Adobe XD'),
        const KnowledgeText(text: 'Photoshop, Lightroom'),
        const KnowledgeText(text: 'Premiere, After Effects'),
        const KnowledgeText(text: 'English, Persian'),
      ],
    );
  }
}
