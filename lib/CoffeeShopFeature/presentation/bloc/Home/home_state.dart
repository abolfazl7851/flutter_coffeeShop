part of 'home_bloc.dart';

class HomeState extends Equatable {

  HomeStatus status ;


  HomeState({required this.status});

  HomeState copyWith({
    HomeStatus? newHomeStatus,
  }){
    return HomeState(status: newHomeStatus ?? status) ;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status];

}