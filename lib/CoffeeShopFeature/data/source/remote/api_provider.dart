
import 'package:coffee_shop/Constants/constants.dart';
import 'package:dio/dio.dart';


class ApiProvider {
  final Dio _dio = Dio();

  // var apiKey = Constants.apiKeys1;


  Future<dynamic> CallSignUp(userModel) async {

    var response = await _dio.post('${Constants.baseUrl}/register',
        queryParameters: {'name': userModel.name,'username': userModel.username,'email': userModel.email, 'password': userModel.password, 'c_password': userModel.password});

    // print(response.toString()) ;

    // userModel = UserModel.fromJson(response.data) ;
    return response;
  }


  Future<dynamic> CallGetAllCoffees() async {

    var response = await _dio.get('${Constants.baseUrl}/allCoffees');
    // print(response.toString()) ;

    return response;
  }



}