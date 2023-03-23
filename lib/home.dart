import 'package:flutter/material.dart';
import 'package:picturemath/config.dart';
import 'package:picturemath/level.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool volume=false;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double apppbarheidth=kToolbarHeight;
    double appstatus=MediaQuery.of(context).padding.top;
    double bottombar=MediaQuery.of(context).padding.bottom;

    double body=height-apppbarheidth-appstatus-bottombar;

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select Mode"),
          ],
        ),
        actions: [
          Center(child: IconButton(onPressed: (){

            if(volume==false)
              {
                volume=true;
              }
            else if(volume==true)
              {
                volume=false;
              }
            setState(() {

          });
            }, icon: volume==false? Icon(Icons.volume_off): Icon(Icons.volume_up_rounded))),
          Container(
              height: body*0.002,
              width:34,
              // color: Colors.red,
              // child: IconButton(onPressed: (){
               child: PopupMenuButton(
                    itemBuilder:(context) => [
                      PopupMenuItem(
                          child: Row(
                          children: [
                            Text("SHARE"),
                          ],
                          )),
                      PopupMenuItem(
                          child: Row(
                            children: [

                              Text("MORE GAMES"),
                            ],
                          )),
                      PopupMenuItem(
                          child: Row(
                            children: [
                              Text("PRIVACY POLICY"),
                            ],
                          )),
                    ],
                    icon: Icon(Icons.more_vert)
                ),

              // }, icon: Icon(Icons.more_vert))
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: body,
          width: width,
          decoration: BoxDecoration(
            // color: Colors.black,
            color: Color(0xffe0f2f1),
            image:DecorationImage(
              image: AssetImage("images/fondo_imagenes.png"),
           // fit: BoxFit.fill
            )
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(
               padding: EdgeInsets.fromLTRB(0, body*0.18, 0, 0),
               height: body*0.70,
               width: width,
               // color: Colors.teal,
               child:  UnconstrainedBox(
                 child: Container(
                   margin: EdgeInsets.all(10),
                   height: body*0.30,
                   width: width*0.55,
                   decoration: BoxDecoration(
                       color: Color(0xffe0f2f1),
                       border: Border.all(width: 7,color: Colors.teal),
                       borderRadius: BorderRadius.circular(10)
                   ),
                   child:Container(
                     padding: EdgeInsets.all(10),
                     // height: body*0.25,
                     // width: width*0.30,
                     child: ListView.separated(
                         itemBuilder:(context, index) {
                           return InkWell(
                             onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) {
                                 return level(index);
                               },));
                             },
                             child: Container(
                               height: body*0.07,
                               width: width*0.40,
                               color: Color(0xff009788),
                               child: Center(
                                 child: Text("${config.mode[index]}",style: TextStyle(fontSize: 21,color: Colors.white)),
                               ),
                             ),
                           );
                         },
                         separatorBuilder: (context, index) {
                           return Divider(height: body*0.020);
                         },
                         itemCount: config.mode.length),
                   )
                 ),
               ),
             ),
             Container(
               height:  body*0.10,
               width: width,
               // color: Colors.blue,
               child: UnconstrainedBox(
                 child:  Container(
                   margin: EdgeInsets.fromLTRB(0,0, 0, 0),
                   height: body*0.08,
                   width: width*0.35,
                   decoration: BoxDecoration(
                     // color: Colors.deepPurpleAccent,
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(width: 5,color: Colors.teal)
                   ),
                   child:Center(
                     child: Container(
                       height: body*0.05,
                       width: width*0.30,
                       color: Colors.teal,
                       child: Center(
                         child: Text("REMOVE ADS",style: TextStyle(fontSize: 15,color: Colors.white)),
                       ),
                     ),
                   ),

                 ),
               ),
             ),
             Container(
               height: body*0.20,
               width: width,
               // color: Colors.blue,
               child: UnconstrainedBox(
                 child:  Container(
                   margin: EdgeInsets.fromLTRB(0,0, 0, 0),
                   height: body*0.08,
                   width: width*0.70,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(width: 5,color: Colors.teal)
                   ),
                   child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Container(
                           height: body*0.05,
                           width: width*0.30,
                           color: Colors.teal,
                           child: Center(
                             child: Text("SHARE",style: TextStyle(fontSize: 15,color: Colors.white)),
                           ),
                         ),
                         Container(
                           height: body*0.05,
                           width: width*0.30,
                           color: Colors.teal,
                           child: Center(
                             child: Text("MORE GAME",style: TextStyle(fontSize: 15,color: Colors.white)),
                           ),
                         ),
                       ],
                     ),
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
