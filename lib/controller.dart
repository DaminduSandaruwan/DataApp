import 'package:data_app/models/feedback_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController{
  final void Function(String) callback;
  static const String URL ="https://script.google.com/macros/s/AKfycbz6E8H-BafGzcKt1xiVEPI0yvw-VRau8zp5eAjV0QtRrWoKu7_J/exec";
  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async{
    try{
      await http.get(
        URL + feedbackForm.toParams()
      ).then((response){
        callback(convert.jsonDecode(response.body)['status']);
      });
    }
    catch(e){
      print(e.toString());
    }
  }
}