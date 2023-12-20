import 'package:flutter/material.dart';
import 'package:travella/models/hotel_model.dart';
import 'package:travella/widgets/my_form_field.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

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
                height: MediaQuery.of(context).size.height * 0.02,
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
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'Create an account',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 23),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'Create Your new account and find\nmore services!',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              MyFormField(
                controller: nameController,
                hint: 'First Name',
                prefixIcon: const Icon(Icons.person_2_outlined),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                },
              ),
              MyFormField(
                controller: emailController,
                hint: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                },
              ),
              MyFormField(
                controller: passwordController,
                hint: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: const Icon(Icons.remove_red_eye),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                },
              ),
              MyFormField(
                controller: phoneController,
                hint: 'Phone',
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  if (value.length < 11) {
                    return 'phone must be 11 number';
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.4, 52)),
                onPressed: () {
                  setState(() {
                    Count.isReg=true;
                  });
                   Navigator.pop(context);
                },
                child: const Text('Signup',
                style: TextStyle(
                  color: Colors.white
                ),
                
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
