import 'package:flutter/material.dart';

class TModel {
  final int id;
  final String question;
  final int answer0;
  final int answer1;
  final int answer2;
  final int answer3;
  final int answer4;

  TModel({
    required this.id,
    required this.question,
    required this.answer0,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
  });
}

class TensiScale extends StatefulWidget {
  const TensiScale({super.key});

  @override
  State<TensiScale> createState() => _TensiScaleState();
}

class _TensiScaleState extends State<TensiScale> {
  final Map<int, int> _selectedValues = {};
  int _totalScore = 0;

  void _calculateScore() {
    _totalScore = 0;
    _selectedValues.forEach((questionId, selectedValue) {
      var question = tensiusers.firstWhere((user) => user.id == questionId);
      if (selectedValue == question.answer0) {
        _totalScore += question.answer0;
      } else if (selectedValue == question.answer1) {
        _totalScore += question.answer1;
      } else if (selectedValue == question.answer2) {
        _totalScore += question.answer2;
      } else if (selectedValue == question.answer3) {
        _totalScore += question.answer3;
      } else if (selectedValue == question.answer4) {
        _totalScore += question.answer4;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Tensi Scale', style: TextStyle(fontSize: 40)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Text('لا يبنطبق علي تماما', textAlign: TextAlign.center)),
                  Expanded(child: Text('لا ينطبق علي غالبا', textAlign: TextAlign.center)),
                  Expanded(child: Text('احيانا ينطبق واحيانا لا', textAlign: TextAlign.center)),
                  Expanded(child: Text('ينطبق علي غالبا', textAlign: TextAlign.center)),
                  Expanded(child: Text('ينطبق علي تماما', textAlign: TextAlign.center)),
                ],
              ),
            ),
            for (int i = 0; i < tensiusers.length; i++)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            tensiusers[i].question,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Radio(
                                  value: tensiusers[i].answer0,
                                  groupValue: _selectedValues[tensiusers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[tensiusers[i].id] = value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Radio(
                                  value: tensiusers[i].answer1,
                                  groupValue: _selectedValues[tensiusers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[tensiusers[i].id] = value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Radio(
                                  value: tensiusers[i].answer2,
                                  groupValue: _selectedValues[tensiusers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[tensiusers[i].id] = value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Radio(
                                  value: tensiusers[i].answer3,
                                  groupValue: _selectedValues[tensiusers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[tensiusers[i].id] = value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Radio(
                                  value: tensiusers[i].answer4,
                                  groupValue: _selectedValues[tensiusers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[tensiusers[i].id] = value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                              ],
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _totalScore < 300
                    ? 'مفهومك لذاتك خاطئ'
                    : 'لديك مفهوم واضح لذاتك',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



final List<TModel> tensiusers = [
  TModel(id: 1,question: ' امتلك جسما سليما',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 2,question: 'أحب أن أبدو وسيما وأنيقا في كل الاوقات',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 3,question: 'أنا شخص جناب',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 4,question: 'أنا مثقل بالأوجاع والآلام',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 5,question: 'اعتبر نفسي شخصا عاطفيا',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 6,question:'أنا شخص مريض',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
 TModel(id: 7,question: 'لست بدينا جد أو نحيفا جدا',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
 TModel(id: 8,question: 'لست طويلا جدا أو قصيرا جدا', answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
TModel(id: 9,question: 'أحب مظهري أن يكون بنفس الطريقةالتي هو عليها',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
TModel(id: 10,question: 'لا أشعر أنني على ما يرام كما يجب  ',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 11,question: 'بودي أن أغير بعض الأجزاء من جسمي',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 12,question: 'يجب أن يكون لدى جاذبية أكثر',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 13,question: 'اعتنى بنفسي جيدا من الناحية البدنية',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 14,question: 'أشعر أنني على ما يرام معظم الوقت',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 15,question: 'أحاول أن اهتم بمظهري',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 16, question: 'مستوى أدائي الرياضي ضعيف', answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 17, question: 'غالبا ما أتصرف كما لو كنت غير ماهر ', answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 18, question: 'نومي قليل', answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 19, question: 'أنا شخص مهذب',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 20, question: 'أنا شخص متلين',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel( id: 21,question: 'أنا شخص أمين', answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 22, question: 'أنا فاشل أخلاقيا', answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 23, question: 'أنا شخص سي', answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 24, question: 'أنا شخص ضعيف من الناحية الأخلاقية',  answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 25, question: 'أنا راض عن سلوكي الأخلاقي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 26, question: 'أنا متدين كما أريد أن أكون',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 27, question: 'أنا راض عن صلتي بالله', answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 28,question: 'بودي أن أكون جديرا بالثقة',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 29, question: 'ينبغي أن اذهب إلى الجامع (الكنيسة)أكثر من ذلك',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 30, question: 'ا يجب أن أقول مثل هذه الأكاذيب الكثيرة', answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 31, question:'أنا مخلص نحو ديني في كل يوم من حياتي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel( id: 32, question: 'افعل ما هو صواب معظم الوقت', answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 33, question: 'أحاول أن أتغير عندما اعرف أنني أقوم بأشياء خاطئة',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 34, question: 'استخدم أحيانا وسائل غير مشروعة لشق طريقي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 35,question:'افعل أحيانا أشياء سيئة جدا ',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 36, question: 'أجد صعوية في أن افعل ما هو صحيح', answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel( id: 37,question:'أنا شخص مرح', answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel( id: 38, question: 'لدي قدر من ضبط النفس',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 39, question: 'أنا شخص هادئ وسلس', answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel( id: 40, question: 'أنا شخص حقود',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 41, question: 'افقد أعصابي',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
    TModel(id: 42, question: 'أنا لاشيء',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 4),
  TModel(id: 43, question: 'أنا راض بان كون كما أنا تماما',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 44, question: 'أنا أنيق كما أود أن أكون',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 45, question: 'أنا لطيف تماما كما يجب علي أن أكون',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 4),
  TModel(id: 46, question: 'أنا لست الشخص الذي أود أن أكونه',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 47, question: 'احتقر نفسي',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 4),
  TModel(id: 48, question: 'ارغب في ألا استسلم بسهولة كما افعل أستطيع دائما العناية بنفسي في أي وقت',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 4),
  TModel(id: 49, question: 'احل مشاكلي بسهولة تامة',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 50, question: 'اتتحمل التأنيب من أشياء دون أن افقد اعصابي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 51, question: 'أغير رأبي كثيرا',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 52, question: 'افعل أشياء بدون تفكير مسبق فيها',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 53, question: 'أحاول أن اهرب من مشاكلي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 54, question: 'لدي أسرة تساعدني دائما في أي نوع من المشاكل',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 55, question: 'أنا شخص مهم بالنسبة لأصدقائي وأسرتي',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 56, question: 'أنا عضو في أسرة سعيدة',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 57, question: 'أنا غير محبوب من أسرتي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 58, question: 'أصدقائي لا يتقون بي ',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 59, question: 'أشعر أن أسرتي لا تتق بي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 60, question: 'أنا راض عن علاقتي الأسرية',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 61, question: 'أعامل والذي كما يجب علي معاملتهما (استخدام الفعل الماضي في حالة الوفاة) ',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 62, question: 'أنا حساس جدا لما تقوله أسرتي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 63, question: 'يجب علي أن أثق في أسرتي أكثر من ذلك',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 64, question: 'يجب أن أحب أسرتي أكثر من ذلك',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 65, question: 'أحاول أن أكون عادلا مع أصدقائي وأسرتي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
    TModel(id: 66, question: 'أقوم بأداء نصيبي من العمل في المنزل',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 67, question: 'لشعر باهتمام حقيقي نحو أسرتي',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id:68, question: 'اتشاجر مع أسرتي',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 69, question: 'استسلم لوالدي (استخدم الفعل الماضي في حالة الوفاة )',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 70, question: 'لا أتصرف بالطريقة التي ترى أسرتي انه يجب علي أن أتصرف بها',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 71, question: 'أنا شخص ودود',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 72, question: 'أنا مشهور بين النساء',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
    TModel(id: 73, question: 'أنا مشهور بين الرجال',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 74, question: 'أنا غاضب من العالم كله',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 75, question: 'لا اهتم بما يفعله الآخرون',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 76, question: 'من الصعب مصادقتي',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 77, question: 'أنا اجتماعي كما أود أن أكون',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
    TModel(id: 78, question: 'أنا راض عن الطريقة التي أعامل بها الآخرين',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 79, question: 'أحاول أن ارض الآخرين ولكني لا أبالغ في ذلك',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 80, question: 'يجب أن أكون أكثر أدبا بالنسبة للآخرين',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 81, question: 'لست صالحا إطلاقا من وجهة النظر الاجتماعية',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 82, question: 'ينبغي أن أتعامل بصورة أفضل معا لآخرين',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 83, question: 'حاول أن انهم وجهة نظر الزملاء الآخرين',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 84, question: 'اری جوانب حسنة في كل من التقيت بهم من الناس',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 85, question: 'أتعامل في يسر مع الآخرين',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 86, question: 'لا أشعر بالراحة مع بقية الناس',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 87, question: 'لا أسامح الآخرين بسهولة',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 88, question: 'جد صعوبة بالتحدث مع الغرباء',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 89, question: 'لا أقول الصدق دائما',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 90, question: 'في بعض الأحيان أفكر في أشياء سيئة جدا لا يصح الحديث عنها',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 91, question: 'يعتريني الغضب أحيانا',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
    TModel(id: 92, question: 'أحيانا عندما أكون على غير ما يرام بتابني الضيق',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 93, question: 'لا أحب كل من اعرفهم',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 94, question: 'أروج الشائعات قليلا في بعض الأحيان',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
  TModel(id: 95, question: 'اضحك أحيانا من النكت التي قد تخرج عن حدود اللباقة',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 96, question: 'أشعر أحيانا برغبة في السب',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),
  TModel(id: 97, question: 'أفضل الفوز على الهزيمة في اللعب',answer0: 1,answer1: 2,answer2: 3,answer3: 4,answer4: 5),
    TModel(id: 98, question: 'أحيانا اوجل عمل اليوم إلى الغد',answer0: 5,answer1: 4,answer2: 3,answer3: 2,answer4: 1),






];



