import 'package:flutter/material.dart';

class QuestPage extends StatelessWidget {
  const QuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FAQScreen(); // مش محتاج MaterialApp هنا
  }
}

// -------------------------------------------------------------------

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  final List<Map<String, String>> faqData = const [
    {
      'question': 'نص السؤال هنا والذي عادة ما يتكون من عدة أسطر كهذا المثال',
      'answer':
      'نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر. نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر.',
    },
    {
      'question': 'نص السؤال هنا والذي عادة ما يتكون من عدة أسطر كهذا المثال',
      'answer': 'نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر.',
    },
    {
      'question': 'نص السؤال هنا والذي عادة ما يتكون من عدة أسطر كهذا المثال',
      'answer':
      'نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر. نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر. نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر.',
    },
    {
      'question': 'نص السؤال هنا والذي عادة ما يتكون من عدة أسطر كهذا المثال',
      'answer': 'نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false, // ❌ كده بنلغي زر الرجوع الافتراضي
        title: const Text(
          'الأسئلة الشائعة',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context); // ✅ يرجع للـ profile_screen
            },
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            itemCount: faqData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: FAQItem(
                    question: faqData[index]['question']!,
                    answer: faqData[index]['answer']!,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      shape: const Border(),
      iconColor: Colors.black,
      collapsedIconColor: Colors.black,
      title: Text(
        question,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xfff2A72AD),
          fontSize: 14.5,
        ),
      ),
      trailing: const Icon(Icons.keyboard_arrow_down, size: 28),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          child: Text(
            answer,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              height: 1.5,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
