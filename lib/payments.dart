import 'dart:math';

import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  @override
  _Payments createState() => _Payments();
}

InputBorder border;

class _Payments extends State<Payments> {
  final Random r = Random();
  final List<IconData> iconData = <IconData>[
    Icons.business_center,
    Icons.school,
    Icons.notifications_none
  ];
  Icon randomIcon() => Icon(
        iconData[r.nextInt(iconData.length)],
        size: 40,
      );
  final List<Color> colorData = <Color>[Color(0xFF6B94FF), Color(0xFFFFFFFF)];
  Color randomColor() => Color(colorData[r.nextInt(colorData.length)].value);

  int _selectedIndex = 1;

  void _navigateToScreens(int index) {
    if (index == 0) Navigator.pushReplacementNamed(context, '/home');
    if (index == 2) Navigator.pushReplacementNamed(context, '/search');
    if (index == 3) Navigator.pushReplacementNamed(context, '/business');
    if (index == 4) Navigator.pushReplacementNamed(context, '/more');
  }

//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body:
           Stack(
        children: [
          Container(height: 1, width: 1000,),
          Positioned(left: 36, top: 60, child: Text("Ваш счет : 0 руб.", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)),
          Positioned(left: 45, top: 90, child: Text("Вывод средств >", style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),)),
          Positioned(left: 36, top: 140, child: Text("Платежи:", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)),
//          Center( child: Container(child: Row (children:[ Align( alignment: Alignment.center, child: Image.asset('images/empty.png', scale: 0.75,))])))
          Align(alignment: Alignment(0,0.15) ,child: Image.asset('images/empty.png', scale: 0.75,))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        currentIndex: 1,
        onTap: (int index) {
          setState(() {
            print(index);
            this._selectedIndex = index;
          });
          _navigateToScreens(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            title: Text('Дом.стр',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.flash_on,
              color: Colors.black,
            ),
            title: Text('Платежи',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            title: Text('Поиск',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business_center,
              color: Colors.grey,
            ),
            title: Text('Бизнес',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.grey,
            ),
            title: Text('Больше',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
          ),
        ],
      ),
    );
  }
}