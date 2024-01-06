<<<<<<< HEAD
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
=======
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
>>>>>>> 4e45f051bdbfbfc0f1315072d770b4825243ce9a
