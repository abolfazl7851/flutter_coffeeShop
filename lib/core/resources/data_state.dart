
abstract class DataState<T>{
  final T? data ;
  final List<String>? errors;

  DataState(this.data, this.errors);
}

class DataSuccess<T> extends DataState<T> {

   DataSuccess(T? data) : super(data,null) ;
}


class DataFailed<T> extends DataState<T> {
  DataFailed(List<String> errors,) : super(null,errors) ;
}
