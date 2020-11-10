import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_flutter/tutorial3_covid_ui/ThemeTutorial3.dart';

class HeaderHomeCovid extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  final Function onPressMenu;
  final bool isShowBack;

  const HeaderHomeCovid({
    this.image,
    this.textTop = "",
    this.textBottom = "",
    this.offset = 0,
    this.onPressMenu,
    this.isShowBack = false,
  });

  @override
  _HeaderHomeCovidState createState() => _HeaderHomeCovidState();
}

class _HeaderHomeCovidState extends State<HeaderHomeCovid> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TNClipper(),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(image: AssetImage("assets/images/virus.png")),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  (widget.isShowBack
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, color: Colors.white),
                        )
                      : Container()),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (widget.onPressMenu != null) {
                        widget.onPressMenu();
                      }
                    },
                    child: SvgPicture.asset(
                      "assets/icons/menu.svg",
                      height: 11,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: (widget.offset < 0) ? 0 : widget.offset,
                      child: SvgPicture.asset(
                        widget.image,
                        width: 230,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Positioned(
                      top: 20 - widget.offset / 2,
                      left: 150,
                      child: Text(
                        "${widget.textTop} \n${widget.textBottom}",
                        style: ThemeTutorial3.kHeadingTextStyle
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TNClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80.0);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80.0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
