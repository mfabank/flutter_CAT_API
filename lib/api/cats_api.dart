import 'network.dart';

const String apiKey = 'DEMO-API-KEY';
const String catApiURL = 'https://api.thecatapi.com/v1/breeds?';
const String catImageApiURL = 'https://api.thecatapi.com/v1/images/search?';
const String breedString = 'breed_id=';
const String apiKeyString = 'x-api-key = $apiKey';


class CatAPI {
  Future <dynamic> getCatBreeds() async {
    Network network = Network('$catApiURL$apiKeyString');
    var catData = await network.getData();
    return catData;
  }

  Future <dynamic> getCatBreed(String breedName) async{
    Network network = Network("$catImageApiURL$breedString$breedName&$apiKeyString");
    var catData = await network.getData();
    return catData;
  }
}