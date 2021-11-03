import 'package:Airplay/ui/auth/login.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor2,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(125),
        child: SafeArea(
          child: Container(
            width: wholescreenWidth(context),
            color: backgroundcolor2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: wholescreenWidth(context) / 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/icon.png"),
                        SizedBox(
                          width: wholescreenWidth(context) / 20,
                        ),
                        CustomText(
                            size: 18,
                            color: regular,
                            fontWeight: FontWeight.w400,
                            text: "Air Play"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: wholescreenWidth(context) / 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 25,
                              color: regular,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Column(
            children: [
              verticalSpaceMedium,
              verticalSpaceMedium,
              Container(
                color: const Color.fromRGBO(0, 25, 29, 1),
                width: wholescreenWidth(context),
                height: wholescreenHeight(context) / 7,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          size: 14,
                          color: regular,
                          fontWeight: FontWeight.w400,
                          text: "Email Address"),
                      verticalSpaceSmall,
                      CustomText(
                          size: 14,
                          color: backgroundcolor1,
                          fontWeight: FontWeight.w400,
                          text: "danieloludiya@gmail.com"),
                    ],
                  ),
                ),
              ),
              verticalSpaceMedium,
              Container(
                  color: const Color.fromRGBO(0, 25, 29, 1),
                  width: wholescreenWidth(context),
                  height: wholescreenHeight(context) / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            size: 14,
                            color: regular,
                            fontWeight: FontWeight.w400,
                            text: "First Name"),
                        verticalSpaceSmall,
                        CustomText(
                            size: 14,
                            color: backgroundcolor1,
                            fontWeight: FontWeight.w400,
                            text: "Daniel")
                      ],
                    ),
                  )),
              verticalSpaceMedium,
              Container(
                  color: const Color.fromRGBO(0, 25, 29, 1),
                  width: wholescreenWidth(context),
                  height: wholescreenHeight(context) / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            size: 14,
                            color: regular,
                            fontWeight: FontWeight.w400,
                            text: "Last Name"),
                        verticalSpaceSmall,
                        CustomText(
                            size: 14,
                            color: backgroundcolor1,
                            fontWeight: FontWeight.w400,
                            text: "Oludiya")
                      ],
                    ),
                  )),
              verticalSpaceMedium,
              Container(
                  color: const Color.fromRGBO(0, 25, 29, 1),
                  width: wholescreenWidth(context),
                  height: wholescreenHeight(context) / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            size: 14,
                            color: regular,
                            fontWeight: FontWeight.w400,
                            text: "GENDER"),
                        verticalSpaceSmall,
                        CustomText(
                            size: 14,
                            color: backgroundcolor1,
                            fontWeight: FontWeight.w400,
                            text: "Male")
                      ],
                    ),
                  )),
              verticalSpaceMedium,
              Container(
                  color: const Color.fromRGBO(0, 25, 29, 1),
                  width: wholescreenWidth(context),
                  height: wholescreenHeight(context) / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            size: 14,
                            color: regular,
                            fontWeight: FontWeight.w400,
                            text: "phone Number"),
                        verticalSpaceSmall,
                        CustomText(
                            size: 14,
                            color: backgroundcolor1,
                            fontWeight: FontWeight.w400,
                            text: "09098881123")
                      ],
                    ),
                  )),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const Login()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: backgroundcolor1,
                          ),
                          CustomText(
                              size: 14,
                              color: backgroundcolor1,
                              fontWeight: FontWeight.w400,
                              text: "Logout")
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
