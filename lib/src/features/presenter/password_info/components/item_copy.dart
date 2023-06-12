import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemCopy extends StatelessWidget {
  final String text;
  const ItemCopy({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        right: sizeWidth * 0.1,
        left: sizeWidth * 0.1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: sizeHeight * 0.023),
          ),
          IconButton(
            icon: const Icon(
              Icons.copy,
              color: Colors.black,
            ),
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: text),
              );
            },
          ),
        ],
      ),
    );
  }
}
