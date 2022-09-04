import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';


@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? email,
    String? password,
    bool? active,
    DateTime? created,
    DateTime? changed,
    String? createdby,
    String? changedby,
    List<String>? keywords,
    String? tags,
    int? version,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
