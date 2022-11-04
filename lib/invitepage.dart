import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo_assignment/constants.dart';
import 'package:marlo_assignment/keyboard.dart';
import 'package:marlo_assignment/teamspage.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({super.key});

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  bool _selected = false;
  String dropdownvalue = 'Admin';
  Color _containerColor = Colors.white;
  var items = [
    'Admin',
    'Approver',
    'Preparer',
    'Viewer',
    'Employee',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DismissKeyboard(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.to(TeamsPage());
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Invite',
                    style: heading,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 229, 237, 234),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Business email',
                        labelStyle:
                            TextStyle(fontSize: 15.sp, color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => showModal(context),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 229, 237, 234),
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(dropdownvalue,
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 143, 141, 141))),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    )

                        // Array list of items
                        // items: items.map((String items) {
                        //   return DropdownMenuItem(
                        //     value: items,
                        //     child: Text(items),
                        //   );
                        // }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value

                        // onChanged: (String? newValue) {
                        //   showModal(context);
                        //   //   setState(() {
                        //   //     dropdownvalue = newValue!;
                        //   //   });
                        // },
                        ),
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                        child: Text('Continue',
                            style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))))
              ],
            )),
          ),
        ),
      ],
    );
  }

  void showModal(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: Container(
                  width: 60,
                  height: 5,
                  child: Divider(),
                  color: Colors.blue,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                height: 350.h,
                alignment: Alignment.center,
                child: Expanded(
                  child: Stack(
                    children: [
                      Text(
                        'Team roles',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                        ),
                        child: ListView.builder(
                            itemCount: items.length,
                            // separatorBuilder: (context, int) {
                            //   return Divider();
                            // },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, bottom: 5),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: _containerColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, bottom: 0, top: 15),
                                        child: Text(items[index],
                                            style: GoogleFonts.roboto(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 143, 141, 141))),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      dropdownvalue = items[index];
                                      _containerColor =
                                          Color.fromARGB(255, 229, 239, 238);
                                    });
                                    Navigator.of(context).pop();
                                  });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
