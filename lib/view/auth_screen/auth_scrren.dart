import 'package:amazon_project/constants/common_function.dart';
import 'package:amazon_project/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isInLogin = false;
  String caccout = 'CAccount', signin = 'Signin', selcted = 'Selcet';
  String currentCountryCode = '+91';
  TextEditingController txtMoblieNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage('assets/images/amazonlogo.png'),
          height: height * 0.08,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: height * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome',
                  style: textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w500)),
              CommonFunction.blankSpace(height * 0.02, 0),
              Container(
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(color: greyShade3),
                ),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.055,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: greyShade3),
                          ),
                          color: greyShade1),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Row(
                        children: [
                          // InkWell(
                          //   onTap: () {
                          //     isInLogin = false;
                          //     setState(() {});
                          //   },
                          //   child: Container(
                          //     alignment: Alignment.center,
                          //     height: height * 0.04,
                          //     width: width * 0.04,
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       border: Border.all(color: Colors.grey),
                          //       color: Colors.white,
                          //     ),
                          //     child: Icon(
                          //       Icons.circle,
                          //       size: height * 0.01,
                          //       color: isInLogin
                          //           ? const Color.fromRGBO(255, 153, 0, 1)
                          //           : Colors.transparent,
                          //     ),
                          //   ),
                          // ),
                          Radio(
                            value: caccout,
                            groupValue: selcted,
                            // focusColor: grey,
                            // activeColor: transparent,
                            fillColor: MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return secondaryColor;
                              }
                              return grey;
                            }),
                            onChanged: (value) {
                              selcted = value!;
                              setState(() {});
                            },
                          ),
                          CommonFunction.blankSpace(0, width * 0.02),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Create Account. ',
                                    style: textTheme.labelMedium!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: 'New to Amazon? ',
                                    style: textTheme.labelMedium)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            // InkWell(
                            //   onTap: () {
                            //     isInLogin = true;
                            //     setState(() {});
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     height: height * 0.04,
                            //     width: width * 0.04,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       border: Border.all(color: Colors.grey),
                            //       color: Colors.white,
                            //     ),
                            //     child: Icon(
                            //       Icons.circle,
                            //       size: height * 0.01,
                            //       color: isInLogin
                            //           ? Colors.transparent
                            //           : const Color.fromRGBO(255, 153, 0, 1),
                            //     ),
                            //   ),
                            // ),
                            Radio(
                              value: signin,
                              groupValue: selcted,
                              // focusColor: grey,
                              // activeColor: transparent,
                              fillColor:
                                  MaterialStateColor.resolveWith((states) {
                                if (states.contains(MaterialState.selected)) {
                                  return secondaryColor;
                                }
                                return grey;
                              }),
                              onChanged: (value) {
                                selcted = value!;
                                setState(() {});
                              },
                            ),
                            CommonFunction.blankSpace(0, width * 0.02),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Sign in. ',
                                    style: textTheme.labelMedium!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: 'Already a Customer? ',
                                    style: textTheme.labelMedium)
                              ]),
                            )
                          ]),
                          CommonFunction.blankSpace(height * 0.01, 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (value) {
                                      currentCountryCode =
                                          '+${value.phoneCode}';
                                      setState(() {});
                                    },
                                  );
                                },
                                child: Container(
                                  height: height * 0.055,
                                  width: width * 0.15,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: grey,
                                      ),
                                      color: greyShade2,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    currentCountryCode,
                                    style: textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.055,
                                width: width * 0.64,
                                child: TextFormField(
                                  controller: txtMoblieNumber,
                                  cursorColor: black,
                                  keyboardType: TextInputType.number,
                                  style: textTheme.bodyMedium,
                                  decoration: InputDecoration(
                                    hintText: 'Moblie number',
                                    hintStyle: const TextStyle(fontSize: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color: grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: secondaryColor),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color: grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color: grey),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    CommonFunction.blankSpace(height * 0.02, 0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(width * 0.80, height * 0.055),
                          backgroundColor: amber),
                      child: Text('Continue',
                          style: textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w500)),
                    ),
                    CommonFunction.blankSpace(height * 0.02, 0),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: height * 0.015,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'By Continuing you agree to Amazon\'s ',
                                style: textTheme.labelMedium),
                            TextSpan(
                              text: 'Conditions of use ',
                              style:
                                  textTheme.labelMedium!.copyWith(color: blue),
                            ),
                            TextSpan(
                                text: 'and ', style: textTheme.labelMedium),
                            TextSpan(
                              text: 'Privacy Notice',
                              style:
                                  textTheme.labelMedium!.copyWith(color: blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CommonFunction.blankSpace(height * 0.01, 0),
                  ],
                ),
              ),
              CommonFunction.blankSpace(height * 0.05, 0),
              Column(
                children: [
                  Container(
                    height: 1.5,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          white,
                          greyShade3,
                          white,
                        ],
                      ),
                    ),
                  )
                ],
              ),
              CommonFunction.blankSpace(height * 0.025, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Condition of Use',
                    style: textTheme.bodyMedium!.copyWith(color: blue),
                  ),
                  Text(
                    'Privacy Notice',
                    style: textTheme.bodyMedium!.copyWith(color: blue),
                  ),
                  Text(
                    'Help',
                    style: textTheme.bodyMedium!.copyWith(color: blue),
                  )
                ],
              ),
              CommonFunction.blankSpace(height * 0.015, 0),
              Center(
                child: Text(
                  '@ 1996-2023,Amazon.com,Inc. or its affiliates',
                  style: textTheme.labelSmall!.copyWith(
                    color: grey,
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
