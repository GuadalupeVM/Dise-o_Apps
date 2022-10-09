import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingControllerNUM1 = TextEditingController();
  TextEditingController textEditingControllerNUM2 = TextEditingController();
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("-----"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: "---------"),
                  controller: textEditingController,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Primer numero"),
                  controller: textEditingControllerNUM1,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Segundo numero"),
                  controller: textEditingControllerNUM2,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //Primera fila de botones
                  children: [
                    MaterialButton(
                      onPressed: () =>doAddition() ,
                      child: Text(
                        "+",
                        style: TextStyle(

                          fontSize: 30.0,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      color: Colors.redAccent,
                    ),
                    MaterialButton(
                      onPressed: () => doRest(),
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.0,
                        ),
                      ),
                      color: Colors.purpleAccent,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //Primera fila de botones
                  children: [
                    MaterialButton(
                      onPressed: () => doMultiplication(),
                      child: Text(
                        "x",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.0,
                        ),
                      ),
                      color: Colors.blueAccent,
                    ),
                    MaterialButton(
                      onPressed: () => doDivision(),
                      child: Text(
                        "/",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.0,
                        ),
                      ),
                      color: Colors.yellowAccent,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void doAddition(){
    setState(() {
      double? n1 =double.tryParse(textEditingControllerNUM1.text);
      double? n2 =double.tryParse(textEditingControllerNUM2.text);
      total = n1! + n2!;
      textEditingControllerNUM1.text="";
      textEditingControllerNUM2.text="";
      textEditingController.text = total.toString();

    });
  }

  void doRest(){
    setState(() {
      double? n1 =double.tryParse(textEditingControllerNUM1.text);
      double? n2 =double.tryParse(textEditingControllerNUM2.text);
      total = n1! - n2!;
      textEditingControllerNUM1.text="";
      textEditingControllerNUM2.text="";
      textEditingController.text = total.toString();

    });
  }

  void doMultiplication(){
    setState(() {
      double? n1 =double.tryParse(textEditingControllerNUM1.text);
      double? n2 =double.tryParse(textEditingControllerNUM2.text);
      total = n1! * n2!;
      textEditingControllerNUM1.text="";
      textEditingControllerNUM2.text="";
      textEditingController.text = total.toString();

    });
  }

  void doDivision(){
    setState(() {
      double? n1 =double.tryParse(textEditingControllerNUM1.text);
      double? n2 =double.tryParse(textEditingControllerNUM2.text);
      if (n2==0){
        textEditingController.text = "mensaje";
        textEditingControllerNUM1.text="";
        textEditingControllerNUM2.text="";

      }
      else{
        total = n1! / n2!;
        textEditingControllerNUM1.text="";
        textEditingControllerNUM2.text="";
        textEditingController.text = total.toString();

      }


    });
  }

}

