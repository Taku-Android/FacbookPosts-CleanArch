import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

  final String errMessage ;

  Failure(this.errMessage);
}

class ServerError extends Failure {
  ServerError(super.errMessage);

  factory ServerError.fromDioError(DioException exception){

    switch(exception.type){
      case DioExceptionType.connectionTimeout:
        return ServerError('Connection time out');
      case DioExceptionType.sendTimeout:
        return ServerError('Send time out');

      case DioExceptionType.receiveTimeout:
        return ServerError('Receive time out');

      case DioExceptionType.badCertificate:
        return ServerError('Bad certificate');

      case DioExceptionType.badResponse:
      return ServerError.fromResponse(exception.response!.statusCode!, exception.response!.data);
      case DioExceptionType.cancel:
        return ServerError('Request canceled');

      case DioExceptionType.connectionError:
        return ServerError('Please check your internet connection');

      case DioExceptionType.unknown:
        return ServerError('Please check your internet connection');
      default:
        return ServerError('Oops there was an Error  , Please try again or contact with us!');
    }

    }


    factory ServerError.fromResponse(int statusCode , dynamic response){

    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
      // handle the error you get from api

      return ServerError(response['error']['message']);

    }else if (statusCode == 404){
      return ServerError('Request not found , Please try again later!');
    }else if (statusCode == 500){
      return ServerError('Internal server error , Please try again later!');
    }else{
      return ServerError('Oops there was an Error  , Please try again or contact with us!');
    }

    }

  @override
  List<Object?> get props => [];

}

class CashError extends Failure{

  CashError(super.errMessage);

  @override
  List<Object?> get props => [];

}