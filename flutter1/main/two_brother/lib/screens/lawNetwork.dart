import 'package:flutter/material.dart';
import 'package:two_brother/widget/icon.dart';
import 'package:two_brother/widget/text_widget.dart';

class LawNetwork extends StatefulWidget {
  const LawNetwork({super.key});

  @override
  State<LawNetwork> createState() => _LawNetworkState();
}

class _LawNetworkState extends State<LawNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: (){
            setState(() {
              
            });
          }, icon: icon)
        ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(data: "Baap company",),
          IconWidget(iconData: Icons.search)
        ],
      ),
  
      ),
    );
  }
}