import 'package:data_app/controller.dart';
import 'package:data_app/models/feedback_form.dart';
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

  void _submitForm(){
    if(_formKey.currentState.validate()){
      FeedbackForm feedbackForm = FeedbackForm(
        nameController.text,
        emailController.text,
        mobilenoController.text,
        feedbackController.text
      );

      FormController formController= FormController(
        (String response){
          print(response);
          if(response==FormController.STATUS_SUCCESS){
            _showSnakBar("Feedback Submitted");
          }else{
            _showSnakBar("Error in feedback");
          }
        }
      );
      _showSnakBar("Submitting Feedback");
      formController.submitForm(feedbackForm);
    }
    
  }

  _showSnakBar(String message){
    final snackBar = SnackBar(
      content: Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form( 
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:24, vertical:100),
          child: Column(
            children: <Widget>[
              Text(
                "GoogleSheet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                validator: (value){
                  return value.isEmpty ? "Enter Valid Name" : null;
                },
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              TextFormField(
                validator: (value){
                  return value.isEmpty ? "Enter Email" : null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextFormField(
                validator: (value){
                  return value.isEmpty ? "Enter Mobile Number" : null;
                },
                decoration: InputDecoration(
                  hintText: "Mobile Number",
                ),
              ),
              TextFormField(
                validator: (value){
                  return value.isEmpty ? "Enter Feedback" : null;
                },
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