import 'package:flutter/material.dart';

class SIModel {
  final int id;
  final String question;
  final int never;
  final int maybe;
  final int mostly;
  final int always;

  SIModel({
    required this.id,
    required this.question,
    required this.never,
    required this.maybe,
    required this.mostly,
    required this.always,
  });
}


class ADHDScreen extends StatefulWidget {
  const ADHDScreen({super.key});

  @override
  State<ADHDScreen> createState() => _ADHDScreenState();
}

class _ADHDScreenState extends State<ADHDScreen> {
  final Map<int, int> _selectedValues = {};
  int _totalScore = 0;

  void _calculateScore() {
    _totalScore = 0;
    _selectedValues.forEach((questionId, selectedValue) {
      var question = users.firstWhere((user) => user.id == questionId);
      if (selectedValue == question.never) {
        _totalScore += question.never;
      } else if (selectedValue == question.maybe) {
        _totalScore += question.maybe;
      } else if (selectedValue == question.mostly) {
        _totalScore += question.mostly;
      } else if (selectedValue == question.always) {
        _totalScore += question.always;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('ADHD', style: TextStyle(fontSize: 40)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < users.length; i++)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          users[i].question,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text('Never'),
                                Radio(
                                  value: users[i].never,
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
                                const Text('Maybe'),
                                Radio(
                                  value: users[i].maybe,
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
                                const Text('Mostly'),
                                Radio(
                                  value: users[i].mostly,
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
                                const Text('Always'),
                                Radio(
                                  value: users[i].always,
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


final List<SIModel> users = [
  // family
  SIModel(id: 1,question: ' هل يوجد لديك مشاكل مع الاسرة ؟',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 2,question: 'الديك مشاكل مع الوالدين / الزوج ؟',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 3,question: 'تعتمد على الأخرين للقيام بأشياء من أجلك',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 4,question: 'اتتسبب فى شجار فى الاسررة',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 5,question: 'من الصعب قضاء وقت,ممتع مع العائلة',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 6,question:'تتسبب فى مشاكل فى زعاية عائلتك',never: 0,maybe: 1,mostly: 2,always: 3),
 SIModel(id: 7,question: 'الديك مشاكل فى موازية بين احتياجاتك و احتياجات اسرتك',never: 0,maybe: 1,mostly: 2,always: 3),
 SIModel(id: 8,question: 'ففدت التحكم فى مشاكل مع الاسرة',never: 0,maybe: 1,mostly: 2,always: 3),
//  work
SIModel(id: 9,question: 'لديك مشاكل فى اداء المهام المطلوبة',never: 0,maybe: 1,mostly: 2,always: 3),
SIModel(id: 10,question: 'امتتتاكل فى انجاز عملك بكفاءة',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 11,question: 'لديك مشاكل مع رئيسك فى العمل',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 12,question: 'لديك مشاكل فى حفظ وظيفتك',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 13,question: 'هل أخذت طرد من عملك',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 14,question: 'هل لديك مشاكل مع فريق عملك',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 15,question: 'هل عندك مشاكل فى الغياب ؟',never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 16, question: 'هل لديك مشاكل فى الوصول متاخر للعمل', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 17, question: 'هل لديك مشكلة فى إلقيام بمهمام جديدة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 18, question: 'يوجد مشكلة فى امكانيات العمل', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 19, question: 'لديك آداء ضعيف فى العمل', never: 0,maybe: 1,mostly: 2,always: 3),
  // school
  SIModel(id: 20, question: 'مشاكل فى تدوين الملاحظات', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel( id: 21,question: 'مشاكل فى إتمام المهام المطلوبة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 22, question: 'مشاكل فى انجاز واجباتك بدقة و كفاءة عالية', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 23, question: 'مشاكل مع المدرسين', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 24, question: 'مشاكل مع مدير المدرسة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 25, question: 'مشاكل فى تلبية الحد الادنى من متطلبات البقاء فى المدرسة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 26, question: 'مشاكل فى الغياب', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 27, question: 'مشاكل فى الوصول متأخر', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 28,question: 'مشاكل فى إمكانيات المدرسة للعمل', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 29, question: 'مشاكل فى عدم تناسق الدرجات', never: 0,maybe: 1,mostly: 2,always: 3),
  // social skills
  SIModel(id: 30, question: 'مسرف فى إستخدام الآنترنت و العاب الفيديو و التليفزيون', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 31, question:'مشاكل في الاحتفاظ على مظهر ملائم و مقبول', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel( id: 32, question: 'مشاكل فى الاستعداد لمغادرة المنزل', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 33, question: 'مشاكل فى الذهاب للنوم', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 34, question: 'مشاكل فى التغدية', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 35,question:'مشاكل فى الجنس', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 36, question: 'مشاكل فى الخلود الى النوم .اثناء النوم', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel( id: 37,question:'الحصول على الاذى او الاصاية', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel( id: 38, question: 'ايتجتب ممارسة الرياضة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 39, question: 'مشاكل فى الحفاط على الخراعيد مع الدكتور', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel( id: 40, question: 'مشاكل فى مواكبة الاعمال المنزلية', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 41, question: 'امشاكل فى إدارة الاعمال', never: 0,maybe: 1,mostly: 2,always: 3),
  // self concept
  SIModel(id: 42, question: 'احور بالسوء تجا النقص', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 43, question: 'الشعور بالاحياط مع النفس', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 44, question: 'تحور بالاحباط و الخنقة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 45,question: 'جد أى شئ يشسرك والتسمادة في هذة الحياة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 46, question: 'الشعور اننى غير كفئ', never: 0,maybe: 1,mostly: 2,always: 3),
  // social
  SIModel(id: 47, question: 'مشكلة في التعاون', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel( id: 48, question:'مشكلة في التعاون', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 49, question: 'مشكلة في الانسجام مع الناس', never: 0,maybe: 1,mostly: 2,always: 3),
    SIModel(id: 50, question: 'مشكلة في الانسجام مع الناس', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 51, question: 'لديه مشاكل في المشاركه فى الهوايات', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 52, question: 'مشاكل فى الاستمتاع مع الآخرين', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 53, question: 'مشاكل فى تكوب صداقات', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 54, question: 'مشاكل في الحفاظ علي الصداقات', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 55, question: 'يقول الفاظ واشياء غير لائقة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 56, question: 'مشاكل وخناقات مع الجيران', never: 0,maybe: 1,mostly: 2,always: 3),
  // danger
  SIModel(id: 57, question: 'القياده متهورة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 58, question: 'يفعل أشياء أخرى أثناء القيادة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 59, question: 'أخد الطريق بغضب', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 60, question: 'تكسير أو تدمير الاشياء', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 61, question: 'يفعل أشياء غير شرعية', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 62, question: 'التورط مع الشرطة', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 63, question: 'تدخين السجائر', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 64, question: 'تدخين المخدرات', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 65, question: 'شرب الكحوليات', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 66, question: 'ممارسة الجنس بدون وقاية .(تنظيم النسل . واقى ذكرى ).اسلوك جنس غير مناسب', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 67, question: 'أخذ المخدرات فى الشارع', never: 0,maybe: 1,mostly: 2,always: 3),
  SIModel(id: 68, question: 'عنيف بشكل عدواني جسدى .( عدواني بتشكل جسدى).أعدواني لفظيا', never: 0,maybe: 1,mostly: 2,always: 3),



];
