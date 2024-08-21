
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';

class InputConverter{

	Either<Failure, double> stringToDouble(String str){
		try{
			final result = double.parse(str);
			if(result <= 0) throw const FormatException();
			return Right(result);
		} on FormatException {
			return Left(InvalidInput());
	}
}
}


class InvalidInput extends Failure{}
