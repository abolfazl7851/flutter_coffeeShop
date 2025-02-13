import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffee_shop/CoffeeShopFeature/domain/entities/current_user_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';
import '../bloc/sign_up_bloc.dart';
import '../bloc/sign_up_status.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  bool _dupEmail = false;

  bool _dupUsername = false;

  // late UserDataProvider userProvider;

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // BlocProvider.of<SignUpBloc>(context).add(LoadSignUpEvent(userModel));
  }

  @override
  Widget build(BuildContext context) {
    // userProvider = Provider.of<UserDataProvider>(context);

    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF212325),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset("images/animation_coffee.json",
                  width: double.infinity, height: 250),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Sign Up',
                    style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Create Account',
                    style: GoogleFonts.ubuntu(
                        fontSize: 16, color: Colors.white54)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, bottom: 20),
                child: Form(
                  key: _formKey,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    TextFormField(
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_add_alt_1,
                          color: Colors.orange,
                        ),
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(color: Colors.orange),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.orange,
                              width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.orange,
                              width: 2.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.orange),
                      controller: nameController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name';
                        } else if (value.length < 3) {
                          return 'at least enter 3 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.orange,
                        ),
                        hintText: 'Enter your Username',
                        hintStyle: TextStyle(color: Colors.orange),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.orange,
                              width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.orange,
                              width: 2.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.orange),
                      controller: usernameController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        } else if (value.length < 3) {
                          return 'at least enter 3 characters';
                        } else if (value.length > 13) {
                          return 'maximum character is 13';
                        } else if (_dupUsername) {
                          return 'this username already token!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      cursorColor: Colors.orange,
                      onChanged: (val) => {},
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.orange,
                        ),
                        hintText: 'Enter your Email',
                        hintStyle: TextStyle(color: Colors.orange),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.orange,
                              width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.orange,
                              width: 2.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.orange),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter gmail';
                        } else if (!value.endsWith('@gmail.com')) {
                          return 'please enter valid gmail';
                        } else if (_dupEmail) {
                          return 'this email already taken';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_open,
                          color: Colors.orange,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure ? Icons.visibility : Icons
                                .visibility_off,
                            color: Colors.orange,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintText: "Enter your Password",
                        hintStyle: const TextStyle(color: Colors.orange),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.orange,
                              width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.orange,
                              width: 2.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.orange),
                      cursorColor: Colors.orange,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 8) {
                          return 'at least enter 8 characters';
                        } else if (value.length > 13) {
                          return 'maximum character is 13';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, color: Colors.grey, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<SignUpBloc, SignUpState>(
                        buildWhen: (previous, current) {
                          if (previous.status == current.status) {
                            return false;
                          }
                          return true;
                        }, builder: (context, state) {
                      if (state.status is SignUpStatusInitial) {
                        return signupBtn();
                      }

                      if (state.status is SignUpStatusLoading) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                              strokeWidth: 3,
                            ),
                          ),
                        );
                      }

                      /// show Error State for Cw
                      if (state.status is SignUpStatusError) {
                        final SignUpStatusError signupError =
                        state.status as SignUpStatusError;
                        WidgetsBinding.instance.addPostFrameCallback((
                            timeStamp) {
                          List<String> errors = signupError.message;
                          if (errors.isNotEmpty) {
                            for (var error in errors) {
                              if (error.contains('email')) {
                                _dupEmail = true;
                              } else if (error.contains('username')) {
                                _dupUsername = true;
                              } else {
                                ShowError(error);
                              }
                            }
                          }
                          _formKey.currentState?.validate();
                          _dupEmail = false;
                          _dupUsername = false;
                        });

                        return signupBtn();
                      }

                      if (state.status is SignUpStatusCompleted) {
                        final SignUpStatusCompleted signupCompleted =
                        state.status as SignUpStatusCompleted;
                        saveUser(signupCompleted.currentUserEntity);
                        return Container();
                      }

                      return Container();
                    })
                  ]),
                ),
              )
            ],
          )),
    );
  }

  Widget signupBtn() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.

          if (_formKey.currentState!.validate()) {
            UserModel userModel = UserModel(
              username: usernameController.text.toString().trim(),
              name: nameController.text.toString().trim(),
              email: emailController.text.toString().trim(),
              password: passwordController.text.toString().trim(),
            );
            BlocProvider.of<SignUpBloc>(context)
                .add(LoadSignUpEvent(userModel));

            // userProvider.callRegisterApi(nameController.text, emailController.text, passwordController.text);
          }
        },
        child: const Text('Sign Up'),
      ),
    );
  }

  ShowError(String error) {
    print(error);
    final snackBar = SnackBar(

      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!!!',
        message: "something went wrong!!! try again later...",

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Future<void> saveUser(CurrentUserEntity user) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> map = {
    'name' : user.name,
    'username' : user.username,
    'email' : user.email,
    'create_at' : user.createdAt,
    'token' : user.token,
    };
    await prefs.setString('user', jsonEncode(map));

    //  نحوه گرفتن کاربر!!!!!!!!!!!!!!!!!!

    String? userPref = prefs.getString('user');

    Map<String,dynamic> userMap = jsonDecode(userPref!) as Map<String, dynamic>;

    print(userMap['name']);

  }

// bool SignUpError(SignUpStatusError signupError) {
//   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     // _formKey.currentState?.save();
//     List<String> errors = signupError.message;
//     print(errors);
//     if (errors.isNotEmpty) {
//       for (var error in errors) {
//         if (error.contains('email')) {
//           ShowError(error) ;
//         } else if (error.contains('username')) {
//           ShowError(error) ;
//         } else {
//           ShowError(error);
//         }
//       }
//     }
//     if(_formKey.currentState!.validate()){
//       print("sjfdwfdwgfywdhdfshdhdhd");
//     }
//
//   });
//
//     return Container() ;
//
// }
}
