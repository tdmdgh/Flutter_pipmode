import 'package:flutter/material.dart';
import 'package:overlay_p/newnew.dart';
import 'package:overlay_p/video.dart';
// import 'package:tests/notfile.dart';
// import 'package:tests/video.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

Duration dur = Duration(milliseconds: 250);
bool _isOverlayed = false;
double gloset = 0;
double offset = 0;
var content;
OverlayState _overlayState;
OverlayEntry _overlayEntry;
bool _ispipmode = false;

showOverlay(BuildContext context, Color color) {
  _overlayState = Overlay.of(context);
  if (content == color) {
    _ispipmode = false;

    _overlayEntry.markNeedsBuild();
  } else {
    if (_isOverlayed) {
      _overlayEntry.remove();
      _isOverlayed = false;
    }
    content = color;
    _ispipmode = false;

    offset = 0;
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 20,
        left: 0,
        child: AnimatedContainer(
          decoration: BoxDecoration(color: Colors.black45),
          duration: dur,
          height: !_ispipmode
              ? (MediaQuery.of(context).size.height - offset) >
                      MediaQuery.of(context).size.height
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.height - offset
              : 60 - offset <= 1
                  ? 1
                  : 60 - offset,
          width: MediaQuery.of(context).size.width,
          child: Column(children:[ 
          Opacity(
            opacity: _ispipmode?((offset <= 0)
                      ? 1
                      : (1 / offset > 1)
                          ? 1
                          : 1 / offset):1,
                      child: Row(children: [
              GestureDetector(
                    onTap: () {
                        // setState(() {
                        _ispipmode = false;
                        // });
                        dur = Duration(milliseconds: 250);

                        _overlayEntry.markNeedsBuild();
                      },
                      onVerticalDragUpdate: (details) {
                        // setState(() {
                        //   dur = Duration(milliseconds: 0);
                        //   offset += details.delta.dy;
                        // });
                        dur = Duration(milliseconds: 0);
                        offset += details.delta.dy;
                        _overlayEntry.markNeedsBuild();
                      },
                      onVerticalDragEnd: (details) {
                        // setState(() {
                        if (details.velocity.pixelsPerSecond.dy < -1000) {
                          _ispipmode = !_ispipmode;
                          dur = Duration(milliseconds: 250);
                          offset = 0;
                        } else {
                          if(_ispipmode){
                          if (offset <
                              -(MediaQuery.of(context).size.height * 2 / 5)) {
                            _ispipmode = !_ispipmode;
                            dur = Duration(milliseconds: 250);
                            offset = 0;
                          } else {
                            if (offset > 5) {
                              _ispipmode = !_ispipmode;

                              if (_isOverlayed) {
                                _overlayEntry.remove();
                                _isOverlayed = false;
                                offset = 0;
                              }
                            }
                            offset = 0.0;
                            dur = Duration(milliseconds: 150);
                          }
                          }
                          else{
                             if (MediaQuery.of(context).size.height - offset < 
                          MediaQuery.of(context).size.height *3/5
                            // offset >
                              // (MediaQuery.of(context).size.height * 2 / 5)
                              ) {
                            _ispipmode = !_ispipmode;
                            dur = Duration(milliseconds: 250);
                            offset = 0;
                          } else {
                            offset = 0.0;
                            dur = Duration(milliseconds: 150);
                          }
                          }
                        }
                        // });
                        _overlayEntry.markNeedsBuild();
                      },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          AnimatedContainer(
                            duration: dur,
                        height: _ispipmode?
                        (MediaQuery.of(context).size.width / 3 -
                                            offset <=
                                        (MediaQuery.of(context).size.width)
                                    ? (MediaQuery.of(context).size.width / 3 -
                                            offset) *
                                        9 /
                                        16
                                    : MediaQuery.of(context).size.width *
                                        9 /
                                        16)
                              :( MediaQuery.of(context).size.height - offset >=
                                MediaQuery.of(context).size.width * 9 / 16
                            ? MediaQuery.of(context).size.width * 9 / 16
                            : (MediaQuery.of(context).size.width * 9 / 16) -
                                (offset -
                                    (MediaQuery.of(context).size.height -
                                        MediaQuery.of(context).size.width *
                                            9 /
                                            16))),
                        width: _ispipmode?
                        (MediaQuery.of(context).size.width / 3 -
                                            offset <
                                        MediaQuery.of(context).size.width
                                    ? MediaQuery.of(context).size.width / 3 -
                                        offset
                                    : MediaQuery.of(context).size.width)
                        :(MediaQuery.of(context).size.height - offset >=
                                MediaQuery.of(context).size.width * 9 / 16
                            ? MediaQuery.of(context).size.width
                            : (MediaQuery.of(context).size.height - offset) *
                                16 /
                                9),
                        decoration: BoxDecoration(color: content),
                        child: Video(),
                          ),
                          _ispipmode? AnimatedContainer(
                                duration: dur,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                width:
                                    MediaQuery.of(context).size.width * 8 / 15 +
                                                offset * 4 / 5 >
                                            0
                                        ? MediaQuery.of(context).size.width *
                                                8 /
                                                15 +
                                            offset * 4 / 5
                                        : 0, 
                              ):SizedBox(),
                          _ispipmode? AnimatedContainer(
                                duration: dur,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width *
                                                  2 /
                                                  15 +
                                              offset / 5 >
                                          0
                                      ? MediaQuery.of(context).size.width *
                                              2 /
                                              15 +
                                          offset / 5
                                      : 0,
                                  child: GestureDetector(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              3 *
                                              9 /
                                              16,
                                      width: MediaQuery.of(context).size.width *
                                                      2 /
                                                      15 +
                                                  offset / 5 >
                                              0
                                          ? MediaQuery.of(context).size.width *
                                                  2 /
                                                  15 +
                                              offset / 5
                                          : 0,
                                      child: Icon(Icons.close),
                                    ),
                                    onTap: () {
                                      // setState(() {
                                      if (_isOverlayed) {
                                        _overlayEntry.remove();
                                        _isOverlayed = false;
                                        offset = 0;
                                      }

                                      _overlayEntry.markNeedsBuild();
                                      // });
                                    },
                                  )):SizedBox()
                        ],),
              )
            ],),
          )
          ,_ispipmode?SizedBox():SizedBox(height: 30,),
          _ispipmode?SizedBox():Container(
                                  decoration: BoxDecoration(
                                      color: Colors.brown),
                                  height: MediaQuery.of(context).size.width *
                                      9 /
                                      16,
                                  width: MediaQuery.of(context).size.width,
                                ),])
        ),
      ),
    );

    _overlayState.insert(_overlayEntry);
    _isOverlayed = true;
  }
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.next_plan_outlined),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SecPage()));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: GestureDetector(
                onTap: () {
                  showOverlay(context, Colors.grey);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  height: 250,
                  width: MediaQuery.of(context).size.width - 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: GestureDetector(
                onTap: () {
                  showOverlay(context, Colors.red);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  height: 250,
                  width: MediaQuery.of(context).size.width - 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: GestureDetector(
                onTap: () {
                  showOverlay(context, Colors.orange);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  height: 250,
                  width: MediaQuery.of(context).size.width - 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
                height: 250,
                width: MediaQuery.of(context).size.width - 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                height: 250,
                width: MediaQuery.of(context).size.width - 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                height: 250,
                width: MediaQuery.of(context).size.width - 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                height: 250,
                width: MediaQuery.of(context).size.width - 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                height: 250,
                width: MediaQuery.of(context).size.width - 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                height: 250,
                width: MediaQuery.of(context).size.width - 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
