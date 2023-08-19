import 'package:first_task/providers/loginProvider.dart';
import 'package:first_task/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';
import '../widgets/textButton.dart';
import '../widgets/textField.dart';
import 'informationScreen.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(300),
                  topLeft: Radius.zero,
                ),
                color: Colors.yellow.shade700,
              ),
              
              width: 440,
              height: 420,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(22, 150, 22, 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: const Offset(
                            0.5,
                            0.5,
                          ),
                          blurRadius: 20.0,
                          spreadRadius: 4.0,
                        ),
                      ],
                    ),
                    height: 610,
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome!',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Login',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              textFieldWidget(
                                lableText: 'Username', 
                                hintText: 'Your Name',
                                controller: userNameController,
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              textFieldWidget(
                                lableText: 'Password',
                                hintText: 'Password',
                                controller: passwordController,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(55, 20, 45, 10),
                                child: FutureBuilder(
                                  future: getUser(),
                                  builder: (context, snapshot) {
                                    return ElevatedButton(
                                      child: Text('LOGIN'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.yellow.shade700,
                                        foregroundColor: Colors.white,
                                        shadowColor: Colors.yellow.shade500,
                                        elevation: 6,
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700
                                        ),
                                        minimumSize: Size(120, 35),
                                      ),
                                      onPressed: () {
                                        var firstProvider = Provider.of<loginProvider>(context, listen: false);
                                        //APIHandler.getUser();
                                        //print("response ${APIHandler.getUser()}");
                                        if (formKey.currentState!.validate()) {
                                          if (snapshot.hasData && snapshot.data != null) {
                                            firstProvider.isValid(snapshot.data!, userNameController.text, passwordController.text);
                                            if (firstProvider.isSuccessful == true) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder: (context) => //UserDataForm(data: snapshot.data![i])
                                                  HomePage(data: firstProvider.getdata()))
                                                );
                                            }
                                            else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('you have never signed up'))
                                              );
                                            }
                                          }
                                        };
                                      }
                                    );
                                  },
                                )
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(75, 8, 55, 0),
                          child: textButtonWidget(color: Colors.black, text:'Forget Password?',),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 15, 0, 5),
                          child: Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10
                                ),
                              ),
                              textButtonWidget(color: Colors.yellow.shade700, text:'Create Account',),
                        
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(240),
                          topLeft: Radius.circular(30),
                        ),
                        color: Colors.yellow.shade700,
                      ),
                      
                      width: 150,
                      height: 120,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}