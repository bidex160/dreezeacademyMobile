import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/provider/classProvider.dart';
import 'package:dreezeacademy/model/classquestionmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';
import 'package:dreezeacademy/widgets/VideoPlayer.dart';
import 'package:video_player/video_player.dart';

class ClassRoom extends StatelessWidget {
  static const routeName = '/ClassRoom';


  @override
  Widget build(BuildContext context) {

    final classprovider = Provider.of<ClassProvider>(context, listen: true);
    final classdata = classprovider.items;

    print(classdata.length);
    print(classdata.length);
    print(classdata.length);
    print("classdata.length");

    return MaterialApp(

      home: classroom(),

    );
  }
}

class classroom extends StatefulWidget {
  @override
  _classroomState createState() => _classroomState();
}

class _classroomState extends State<classroom> {
  ClassQuestionModel _currentquestion;
  String _currentUrl ="https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
 VideoPlayerController _videoPlayerController;
  var _disposed = false;

  bool moredetails = false;
  void showmore(){
setState(() {
  moredetails  = !moredetails;
  print(moredetails);
});
  }


  void currentQuestion(ClassQuestionModel classQuestion){
    setState(() {
     // _videoPlayerController.

      _currentquestion = classQuestion;

       _currentUrl = _currentquestion.Videourl;

      print(_currentquestion.Videourl);
      print(_currentUrl);
    });
  }

  void _initializeAndPlay() async {
   print("_initializeAndPlay current urlll---------> $_currentUrl");
    final controller = VideoPlayerController.network(_currentUrl);
    final old = _videoPlayerController;
    _videoPlayerController = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdated);
      await old.pause();


    }
    setState(() {
      debugPrint("---- controller changed");
    });

    controller
      ..initialize().then((_) {
        debugPrint("---- controller initialized");
        old?.dispose();

        controller.addListener(_onControllerUpdated);
        controller.play();
        setState(() {});
      });
  }
  Future<void> _onControllerUpdated() async {
    if (_disposed) return;
    final controller = _videoPlayerController;
    if (controller == null) return;
    if (!controller.value.initialized) return;
    final position = await controller.position;
    final duration = controller.value.duration;
    if (position == null || duration == null) return;

    final playing = controller.value.isPlaying;
    final isEndOfClip =
        position.inMilliseconds > 0 && position.inSeconds == duration.inSeconds;


   // print("Prinnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnt");
    //print("Prinnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnt");

   // print(playing);
    //print(isEndOfClip);

  //  print("Prinnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnt");
   // print("Prinnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnt");

    // blocking too many updation
    final interval = position.inMilliseconds / 250.0;



  }

  @override
  void initState() {

    super.initState();
    _initializeAndPlay();
  }

  @override
  void dispose() {
    _disposed = true;

    _videoPlayerController?.pause(); // mute instantly
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    super.dispose();
  }


  Widget _playVideo(BuildContext context){
    final controller = _videoPlayerController;
    if(controller != null && controller.value.initialized) {
      return ChangeNotifierProvider(


        create: (_) => _currentquestion,
        child: Container(
          height: Config.yMargin(context, 33),
          child: Card(
            elevation: 5,
          child: Column(

                children: [
                  ChewiePlayer(
                      false, controller, false, _currentUrl),
                  Expanded(

                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                  Icons.thumb_up
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text("${_currentquestion.like}"),
                              )
                            ],
                          ),
                          onTap: () {
                            setState(() {

                            });
                            _currentquestion.addlike();
                            print("object");
                          },
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                                Icons.thumb_down
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text("${_currentquestion.unlike}"),
                            )
                          ],
                        ),

                        IconButton(
                          icon: Icon(
                              Icons.keyboard_arrow_down
                          ),
                          onPressed: () {
                            showmore();
                          },
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),

        ),
      );
    }
    else{
      return Container(
        color:Colors.black38,
        height: Config.yMargin(context, 33),

      );
    }

  }

  @override
  Widget build(BuildContext context) {


    final classprovider = Provider.of<ClassProvider>(context, listen: true);
    final classdata = classprovider.items;
    _currentquestion = classdata[0];
    _currentUrl = _currentquestion.Videourl;
    return Scaffold(
      appBar: AppBar(
        title: Text("subject"),
      ),
    body: Container(
      height: Config.yMargin(context, 100),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

        _playVideo(context),

            Divider(thickness: Config.yMargin(context, 1),),

            //if(moredetails)

            moredetails ? Container(
      child: Text(_currentquestion.text),
      ) :
            SizedBox(
                height: Config.yMargin(context, 53),
              child:ListView.builder(
                    itemCount: classdata.length,

                      itemBuilder: (_, int index){
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: Config.yMargin(context, 20),
                              color: Colors.white,

                             child: Row(
                               children: <Widget>[
                                 Container(
                                   width: Config.xMargin(context, 40),
                                   child:Icon(
                                     Icons.play_circle_filled
                                   )

                                 ),

                                 Padding(
                                   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                   child: Column(
                                     children: <Widget>[
                                       Text("Logarithm"),
                                       Text('part2')

                                     ],

                                   ),
                                 )
                               ],
                             ),

                            ),
                          ),
                          onTap: (){
                            currentQuestion(classdata[index]);
                            print(index);
                            setState(() {
                             _initializeAndPlay();
                           // _videoPlayerController.dispose();
                            });



                          },
                        );
                      }

                  ),


              ),



            //Text("${classdata.length}")
          ],
        ),
    ),




    );
  }
}

