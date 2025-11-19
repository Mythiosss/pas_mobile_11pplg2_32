import 'dart:convert';

RegisterApi registerApiFromJson(String str) => RegisterApi.fromJson(json.decode(str));

String registerApiToJson(RegisterApi data) => json.encode(data.toJson());

class RegisterApi {
    bool status;
    String message;

    RegisterApi({
        required this.status,
        required this.message,
    });

    factory RegisterApi.fromJson(Map<String, dynamic> json) => RegisterApi(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}