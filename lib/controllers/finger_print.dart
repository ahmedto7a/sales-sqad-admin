
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:equatable/equatable.dart';

import '../views/home_screen.dart';



class FingerAuthController extends GetxController {
  final _localAuth = LocalAuthentication();
  final _authenticationStateStream = AuthenticationState().obs;
  final _biometricSupportedStream = false.obs;
  final _isAuthenticated = false.obs;
  String errorMessage = '';

  AuthenticationState get authState => _authenticationStateStream.value;
  bool get isBiometricsSupported => _biometricSupportedStream.value;
  bool get isAuthenticated => _isAuthenticated.value;


  @override
  void onInit() {
    _checkIfBiometricsSupported();
    signInWithBiometrics();
    _authenticationStateStream.value = UnAuthenticated();
    super.onInit();
  }

  Future<void> signInWithBiometrics() async {
    try {
      var isAuthenticated = await _localAuth.authenticate(

        localizedReason: ' Authenticate to take attendance',
          options:  AuthenticationOptions(biometricOnly: true,stickyAuth: true, useErrorDialogs: true,)
      );

      if (isAuthenticated) {
        _authenticationStateStream.value = Authenticated();


        Get.offAll(HomeScreen());
      } else {
        _authenticationStateStream.value = UnAuthenticated();
      }
    } on PlatformException catch (e) {
      // display this error if you want
      print(e.message);
    }
  }

  // Future<void> SignInBiom () async {
  //   if()
  //
  // }

  void signOut() {
    _authenticationStateStream.value = UnAuthenticated();
  }

  void _checkIfBiometricsSupported() async {
    _biometricSupportedStream.value = await _localAuth.isDeviceSupported();
    print("BIOmetric CHeked${_biometricSupportedStream.value = await _localAuth.isDeviceSupported()}");
  }
}

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
}
