import 'package:flutter/material.dart';


class QuestPage extends StatelessWidget {
  const QuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FAQScreen(),
    );
  }
}

// -------------------------------------------------------------------

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  // قائمة البيانات التي تحتوي على الأسئلة والأجوبة
  final List<Map<String, String>> faqData = const [
    {
      'question': 'نص السؤال هنا والذي عادة ما يتكون من عدة أسطر كهذا المثال',
      'answer': 'نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر. نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر.',
    },
    {
      'question': 'نص السؤال هنا والذي عادة ما يتكون من عدة أسطر كهذا المثال',
      'answer': 'نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر.',
    },
    {
      'question': 'نص السؤال هنا والذي عادة ما يتكون من عدة أسطر كهذا المثال',
      'answer': 'نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر. نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر. نص الجواب الذي يكون هنا عادة ما يتكون من عدة أسطر.',
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
        // إزالة الظل من شريط التطبيق
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,

        // العنوان في منتصف الشاشة
        title: const Text(
          'الأسئلة الشائعة',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        // زر الرجوع أو زر جانبي مشابه لما في الصورة
        actions: [
          IconButton(
            onPressed: () {},
            // استخدام أيقونة السهم لليمين كما في الصورة (افتراضيًا للغة العربية)
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          ),
        ],
      ),

      // جسم الصفحة
      body: Directionality(
        // لضمان عرض النص والأيقونات من اليمين لليسار (RTL)
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            itemCount: faqData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                // حاوية بيضاء مستديرة تمثل كل سؤال وجواب
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    // لإضافة ظل خفيف مشابه لما في الصورة (اختياري)
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

// ويدجت مخصص لعنصر السؤال والجواب باستخدام ExpansionTile
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
    // ExpansionTile توفر خاصية الطي والتوسيع بشكل مدمج
    return ExpansionTile(
      // محاذاة النص للسؤال
      tilePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),

      // إزالة الخط الفاصل الذي يظهر أسفل العنوان افتراضيًا
      shape: const Border(),

      // تخصيص الأيقونة المستخدمة للفتح والإغلاق
      iconColor: Colors.black,
      collapsedIconColor: Colors.black,

      // عنوان السؤال (يُعرض دائمًا)
      title: Text(
        question,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xfff2A72AD),
          fontSize: 14.5,
        ),
      ),

      // الأيقونة المستخدمة عندما يكون العنصر مطويًا (السهم للأسفل)
      trailing: const Icon(Icons.keyboard_arrow_down, size: 28),

      // الودجت الذي يظهر عند فتح العنصر
      children: <Widget>[
        // المحتوى (الجواب)
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          child: Text(
            answer,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              height: 1.5,
            ),
            // محاذاة النص للجواب
            textAlign: TextAlign.right,
          ),
        ),
      ],
      // الدالة التي يتم استدعاؤها عند تغيير حالة العنصر (للتعديل على الأيقونة إذا أردت)
      onExpansionChanged: (isExpanded) {
        // يمكنك هنا تحديث حالة لتغيير الأيقونة من سهم للأسفل إلى سهم للأعلى يدويًا إذا لم تعجبك الأيقونة الافتراضية
      },
    );
  }
}