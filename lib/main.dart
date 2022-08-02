import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var grid = [
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
  ];
  var winner = "";
  var currentplayer = 'X';
  void drowxo (i) {
    if(grid[i] == '-') {
      setState(() {
      grid[i] = currentplayer;
      currentplayer = currentplayer == 'X' ? 'O' : 'X';
     });
     findWinner(grid[i]);
    }
  }
  
  bool checkMove(i1,i2,i3,sign){
    if(grid[i1] == sign && grid[i2] == sign && grid[i3] == sign){
      return true;
    }
    return false;
  }

  void findWinner(currentsing) {
    if(checkMove(0,1,2,currentsing) || checkMove(3,4,5,currentsing) || checkMove(6,7,8,currentsing) ||
       checkMove(0,3,6,currentsing) || checkMove(1,4,7,currentsing) || checkMove(2,5,8,currentsing) ||
       checkMove(0,4,8,currentsing) || checkMove(2,4,6,currentsing)
    ){
      setState(() {
        winner = currentsing;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tic Tac Toe'),
        ),
        body: Center(
          child: Column(
            children: [
              if(winner != "") Text('$winner won the game',style: TextStyle(fontSize: 30),),
              Container(
                constraints: BoxConstraints(maxHeight: 1500, maxWidth: 1500),
                margin: EdgeInsets.all(20),
                color: Colors.black,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemCount: grid.length,
                  itemBuilder: (context, index) => Material(
                    color: Colors.amber,
                              child: InkWell(
                      splashColor: Colors.red,
                      onTap: () => drowxo(index),
                                child: Center(
                          child: Text(
                        grid[index],
                        style: TextStyle(fontSize: 100),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
