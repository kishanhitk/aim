import 'package:aim/screens/Auth/community_login_page.dart';
import 'package:aim/screens/Auth/login_page.dart';
import 'package:aim/screens/Auth/register_page.dart';
import 'package:flutter/material.dart';

class SignInOptions extends StatefulWidget {
  @override
  _SignInOptionsState createState() => _SignInOptionsState();
}

class _SignInOptionsState extends State<SignInOptions> {
  int currentPage = 0 ;
  void toggleView(int view) {
    setState(() {
      currentPage = view ;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentPage == 0){
      return LoginPage(toggleView: toggleView) ;
    }
    else if(currentPage == 1){
      return Register(toggleView: toggleView) ;
    }
    else if(currentPage == 2){
      return CommunityLoginPage(toggleView: toggleView) ;
    }
    else if(currentPage == 3){}
  }
}
