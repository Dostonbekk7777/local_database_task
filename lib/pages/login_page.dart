import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:local_database_task/pages/reg_page.dart';
class LoginPage extends StatefulWidget {
  static final String id = 'login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final  _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  void _doLogin(){
    String username = _userNameController.text.toString();
    String password = _passwordController.text.toString();

    var box = Hive.box('task_base');
    box.put("NAME", username);
    box.put("PASSWORD", password);

    String get_name = box.get("NAME");
    String get_pw = box.get("PASSWORD");

    print(get_name);
    print(get_pw);

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

              // # image
            Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/user.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 30,),
              Text("Wellcome Back!",style: TextStyle(color: Colors.grey.shade300,fontSize: 32,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("Sign in to continue",style: TextStyle(color: Colors.grey.shade300,fontSize: 18,fontWeight: FontWeight.bold),),
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
              Text('Forgot password',style: TextStyle(color: Colors.grey.shade500,fontSize: 15),),
              SizedBox(height: 50,),
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
                          child: Text('SIGN UP',
                            style: TextStyle(color: Colors.lightBlue,fontSize: 16,fontWeight: FontWeight.bold),),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, RegPage.id);
                          },
                        )
                      ],
                    ),
                  ],
                ),


          ),
        ),

    );
  }
}
