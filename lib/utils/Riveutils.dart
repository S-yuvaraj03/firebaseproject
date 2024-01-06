import 'package:rive/rive.dart';

class Riveutils {
  static StateMachineController getRiveController(Artboard artboard,
  {stateMachineName = "state Machine 1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);
    artboard.addController(controller!);
    return controller;
  }
}
