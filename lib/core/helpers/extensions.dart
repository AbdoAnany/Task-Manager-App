import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
//
//
// extension Navigation on BuildContext {
//   Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
//     return Navigator.of(this).push(
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) {
//           return FadeTransition(
//             opacity: animation,
//             child: YourDestinationWidget(arguments: arguments),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
//     return Navigator.of(this).pushReplacement(
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) {
//           return FadeTransition(
//             opacity: animation,
//             child: YourDestinationWidget(arguments: arguments),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<dynamic> pushNamedAndRemoveUntil(String routeName,
//       {Object? arguments, required RoutePredicate predicate}) {
//     return Navigator.of(this).pushAndRemoveUntil(
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) {
//           return FadeTransition(
//             opacity: animation,
//             child: YourDestinationWidget(arguments: arguments),
//           );
//         },
//       ),
//       predicate,
//     );
//   }
//
//   void pop() => Navigator.of(this).pop();
// }
