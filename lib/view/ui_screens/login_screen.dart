import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_16_itc_flutter_advanced/view_model/auth_cubit.dart';

// LoginScreen()
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("ENG ", style: TextStyle(color: Color(0xffEA3F7E))),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xffEA3F7E),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Image.asset("assets/images/logo-2.png"),
              SizedBox(height: 120),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xff949494)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xff949494)),
                  ),
                ),
              ),
              SizedBox(height: 21),
              TextFormField(
                controller: _passwordController,
                obscureText: isVisible,
                decoration: InputDecoration(
                  hintText: "password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xff949494)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xff949494)),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      print("object");
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      // ternary operator
                      isVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Color(0xff949494),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forget password",
                    style: TextStyle(color: Color(0xff949494)),
                  ),
                ],
              ),
              SizedBox(height: 21),

              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state is AuthLoginSuccess){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully",selectionColor: Colors.green,)));
                    // navigation
                  }


                },
                builder: (context, state) {
                  print("Current State Is =====>> $state");
                  if (state is AuthLoginLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SizedBox(
                    width: 370,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffEA3F7E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "SIGN IN ",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Color(0xff949494)),
                  ),
                  TextButton(
                    onPressed: () {
                      //normal navigation - named navigation

                      // Navigator.push(context, route);
                      Navigator.pushNamed(context, "home");
                      // Navigator.pushReplacement(context, route);
                      Navigator.pushReplacementNamed(context, "profile");
                      // Navigator.pushAndRemoveUntil(context, route);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        "chat",
                        (route) => false,
                      );
                      // Navigator.pop(context, route);
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Color(0xffEA3F7E)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
