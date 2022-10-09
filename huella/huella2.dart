import 'package:flutter/material.dart';
import 'parte2.dart';
import 'parte3.dart';
import 'parte4.dart';

void main() => runApp(const Page2());


class Page2 extends StatefulWidget {

  const Page2({super.key});


  //MyHomePageState createSate() => MyHomePageState();

  @override
  State<Page2> createState() => MyHomePageState();


}



class MyHomePageState extends State<Page2> {
  int _selectDrawer = 0;
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: return parte2();
      case 1: return parte3();
      case 2: return parte4();

    }
  }

  _onSelectItem(int pos){
    setState((){
      _selectDrawer = pos;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff805566),
          title: Text('Mi App')
      ),

      drawer: Drawer(






        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget> [
            UserAccountsDrawerHeader(


                accountName: Text('GuadalupeVM'),
                accountEmail: Text('1721110652@utectulancingo.edu.mx'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('G', style: TextStyle(fontSize: 40.0),),


              ),
            ),

            ListTile(
              title: const Text('Item 1'),
              leading: Icon(Icons.home),
              onTap: () {
                _onSelectItem(0);
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              leading: Icon(Icons.account_balance),
              onTap: () {
                _onSelectItem(1);
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              leading: Icon(Icons.account_balance_wallet),
              onTap: () {
                _onSelectItem(2);
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawer),
    );
  }
}
