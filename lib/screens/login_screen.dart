
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carp/api/api_service.dart';
import 'package:carp/screens/forget_password_screen.dart';
import 'package:carp/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        title:
          Text('LOGIN OR CREATE AN ACCOUNT'),
      ),


      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('front.registerd_customers', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Text('If you have an account with us, please log in.', style: TextStyle(
                    fontSize: 15,
                  ),),
                  SizedBox(height: 15,),
                  Text('Email Address', style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 10,),
                  TextFormField(keyboardType: TextInputType.emailAddress ,
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                        fillColor:Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(2),)
                    ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill out this field';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 15,),
                  Text('Password',style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ), ),
                  SizedBox(height: 10,),
                  TextFormField(obscureText: true ,
                    controller: passwordController,
                    decoration: InputDecoration(
                        fillColor:Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2),)
                    ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill out this field';
                        }
                        return null;
                      }
                  ),

                  SizedBox(height: 15,),
                  Row(
                    children: [
                       RaisedButton(
                        color: Colors.yellow,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                         onPressed: (){
                          String email = emailController.text;
                          String password = passwordController.text;
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login')),
                            );
                            APIService().login(email, password, context);
                          }
                         },
                      ),
                      FlatButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPasswordScreen()));
                      }, child: Text('front.forget_your_password?')),
                    ],
                  ),
                  SizedBox(height: 20,),

                  SizedBox(height: 10,),
                  Text('New Customers', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Text('By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.', style: TextStyle(
                    fontSize: 15,
                  ),),
                  SizedBox(height: 15,),

                  Center(
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                      },
                      color: Colors.yellow,
                      child: Text(
                        'CREATE AN ACCOUNT',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

