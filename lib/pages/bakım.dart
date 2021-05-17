import 'package:flutter/material.dart';


class Bakim extends StatelessWidget {




  @override
  Widget build(BuildContext context) {




    return Center(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg.jpg"),fit: BoxFit.cover),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:50.0),
              Text(
                "Yakında tüm butiklerle sizlerleyiz...",
                style: TextStyle(fontSize: 50.0,color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "iletişim: onuracikgoz28@gmail.com",
                      style: TextStyle(fontSize: 20.0,color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
