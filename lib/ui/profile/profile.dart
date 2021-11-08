import 'package:Airplay/services/auth_service.dart';
import 'package:Airplay/ui/auth/login.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(125),
        child: SafeArea(
          child: Container(
            width: wholescreenWidth(context),
            color: Theme.of(context).scaffoldBackgroundColor,
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
                width: wholescreenWidth(context),
                height: wholescreenHeight(context) / 7,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .cardColor, // const Color.fromRGBO(0, 25, 29, 1),

                  border: Border.all(color: Colors.black26),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        size: 16,
                        color: regular,
                        fontWeight: (Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .fontWeight)!,
                        text: "Email Address",
                      ),
                      verticalSpaceSmall,
                      CustomText(
                        size: 15,
                        color: (Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .color)!, // regular,
                        fontWeight: (Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .fontWeight)!, //FontWeight.normal,
                        text: "danieloludiya@gmail.com",
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpaceMedium,
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .cardColor, // const Color.fromRGBO(0, 25, 29, 1),

                    border: Border.all(color: Colors.black26),
                  ),
                  width: wholescreenWidth(context),
                  height: wholescreenHeight(context) / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          size: 16,
                          color: regular,
                          fontWeight: (Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .fontWeight)!,
                          text: "First Name",
                        ),
                        verticalSpaceSmall,
                        CustomText(
                          size: 15,
                          color: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .color)!, // regular,
                          fontWeight: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .fontWeight)!, //FontWeight.normal,
                          text: "Daniel",
                        ),
                      ],
                    ),
                  )),
              verticalSpaceMedium,
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .cardColor, // const Color.fromRGBO(0, 25, 29, 1),

                    border: Border.all(color: Colors.black26),
                  ),
                  width: wholescreenWidth(context),
                  height: wholescreenHeight(context) / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          size: 16,
                          color: regular,
                          fontWeight: (Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .fontWeight)!,
                          text: "Last Name",
                        ),
                        verticalSpaceSmall,
                        CustomText(
                          size: 15,
                          color: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .color)!, // regular,
                          fontWeight: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .fontWeight)!, //FontWeight.normal,
                          text: "Oludiya",
                        ),
                      ],
                    ),
                  )),
              verticalSpaceMedium,
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .cardColor, // const Color.fromRGBO(0, 25, 29, 1),

                    border: Border.all(color: Colors.black26),
                  ),
                  width: wholescreenWidth(context),
                  height: wholescreenHeight(context) / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          size: 16,
                          color: regular,
                          fontWeight: (Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .fontWeight)!,
                          text: "GENDER",
                        ),
                        verticalSpaceSmall,
                        CustomText(
                          size: 15,
                          color: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .color)!, // regular,
                          fontWeight: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .fontWeight)!, //FontWeight.normal,
                          text: "Male",
                        ),
                      ],
                    ),
                  )),
              verticalSpaceMedium,
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .cardColor, // const Color.fromRGBO(0, 25, 29, 1),

                    border: Border.all(color: Colors.black26),
                  ),
                  width: wholescreenWidth(context),
                  height: wholescreenHeight(context) / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          size: 16,
                          color: regular,
                          fontWeight: (Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .fontWeight)!,
                          text: "Phone Number",
                        ),
                        verticalSpaceSmall,
                        CustomText(
                          size: 15,
                          color: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .color)!, // regular,
                          fontWeight: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .fontWeight)!, //FontWeight.normal,
                          text: "09098881123",
                        ),
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
                      InkWell(
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: (Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .color)!,
                            ),
                            SizedBox(width: 10),
                            CustomText(
                              size: 18,
                              color: (Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .color)!, // backgroundcolor1,
                              fontWeight: FontWeight.w600,
                              text: "Logout",
                            )
                          ],
                        ),
                        onTap: () async {
                          await authService.signOut();
                        },
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
