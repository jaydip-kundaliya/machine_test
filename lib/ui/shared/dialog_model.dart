import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_text_style.dart';

class DialogModel extends StatelessWidget {
  final List<dynamic> list;
  final Function(dynamic)? onItemClick;
  const DialogModel({
    Key? key,
    required this.list,
    this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Month'),
      content: SizedBox(
        height: 450,
        child: ListView.separated(
          itemCount: list.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (onItemClick != null) {
                onItemClick!(list[index]);
                Navigator.of(context).pop();
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(list[index].toString(),
                  style: AppTextStyle.poppins(
                    color: const Color(0xFF000000),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
