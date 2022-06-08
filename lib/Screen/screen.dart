import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_pick/Animation/Heartanimation.dart';
import 'package:image_pick/Data/Data_Store.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final topBar = AppBar(
    backgroundColor: const Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: const Icon(Icons.camera_alt, color: Colors.black),
    title: SizedBox(
        height: 35.0.h, child: Image.asset("assets/images/insta_logo.png")),
    actions: const <Widget>[
      RPadding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(
          Icons.send,
          color: Colors.black,
        ),
      )
    ],
  );

  bool isHeartAnimating = false;
  bool isLiked = false;

  void showInSnackBar() {
    const snackBar = SnackBar(
      elevation: 6.0,
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
      margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
      behavior: SnackBarBehavior.floating,
      content: Text(
        'More Options',
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: SafeArea(
        child: Container(
          margin: REdgeInsets.only(left: 10, right: 10),
          padding: REdgeInsets.all(4.0),
          child: ListView.builder(
            itemCount: dummyStoryData.length,
            itemBuilder: (context, index) => index == 0
                ? const SizedBox(
                    height: 0,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),

                      /// 1 Row Profile With Toggle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40.0.h,
                                width: 40.0.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                        dummyStoryData[index].profilepic,
                                        scale: 8,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                dummyStoryData[index].name,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () => showInSnackBar(),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 5.h,
                      ),

                      /// 2 Row ImageView With Click Animation
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  InteractiveViewer(
                                    minScale: 0.1,
                                    maxScale: 1.6,
                                    onInteractionUpdate: (_) =>
                                        print("Interaction Updated"),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        dummyStoryData[index].postphoto,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: isHeartAnimating ? 1 : 0,
                                    child: HeartAnimationWidget(
                                        isAnimating: isHeartAnimating,
                                        onEnd: () {
                                          setState(() {
                                            isHeartAnimating = false;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                          size: 100,
                                        )),
                                  ),
                                ],
                              ),
                              onDoubleTap: () {
                                setState(() {
                                  isHeartAnimating = true;
                                  isLiked = true;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      /// 3 Row Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                  },
                                  icon: Icon(
                                    isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: isLiked ? Colors.red : Colors.black,
                                    size: 28,
                                  )),
                              Text(
                                dummyStoryData[index].like.toString(),
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const Icon(FontAwesomeIcons.comment),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                dummyStoryData[index].comment.toString(),
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.eye,
                                size: 24,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                dummyStoryData[index].view.toString(),
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ],
                      ),

                      /// 4 Row Comment
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //const Text("karan "),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            text:
                                                '${dummyStoryData[index].name} ',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: dummyStoryData[index]
                                                    .commmentss
                                                    .toString(),
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_outline,
                                size: 28,
                                color: Colors.black,
                              )),
                        ],
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      /// 5 Row Total Comments
                      Row(
                        children: [
                          Text(
                              "View all ${dummyStoryData[index].comment} comments",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.grey)),
                        ],
                      ),

                      SizedBox(
                        height: 5.h,
                      ),

                      /// Row Total Days
                      Row(
                        children: [
                          Text(
                              "${dummyStoryData[index].day.toString()} DAY AGO",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
