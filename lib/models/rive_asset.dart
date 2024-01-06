import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});
  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "HOME", stateMachineName: "HOME_interactivity", title: "HOME"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
      title: "FAVOURITES"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "ORDER"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "HELP"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "PROFILE"),
];

List<RiveAsset> sidemenus = [
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "HOME", stateMachineName: "HOME_interactivity", title: "HOME"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "NOTIFICATION"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "PAST ORDERS"),
];

List<RiveAsset> sidemenus2 = [
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "HELP"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "REFRESH/RELOAD",
      stateMachineName: "RELOAD_Interactivity",
      title: "REFRESH"),
];
