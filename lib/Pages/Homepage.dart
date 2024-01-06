// ignore: file_names
import "dart:ffi";
import "dart:math";

import "package:firebaseproject/Pages/Laundrypage.dart";
import "package:firebaseproject/components/Drawer.dart";
import 'package:firebaseproject/utils/Riveutils.dart';
import "package:firebaseproject/models/rive_asset.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:rive/rive.dart";

import "../components/Animatedbar.dart";
import "../models/MenuBtn.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  RiveAsset selectedBottomNav = bottomNavs.first;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalanimation;

  late SMIBool isSidebarclosed;

  bool isSidemenuClosed = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scalanimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              width: 250,
              left: isSidemenuClosed ? -250 : 0,
              height: MediaQuery.of(context).size.height,
              child: const Sandwichmenu()),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(animation.value - 30 * animation.value* pi / 180),
            child: Transform.translate(
                offset: Offset(animation.value * 230, 0),
                child: Transform.scale(
                    scale: scalanimation.value,
                    child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        child: Laundrypage()))),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: isSidemenuClosed ? 0 : 200,
            top: 16,
            child: MenuBtn(
              riveOnInit: (artboard) {
                StateMachineController controller = Riveutils.getRiveController(
                    artboard,
                    stateMachineName: "State Machine");
                isSidebarclosed = controller.findSMI("isOpen") as SMIBool;
                isSidebarclosed.value = true;
              },
              press: () {
                isSidebarclosed.value = !isSidebarclosed.value;
                if (isSidemenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
          
                setState(() {
                  isSidemenuClosed = isSidebarclosed.value;
                });
              },
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                    onTap: () {
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index] != selectedBottomNav) {
                        setState(() {
                          selectedBottomNav = bottomNavs[index];
                        });
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        bottomNavs[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedNavbar(
                            isActive: bottomNavs[index] == selectedBottomNav),
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Opacity(
                            opacity:
                                bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    Riveutils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavs[index].stateMachineName);
                                bottomNavs[index].input =
                                    controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
