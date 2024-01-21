import 'package:flutter/material.dart';

class DetailKardio extends StatefulWidget {
  DetailKardio({super.key, required this.data});

  dynamic data;

  @override
  State<DetailKardio> createState() => _DetailKardio();
}

class _DetailKardio extends State<DetailKardio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Column(
        children: [
          Image.network(
            widget.data.img,
            width: 250,
            height: 150,
          ),

          // CircleAvatar(
          //   backgroundImage: NetworkImage(widget.data.img),
          // ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.data.detail.toString()),
          ),
        ],
      ),
    );
  }
}
