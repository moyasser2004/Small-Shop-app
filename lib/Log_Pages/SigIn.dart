import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Cubit/registerCubit.dart';





class SigIn extends StatelessWidget {

  final GlobalKey<FormState> _formKeyEmail = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKeyPhone = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKeyName = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              if (state.check.status) {
                HapticFeedback.lightImpact();
                Fluttertoast.showToast(
                  backgroundColor: Colors.blue,
                  msg: '${state.check.message} ',
                );
                Navigator.of(context).pushNamed("LogIn");
              } else {
                HapticFeedback.lightImpact();
                Fluttertoast.showToast(
                  backgroundColor: const Color(0xCAE50707),
                  msg: '${state.check.message} ',
                );
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
                               Expanded(
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: size.width * .9 - 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900]?.withOpacity(.9),
                                    borderRadius: BorderRadius.circular(25),
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
                                          'Sign In',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white.withOpacity(.9),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 25, 10),
                                        child: Form(
                                          key: _formKeyEmail,
                                          child: TextFormField(
                                            maxLines: 1,
                                            controller: _emailController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            decoration: InputDecoration(
                                              labelText: "Email",
                                              labelStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent
                                                      .withOpacity(.89)),
                                              prefixIcon: Icon(
                                                  Icons.alternate_email,
                                                  color: Colors.grey[400]),
                                              enabled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent
                                                          .withOpacity(.2),
                                                      width: 2)),
                                            ),
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "       Email can't be empty ! ! ! ";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 25, 10),
                                        child: Form(
                                          key: _formKeyPassword,
                                          child: TextFormField(
                                            maxLines: 1,
                                            controller: _passwordController,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            decoration: InputDecoration(
                                              labelText: "Password",
                                              labelStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent
                                                      .withOpacity(.89)),
                                              prefixIcon: Icon(
                                                  Icons.remove_red_eye,
                                                  color: Colors.grey[400]),
                                              enabled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 4)),
                                            ),
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "       Password at lest 8 digits ! ! ";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 25, 10),
                                        child: Form(
                                          key: _formKeyName,
                                          child: TextFormField(
                                            maxLines: 1,
                                            controller: _nameController,
                                            keyboardType: TextInputType.name,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            decoration: InputDecoration(
                                              labelText: "Name",
                                              labelStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent
                                                      .withOpacity(.89)),
                                              prefixIcon: Icon(Icons.person,
                                                  color: Colors.grey[400]),
                                              enabled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 4)),
                                            ),
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "      enter your name  ! ! ";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 25, 10),
                                        child: Form(
                                          key: _formKeyPhone,
                                          child: TextFormField(
                                            maxLines: 1,
                                            controller: _phoneController,
                                            keyboardType: TextInputType.number,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            decoration: InputDecoration(
                                              labelText: "Phone",
                                              labelStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent
                                                      .withOpacity(.89)),
                                              prefixIcon: Icon(Icons.phone,
                                                  color: Colors.grey[400]),
                                              enabled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 4)),
                                            ),
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "       Password at lest 8 digits ! ! ";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.fromLTRB(20, 50, 20, 20),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            if (_formKeyPassword.currentState!
                                                    .validate() &&
                                                _formKeyEmail.currentState!
                                                    .validate() &&
                                                _formKeyPhone.currentState!
                                                    .validate() &&
                                                _formKeyName.currentState!
                                                    .validate()) {
                                              RegisterCubit
                                                  .get(context)
                                                  .userRegister(
                                                      email:
                                                          _emailController.text.toString(),
                                                      password:
                                                          _passwordController
                                                              .text.toString(),
                                                      name:
                                                          _nameController.text.toString(),
                                                      phone: _phoneController
                                                          .text.toString(),
                                              );
                                              if (state is RegisterSuccess) {
                                                if (state.check.status) {
                                                  Navigator.of(context)
                                                      .pushNamed("LogIn");
                                                }
                                              }
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
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Text(
                                              'Sigin-In',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
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
        ));
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
