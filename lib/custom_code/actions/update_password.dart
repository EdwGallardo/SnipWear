// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:convert';

Future<bool> updatePassword(String newPassword, String repeatedPassword) async {
  // Add your function code here!
  if (newPassword == repeatedPassword) {
    final response = await SupaFlow.client.auth.updateUser(
      UserAttributes(password: newPassword),
    );

    if (response.user != null) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}
