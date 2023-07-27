import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade700),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
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
                    height: 570,
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
                        TextField(
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                            hintText: 'Your Name',
                            hintStyle: TextStyle(
                              color: Colors.grey
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.orange,
                              )
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            height: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.orange,
                              )
                            ),
                            
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            height: 0.5,
                            color: Colors.black
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(55, 20, 45, 10),
                          child: ElevatedButton(
                            onPressed: () {},
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
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(75, 8, 55, 0),
                          child: TextButton(
                                  onPressed: () {},
                                  child: Text('Forget Password?'),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(2),
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10
                                    ),
                                    primary: Colors.black,
                                  ),
                              ),
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
                              TextButton(
                                onPressed: () {},
                                child: Text('Create Account'),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(2),
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10
                                  ),
                                  primary: Colors.yellow.shade700
                                ),
                              ),
                        
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

