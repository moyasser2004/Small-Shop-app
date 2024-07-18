import 'package:flutter/material.dart';

import '../../../model/local/enter_screen_model.dart';

class EnterPageItem extends StatelessWidget {
  final EnterScreenModel enterScreenModel;

  const EnterPageItem({Key? key, required this.enterScreenModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Image.asset(
              enterScreenModel.image,
              fit: BoxFit.fill,
              height: 300,
              width: 400,
            )),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                enterScreenModel.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                enterScreenModel.content,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    );
  }
}
