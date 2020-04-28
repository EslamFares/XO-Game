import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scafoldKey = GlobalKey<ScaffoldState>();
  AssetImage cross = AssetImage('assets/img/cross.png');
  AssetImage circle = AssetImage('assets/img/circle00.png');
  AssetImage edit = AssetImage('assets/img/edit.png');

  int crossWin = 0;
  int circleWin = 0;
  int draw = 0;
  List<String> gameState;
  bool isCross = true;
  bool gameEnd = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
    });
  }

  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black, //Color(0xffFF0000)
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'X',
                    style: TextStyle(
                        color: Color(0xffFF0000),
                        fontSize: 30,
                        letterSpacing: 1.2,
                        fontFamily: GoogleFonts.bangers().fontFamily),
                  ),
                  Text(
                    'O ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        letterSpacing: 1.2,
                        fontFamily: GoogleFonts.bangers().fontFamily),
                  ),
                  Text(
                    'Game',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 30,
                        letterSpacing: 1.2,
                        fontFamily: GoogleFonts.bangers().fontFamily),
                  ),
                ],
              ),
              SizedBox(height: 3,),
              Container(
                height: 10,
                width: 250,
                color: Color(0xffFF0000),
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            Colors.grey[800],
            Colors.black,
          ], radius: 0.85, focal: Alignment.center),
        ),
        child: Column(
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, i) =>
                  SizedBox(
                height: 100,
                width: 100,
                child: Container(
    color: Colors.black,
                  child: MaterialButton(
                    onPressed: () => playGame(i),
                    child: Image(
                      image: getImage(gameState[i]),
                    ),
                  ),
                ),
              ),
              itemCount: gameState.length,
            ),
            //===============================================
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 110,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'X',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.red,
                                  fontFamily: GoogleFonts.indieFlower().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Text('${crossWin}',
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.amber,
                                    fontFamily: GoogleFonts.bangers().fontFamily,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'O',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.blue,
                                  fontFamily: GoogleFonts.indieFlower().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Text('${circleWin}',
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.amber,
                                    fontFamily: GoogleFonts.bangers().fontFamily,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Draw',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.teal,
                                  fontFamily: GoogleFonts.indieFlower().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Text('${draw}',
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.amber,
                                    fontFamily: GoogleFonts.bangers().fontFamily,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          color: Colors.teal.withOpacity(.4),
                          minWidth: 50,
                          height: 50,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text('New Game',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                          onPressed: () =>  logOut(),//newGame()
                        ),
                        MaterialButton(
                          color: Colors.blueGrey.withOpacity(.5),
                          minWidth: 50,
                          height: 50,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text('Play Again',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              )),
                          onPressed: () => resetGame(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[900],
          title: Text('Are you sure?',style: TextStyle(color: Colors.black),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Start new  game and lose score!!',style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Colors.red[900],
              child: Text('No',style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the Dialog
              },
            ),
            FlatButton(
              color: Colors.blue[900],
              child: Text('Yes',style: TextStyle(color: Colors.black),),
              onPressed: () {
                newGame(); //
                Navigator.of(context).pop();// Navigate to login
              },
            ),
          ],
        );
      },
    );
  }

  playGame(int index) {
    if (gameState[index] == 'empty') {
      setState(() {
        if (isCross) {
          gameState[index] = 'cross';
        } else {
          gameState[index] = 'circle';
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  checkWin() {
    if (!gameEnd) {
      if ((gameState[0]) != 'empty' &&
          (gameState[0] == gameState[1]) &&
          (gameState[1] == gameState[2])) {
        setState(() {
          showWiner(gameState[0]);
          markPoints(gameState[0]);
          gameEnd = true;
        });
      } else if ((gameState[3]) != 'empty' &&
          (gameState[3] == gameState[4]) &&
          (gameState[4] == gameState[5])) {
        setState(() {
          showWiner(gameState[3]);
          markPoints(gameState[3]);
          gameEnd = true;
        });
      } else if ((gameState[6]) != 'empty' &&
          (gameState[6] == gameState[7]) &&
          (gameState[7] == gameState[8])) {
        setState(() {
          showWiner(gameState[6]);
          markPoints(gameState[6]);
          gameEnd = true;
        });
      } else if ((gameState[0]) != 'empty' &&
          (gameState[0] == gameState[3]) &&
          (gameState[3] == gameState[6])) {
        setState(() {
          showWiner(gameState[0]);
          markPoints(gameState[0]);
          gameEnd = true;
        });
      } else if ((gameState[1]) != 'empty' &&
          (gameState[1] == gameState[4]) &&
          (gameState[4] == gameState[7])) {
        setState(() {
          showWiner(gameState[1]);
          markPoints(gameState[1]);
          gameEnd = true;
        });
      } else if ((gameState[2]) != 'empty' &&
          (gameState[2] == gameState[5]) &&
          (gameState[5] == gameState[8])) {
        setState(() {
          showWiner(gameState[2]);
          markPoints(gameState[2]);
          gameEnd = true;
        });
      } else if ((gameState[0]) != 'empty' &&
          (gameState[0] == gameState[4]) &&
          (gameState[4] == gameState[8])) {
        setState(() {
          showWiner(gameState[0]);
          markPoints(gameState[0]);
          gameEnd = true;
        });
      } else if ((gameState[2]) != 'empty' &&
          (gameState[2] == gameState[4]) &&
          (gameState[4] == gameState[6])) {
        setState(() {
          showWiner(gameState[2]);
          markPoints(gameState[2]);
          gameEnd = true;
        });
      } else if (!gameState.contains('empty')) {
        setState(() {
          showWiner('Game Draw');
          markPoints('draw');
          gameEnd = true;
        });
      }
    }
  }

  resetGame() {
    setState(() {
      gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      gameEnd = false;
    });
  }

  newGame() {
    resetGame();
    setState(() {
      circleWin = 0;
      crossWin = 0;
      draw = 0;
    });
  }

  markPoints(String mark) {
    switch (mark) {
      case ('cross'):
        setState(() {
          crossWin += 1;
        });
        break;
      case ('circle'):
        setState(() {
          circleWin += 1;
        });
        break;
      case ('draw'):
        setState(() {
          draw += 1;
        });
        break;
    }
  }

  showWiner(String winer) {
    _scafoldKey.currentState.showSnackBar(SnackBar(
      content: Text('${winer} wins'),
      duration: Duration(seconds: 2),
    ));

    //to restGame by self with out click in button
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        resetGame();
      });
    });
  }
}
