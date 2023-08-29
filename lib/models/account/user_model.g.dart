// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      sessionId: json['session_id'] as String?,
      requestToken: json['request_token'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'request_token': instance.requestToken,
      'username': instance.username,
    };
