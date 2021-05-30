import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:igpazar/const.dart';
import 'package:igpazar/store/mode_store.dart';
import 'package:igpazar/widgets/navigation_bar/navbar_logo.dart';
import 'package:provider/provider.dart';

class NavigationBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ModeStore _modeStore = Provider.of<ModeStore>(context, listen: false);
    return Container(
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NavbarLogo(),
                Observer(builder: (_) {
                  return Text("İGPAZAR",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "bebas",
                        color: color(context,
                            darkModeColor: white, unDarkModeColor: black),
                      ));
                }),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    _modeStore.changeDarkMode();
                  },
                  child: SvgPicture.asset(
                      _modeStore.darkMode
                          ? "assets/icons/bat_white.svg"
                          : "assets/icons/bat.svg",
                      height: 30,
                      width: 30,
                      color: _modeStore.darkMode
                          ? Color(0xFFFFFFFF)
                          : Color(0xFF212121))),
            ],
          )
        ],
      ),
    );
  }
}
