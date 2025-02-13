
import '../../../usecase/use_case.dart';
import '../repository/getAllCoffees_repository.dart';

class GetAllCoffeesUseCase extends UseCase{
  final GetAllCoffeesRepository getAllCoffeesRepository ;


  GetAllCoffeesUseCase(this.getAllCoffeesRepository);

  @override
  Future call(params) {

    return getAllCoffeesRepository.fetchAllCoffees();
  }

}