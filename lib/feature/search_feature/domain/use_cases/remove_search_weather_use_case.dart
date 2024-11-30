import 'package:injectable/injectable.dart';
import 'package:task_tm_app/core/shared_use_case/shared_use_case.dart';
import 'package:task_tm_app/feature/search_feature/domain/repositories/search_repo.dart';

@lazySingleton
class RemoveSearchWeatherUseCase implements SharedUseCase<bool, int> {
  final SearchRepository searchRepository;
  RemoveSearchWeatherUseCase(this.searchRepository);
  @override
  call(int params) {
    return searchRepository.removeSearch(weatherId: params);
  }
}
