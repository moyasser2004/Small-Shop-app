import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/core/class/sharePrefrences.dart';

import '../../../controller/cubit/auth/login_cubit.dart';
import '../../../controller/state/auth/login_states.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController();
  final GlobalKey<FormState> _formKeyEmail = GlobalKey<FormState>();

  final TextEditingController _passwordController =
      TextEditingController();
  final GlobalKey<FormState> _formKeyPassword =
      GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          if (state.loginModel.status) {
            HapticFeedback.lightImpact();
            Fluttertoast.showToast(
              backgroundColor: Colors.blue,
              msg: '${state.loginModel.message} ',
            );
            await SharedPreferencesHelper.setBool(
                key: "key", value: true);
            Navigator.of(context).pushReplacementNamed("Home_Page");
          } else {
            HapticFeedback.lightImpact();
            Fluttertoast.showToast(
              backgroundColor: const Color(0xCAE50707),
              msg: '${state.loginModel.message} ',
            );
            await SharedPreferencesHelper.setBool(
                key: "key", value: false);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    SizedBox(
                      height: size.height,
                      child: Image.asset(
                        'images/img.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: size.width * .9 - 50,
                              decoration: BoxDecoration(
                                color:
                                    Colors.grey[900]?.withOpacity(.9),
                                borderRadius:
                                    BorderRadius.circular(25),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.width * .15,
                                      bottom: size.width * .1,
                                    ),
                                    child: Text(
                                      'Log In',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                            .withOpacity(.9),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(
                                            25, 20, 25, 10),
                                    child: Form(
                                      key: _formKeyEmail,
                                      child: TextFormField(
                                        maxLines: 1,
                                        controller: _emailController,
                                        keyboardType: TextInputType
                                            .emailAddress,
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        decoration: InputDecoration(
                                          labelText: "Email",
                                          labelStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight:
                                                  FontWeight.bold,
                                              color: Colors.blueAccent
                                                  .withOpacity(.89)),
                                          prefixIcon: Icon(
                                              Icons.alternate_email,
                                              color:
                                                  Colors.grey[400]),
                                          enabled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .transparent
                                                      .withOpacity(
                                                          .2),
                                                  width: 2)),
                                        ),
                                        validator: (String? value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return "       Email can't be empty ! ! ! ";
                                          }
                                          return null;
                                        },
                                        onFieldSubmitted: (val) {
                                          if (_formKeyPassword
                                                  .currentState!
                                                  .validate() &&
                                              _formKeyEmail
                                                  .currentState!
                                                  .validate()) {
                                            LoginCubit.get(context).userLogin(
                                                email:
                                                    _emailController
                                                        .text
                                                        .toString(),
                                                password:
                                                    _passwordController
                                                        .text
                                                        .toString());
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(
                                            25, 10, 25, 10),
                                    child: Form(
                                      key: _formKeyPassword,
                                      child: TextFormField(
                                        maxLines: 1,
                                        controller:
                                            _passwordController,
                                        keyboardType: TextInputType
                                            .visiblePassword,
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        decoration: InputDecoration(
                                          labelText: "Password",
                                          labelStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight:
                                                  FontWeight.bold,
                                              color: Colors.blueAccent
                                                  .withOpacity(.89)),
                                          prefixIcon: Icon(
                                              Icons.remove_red_eye,
                                              color:
                                                  Colors.grey[400]),
                                          enabled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(20),
                                              borderSide:
                                                  const BorderSide(
                                                      color:
                                                          Colors.grey,
                                                      width: 4)),
                                        ),
                                        validator: (String? value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return "       Password at lest 8 digits ! ! ";
                                          }
                                          return null;
                                        },
                                        onFieldSubmitted: (val) {
                                          if (_formKeyPassword
                                                  .currentState!
                                                  .validate() &&
                                              _formKeyEmail
                                                  .currentState!
                                                  .validate()) {
                                            LoginCubit.get(context)
                                                .userLogin(
                                                    email:
                                                        _emailController
                                                            .text,
                                                    password:
                                                        _passwordController
                                                            .text);
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                'Create a new Account',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                            recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    Fluttertoast
                                                        .showToast(
                                                      msg:
                                                          'Create a new Account ',
                                                    );
                                                    Navigator.of(
                                                            context)
                                                        .pushNamed(
                                                            "SigIn");
                                                  },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(
                                            20, 50, 20, 20),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor:
                                          Colors.transparent,
                                      onTap: () {
                                        if (_formKeyPassword
                                                .currentState!
                                                .validate() &&
                                            _formKeyEmail
                                                .currentState!
                                                .validate()) {
                                          LoginCubit.get(context)
                                              .userLogin(
                                                  email:
                                                      _emailController
                                                          .text
                                                          .toString(),
                                                  password:
                                                      _passwordController
                                                          .text
                                                          .toString());
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          bottom: size.width * .05,
                                        ),
                                        height: size.width / 8,
                                        width: size.width / 1.25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[700],
                                          borderRadius:
                                              BorderRadius.circular(
                                                  20),
                                        ),
                                        child: const Text(
                                          'Log-In',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight:
                                                FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
