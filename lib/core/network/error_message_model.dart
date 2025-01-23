import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int status;
  final String errorMessage;

  const ErrorMessageModel({
    required this.status,
    required this.errorMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      status: json["status"],
      errorMessage: json["ErrorMessage"],
    );
  }

  @override
  List<Object?> get props => [
    status,
    errorMessage,
  ];
}