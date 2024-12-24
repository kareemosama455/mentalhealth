import 'package:flutter/material.dart';

class OPModel {
  final int id;
  final String question;
  final int first;
  final int second;
  final int third;
  final int fourth;
  final int fifth;

  OPModel({
    required this.id,
    required this.question,
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.fifth,
  });
}

class OPAnswers {
  final int id;
  final String answer0;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;

  OPAnswers({
    required this.id,
    required this.answer0,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
  });
}

class ObsessiveScreen extends StatefulWidget {
  const ObsessiveScreen({super.key});

  @override
  State<ObsessiveScreen> createState() => _ObsessiveScreenState();
}

class _ObsessiveScreenState extends State<ObsessiveScreen> {
  final Map<int, int> _selectedValues = {};
  int _totalScore = 0;

  void _calculateScore() {
    _totalScore = 0;
    _selectedValues.forEach((questionId, selectedValue) {
      var question = opUsers.firstWhere((user) => user.id == questionId);
      if (selectedValue == question.first) {
        _totalScore += question.first;
      } else if (selectedValue == question.second) {
        _totalScore += question.second;
      } else if (selectedValue == question.third) {
        _totalScore += question.third;
      } else if (selectedValue == question.fourth) {
        _totalScore += question.fourth;
      } else if (selectedValue == question.fifth) {
        _totalScore += question.fifth;
      }
    });
  }

  String _getResultMessage() {
    if (_totalScore < 7) {
      return 'خفيف جدا';
    } else if (_totalScore >= 8 && _totalScore <= 15) {
      return 'خفيف';
    } else if (_totalScore >= 16 && _totalScore <= 23) {
      return 'متوسط';
    } else if (_totalScore >= 24 && _totalScore <= 31) {
      return 'ملحوظ';
    } else if (_totalScore >= 32 && _totalScore <= 40) {
      return 'شديد';
    } else {
      return 'Invalid score';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Obsessive Compulsive', style: TextStyle(fontSize: 30))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < opUsers.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          opUsers[i].question,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: opUsers[i].first,
                                  groupValue: _selectedValues[opUsers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[opUsers[i].id] =
                                          value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                                Expanded(
                                    child: Text('(${opAnswers[i].answer0})')),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: opUsers[i].second,
                                  groupValue: _selectedValues[opUsers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[opUsers[i].id] =
                                          value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                                Expanded(
                                    child: Text('(${opAnswers[i].answer1})')),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: opUsers[i].third,
                                  groupValue: _selectedValues[opUsers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[opUsers[i].id] =
                                          value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                                Expanded(
                                    child: Text('(${opAnswers[i].answer2})')),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: opUsers[i].fourth,
                                  groupValue: _selectedValues[opUsers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[opUsers[i].id] =
                                          value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                                Expanded(
                                    child: Text('(${opAnswers[i].answer3})')),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: opUsers[i].fifth,
                                  groupValue: _selectedValues[opUsers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[opUsers[i].id] =
                                          value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                                Expanded(
                                    child: Text('(${opAnswers[i].answer4})')),
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
                _getResultMessage(),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// ignore: non_constant_identifier_names
final List<OPModel> opUsers = [
  OPModel(id: 1,question: 'مقدار الوقت الذي تستغرقه الأفكار الوسواسية؟',first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
  OPModel(id: 2,question: 'مقدار التعارض الذي تحدثه الأفكار الوسواسية مع نشاطاتك الاجتماعية والعملية؟',first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
  OPModel(id: 3,question: '- مقدار التوتر والقلق المصاحب للأفكار الوسواسية؟',first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
  OPModel(id: 4,question: 'مقدار الجهد الذي المبذول في مقاومة الأفكار الوسواسية (بغض النظر عن نجاحك في المقاومة؟',first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
  OPModel(id: 5,question: 'مقدار سيطرتك على الأفكار الوسواسية؟',first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
  OPModel(id: 6,question:'مقدار الوقت الذي تمضيه في القيام بالأفعال القهرية؟',first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
 OPModel(id: 7,question: 'مقدار التعارض الذي تحدثه الأفعال القهرية في نشاطاتك الاجتماعية والعملية؟',first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
 OPModel(id: 8,question: 'مقدار التوتر والقلق الناتج في حال الامتناع عن القيام بالأفعال القهرية؟', first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
OPModel(id: 9,question: 'مقدار الجهد المبذول في مقاومة الأفعال القهرية ( بغض النظر عن مدى نجاحك في المقاومة) ؟',first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
OPModel(id: 10,question: 'مقدار سيطرتك على الأفعال القهرية؟',first: 0,second: 1,third: 2,fourth: 3,fifth: 4),
];

final List<OPAnswers> opAnswers = [
  OPAnswers(id: 1, answer0: 'لا شئ',
  answer1:'أقل من ساعة في اليوم ، أو تتكرر أحيانا (بمعدل 8 مرات فأقل يوميا )',
   answer2: 'من ساعة إلى 3 ساعات في اليوم، أو تتكرر آثيرا (أآثر من 8 مرات في اليوم لكن معظم ساعات اليوم خالية منالأفكار الوسواسية .',
    answer3: 'من 3 8 إلى ساعات في اليوم ، أو تحدث آثيرا جدا (تحدث أآثر من 8 مرات في اليوم وفي معظم ساعات اليوم )', 
    answer4: 'أآثر من 8 ساعات في اليوم ، أو تحدث بشكل دائم (أآثر من تحملها ونادرا ما ماتمر ساعة بدون وساوس آثيرة )' ),
  OPAnswers(id: 2, answer0: 'لايوجد',
  answer1:'تعارض خفيف مع النشاطات الاجتماعية أو العملية ولكن النشاط العام لا يتأثر',
   answer2: 'تعارض واضح في النشاطات الاجتماعية أو العملية ولكن يمكن السيطرة عليه', 
   answer3: 'تسبب خللا آبيرا في أداء النشاطات الاجتماعية أو العملية',
    answer4: 'تسبب خللا بليغا'),
  OPAnswers(id: 3, answer0: 'لا يوجد',
  answer1:'خفيف (أحيانا) . ، ليس مزعج',
   answer2: 'متوسط (غالبا) ومزعجا ولكن يمكن السيطرة عليه',
    answer3: 'شديد (أغلب الوقت ) . ومزعج جدا',
     answer4: 'توتر بليغ (دائم) لحد الإعاقة تقريبا '),
  OPAnswers(id: 4, answer0: 'لا أبذل جهدا حتى أقاوم دائما (أو أن الأفكار قليلة جدا بحيث لا حاجة للمقاومة )',
  answer1:'حاول أن أقاوم معظم الوقت ',
   answer2: 'أبذل بعض الجهد حتى أقاوم .',
    answer3: 'أستسلم لكل الأفكار الوسواسية بدون محاولة للسيطرة عليها، وإن حاولت السيطرة فيكون بعد تردد ',
     answer4: 'أستسلم آلية وبإرادتي للأفكار الوسواسية آلها .'),
  OPAnswers(id: 5, answer0: 'سيطرة تامة',
  answer1:'سيطرة آبيرة، عادة يمكنني أن أوقف أو أصرف انتباهي عن الوسواس عند بذل بعض الجهد التركيز',
   answer2: 'سيطرة متوسطة، بعض الأحيان استطيع إيقاف أو صرف انتباهي عن الوسواس .',
    answer3: 'سيطرة قليلة، نادرا ما أنجح في إيقاف الوساوس، أستطيع فقط صرف الانتباه وبصعوبة .',
     answer4: 'لا سيطرة ، نادرا ما أستطيع صرف الانتباه عن الوساوس ولو للحظات قليلة .w'),
  OPAnswers(id: 6, answer0: 'لاشيء',
  answer1:'(أقل من ساعة في اليوم ، أو تقوم بالأفعال أحيانا ( لا تزيد عن 8 مرات في اليوم ',
   answer2: 'من ساعة إلى ثلاث ساعات في اليوم، أو تقوم بالأفعال آثيرا ( أآثر من 8 مرات في اليوم ولكن معظم الساعاتتخلو من الأفعال القهرية )',
    answer3: 'أآثر من ثلاث ساعات في اليوم ، أو تقوم بالأفعال آثيرا جدا ( أآثر من 8 مرات في اليوم وخلال معظم ساعاتاليوم ',
     answer4: 'آثر من 8 ساعات في اليوم أو تقوم بالأفعال بشكل دائم (أآثر من أن تحصيها ونادرا ماتمر ساعة لا تقوم فيهابالأفعال '),
  OPAnswers(id: 7, answer0: 'لا يوجد',
  answer1:'تعارض خفيف مع النشاطات الاجتماعية أو العملية ، ولكن النشاط العام لا يتأثر',
   answer2: 'تعارض واضح مع النشاطات الاجتماعية أو العملية ولكن يمكن السيطرة عليه',
    answer3: 'تسبب خللا آبيرا في أداء النشاطات الاجتماعية أو العملية',
     answer4: 'تسبب عجزا آبيرا'),
  OPAnswers(id: 8, answer0: 'لا يوجد',
  answer1:'قلق بسيط عند الامتناع عن القيام بالأفعال',
   answer2: 'يظهر القلق لكن يمكن تحمله',
    answer3: 'قلق واضح ومزعج للغاية',
     answer4: 'قلق شديد يسبب عجزا بليغا'),
  
  OPAnswers(id: 9, answer0: 'أبذل جهدا حتى أقاوم دائما (أو أن الأفعال القهرية قليلة بحيث لا حاجة للمقاومة )',
  answer1:'أحاول أن أقاوم معظم الوقت',
   answer2: 'عمل بعض المحاولات للمقاومة',
    answer3: 'ستسلم لكل الأفعال القهرية بدون محاولة للسيطرة عليها ، وإن حاولت السيطرة فيكون بعد تردد',
     answer4: 'ستسلم آلية وبإرادتي لكل الأفعال القهرية .'),
  OPAnswers(id: 10, answer0: 'سيطرة تامة',
  answer1:'عادة ما أوقف الأفعال القهرية بصعوبة',
   answer2: 'حيانا أستطيع إيقاف الأفعال القهرية بصعوبة',
    answer3: 'أستطيع بصعوبة أن أؤخر - - فقط الأفعال القهرية لكن يجب على القيام بها حتى النهاية',
     answer4: 'نادرا ما أستطيع أن أؤخر القيام بالأفعال القهرية ولو للحظات .'),
];




