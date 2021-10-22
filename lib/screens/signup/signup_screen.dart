import 'package:flutter/material.dart';
import 'package:scratch/screens/singin/signin_screen.dart';
import 'package:scratch/screens/singin/widgets/top_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // formKey
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // full Name field
    final fullName = TextFormField(
        autofocus: false,
        controller: fullNameController,
        keyboardType: TextInputType.name,
        // validator : () {},
        onSaved: (value) {
          fullNameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
            labelText: "Full Name",
            hintText: "Yaser Ibrahim",
            hintStyle: TextStyle(fontSize: 16),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA8A8A8)))));
    // email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        // validator : () {},
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
            labelText: "Email",
            hintText: "user@email.com",
            hintStyle: TextStyle(fontSize: 16),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA8A8A8)))));
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        // validator : () {},
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "Password",
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA8A8A8)))));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xFF30BE76),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: const Text('Create Account',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
    );
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
      const TopBar(),
      const SizedBox(
        height: 25,
      ),
      Row(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                'Create account to continue.',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF606060),
                    fontWeight: FontWeight.normal),
              )),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      Container(
        color: Colors.white,
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  fullName,
                  const SizedBox(
                    height: 20,
                  ),
                  emailField,
                  const SizedBox(
                    height: 20,
                  ),
                  passwordField,
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: loginButton)
                ])),
      ),
      const SizedBox(
        height: 20,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?",
              style: TextStyle(
                  color: Color(0xFFA8A8A8),
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
            },
            child: const Text("Login Here",
                style: TextStyle(
                    color: Color(0xFF30BE76),
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          )
        ],
      )
    ]))));
  }
}
