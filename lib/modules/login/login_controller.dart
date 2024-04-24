import 'dart:async';
import 'dart:convert';

import 'package:all_events_task/modules/home/home_binding.dart';
import 'package:all_events_task/modules/home/home_view.dart';
import 'package:all_events_task/shared/constant/storage_constatnt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final prefs = Get.find<SharedPreferences>();
  RxBool isLoading = false.obs;

//Google login method
  Future<User?> signInWithGoogle({required BuildContext context}) async {
    isLoading.value = true;
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      isLoading.value = false;
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
        await prefs.setString(StorageConstants.userData, user.toString());
        await prefs.setBool(StorageConstants.isLogin, true);
        Get.off(const HomeView(),
            binding: HomeBinding(), transition: Transition.fadeIn);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Fluttertoast.showToast(
              msg: 'The account already exists with a different credential');
        } else if (e.code == 'invalid-credential') {
          Fluttertoast.showToast(
              msg: 'Error occurred while accessing credentials. Try again.');
        }
      } catch (e) {
        Fluttertoast.showToast(
            msg: 'Error occurred using Google Sign In. Try again.');
      }
    }

    return user;
  }
}
