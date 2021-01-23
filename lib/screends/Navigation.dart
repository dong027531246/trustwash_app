import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trustwash_app/screends/BadgIcon.dart';
import 'package:trustwash_app/screends/Home.dart';
import 'package:trustwash_app/screends/Map.dart';
import 'package:trustwash_app/screends/month.dart';
import 'package:trustwash_app/screends/Profile.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  GMap gmap = new GMap();
  Home home = new Home();
  month calendar = new month();
  //Profile profile = new Profile();

  List<Widget> _pages;
  Widget _currentpage;

  int _tabbarcount = 0 ;
  StreamController<int> _conuntcontroler = StreamController<int>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = [home,calendar,gmap,calendar];
    _currentpage = home;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("images/icon.jpg"),
        title: Text('Trustwash '),
        backgroundColor: Colors.blue,
      ),
      body: _currentpage,
      // Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('images/1.png'), fit: BoxFit.cover),
      //     gradient: LinearGradient(
      //         colors: [Colors.blue[400], Colors.blue],
      //         begin: Alignment.bottomCenter,
      //         end: Alignment.topCenter),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: StreamBuilder(
                initialData: _tabbarcount,
                stream: _conuntcontroler.stream,
                builder: (_,snapshot) => BadgeIcon(
                  icon: Icon(
                    Icons.home,
                  ),
                  badgeCount: snapshot.data,
                ),
              ),
              title: Text('Home'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('Calendar'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_location),
              title: Text('Map'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _currentpage = _pages[index];
          });
        },
      ),
    );
  }
}
