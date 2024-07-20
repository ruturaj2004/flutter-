import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          color: const Color.fromARGB(255, 207, 207, 206),
          height: 55,
          width: 90,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "23",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Present Days",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
