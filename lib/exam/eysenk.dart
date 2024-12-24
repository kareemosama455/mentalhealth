import 'package:flutter/material.dart';

class QModel {
  final int id;
  final String question;
  final int yesScore;
  final int noScore;

  QModel({
    required this.id,
    required this.question,
    required this.yesScore,
    required this.noScore,
  });
}

class EysenkScreen extends StatefulWidget {
  const EysenkScreen({super.key});

  @override
  State<EysenkScreen> createState() => _EysenkScreenState();
}

class _EysenkScreenState extends State<EysenkScreen> {
  final Map<int, int> _selectedValues = {};
  int _totalScore = 0;

  void _calculateScore() {
    _totalScore = 0;
    _selectedValues.forEach((questionId, selectedValue) {
      var question = users.firstWhere((user) => user.id == questionId);
      if (selectedValue == question.yesScore) {
        _totalScore += question.yesScore;
      } else {
        _totalScore += question.noScore;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Eysenk Inventory', style: TextStyle(fontSize: 40))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < users.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            users[i].question,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Column(
                          children: [
                            const Text('Yes'),
                            Radio(
                              value: users[i].yesScore,
                              groupValue: _selectedValues[users[i].id],
                              onChanged: (value) {
                                setState(() {
                                  _selectedValues[users[i].id] = value as int;
                                  _calculateScore();
                                });
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('No'),
                            Radio(
                              value: users[i].noScore,
                              groupValue: _selectedValues[users[i].id],
                              onChanged: (value) {
                                setState(() {
                                  _selectedValues[users[i].id] = value as int;
                                  _calculateScore();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total Score: $_totalScore',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


final List<QModel> users = [
  QModel(id: 1,question: ' هل تنوق إلى الأشياء المثيرة في معظم الأحيان؟',yesScore: 2,noScore: 1),
  QModel(id: 2,question: 'هل تحتاج إلى أصدقاء يفهمونك لكي تشعر بالارتياح والابتهاج؟',yesScore: 2,noScore: 1),
  QModel(id: 3,question: 'هل أنت سعيد وتعالج الأمور ببساطة ودون تدقيق وتمحيص؟',yesScore: 2,noScore: 1),
  QModel(id: 4,question: 'هل تنزعج إلى حد كبير لو رفض طلب لك؟',yesScore: 1,noScore: 2),
  QModel(id: 5,question: 'هل تتمثل وتفكر ملياً فبل الإقدام على عمل أي شيء؟',yesScore: 2,noScore: 1),
  QModel(id: 6,question:'هل تفي دائباً بوعد قطعته على نفسك بغض النظر عم| قد يكلفمن تعب أو عناء؟',yesScore: 1,noScore: 2),
 QModel(id: 7,question: 'هل يثور مزاجك وييدأ في أحيان كثيرة؟',yesScore: 1,noScore: 2),
 QModel(id: 8,question: 'هل يثور مزاجك وييدأ في أحيان كثيرة؟', yesScore: 1,noScore: 2),
QModel(id: 9,question: 'هل يثور مزاجك وييدأ في أحيان كثيرة؟',yesScore: 1,noScore: 2),
QModel(id: 10,question: 'هل يثور مزاجك وييدأ في أحيان كثيرة؟',yesScore: 2,noScore: 1),
  QModel(id: 11,question: 'هل من عادتك أن تقوم بعمل وقول أشياء على نحو متسرع ودونتأمل أو تفكير؟',yesScore: 1,noScore: 2),
  QModel(id: 12,question: 'هل حدث أن شعرت بالتعاسة دون سبب كاف لذلك؟',yesScore: 1,noScore: 2),
  QModel(id: 13,question: 'هل تعمل أي شيء تقريباً من أجل الجرأة؟',yesScore: 2,noScore: 1),
  QModel(id: 14,question: 'هل تشعر بالخجل فجأة عندما تريد التحدث إلى شخص غريبجذاب؟',yesScore: 1,noScore: 2),
  QModel(id: 15,question: 'هل يحدث أن تفقد السيطرة على نفسك وتغدو غاضباً أحياناً؟',yesScore: 1,noScore: 2),
  QModel(id: 16, question: 'هل تقوم بالأشياء على نحو ارتجالي في معظم الأحيان؟', yesScore: 1, noScore: 2),
  QModel(id: 17, question: 'هل تشعر غالباً بالقلق حيال أشياء كان ينبغي لك ألا تفعلها أوتقرها؟', yesScore: 2, noScore: 1),
  QModel(id: 18, question: 'هل تفضل المطالعة على التحدث مع الآخرين بصفة عامة؟', yesScore: 1, noScore: 2),
  QModel(id: 19, question: 'هل يسهل جرح مشاعرك نوعاً ما؟', yesScore: 1, noScore: 2),
  QModel(id: 20, question: 'هل ترغب في الخروج كثيراً من المنزل؟', yesScore: 1, noScore: 2),
  QModel( id: 21,question: 'هل تراودك أحياناً أفكار وخواطر لا ترغب أن يعرفها الآخرون', yesScore: 1, noScore: 2),
  QModel(id: 22, question: 'هل تشعر بنشاط شديد أحياناً وبالبلادة أحياناً أخرى؟', yesScore: 1, noScore: 2),
  QModel(id: 23, question: 'هل تفضل أن يكون لديك عدد قليل من الأصدقاء شريطة أن يكونوامن المقربين؟', yesScore: 1, noScore: 2),
  QModel(id: 24, question: 'هل تستغرق في أحلام اليقظة؟', yesScore: 1, noScore: 2),
  QModel(id: 25, question: 'هل تجيب الناس بالصراخ عندما يصرخون في وجهك؟', yesScore: 2, noScore: 1),
  QModel(id: 26, question: 'هل يضايقك الشعور بالذنب في كثير من الأحيان؟', yesScore: 1, noScore: 2),
  QModel(id: 27, question: 'هل عاداتك جميعها حسنة ومرغوب فيها؟', yesScore: 2, noScore: 1),
  QModel(id: 28,question: 'هل يمكنك أن تترك نفسك على سجيتها وتتمتع كثيراً في حفل مرح؟', yesScore: 2, noScore: 1),
  QModel(id: 29, question: 'هل تعتبر نفسك متوتر الأعصاب؟', yesScore: 2, noScore: 1),
  QModel(id: 30, question: 'هل يعتقد الآخرون أنك حيوي ونشيط؟', yesScore: 1, noScore: 2),
  QModel(id: 31, question:'هل قمت بعمل شيء هام ثم شعرت غالباً أن باستطاعتك القيامبه على نحو أفضل؟', yesScore: 1, noScore: 2),
  QModel( id: 32, question: 'هل يغلب عليك طابع الهدوء عندما تكون مع الآخرين؟', yesScore: 2, noScore: 1),
  QModel(id: 33, question: 'هل تنهمك في القيل والقال أو نشر الإشاعات أحياناً؟', yesScore: 1, noScore: 2),
  QModel(id: 34, question: 'هل تلازمك الأفكار لدرجة لا تستطيع معها النوم؟', yesScore: 2, noScore: 1),
  QModel(id: 35,question:'إذا كنت تريد معرفة شيء ماء فهل تفضل معرفته من خلال اللجوءإلى شخص آخر تحدثه عنه؟', yesScore: 1, noScore: 2),
  QModel(id: 36, question: 'هل يحدث لك خفقان قلب أو تسرع في دقاته؟', yesScore: 1, noScore: 2),
  QModel( id: 36,question:'هل تحب نوع العمل الذي يتطلب منك انتباهاً شديداً أو دقيقاً؟هل تنتابك نوبات من الارتجاف والارتعاش أحياناً؟', yesScore: 1, noScore: 2),
  QModel( id: 36, question: 'هل تصرح للجمارك عن كل شيء لديك حتى لو علمت أنه يستحيل اكتشافه؟', yesScore: 1, noScore: 2),
  QModel(id: 37, question: 'هل أنت شخص سريع الاستثارة أو الانفعال؟', yesScore: 1, noScore: 2),
  QModel( id: 38, question: 'هل ترغب القيام بأشياء ينبغي لك أن تتصرف حياها بسرعة؟', yesScore: 1, noScore: 2),
  QModel(id: 39, question: 'هل تقلق بصدد أشياء مخيفة قد تحدث لك؟', yesScore: 2, noScore: 1),
  QModel(id: 40, question: 'هل يمتاز أسلوب حركتك بالبطء وعدم السرعة؟', yesScore: 1, noScore: 2),
  QModel(id: 41, question: 'هل حدث أن تأخرت عن تنفيذ موعد أو عمل ما؟', yesScore: 1, noScore: 2),
  QModel(id: 42, question: 'هل تنتابك كوابيس أو أحلام مزعجة كثيرة؟', yesScore: 1, noScore: 2),
  QModel(id: 43,question: 'هل ترغب في التحدث مع الناس إلى حدٍ كبير بحيث لم تضيع', yesScore: 1, noScore: 2),
  QModel(id: 44, question: 'فرصة الحديث إلى شخص غريب؟', yesScore: 2, noScore: 1),
  QModel(id: 45, question: 'هل تزعجك الآلام والأوجاع؟', yesScore: 1, noScore: 2),
  QModel( id: 46, question:'هل تشعر بتعاسة شديدة إن لم تر كثير من الناس في معظم الأحيان؟', yesScore: 2, noScore: 1),
  QModel(id: 47, question: 'هل تعتبر نفسك شخصا عصبيا؟', yesScore: 1, noScore: 2),
  QModel(id: 48, question: 'هل هناك أشخاص ممن تعرفهم لا تحبهم على نحو قاطع؟', yesScore: 1, noScore: 2),
  QModel(id: 49, question: 'هل تستطيع القول بأنك واثق من نفسك تماماً؟', yesScore: 2, noScore: 1),
  QModel( id: 50,question:' هل يؤلمك الآخرون بسهولة لدى اكتشافهم الخطأ فيك أو في عملك؟', yesScore: 1, noScore: 2),
  QModel(id: 51, question: 'هل يصعب عليك أن تتمتع فعلاً في حفل مرح؟', yesScore: 1, noScore: 2),
  QModel(id: 52, question: 'هل تنزعج من الشعور بالنقص؟', yesScore: 1, noScore: 2),
  QModel( id: 53, question: ' هل يسهل عليك إضفاء جو من الحيوية على حفل ممل إلى حد ما ؟ ', yesScore: 2, noScore: 1),
  QModel(id: 54, question: 'هل تتحدث أحياناً عن أمور لا تعرف عنها شيئاً؟', yesScore: 1, noScore: 2),
  QModel(id: 55, question: 'هل أنت قلق على صحتك ؟', yesScore: 1, noScore: 2),
  QModel(id: 56, question: 'هل تحب إيقاع الآخرين في " مقالب " بقصد المرح؟', yesScore: 1, noScore: 2),
  QModel(id: 57, question: ' هل تعاني من الأرق؟', yesScore: 1, noScore: 2),
];
