import 'package:gitstaredrepogetter/core/constants/app_urls.dart';
import 'package:gitstaredrepogetter/core/environment/envirionment_config.dart';
import 'package:gitstaredrepogetter/core/service.dart/api_service.dart';
import 'package:gitstaredrepogetter/layers/data/dto/home/repository_response_dto.dart';

class HomeGitRepoSourceNetwork extends ApiService {
  
  Future<List<RepositoryResponseDto>> getRepositoryByKeyword(
      {required Map<String, dynamic> query}) async {
  
    final url = EnvironmentConfig.baseUrl + AppUrls.gitRepository;
  
    final response = await get(url, query: query);
  
    List<RepositoryResponseDto> repos = [];

    for (var element in (response.data['items'] as List)) {
      repos.add(RepositoryResponseDto.fromJson(element));
    }
    return repos;
  }
}
