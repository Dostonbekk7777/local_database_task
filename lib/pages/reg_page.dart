import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:local_database_task/pages/login_page.dart';
class RegPage extends StatefulWidget {
  static final String id = 'reg_page';
  const RegPage({Key? key}) : super(key: key);

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {

  final  _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final  _userEmailController = TextEditingController();
  final _userPhoneController = TextEditingController();
  void _doLogin(){
    String username = _userNameController.text.toString();
    String password = _passwordController.text.toString();
    String email = _userEmailController.text.toString();
    String phone = _userPhoneController.text.toString();

    var box = Hive.box('task_base');
    box.put("NAME", username);
    box.put("PASSWORD", password);
    box.put("PHONE", email);
    box.put("EMAIL", phone);

    String get_name = box.get("NAME");
    String get_pw = box.get("PASSWORD");
    String get_email = box.get("EMAIL");
    String get_phone = box.get("PHONE");

    print(get_name);
    print(get_pw);
    print(get_email);
    print(get_phone);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C1559),
      body:Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [

              SizedBox(height: 30,),
              Text("Create Account",style: TextStyle(color: Colors.grey.shade300,fontSize: 32),),

              SizedBox(height: 100,),

              // #username, password
              TextField(
                controller: _userNameController,
                style:TextStyle(color: Colors.grey.shade300,fontSize: 24),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.white,
                      )
                  ),
                  prefixIcon: Icon(Feather.user,color: Colors.grey.shade300,),
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.grey.shade300,fontSize: 18),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _userEmailController,
                style:TextStyle(color: Colors.grey.shade300,fontSize: 24),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.white,
                      )
                  ),
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.grey.shade300,),
                  hintText: "E-mail",
                  hintStyle: TextStyle(color: Colors.grey.shade300,fontSize: 18),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _userPhoneController,
                style:TextStyle(color: Colors.grey.shade300,fontSize: 24),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.white,
                      )
                  ),
                  prefixIcon: Icon(Feather.phone,color: Colors.grey.shade300,),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.grey.shade300,fontSize: 18),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _passwordController,
                style:TextStyle(color: Colors.grey.shade300,fontSize: 24),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.white,
                      )
                  ),
                  prefixIcon: Icon(FontAwesome.key,color: Colors.grey.shade300,),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey.shade300,fontSize: 18),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20,),


              SizedBox(height: 70,),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        colors: [
                          Colors.blue.shade900,
                          Colors.blue.shade700,
                          Colors.blue.shade300
                        ]
                    )
                ),
                child: IconButton(
                  onPressed: _doLogin,
                  icon: Icon(Feather.arrow_right,size: 35,color: Colors.white,),
                ),
              ),

              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don`t have an account?",
                    style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, LoginPage.id);
                    },
                    child: Text('SIGN IN',style: TextStyle(color: Colors.lightBlue,fontSize: 16,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ],
          ),


        ),
      ),

    );;
  }
}

