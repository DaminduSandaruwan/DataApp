class FeedbackForm{
  String _name;
  String _email;
  String _mobileno;
  String _feedback;

  FeedbackForm(this._name,this._email,this._mobileno,this._feedback);

  String toParams() => "?name$_name&email=$_email&mobileno=$_mobileno&feedback=$_feedback";

}