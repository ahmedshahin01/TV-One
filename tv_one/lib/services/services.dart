import 'package:tv_one/model/Cast.dart';
import 'package:tv_one/model/ImagesModel.dart';
import 'package:tv_one/model/epslodeModel.dart';
 
import 'package:tv_one/model/showmodel.dart';
import 'package:http/http.dart' as http;

class RemoteServices1 {
//thisfun fetch all shows data

  Future<List<ShowModel>?> fetchshow(num) async {
    final url = Uri.parse('https://api.tvmaze.com/shows?page=${num}');
    await http.get(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return showModelFromJson(jsonData);
      //return allshowModelFromJson(jsonData);
    } else {
      return null;
    }
  }

//thisfun fetch cast data
  Future<List<CastModel>?> fetchCast(id) async {
    final url = Uri.parse('https://api.tvmaze.com/shows/${id}/cast');
    await http.get(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return castModelFromJson(jsonData);
    } else {
      return null;
    }
  }

//thisfun fetch Show Images

  Future<List<ShowImageModel>?> fetchImages(id) async {
    final url = Uri.parse('https://api.tvmaze.com/shows/${id}/images');
    await http.get(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return showImageModelFromJson(jsonData);
    } else {
      return null;
    }
  }
//thisfun fetch Show search

  Future<ShowModel?> fetchSearch(str) async {
    final url = Uri.parse('https://api.tvmaze.com/singlesearch/shows?q=${str}');
    await http.get(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return oneShowModelFromJson(jsonData);
    } else {
      return null;
    }
  }
//thisfun fetch Show epsilodes

  Future<List<EpisodesModel>?> fetchEpislode(id) async {
    final url = Uri.parse('https://api.tvmaze.com/shows/${id}/episodes');
    await http.get(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return episodesFromJson(jsonData);
    } else {
      return null;
    }
  }

  /* Future<List<ShowModel>?>fetchDayShows()async{

    final url=Uri.parse('https://api.tvmaze.com/shows?date=2022-03-16');
    await http.get(url);
    http.Response response=await http.get(url);
    if (response.statusCode==200) {
      var jsonData=response.body;
      return allshowModelFromJson(jsonData);
      
    } else {
      return null;
    }

  }*/
}
