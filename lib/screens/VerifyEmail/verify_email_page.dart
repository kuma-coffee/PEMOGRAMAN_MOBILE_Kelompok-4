import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maths_edu/constants.dart';
import 'package:maths_edu/screens/homePage/dump.dart';
import 'package:maths_edu/services/utils.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  // bool canResendEmail = false;
  // Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  // void initState() {
  //   super.initState();

  //   isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

  //   if (!isEmailVerified) {
  //     sendVerificationEmail();

  //     timer = Timer.periodic(
  //       Duration(seconds: 3),
  //       (_) => checkEmailVerified(),
  //     );
  //   }
  // }

  // @override
  // void dispose() {
  //   timer?.cancel();

  //   super.dispose();
  // }

  // Future checkEmailVerified() async {
  //   await FirebaseAuth.instance.currentUser!.reload();

  //   setState(() {
  //     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  //   });

  //   if (isEmailVerified) timer?.cancel();
  // }

  // Future sendVerificationEmail() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     await user?.sendEmailVerification();

  //     setState(() => canResendEmail = false);
  //     await Future.delayed(Duration(seconds: 5));
  //     setState(() => canResendEmail = true);
  //   } catch (e) {
  //     Utils.showSnackBar(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Dump();
  }
}
//   Widget build(BuildContext context) => isEmailVerified
//       ? Dump()
//       : Scaffold(
//           body: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/sec-background.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             alignment: Alignment.center,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   //Text
//                   Column(
//                     children: [
//                       Text(
//                         'A verification Email has been sent to your email.',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                     ],
//                   ),

//                   //Resend Email Button
//                   FractionallySizedBox(
//                     widthFactor: 0.8,
//                     child: Container(
//                       margin: EdgeInsets.symmetric(vertical: 10),
//                       child: ElevatedButton.icon(
//                         onPressed:
//                             canResendEmail ? sendVerificationEmail : null,
//                         icon: Icon(
//                           FontAwesomeIcons.envelope,
//                           color: Colors.white,
//                         ),
//                         label: Text(
//                           'Resent Email',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 40),
//                           backgroundColor: kPrimaryColor,
//                         ),
//                       ),
//                     ),
//                   ),

//                   //back button
//                   TextButton(
//                     child: Text(
//                       'Cancel',
//                       style: TextStyle(
//                         color: kPrimaryColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     onPressed: () => FirebaseAuth.instance.signOut(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
// }
