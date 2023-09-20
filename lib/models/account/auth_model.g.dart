// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthModel _$$_AuthModelFromJson(Map<String, dynamic> json) => _$_AuthModel(
      sessionId: json['session_id'] as String?,
      requestToken: json['request_token'] as String?,
      accountId: json['account_id'] as int?,
    );

Map<String, dynamic> _$$_AuthModelToJson(_$_AuthModel instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'request_token': instance.requestToken,
      'account_id': instance.accountId,
    };
