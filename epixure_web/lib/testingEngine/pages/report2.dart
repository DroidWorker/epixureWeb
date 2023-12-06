import 'package:epixure_web/testingEngine/pages/report3.dart';
import 'package:epixure_web/toolWidgets/horizontalChart.dart';
import 'package:epixure_web/toolWidgets/wind_rose.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';

class Report2 extends StatelessWidget {

  final List<BarData> data = [
    BarData(label: 'интерес', value: 0.8, color: Colors.blue, maxValue: 1),
    BarData(label: 'радость', value: 0.9, color: Colors.green, maxValue: 1),
    BarData(label: 'горе', value: 0.6, color: Colors.orange, maxValue: 1),
    BarData(label: 'гнев', value: 0.4, color: Colors.lightBlueAccent, maxValue: 1),
    BarData(label: 'страх', value: 0.3, color: Colors.lightBlueAccent, maxValue: 1),
    BarData(label: 'стыд', value: 0.4, color: Colors.lightBlueAccent, maxValue: 1),
  ];
  final List<BarData> data1 = [
    BarData(label: 'пэм', value: 0.4, color: Colors.lightBlueAccent, maxValue: 1),
    BarData(label: 'нэм', value: 0.3, color: Colors.lightBlueAccent, maxValue: 1),
    BarData(label: 'тдэм', value: 0.4, color: Colors.lightBlueAccent, maxValue: 1),
  ];
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Center(child: Text('Вы прошли Модуль 2:  Шкалы эмоций', style: TextStyle(fontSize: 20),),),
                            const SizedBox(height: 10,),
                            const Center(child: Text('Промежуточные результаты', style: TextStyle(fontSize: 16),),),
                            const SizedBox(height: 70,),
                            const Center(child: Text("Диаграмма эмоций", style: TextStyle(fontSize: 24))),
                            const SizedBox(height: 20),
                            HorizontalBarChart(barDataList: data),
                            const Text("Индексы"),
                            HorizontalBarChart(barDataList: data1),
                            const Text("Чтобы расшифровать и сохранить результаты теста необходимо зарегестрироваться", style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
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
                                      MaterialPageRoute(builder: (context) => Report3()),
                                    );
                                  },
                                  child: const Text(
                                    'Продолжить тест\nмодуль3: Качество жизни',
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