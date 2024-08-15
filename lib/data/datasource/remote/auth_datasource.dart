// import 'package:dartz/dartz.dart';
// import 'package:itlala/core/errors/exceptions.dart';
// import 'package:itlala/core/errors/failurmodel.dart';
// import 'package:itlala/core/network/api_const.dart';
// import 'package:itlala/core/network/api_helper.dart';
// import 'package:itlala/data/model/auth_model.dart';
// import 'package:itlala/domain/enitites/auth.dart';

// abstract class BaseRemoteDataSource {
//  Future<Either<Failu, AuthBaseModel>> login(String email, String password);
//  Future<Either<Failu, AuthBaseModel>> register(String email,
//   String password,
//   String phone,
//   String name,
//   );
// }

// class AuthRemoteDatasource extends BaseRemoteDataSource {
//   @override
// Future<Either<Failu, AuthBaseModel>> login(String email, String password) async {
//     final data = {
//       'email': email,
//       'password': password,
//     };

//     final response = await ApiHelper.postData(
//       path: ApiConst.login,
//       data: data,
//     );

//     if (response.status == 200) {
//       return AuthModel.fromJson(response.data);
//     } else {
//       throw ExceptionsServer(errorEx: ErrorEx.fromJson(response.data));
//     }
//   }
  
//   @override
//   Future<Either<Failu, AuthBaseModel>> register(String email, String password, String phone, String name) async  {
//      final data = {
//       'email': email,
//       'password': password,
//       'phone': phone,
//       'name': name,
//     };

//     final response = await ApiHelper.postData(
//       path: ApiConst.login,
//       data: data,
//     );

//     if (response.status == 200) {
//       return AuthModel.fromJson(response.data);
//     } else {
//       throw ExceptionsServer(errorEx: ErrorEx.fromJson(response.data));
//     }
//   }
// }
