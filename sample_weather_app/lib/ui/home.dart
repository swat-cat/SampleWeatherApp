import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  var list = Iterable<int>.generate(12).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: list.map((e) => example(e, context)).toList(),
        ),
      ),
    );
  }

  Widget containerAndCenter() {
    return Container(
      color: Colors.green,
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }

  Widget column() {
    return Column(
      children: [
        Container(
          height: 100,
          color: Colors.red,
          child: Center(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Container(
          height: 100,
          color: Colors.yellow,
        )
      ],
    );
  }

  Widget row() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            width: 100,
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            width: 100,
            color: Colors.yellow,
          ),
        )
      ],
    );
  }

  Widget grid() {
    return GridView.count(
      crossAxisCount: 6,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), shape: BoxShape.circle),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        )
      ],
    );
  }

  Widget stack() {
    return Stack(
      children: [
        Container(
          width: 400,
          height: 200,
          color: Colors.red,
        ),
        Positioned(
          top: 50,
          left: 50,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          child: ElevatedButton(onPressed: () {}, child: const Text("Submit")),
        ),
        Align(
          alignment: Alignment(-.3, -.3),
          child: ElevatedButton(onPressed: () {}, child: const Text("Submit")),
        ),
        Center(
          child: ElevatedButton(onPressed: () {}, child: const Text("Submit")),
        )
      ],
    );
  }

  Widget wrap() {
    return Wrap(
      children: list.map<Widget>((e) => chip(e)).toList(),
    );
  }

  Widget chip(int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Chip(label: Text("$index index")),
      );
  
  Widget example(int index, BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        elevation: 8,
        child: Row(
          children: [
            const SizedBox(width: 8,),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green),
              ),
              child: const Icon(Icons.person, size: 24,),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Max Ermakov $index",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 4),
                    child: Text("+3806799999$index",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  )
                ],
              ),
            )),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, ))
          ],
        ),
      ),
    );
  }
}
