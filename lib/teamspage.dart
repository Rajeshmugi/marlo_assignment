import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo_assignment/constants.dart';
import 'package:material_design_icons_flutter/icon_map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:marlo_assignment/invitepage.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.monetization_on_outlined),
            label: 'Loan',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.contactsOutline),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/teams.png")),
            label: 'Teams',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.chatQuestionOutline),
            label: 'Chat',
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Teams',
                  style: heading,
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All people- 3',
                  style: mediumfont,
                ),
                Text(
                  'See all',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          containerwidget('KS', 'Krishna Soundhar', 'Admin',
              Color.fromARGB(255, 10, 114, 200), 'Active'),
          SizedBox(
            height: 5,
          ),
          containerwidget('VB', 'Vishnoo B', 'Admin',
              Color.fromARGB(255, 10, 114, 200), 'Active'),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Invited people - 1',
                  style: mediumfont,
                ),
                Text(
                  'See all',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                )
              ],
            ),
          ),
          containerwidget('EJ', 'Emperor J', '',
              Color.fromARGB(255, 168, 119, 89), 'Admin'),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 320, top: 120),
            child: FloatingActionButton(
              onPressed: () {
                Get.to(InvitePage());
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      )),
    );
  }

  Container containerwidget(
      String name1, String name2, String name3, Color colors, String name4) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(color: Colors.transparent)),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: 50,
              child: Center(
                  child: Text(
                name1,
                style: TextStyle(
                    color: Color.fromARGB(255, 240, 230, 230),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              )),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name2,
                  style: medium,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Text(
                    name4,
                    style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                name3,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
