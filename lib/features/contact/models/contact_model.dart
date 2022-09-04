import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    String? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? notes,
    dynamic images,
    String? dummy,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

}
