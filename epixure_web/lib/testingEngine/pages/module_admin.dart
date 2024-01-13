import 'package:epixure_web/testingEngine/ViewModel.dart';
import 'package:epixure_web/testingEngine/data/models.dart';
import 'package:epixure_web/testingEngine/pages/report1.dart';
import 'package:epixure_web/toolWidgets/EmojiText.dart';
import 'package:epixure_web/toolWidgets/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/colors.dart';
import '../../toolWidgets/indexes_edit_table.dart';

class ModuleAdmin extends StatefulWidget {
  const ModuleAdmin({super.key});

  ModuleAdminState createState() => ModuleAdminState();
}

class ModuleAdminState extends State{
  late TestViewModel vm;
  bool isVideoVisible = true;
  List<Question> questions = [];
  var step = 1;
  var maxStep = 21;

  List<double> ansvers = [];

  List<String> spheres = [
  "Здоровье",
  "Отношения",
  "Окружение",
  "Призвание",
  "Богатство",
  "Саморазвитие",
  "Яркость жизни",
  "Духовность"
  ];

  @override
  void initState() {
    super.initState();
    // Получаем экземпляр ViewModel
    vm = Provider.of<TestViewModel>(context, listen: false);

    // Вызываем методы во ViewModel только один раз
    vm.getmoduleName();
    vm.getQuestions();
  }

  List<Question> currentResults = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<TestViewModel>(builder: (context, viewModel, child){
      questions= viewModel.questionsAndKoeffs;
      if(questions.isNotEmpty) {
        maxStep = questions.length;
        currentResults.clear();
        for(int i=0; i<8; i++){
          currentResults.add(Question(question: spheres[i], answers: [], indexes: [questions[step-1].indexes[i], (ansvers.length==step)?ansvers[step-1]:-1, (ansvers.length==step)?ansvers[step-1]*questions[step-1].indexes[i]:-1]));
        }
      }
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
                                Center(child: Text(viewModel.moduleName, style: const TextStyle(fontSize: 20),),),
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
                                                  '   Утверждение $step из $maxStep (${(step*100)~/maxStep}%)', // Текст внутри progress bar
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
                                Text(questions.isNotEmpty?questions[step-1].question:"", style: const TextStyle(fontSize: 22),),
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
                                            ansvers.length==step?ansvers[step-1]=1:ansvers.add(1);
                                          });
                                        },
                                        child: Text(
                                          questions.isNotEmpty?questions[step-1].answers[0]:'Согласен',
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
                                            ansvers.length==step?ansvers[step-1]=0.75:ansvers.add(1);
                                          });
                                        },
                                        child:  Text(
                                          questions.isNotEmpty?questions[step-1].answers[1]:'Скорее согласен',
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
                                            ansvers.length==step?ansvers[step-1]=0.5:ansvers.add(1);
                                          });
                                        },
                                        child: Text(
                                          questions.isNotEmpty?questions[step-1].answers[2]:'Нечто среднее',
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
                                            ansvers.length==step?ansvers[step-1]=0.25:ansvers.add(1);
                                          });
                                        },
                                        child: Text(
                                          questions.isNotEmpty?questions[step-1].answers[3]:'Скорее не согласен',
                                          style: const TextStyle(fontSize: 18.0, color: Colors.black),
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
                                            ansvers.length==step?ansvers[step-1]=0:ansvers.add(1);
                                          });
                                        },
                                        child: Text(
                                          questions.isNotEmpty?questions[step-1].answers[4]:'Не согласен',
                                          style: const TextStyle(fontSize: 20.0, color: Colors.black),
                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                    ],)),
                                  if(constraints.maxWidth>600)Expanded(child:RichText(text: const TextSpan(text: 'Используйте кинезиологический тест\n\n', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                      children:[TextSpan(text: 'Чтобы получить доступ к сознанию, используйте несложный кинезиологический мышечный тест, который определяет истинность или ложность утверждения в зависимости от мышечного тонуса. Мышцы тела мгновенно ослабевают в отсутствии Истины или становятся сильными в ее присутствии.\n\nГлубоко погрузитесь в чувства, которые вы исптываете, представляя себе свои любовные отношения с партнером.\n\nЕсли мышцы ваших палец и рук ослабевают и кольца разжимаются сами собой, значит вы чувствуете физическую слабость и отношения доставляют вам тревожные или негативные ощущения. Напротив, если мышцы в тонусе, и легко удерживают кольца скрепленными, то вы чуствуете силу, представляя ваши отношения, они не вводят  вас в тревогу и страх, вы уверены в себе, ваше настроение преподнято.', style: TextStyle(fontWeight: FontWeight.normal, decoration: TextDecoration.none))]))),
                                ],),
                                const SizedBox(height: 80,),
                                Row(children: [
                                  TextButton(
                                    onPressed: () {
                                      viewModel.ansversM1=ansvers;
                                      if(step!=maxStep) {
                                        step++;
                                      } else{
                                        viewModel.calculateResult();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Report1()),
                                        );
                                      }
                                    },
                                    child: Text(
                                      'Далее',
                                      style: TextStyle(fontSize: constraints.maxWidth>600?20.0:14, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  TextButton(
                                    onPressed: () {

                                    },
                                    child: Text(
                                      'Настройки',
                                      style: TextStyle(fontSize: constraints.maxWidth>600?20.0:14, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {

                                    },
                                    child: Text(
                                      'Сохранить',
                                      style: TextStyle(fontSize: constraints.maxWidth>600?20.0:14, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],),
                                const Text("Колесо баланса", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                const Text("Результат данного ответа"),
                                const SizedBox(height: 10,),
                                EditableTable(maxWidth:  MediaQuery.of(context).size.width, questions: currentResults, indexTitle: const ["Вес вопроса", "Вес ответа", "Значение текущего ответа"], onValueUpdate: (value){},)
                              ])),
                        Container(
                          height: 100,
                          color: footerColor,
                        )
                      ])
                  );
                })
        );
    }
    );
  }
}