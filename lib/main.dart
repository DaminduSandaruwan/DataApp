import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form( 
        child: Container(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Mobile Number",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Feedback",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}