import 'package:flutter/material.dart';

class ClinicPage extends StatelessWidget {
  const ClinicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image(
                  height: 200,
                  image: NetworkImage(
                      'https://retina.news.mail.ru/pic/81/51/guide_51_10f723606cd67c12b2d1e789b363333a.jpeg')),
              Text('Россия, г.Волгоград, ул. Советская, д. 23 а',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              Text('Индекс',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('400066', style: TextStyle(fontSize: 20)),
              Text('Телефоны',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('(8442) 38-54-00', style: TextStyle(fontSize: 20)),
              Text('Факс',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('(8442) 38-60-00', style: TextStyle(fontSize: 20)),
              Text('Электронная почта',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('kp3@avol.com', style: TextStyle(fontSize: 20)),
              Text('Время работы',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Пт-Сб: 8:00-20:00', style: TextStyle(fontSize: 20)),
              Text('Сб, Вс: 9:00-16:00', style: TextStyle(fontSize: 20)),
              Text('Травмпункт: круглосуточно', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
