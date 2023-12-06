import 'package:epixure_web/testingEngine/pages/report2.dart';
import 'package:epixure_web/toolWidgets/wind_rose.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';

class Report1 extends StatelessWidget {

  bool isVideoVisible = true;
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
                      padding: const EdgeInsets.all(100.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(child: Text('Вы прошли Модуль 1:  Сферы жизни', style: TextStyle(fontSize: 20),),),
                            const SizedBox(height: 10,),
                            const Center(child: Text('Промежуточные результаты', style: TextStyle(fontSize: 16),),),
                            const SizedBox(height: 40,),
                            const Row(children: [
                              Expanded(child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text("Колесо баланса", style: TextStyle(fontSize: 24),),
                                SizedBox(height: 30,),
                                Text('''
Отношения          5 из 10
Богатство          4 из 10
Здоровье           8 из 10
Призвание          9 из 10
Окружение          7 из 10
Саморазвитие       7 из 10
Яркость жизни      6 из 10
Духовность         4 из 10'''),
                                SizedBox(height: 30,),
                                Text('Важно пройти следующие модули для получения более реалистичных показателей.')
                              ],)),
                              WindRose(values: [0.2, 0.5, 0.1, 0.8, 0.6, 0.4, 0.8, 0.4])
                            ],),
                            const SizedBox(height: 70,),
                            const Center(child: Text("Волновая функция", style: TextStyle(fontSize: 24))),
                            const SizedBox(height: 20,),
                            Container(height: 400,),
                            const SizedBox(height: 70,),
                            const Row(children: [
                              Expanded(child: Text("""На основании результатов теста строится распределение плотности вероятности ваших энергетических состоятний. 

С помощью вычислений мы определяем в каком наиболее вероятном чувстве вы пребываете в тех или иных условиях реальности соприкаясь с разными сферами жизни.

Наиболее веротяное состотяние, так называемое математическое ожидание, определяет численное значение на графике и наиболее близкое чувство по значению."""),),
                              Column(children: [
                                Text("Ваш индекс:", style: TextStyle(fontSize: 20),),
                                Text("168", style: TextStyle(fontSize: 28)),
                                Text("Ваше “наиболее вероятное” состояние: ", style: TextStyle(fontSize: 18)),
                                Text("Гордость", style: TextStyle(fontSize: 26))
                              ],)
                            ],),
                            const SizedBox(height: 50,),
                            const Center(child: Text("Чтобы сохранить промежуточные результаты - зарегистрируйтесь", style: TextStyle(fontSize: 20),),),
                            const SizedBox(height: 70,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Report2()),
                                  );
                                },
                                child: const Text(
                                  'Продолжить тест\nмодуль2: Шкала Эмоций',
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextButton(
                                onPressed: () {

                                },
                                child: const Text(
                                  'Пройти оставшиеся\nтесты потом',
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],)
                          ]
                      )
                  ),
                    Container(
                      height: 100,
                      color: footerColor,
                    )
                  ]
                  )
              )
              ;
            }
        )
    );
  }
}