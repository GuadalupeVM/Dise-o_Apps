import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/painting.dart';
import 'package:untitled/huella/huella2.dart';

void main() {
  runApp(const AppBiometrics());
}

class AppBiometrics extends StatelessWidget {
  const AppBiometrics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: LoginPage()
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LocalAuthentication authentication = LocalAuthentication();
  bool canCheckBiometrics = false;
  List<BiometricType> availableBiometrics = [];
  String authorized = "No autorizado";

  Future<void> checkBiometrics() async {
    bool _canCheckBiometrics = false;
    try {
      _canCheckBiometrics = await authentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      canCheckBiometrics = _canCheckBiometrics;
    });
  }

  Future<void> autenticar() async {
    bool authenticated = false;
    try {
      authenticated = await authentication.authenticate(
          localizedReason: "Coloca tu dedo en el sensor",
          options: const AuthenticationOptions(
              useErrorDialogs: true, stickyAuth: true));
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      authorized = authenticated ? "Autenticado con exito" : "Error";
      if(authenticated){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute<Null>(
            builder: ( BuildContext context){
              return new Page2();
            } ),(Route<dynamic> route) => false);

      }
      //TODO
    });
  }

  @override
  void initState(){
    super.initState();
    autenticar();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Center(
                  child: Text("Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/a.png', width: 200,height: 200,),
                      const SizedBox(height: 50,),
                      Text("Acceso solo con huella"),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        width: double.infinity,
                        child: MaterialButton(onPressed: () { autenticar();},
                          elevation: 0.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: const Padding(
                            padding:EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 24.0),
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),)
          ,
        )
    );
  }

}
