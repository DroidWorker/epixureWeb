import 'package:epixure_web/testingEngine/pages/report1.dart';
import 'package:epixure_web/toolWidgets/EmojiText.dart';
import 'package:epixure_web/toolWidgets/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';

class Module1 extends StatefulWidget {
  const Module1({super.key});

  Module1State createState() => Module1State();
}

class Module1State extends State{
  bool isVideoVisible = true;
  var step = 1;
  final maxStep = 21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: appbarColor,
            scrolledUnderElevation: 0,
            toolbarHeight: 90,
            title: Center(
              child: Image.asset(
                'lib/res/images/logo.png',
                height: 90,
              ),
            )
        ),
        body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                  child: Column(children:[Container(
                      width: constraints.maxWidth,
                      color: bgMainColor,
                      padding: constraints.maxWidth>600? const EdgeInsets.all(100.0): const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(child: Text('Модуль 1:  Сферы жизни', style: TextStyle(fontSize: 20),),),
                                step>9?const SizedBox(height: 40,):Container(),
                                (step>9&&step<21)? Center(child: EmojiText(text: 'Хорошо идем 👍 10 вопросов позади', style: const TextStyle(fontSize: 18),)): step>19? Center(child: EmojiText(text: 'Отлично 🙂 20 вопросов позади', style: const TextStyle(fontSize: 18),),):Container(),
                                const SizedBox(height: 40,),
                                Row(children: [
                                  if(constraints.maxWidth>600)TextButton(onPressed: (){

                                  },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                      backgroundColor: MaterialStateProperty.all<Color>(progressColor),
                                    ),
                                    child: const Text(
                                      'назад',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),),
                                  if(constraints.maxWidth>600)const SizedBox(width: 30,),
                                  Expanded(child:SizedBox(height: 32,
                                      child:
                                  ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                      child:Stack(
                                        children: [
                                          Positioned.fill(
                                            child: LinearProgressIndicator(
                                              minHeight: 10,
                                              value: (step)/21, // Пример: 0.5 означает 50% заполнения
                                              backgroundColor: buttonGrey, // Прозрачный фон для видимости границ
                                              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                                            ),
                                          ),
                                           Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '   Утверждение $step из 21 (${(step*100)~/21}%)', // Текст внутри progress bar
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))))
                                ],),
                                const SizedBox(height:30,),
                                const Text('Оцените утверждение ниже', textAlign: TextAlign.left,),
                                const SizedBox(height: 20,),
                                const Text('Я состою в счастливых и гармоничных отношениях', style: TextStyle(fontSize: 22),),
                                const SizedBox(height: 30,),
                                Row(children: [
                                  Expanded(child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(300.0, 60.0),
                                        backgroundColor: buttonGrey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0), // Установите радиус скругления в 0.0, чтобы сделать кнопку квадратной
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if(step!=maxStep) {
                                            step++;
                                          } else{
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Report1()),
                                            );
                                          }
                                        });
                                      },
                                      child: const Text(
                                        'Согласен',
                                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 30,),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(300.0, 60.0),
                                        backgroundColor: buttonGrey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0), // Установите радиус скругления в 0.0, чтобы сделать кнопку квадратной
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if(step!=maxStep) {
                                            step++;
                                          } else{
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Report1()),
                                            );
                                          }
                                        });
                                      },
                                      child: const Text(
                                        'Скорее согласен',
                                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 30,),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(300.0, 60.0),
                                        backgroundColor: buttonGrey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0), // Установите радиус скругления в 0.0, чтобы сделать кнопку квадратной
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if(step!=maxStep) {
                                            step++;
                                          } else{
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Report1()),
                                            );
                                          }
                                        });
                                      },
                                      child: const Text(
                                        'Нечто среднее',
                                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 30,),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(300.0, 60.0),
                                        backgroundColor: buttonGrey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0), // Установите радиус скругления в 0.0, чтобы сделать кнопку квадратной
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if(step!=maxStep) {
                                            step++;
                                          } else{
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Report1()),
                                            );
                                          }
                                        });
                                      },
                                      child: const Text(
                                        'Скорее не согласен',
                                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 30,),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(300.0, 60.0),
                                        backgroundColor: buttonGrey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0), // Установите радиус скругления в 0.0, чтобы сделать кнопку квадратной
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if(step!=maxStep) {
                                            step++;
                                          } else{
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Report1()),
                                            );
                                          }
                                        });
                                      },
                                      child: const Text(
                                        'Не согласен',
                                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 30,),
                                  ],)),
                                  if(constraints.maxWidth>600)Expanded(child:RichText(text: const TextSpan(text: 'Используйте кинезиологический тест\n\n', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  children:[TextSpan(text: 'Чтобы получить доступ к сознанию, используйте несложный кинезиологический мышечный тест, который определяет истинность или ложность утверждения в зависимости от мышечного тонуса. Мышцы тела мгновенно ослабевают в отсутствии Истины или становятся сильными в ее присутствии.\n\nГлубоко погрузитесь в чувства, которые вы исптываете, представляя себе свои любовные отношения с партнером.\n\nЕсли мышцы ваших палец и рук ослабевают и кольца разжимаются сами собой, значит вы чувствуете физическую слабость и отношения доставляют вам тревожные или негативные ощущения. Напротив, если мышцы в тонусе, и легко удерживают кольца скрепленными, то вы чуствуете силу, представляя ваши отношения, они не вводят  вас в тревогу и страх, вы уверены в себе, ваше настроение преподнято.', style: TextStyle(fontWeight: FontWeight.normal, decoration: TextDecoration.none))]))),
                                ],),
                                const SizedBox(height: 80,),
                                if(constraints.maxWidth<=600)RichText(text: const TextSpan(text: 'Используйте кинезиологический тест\n\n', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                    children:[TextSpan(text: 'Чтобы получить доступ к сознанию, используйте несложный кинезиологический мышечный тест, который определяет истинность или ложность утверждения в зависимости от мышечного тонуса. Мышцы тела мгновенно ослабевают в отсутствии Истины или становятся сильными в ее присутствии.\n\nГлубоко погрузитесь в чувства, которые вы исптываете, представляя себе свои любовные отношения с партнером.\n\nЕсли мышцы ваших палец и рук ослабевают и кольца разжимаются сами собой, значит вы чувствуете физическую слабость и отношения доставляют вам тревожные или негативные ощущения. Напротив, если мышцы в тонусе, и легко удерживают кольца скрепленными, то вы чуствуете силу, представляя ваши отношения, они не вводят  вас в тревогу и страх, вы уверены в себе, ваше настроение преподнято.', style: TextStyle(fontWeight: FontWeight.normal, decoration: TextDecoration.none))])),
                                if(constraints.maxWidth<=600)const SizedBox(height: 20,),
                                isVideoVisible? const Center(child: Text('Кинезиологический тест', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),)):Container(),
                                isVideoVisible? const VideoPlayerScreen(videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"):Container(),
                                const SizedBox(height: 80,),
                                const Text("Впереди тебя ждут модули:", style: TextStyle(fontSize: 18),),
                                const SizedBox(height: 60,),
                                RichText(text: const TextSpan(text: "1. Сферы жизни\n",style: TextStyle(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(text: "2. Шкала эмоций\n",style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: "3. Качество жизни\n",style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: "4. Оценка Я\n",style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: "5. Смертные грехи",style: TextStyle(fontWeight: FontWeight.bold)),
                                ]
                                ))
                              ])),
                  Container(
                    height: 100,
                    color: footerColor,
                  )
                  ]));
            }));
  }
}