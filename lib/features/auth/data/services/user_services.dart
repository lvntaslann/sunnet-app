import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  Map<String, dynamic>? _userData;
  Map<String, dynamic>? get userData => _userData;
  User? get user => _user;
  Future<User?> signUpWithEmail({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'surname': surname,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });
        return user;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("Firebase Hatası: ${e.message}");
    } catch (e) {
      debugPrint("Bilinmeyen Hata: $e");
    }
    return null;
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
  }

  Future<Map<String, dynamic>?> fetchUserData() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        DocumentSnapshot doc = await _firestore
            .collection('users')
            .doc(currentUser.uid)
            .get();
        if (doc.exists) {
          return doc.data() as Map<String, dynamic>;
        }
      }
    } catch (e) {
      print("Kullanıcı verileri alınırken hata oluştu: $e");
    }
    return null;
  }

  Future<void> loadUserData() async {
    _userData = await fetchUserData();
  }
}
