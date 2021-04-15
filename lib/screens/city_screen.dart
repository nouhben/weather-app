import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_remake/shared/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String _city;
  final _controller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _city = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1514924013411-cbf25faa35bb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2472&q=80',
            ),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _controller,
                  decoration: kOtpInputDecoration.copyWith(
                    icon: const Icon(
                      CupertinoIcons.house,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    hintText: 'Enter a city name',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    _city,
                  );
                },
                child: Text(
                  'Get Weather',
                  style: kMessageTextStyle.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityModalSheet extends StatefulWidget {
  @override
  _CityModalSheet createState() => _CityModalSheet();
}

class _CityModalSheet extends State<CityModalSheet> {
  String _city;
  final _controller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _city = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1514924013411-cbf25faa35bb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2472&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
              ),
              cursorWidth: 2.0,
              controller: _controller,
              cursorColor: Colors.black12,
              decoration: kOtpInputDecoration.copyWith(
                fillColor: Colors.white.withOpacity(0.5),
                prefixIcon: const Icon(
                  CupertinoIcons.house,
                  color: Colors.black,
                  size: 24.0,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                hintText: 'City Name',
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                filled: true,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
                _city,
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white.withOpacity(0.75),
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Colors.blue.withOpacity(0.04);
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed))
                    return Colors.blue.withOpacity(0.12);
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            child: Text(
              'Get Weather',
              style: kMessageTextStyle.copyWith(
                  color: Colors.black, fontSize: 26.0),
            ),
          ),
        ],
      ),
    );
  }
}
