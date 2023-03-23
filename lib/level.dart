import 'package:flutter/material.dart';
import 'package:picturemath/config.dart';
import 'package:picturemath/home.dart';
import 'package:picturemath/play.dart';

class level extends StatefulWidget {
 int r;
 level(this.r);

  @override
  State<level> createState() => _levelState();
}

class _levelState extends State<level> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double appstatus=MediaQuery.of(context).padding.top;
    double bottombar=MediaQuery.of(context).padding.bottom;

    double body=height-appstatus-bottombar;

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select level"),
          ],
        ),
        actions: [
          Center(child: Text("${config.mode[widget.r]}",style: TextStyle(fontSize: 15))),

          Container(
              height: body*0.002,
              width:34,
              // color: Colors.red,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)))
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
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child:  InkWell(
                onTap: () {},
                child: Container(margin: EdgeInsets.fromLTRB(50, 30, 0, 20),
                  width: width*0.55,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue.shade50,
                      border: Border.all(width: 5,color: Colors.teal)
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: width*0.50,
                        height: body*0.07,
                        // color:Colors.blue,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: Container(
                              height:body*0.05 ,
                                width: width*0.40,
                                // color:Colors.red,

                                child: Center(child: Text("${config.heding[index]}",style: TextStyle(fontSize: 20,color: Colors.teal.shade700,fontWeight: FontWeight.bold),)))),
                            InkWell(
                              onTap: () {

                               showDialog(
                                 // barrierColor: Colors.transparent,
                                   context: context,
                                   builder: (context) {
                                     return  Dialog(
                                       child: Container(
                                         height: body*0.35,
                                         width: width*0.90,
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Container(
                                               alignment: Alignment.centerLeft,
                                               padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                               height: body*0.050,
                                               width: width,
                                               color: Colors.teal,
                                               child:Text("HOE TO PLAY ${config.heding[index]}"),
                                             ),
                                             Padding(
                                               padding: EdgeInsets.all(8.0),
                                               child: Text("Tap on a square to turn it over and see the picture it hindes"),
                                             ),
                                             Padding(
                                               padding: EdgeInsets.all(8.0),
                                               child: Text("Tap on another square to turn it over too"),
                                             ),
                                             Padding(
                                               padding: EdgeInsets.all(8.0),
                                               child: Text("If the pictures match,they 'll stay facing up,if not,both will turn over again"),
                                             ),
                                             Padding(
                                               padding: EdgeInsets.all(8.0),
                                               child: Text("Find all couples"),
                                             ),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 Padding(
                                                   padding:  EdgeInsets.all(8.0),
                                                   child: ElevatedButton(
                                                     style: ElevatedButton.styleFrom(
                                                         backgroundColor: Colors.teal,),
                                                         onPressed: (){
                                                     Navigator.pop(context);
                                                   }, child: Text("Ok")),
                                                 ),
                                               ],
                                             ),

                                           ],
                                         ),
                                       ),
                                     );
                                   },);

                              },child: Container(
                                height:body*0.05 ,
                                width: width*0.10,
                                // color:Colors.teal,

                                child:  Icon(Icons.question_mark_sharp,color: Colors.teal.shade700,)),
                                ),
                          ],
                        ),
                      ),
                      Container(
                        height: body*0.002,
                        width: body*0.25,
                        color: Colors.teal.shade700,

                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        height: body*0.70,
                        width: width*0.45,
                        // color: Colors.red,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return InkWell(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return play(widget.r,);
                                },));
                              },child:  Container(
                                height: body*0.06,
                                width: width*0.10,
                                color: Colors.teal.shade200,
                                child: Center(child: Text("LEVEL ${index+1}",style: TextStyle(fontSize: 18,color: Colors.white,),)),
                              ),);
                            },
                            separatorBuilder: (context, index) {
                              return Divider(color: Colors.teal.shade50,);
                            },
                            itemCount: 10)
                      ),
                    ],
                  )),
              ),
            );
            },),
        ),
      ),
    );
  }
}
