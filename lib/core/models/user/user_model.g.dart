// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      active: json['active'] as bool?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      changed: json['changed'] == null
          ? null
          : DateTime.parse(json['changed'] as String),
      createdby: json['createdby'] as String?,
      changedby: json['changedby'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: json['tags'] as String?,
      version: json['version'] as int?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'active': instance.active,
      'created': instance.created?.toIso8601String(),
      'changed': instance.changed?.toIso8601String(),
      'createdby': instance.createdby,
      'changedby': instance.changedby,
      'keywords': instance.keywords,
      'tags': instance.tags,
      'version': instance.version,
    };
