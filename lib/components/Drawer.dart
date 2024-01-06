import "package:firebaseproject/components/infocard.dart";
import "package:firebaseproject/components/sidemenu.dart";
import "package:firebaseproject/models/rive_asset.dart";
import "package:firebaseproject/utils/Riveutils.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:rive/rive.dart";

class Sandwichmenu extends StatefulWidget {
  const Sandwichmenu({super.key});

  @override
  State<Sandwichmenu> createState() => _SandwichmenuState();
}

class _SandwichmenuState extends State<Sandwichmenu> {
  RiveAsset selectedmenu = sidemenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: 250,
      height: double.infinity,
      color: Colors.blueGrey[800],
      child: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Infocard(
            name: "Hello User",
            tagline: "#Smartperson",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
            child: Text(
              "Browse".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white70),
            ),
          ),
          ...sidemenus.map((menu) => Sidemenu(
                menu: menu,
                riveonInit: (artboard) {
                  StateMachineController controller =
                      Riveutils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                press: () {
                  menu.input!.change(true);
                  Future.delayed(Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedmenu = menu;
                  });
                },
                isActive: selectedmenu==menu,
              )
            ),
            Padding(
            padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
            child: Text(
              "Support".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white70),
            ),
          ),
          ...sidemenus2.map((menu) => Sidemenu(
                menu: menu,
                riveonInit: (artboard) {
                  StateMachineController controller =
                      Riveutils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                press: () {
                  menu.input!.change(true);
                  Future.delayed(Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedmenu = menu;
                  });
                },
                isActive: selectedmenu==menu,
              )
            ),
        ],
      )),
    ));
  }
}
