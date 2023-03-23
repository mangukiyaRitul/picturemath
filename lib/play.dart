import 'package:flutter/material.dart';
import 'package:picturemath/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class play extends StatefulWidget {
int r;
play(this.r);

  @override
  State<play> createState() => _playState();
}

class _playState extends State<play> {
  bool val=true;
  bool timer=true;
  int i=1;
  int t=0;
  int pos1=0;
  int pos2=0;
  int click=1;
  int score=0;
  int tempheidhtScore=0;
  Stream<int>time()
  async* {
    for(i=5;i>=0;i--)
      {
         Future.delayed(Duration(seconds: 1));
        yield i;
        print(i);
      }
    setState(() {

    });
  }Stream<int>time2()
  async* {
    for(i=0;i<=30;i++)
    {
      await Future.delayed(Duration(seconds: 1));
      yield i;
      print(i);
    }
    setState(() {

    });
  }

  getdata()
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("score");
    tempheidhtScore = prefs.getInt("heidhtScore") ?? 0;
  }

  @override
  void initState() {
    super.initState();
    getdata();
    config.vijibal=List.filled(16, true);

    config.img.shuffle();
         Future.delayed(Duration(seconds: 5)).then((value) {
          val=!val;
          config.vijibal=List.filled(16, false);
          timer=false;
          setState((){});
         });
  }


  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double appbar=kToolbarHeight;
    double appstatus=MediaQuery.of(context).padding.top;
    double bottombar=MediaQuery.of(context).padding.bottom;

    double body=height-appbar-appstatus-bottombar;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Time ${score}    ${tempheidhtScore}"),
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
      drawerEnableOpenDragGesture: false,
      body:Container(
        height: body,
        width: width,
        child: Column(
          children: [
            Container(
              height: body*0.10,
              width: width,
              child: StreamBuilder(
                stream: timer==false?time2():time(),
                builder: (context, snapshot) {
                  t=snapshot.data as int;

                  return timer==false? Container(
                  // height: body*0.10,
                  // width: width,
                  color: Colors.teal,
                  child: Slider(
                  min: 0,
                  max: 30,
                  value: t.toDouble(), onChanged: (value) {},),
                  ):Container(
                    // height: body*0.10,
                    // width: width,
                    color: Colors.teal,
                    child: Slider(
                      min: 0,
                      max: 5,
                      value:  t.toDouble(), onChanged: (value) {},),
                  );


                },
              ),
            ),
            Container(
              height: body*0.75,
              width: width,
              padding: EdgeInsets.fromLTRB(0,body*0.15, 0, 0),
              margin: EdgeInsets.fromLTRB(5,0, 5, 5),
              // color: Colors.red,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                     crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Visibility(
                        visible: config.vijibal[index],
                        child: Container(
                      // height: body*0.050,
                      // width: width*0.08,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(width: 1,color: Colors.black),
                          // image: DecorationImage(
                          //   image: AssetImage("${config.img[index]}"),
                          // ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.asset("images/${config.img[index]}",),
                    ),
                      replacement: InkWell(onTap: () async {


                        if(click==1)
                          {
                            config.vijibal[index]=true;
                           pos1=index;
                           click=3;
                            Future.delayed(Duration(milliseconds: 10)).then((value) {
                                click=2;
                              });
                          }
                        if(click==2)
                          {
                            config.vijibal[index]=true;
                            pos2=index;
                            click=3;
                            if(config.img[pos1]==config.img[pos2])
                              {
                                // print("${config.img[pos1]}");
                                print("MAtch");

                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                int tempScore = prefs.getInt("score") ?? 0;
                                tempScore=tempScore+10;

                                await  prefs.setInt("score",tempScore);
                                int tempheidhtScore = prefs.getInt("heidhtScore") ?? 0;
                                score=tempScore;

                                if(tempScore>tempheidhtScore)
                                  {
                                    await   prefs.setInt("heidhtScore",tempScore);
                                  }


                              }
                            else
                              {
                                 Future.delayed(Duration(seconds: 1)).then((value) {
                                  setState(() {
                                    config.vijibal[pos1]=false;
                                    config.vijibal[pos2]=false;
                                    print("NOT Match");
                                  });});

                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                int tempScore = prefs.getInt("score") ?? 0;
                                tempScore=tempScore-5;
                                await  prefs.setInt("score",tempScore);
                                int tempheidhtScore = prefs.getInt("heidhtScore") ?? 0;
                                score=tempScore;

                                if(tempScore>tempheidhtScore)
                                {
                                  await   prefs.setInt("heidhtScore",tempScore);
                                }
                              }
                            Future.delayed(Duration(seconds: 1)).then((value) {
                                click=1;
                              });
                          }
                        setState(() {});
                      }, child: Container(
                        height: body*0.050,
                        width: width*0.08,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            border: Border.all(width: 1,color: Colors.black),
                            // image: DecorationImage(
                            //   image: AssetImage("${config.img[index]}"),
                            // ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        // child: Image.asset("images/${config.img[index]}",),
                      ),),
                    );
                  },
              itemCount: 16,),
            ),
          ],
        ),
      ),

    );
  }
}