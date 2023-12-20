import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travella/models/hotel_model.dart';
import 'package:travella/widgets/my_form_field.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Center(
                  child: Transform.rotate(
                angle: 1.2,
                child: Transform.scale(
                  scale: 2.5,
                  child: Icon(
                    Icons.airplanemode_active_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Welcome!',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 23),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Create Your new account and find\nmore services!',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // email and password fields   ****************
              MyFormField(
                controller: emailController,
                hint: 'Email',
                prefixIcon: const Icon(Icons.email),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              MyFormField(
                controller: passwordController,
                hint: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.remove_red_eye),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.004,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot your Password?',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              // login button ****************

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Count.isReg=true;
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.4, 52)),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text(
                    'OR',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Expanded(
                    child: Container(
                        height: 2,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              // social media login buttons 3 buttons apple , google , facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/facebook.svg',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.09,
                  ),
                  SvgPicture.asset(
                    'assets/images/google.svg',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.09,
                  ),
                  SvgPicture.asset(
                    'assets/images/apple.svg',
                    height: 40,
                    width: 40,
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
