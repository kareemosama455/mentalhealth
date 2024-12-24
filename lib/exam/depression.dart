// done
import 'package:flutter/material.dart';

class DModel {
  final int id;
  final String question;
  final int first ;
  final int second;
  final int third;


  DModel({
    required this.id,
    required this.question,
    required this.first,
    required this.second,
    required this.third,
  });
}

class DAnswers {
  final int id;
 final String answer1;
 final String answer2;
 final String answer3;


  DAnswers({
    required this.id,
    required this.answer1,
    required this.answer2,
    required this.answer3,


    
  });
}


class DepressionScreen extends StatefulWidget {
  const DepressionScreen({super.key});

  @override
  State<DepressionScreen> createState() => _DepressionScreenState();
}

class _DepressionScreenState extends State<DepressionScreen> {
  
   final Map<int, int> _selectedValues = {};
  int _totalScore = 0;

  void _calculateScore() {
    _totalScore = 0;
    _selectedValues.forEach((questionId, selectedValue) {
      var question = dUsers.firstWhere((user) => user.id == questionId);
      if (selectedValue == question.first) {
        _totalScore += question.first;
      } else if (selectedValue == question.second) {
        _totalScore += question.second;
      }else if (selectedValue == question.third) {
        _totalScore += question.third;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Baik for Depression', style: TextStyle(fontSize: 30))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < dUsers.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dUsers[i].question,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: dUsers[i].first,
                                  groupValue: _selectedValues[dUsers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[dUsers[i].id] = value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                                Expanded(child: Text('(${opAnswers[i].answer1})')),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: dUsers[i].second,
                                  groupValue: _selectedValues[dUsers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[dUsers[i].id] = value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                                Expanded(child: Text('(${opAnswers[i].answer2})')),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: dUsers[i].third,
                                  groupValue: _selectedValues[dUsers[i].id],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValues[dUsers[i].id] = value as int;
                                      _calculateScore();
                                    });
                                  },
                                ),
                                Expanded(child: Text('(${opAnswers[i].answer3})')),
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
            Text('Total Score: $_totalScore'),
          ],
        ),
      ),
    );
  }
}



final List<DModel> dUsers = [
  DModel(id: 1,question: 'انني لا اشعر بالحزن؟',first: 0,second: 1,third: 2),
  DModel(id: 2,question: 'انني لست متشائما بشان المستقبل؟',first: 0,second: 1,third: 2),
  DModel(id: 3,question: 'لا اشعر بانني فاشل بشكل عام؟',first: 0,second: 1,third: 2),
  DModel(id: 4,question: 'ما زالت الاشياء تعطيني شعورا بالرضى كما كانت عاده؟',first: 0,second: 1,third: 2),
  DModel(id: 5,question: 'لا يوجد اي شعور بالذنب؟',first: 0,second: 1,third: 2),
  DModel(id: 6,question:'لا اشعر بانني استحق عقابا من اي نوع؟',first: 0,second: 1,third: 2),
 DModel(id: 7,question: 'لا اشعر بخيبه الامل في نفسي؟',first: 0,second: 1,third: 2),
 DModel(id: 8,question: 'لا اشعر بانني اسوء من الاخرين؟', first: 0,second: 1,third: 2),
DModel(id: 9,question: 'لا يوجد لدي اي افكار انتحاريه؟',first: 0,second: 1,third: 2),
DModel(id: 11,question: 'لا اشعر في الأيام بأنني سريع الغضب أكثر من المعتاد',first: 0,second: 1,third: 2),
DModel(id: 12,question: 'لا اشعر بأنني قد فقدت اهتمامي بالناس الآخرين',first: 0,second: 1,third: 2),
DModel(id: 13,question: 'اشعر بأن مظهري مناسب كما كان عادة',first: 0,second: 1,third: 2),
DModel(id: 14,question: 'استطيع العمل بنفس الكفاءة كما كنت افعل عادة',first: 0,second: 1,third: 2),
DModel(id: 15,question: ' أستطيع النوم جيدا كالمعتاد',first: 0,second: 1,third: 2),
DModel(id: 16,question: 'لا أجد إنني أصبحت أكثر تعبا من المعتاد',first: 0,second: 1,third: 2),
DModel(id: 17,question: 'شهيتي للطعام هي كالمعتاد',first: 0,second: 1,third: 2),
DModel(id: 18,question: ' لم أفقد كثيرا من وزني مؤخرا أو بقي وزني كما هو',first: 0,second: 1,third: 2),
DModel(id: 19,question: 'ليس لدي انزعاج يتعلق بصحتي أكثر من المعتاد ',first: 0,second: 1,third: 2),
DModel(id: 20,question: 'لم الاحظ أية تغيرات تتعلق في اهتماماتي الجنسية',first: 0,second: 1,third: 2),
];

final List<DAnswers> opAnswers = [
  DAnswers(id: 1, 
  answer1:'انني اشعر بالحزن في بعض الاوقات',
   answer2: 'اشعر بالحزن طيله الوقت وللمستقبل للتخلص من هذا الشعور',
    answer3: 'انني اشعر بالحزن والتعاسه لدرجه لا استطيع احتمالها' ),
  DAnswers(id: 2,
  answer1:'اشعر بالتشاؤم بشان المستقبل',
   answer2: 'اشعر انه لايوجد لدي ما اطمح للوصول اليه', 
   answer3: 'اشعر بان المستقبل لا امل فيه وان هذا الوضع غير ممكن تغييره',),
  DAnswers(id: 3, 
  answer1:'اشعر انني اواجه من الفشل اكثر مما يواجه الانسان العادي',
   answer2: 'عندما انظر الى حياتي الماضيه,فان كل ما اراه الكثير من الفشل',
    answer3: 'اشعر انني انسان فاشل تماما',),
  DAnswers(id: 4,
  answer1:'لا اشعر بالمتعه في الاشياء على النحو الذي كنت اشعر به عاده',
   answer2: 'لم اعد اشعر باي متعه حقيقيه في اي شئ على الاطلاق',
    answer3: 'لدي شعور بعدم تلرضى والملل من كل الاشياء',),
  DAnswers(id: 5,
  answer1:'اشعر بالذنب في بعض الاوقات',
   answer2: 'اشعر بالذنب في معظم الاوقات',
    answer3: 'اشعر بالذنب في كافه الاوقات',),
  DAnswers(id: 6,
  answer1:'اشعر بانني استحق العقاب احيانا',
   answer2: 'كثيرا ما اشعر انني استحق العقاب',
    answer3: 'اشعر بانني اعاقب واعذب في حياتي وانني استحق ذلك'),
  DAnswers(id: 7,
  answer1:'اشعر بخيبه الامل في نفسي',
   answer2: 'اشعر بانني احيانا اكره نفسي',
    answer3: 'انني اكره نفسي في كل الاوقات',),
  DAnswers(id: 8,
  answer1:'انني انتقد نفسي بسبب ما لدي ن اخطاء وضعف',
   answer2: 'الوم نفسي طيله الوقت بسبب اخطائي',
    answer3: 'الوم نفسي في كل شئ يحدث حتى لو لم يكن لي علاقه مباشره بذلك',),
  
  DAnswers(id: 9,
  answer1:'توجد لدي افكار انتحاريه ولن لن اقوم بتنفيذها',
   answer2: 'ارغب في قتل نفسي',
    answer3: 'ساقتل نفسي اذا توفرت لي الفرصه السامحه لذلك',),
  DAnswers(id: 10,
  answer1:'ابكي في هذه الايام اكثر من المعتاد',
   answer2: 'انني ابكي طيله الوقت هذه الايام',
    answer3: 'لقد كانت لدي القدره على البكاء لكنني في هذه الايام لا استطيع البكاء مع انني اريد ذلك',),
    DAnswers(id: 11,
  answer1:'أصبح غضبي يستثار بسهولة أكثر من المعتاد هذه الأيام',
   answer2: 'أشعر بسرعة الاستثارة طيلة الوقت في هذه الأيام',
    answer3: 'أحس بأن مشاعري قد تبدلت ولم يعد شيء يغضبني',),
    DAnswers(id: 12,
  answer1:'أصبحت أقل اهتماماً بالناس الآخرين مما كنت عليه',
   answer2: 'فقدت معظم اهتمامي بالناس الآخرين',
    answer3: 'فقدت كل اهتمام لي بالناس الآخرين',),
    DAnswers(id: 13,
  answer1:' يزعجني الشعور بأنني كهلا أو غير جذاب',
   answer2: 'اشعر أن هنالك تغيرات دائمة تطرأ على مشيي، وتجعلني أبدو غير جذاب',
    answer3: 'عتقد بأنني أبدو قبيحاً',),
    DAnswers(id: 14,
  answer1:' احتاج إلى تعزيز إضافي كي أبدأ العمل في أي شيء',
   answer2: 'علي أن أحث نفسي بشده كي أقوم بعمل أي شيء',
    answer3: 'لا أستطيع عمل أو انجاز أي شيء على الإطلاق',),
    DAnswers(id: 15,
  answer1:'لا أنام جيدا كالمعتاد',
   answer2: 'أستيقظ من النوم أبكر بساعة أو ساعتين من المعتاد ولا استطيع العودة ثانيهإلى النوم',
    answer3: 'أستيقظ من النوم أبكر بساعات عديدة من المعتاد ولا أستطيع العودة ثانية إلى النوم.',),
    DAnswers(id: 16,
  answer1:' أصبحت أتعب أكثر من كالمعتاد',
   answer2: 'أصبحت أتعب من عمل أي شيء تقريبا',
    answer3: 'أنا متعب جدا لدرجة لا استطيع معها عمل أي شيء',),
    DAnswers(id: 17,
  answer1:'شهيتي للطعام ليست جيده كما هي',
   answer2: 'شهيتي للطعام سيئة جدا هذه الأيام',
    answer3: 'ليست لدي شهية للطعام على الإطلاق في هذه الأيام',),
    DAnswers(id: 18,
  answer1:'فقدت من وزني حوالي 2 كغم',
   answer2: 'فقدت من وزني حوالي 4 كغم',
    answer3: 'فقدت من الآلام والأوجاع 6 كغم',),
    DAnswers(id: 19,
  answer1:'إنني منزعج بشأن المشكلات الصحية مثل ألام المعدة أو الإمساك أو الآلام والأوجاع الجسمية عامه',
   answer2: 'إنني متضايق من المشكلات الصحية ومن الصعب أن أفكر في أي شيء آخر',
    answer3: 'إنني قلق للغاية بسبب وضعي الصحي بحيث لا استطيع التقبل لأي شيءأخر',),
    DAnswers(id: 20,
  answer1:'أصبحت أقل اهتماما بالأمور الجنسية مما كنت عليه من قبل',
   answer2: 'اهتمامي قليل جدا بالأمور الجنسية في هذه الأيام',
    answer3: 'فقد اهتمامي بالأمور الجنسية تماما',),

    
];


