import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_flutter/tutorial4_travel_app/model/TravelSpot.dart';
import 'package:learning_flutter/tutorial4_travel_app/model/User.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/ThemeTutorial4.dart';

class PlaceCard extends StatelessWidget {
  final TravelSpot travelSport;
  final bool isFullCard;
  final GestureTapCallback press;

  const PlaceCard({
    Key key,
    @required this.travelSport,
    this.isFullCard = false,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(isFullCard ? 158 : 137),
      child: Column(
        children: [
          _buildImagePlace(),
          _buildInfoPlace(),
        ],
      ),
    );
  }

  Widget _buildImagePlace() {
    return AspectRatio(
      aspectRatio: this.isFullCard ? 1.09 : 1.29,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          image: DecorationImage(
            image: AssetImage(travelSport.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoPlace() {
    return Container(
      width: getProportionateScreenWidth(isFullCard ? 158 : 137),
      padding: EdgeInsets.all(
        getProportionateScreenWidth(ThemeTutorial4.kDefaultPadding),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [ThemeTutorial4.kDefaultShadow],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            travelSport.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isFullCard ? 17 : 12,
            ),
          ),
          if (isFullCard)
            Builder(
              builder: (BuildContext context) {
                return Text(
                  travelSport.date.day.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold),
                );
              },
            ),
          if (isFullCard)
            Text(
              DateFormat.MMMM().format(travelSport.date) +
                  " " +
                  travelSport.date.year.toString(),
            ),
          VerticalSpacing(of: 10),
          Travelers(users: travelSport.users),
        ],
      ),
    );
  }
}

class Travelers extends StatelessWidget {
  const Travelers({
    Key key,
    @required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    int totalUser = 0;
    double sizeAvatar = getProportionateScreenWidth(28);

    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(
            users.length,
            (index) {
              totalUser++;
              return Positioned(
                left: (22 * index).toDouble(),
                child: _buildTravelerFace(index),
              );
            },
          ),
          Positioned(
            left: (22 * totalUser).toDouble(),
            child: Container(
              width: sizeAvatar,
              height: sizeAvatar,
              decoration: BoxDecoration(
                color: ThemeTutorial4.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white, size: 16,),
            ),
          )
        ],
      ),
    );
  }

  ClipOval _buildTravelerFace(int index) {
    double sizeAvatar = getProportionateScreenWidth(28);

    return ClipOval(
      child: Image.asset(
        users[index].avatar,
        width: sizeAvatar,
        height: sizeAvatar,
        fit: BoxFit.cover,
      ),
    );
  }
}
