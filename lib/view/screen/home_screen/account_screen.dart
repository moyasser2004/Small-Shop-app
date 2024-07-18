import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit/home/home_cubit.dart';
import '../../../controller/state/home/home_states.dart';



class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
    TextEditingController();
    final TextEditingController phoneController =
    TextEditingController();
    final TextEditingController emailController =
    TextEditingController();
    
    
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit c = HomeCubit.get(context);
        if (state is AccountDataSuccess) {
          emailController.text = c.accModel.data.email.toString();
          nameController.text = c.accModel.data.name.toString();
          phoneController.text = c.accModel.data.phone.toString();
        }
        return state is AccountDataSuccess &&
                state is! AccountDataLoading
            ? Scaffold(
                body: Container(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 50),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZcpT3db7GC_Wi6O4J706Z__PD7w7FwKEdQ&usqp=CAU")),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.alternate_email_rounded,
                            color: Colors.red,
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color:
                                      Colors.black.withOpacity(.6)),
                              borderRadius:
                                  BorderRadius.circular(20)),
                          enabled: false,
                          hintText:
                              "Email: ${HomeCubit.get(context).accModel.data.email.toString()}",
                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.red,
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color:
                                      Colors.black.withOpacity(.6)),
                              borderRadius:
                                  BorderRadius.circular(20)),
                          enabled: false,
                          hintText:
                              "Name: ${HomeCubit.get(context).accModel.data.name.toString()}",
                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.red,
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color:
                                      Colors.black.withOpacity(.6)),
                              borderRadius:
                                  BorderRadius.circular(20)),
                          enabled: false,
                          hintText:
                              "Phone: ${HomeCubit.get(context).accModel.data.phone}",
                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: const Color(0xFF346DE0),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Log_In",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("LogIn");
                      },
                    ),
                  ],
                ),
              ))
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
