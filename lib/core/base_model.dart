abstract class BaseModel {
  Map<String, dynamic>? toJson();
  BaseModel fromJson(Map<String, dynamic> json);
  const BaseModel();
  //printError(Object error, String errorFunction);
}