import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_getx/base/base_repository.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:sample_app_getx/data/models/auth/login_model.dart';
import 'package:sample_app_getx/data/models/code_generate/code_generate_request.dart';
import 'package:sample_app_getx/data/models/code_generate/code_generate_response.dart';
import 'package:sample_app_getx/data/models/passcode_confirm/passcode_confirm_request.dart';
import 'package:sample_app_getx/data/models/passcode_confirm/passcode_confirm_response.dart';
import 'package:sample_app_getx/data/provider/api_client.dart';
import 'package:sample_app_getx/data/provider/response_handler.dart';
import 'package:sample_app_getx/data/provider/server_error.dart';

import '../../models/auth/user_request.dart';
import '../../models/auth/user_response.dart';
import '../../models/register/register_request.dart';
import '../../models/register/register_response.dart';
import '../../models/user/userme_response.dart';

class AuthRepository extends BaseRepository {
  ApiClient authClient = ApiClient.getInstanceAuth(baseUrl: Constants.authUrl);

  ApiClient client = ApiClient.getInstance(baseUrl: Constants.baseUrl);

  Future<ResponseHandler<AuthResponse>> _fetchAuth({
    required AuthRequest username,
  }) async {
    AuthResponse response;
    try {
      response = await authClient.postPhoneNumber(username);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> postPhoneNumber({required AuthRequest username}) async {
    final response = await _fetchAuth(
      username: username,
    );
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

///////

  Future<ResponseHandler<AuthResponse>> _fetchAuth2({
    required AuthRequest2 username,
  }) async {
    AuthResponse response;
    try {
      response = await client.postPhoneNumber2(username);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> postPhoneNumber2({required AuthRequest2 username}) async {
    final response = await _fetchAuth2(
      username: username,
    );
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

////////////////
  Future<ResponseHandler<GenerateResponse>> _fetchPassCodeGenerate({
    required GenerateRequest username,
  }) async {
    GenerateResponse response;
    try {
      response =
          await authClient.passCodeGenerate(username, Constants.platformId);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> passCodeGenerate({
    required GenerateRequest username,
  }) async {
    final response = await _fetchPassCodeGenerate(
      username: username,
    );
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

  ////////////////////////////////////////////////////

  Future<ResponseHandler<PasscodeConfirmResponse>> _fetchPassCodeConfirm({
    required PasscodeConfirmRequest passcode,
  }) async {
    PasscodeConfirmResponse response;
    try {
      response =
          await authClient.passCodeConfirm(passcode, Constants.platformId);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> passCodeConfirm({
    required PasscodeConfirmRequest passcode,
  }) async {
    final response = await _fetchPassCodeConfirm(
      passcode: passcode,
    );
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

  //////////////////

  Future<ResponseHandler<UserMeResponse>> _fetchUserMe({
    required String token,
  }) async {
    UserMeResponse response;
    try {
      response = await client.userMe("Bearer $token", Constants.platformId);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> userMe({
    required String authorization,
  }) async {
    final response = await _fetchUserMe(
      token: authorization,
    );
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

  // UserGenerate
  Future<ResponseHandler<RegisterResponse>> _fetchUserRegister(
      {required RegisterRequest userRegisterRequest}) async {
    RegisterResponse response;
    try {
      response = await authClient.userRegister(userRegisterRequest);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> userRegister(
      {required RegisterRequest userRegisterRequest}) async {
    final response =
        await _fetchUserRegister(userRegisterRequest: userRegisterRequest);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  /// Create User
  Future<ResponseHandler<UserResponse>> _fetchCreateUser(
      {required String? auth, required UserRequest userRequest}) async {
    UserResponse response;
    try {
      response =
          await client.createUser(Constants.platformId, auth!, userRequest);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> createUser(
      {required String? auth, required UserRequest userRequest}) async {
    final response =
        await _fetchCreateUser(auth: auth, userRequest: userRequest);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }
}
