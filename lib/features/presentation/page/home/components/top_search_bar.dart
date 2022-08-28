import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("signup")),


        ],
      ),
    );
  }
}
