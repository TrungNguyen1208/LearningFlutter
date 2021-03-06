import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldSelectCountry extends StatefulWidget {
  @override
  _TextFieldSelectCountryState createState() => _TextFieldSelectCountryState();
}

class _TextFieldSelectCountryState extends State<TextFieldSelectCountry> {

  String _countrySelected = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE5E5E5),
        ),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset("assets/icons/maps-and-flags.svg"),
          SizedBox(width: 20),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              icon: SvgPicture.asset("assets/icons/dropdown.svg"),
              value: _countrySelected,
              items: [
                'Indonesia',
                'Bangladesh',
                'United States',
                'Japan'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _countrySelected = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
