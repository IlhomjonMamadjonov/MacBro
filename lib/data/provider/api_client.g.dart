// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.client.macbro.uz/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BannersResponse> getBanners(limit, lang) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'limit': limit, r'lang': lang};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BannersResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'banner',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BannersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductsResponse> getFeaturedProducts(lang) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'featured-list/rasprodazha',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CategoryResponse> getCategoryWithProduct(lang) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'category',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResponseProductResponse> getProductVariants(
      active, lang, categoryId, limit, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'active': active,
      r'lang': lang,
      r'category': categoryId,
      r'limit': limit,
      r'page': page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseProductResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/product-variant',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductsResponsee> getProductSearch(search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'search': search};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductsResponsee>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'product',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductsResponsee.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResponseLimitedProducts> getLimitedProducts(
      categoryId, lang, limit, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'category': categoryId,
      r'lang': lang,
      r'limit': limit,
      r'page': page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseLimitedProducts>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'product',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseLimitedProducts.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthResponse> postPhoneNumber(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/exists',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthResponse> postPhoneNumber2(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/exists',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GenerateResponse> passCodeGenerate(username, platformId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'platform-id': platformId};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(username.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenerateResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'auth/passcode/generate',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenerateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PasscodeConfirmResponse> passCodeConfirm(passcode, platformId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'platform-id': platformId};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(passcode.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PasscodeConfirmResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'auth/passcode/confirm',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PasscodeConfirmResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegistrResponse> userregister(clientTypeId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(clientTypeId.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegistrResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'auth/user/register',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegistrResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserMeResponse> userMe(authorization, platformId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'platform-id': platformId
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserMeResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/me',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserMeResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
