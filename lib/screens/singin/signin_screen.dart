import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scratch/home/home_screen.dart';
import 'package:scratch/screens/signup/signup_screen.dart';
import 'package:scratch/screens/singin/widgets/top_bar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // formkey
  final _formKey = GlobalKey<FormState>();
  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase auth
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // req expration for email validations
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email!");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
            labelText: "Email address",
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
        validator: (value) {
          RegExp regex = RegExp(r'^.(6,)$');
          if (value!.isEmpty) {
            return ("Password is requried for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Passowrd(Min. 6 charchter)");
          }
        },
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
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {SigIn(emailController.text, passwordController.text);},
          child: const Text('Login',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: SingleChildScrollView(
          child: Column(children: [
            const TopBar(),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 25),
                    child: const Text(
                      'Please login to continue.',
                      style: TextStyle(
                          fontSize: 18,
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
                        emailField,
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Text("Forgot password?",
                                    style: TextStyle(
                                        color: Color(0xFF606060),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal)),
                              )
                            ]),
                        passwordField,
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: loginButton)
                      ])),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New to Scratch?",
                    style: TextStyle(
                        color: Color(0xFFA8A8A8),
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: const Text("Create Account Here",
                      style: TextStyle(
                          color: Color(0xFF30BE76),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                )
              ],
            )
          ]),
        )));
  }

  void SigIn(String email, String password) async {
    if(_formKey.currentState!.validate()){
      await _auth.signInWithEmailAndPassword(email: email, password: password)
      .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()))
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
