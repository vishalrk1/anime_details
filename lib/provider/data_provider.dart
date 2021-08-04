import 'package:anime_search/models/HomePage_model.dart';
import 'package:anime_search/models/Recomendation_data.dart';
import 'package:anime_search/models/anime_model.dart';
import 'package:anime_search/models/manga_model.dart';
import 'package:anime_search/models/news_model.dart';
import 'package:anime_search/models/shedule_anime_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  String errorMessage = '';
  List<HomeCardModel> searchList = [];
  List<ScheduleAnime> scheduleList = [];
  List<MangaModel> mangaList = [];
  List<RecomendationModel> recomendationList = [];
  List<NewsModel> newsList = [];
  late int genreId;
  late AnimeModel animeData = AnimeModel();
  late MangaModel mangaData = MangaModel();

  Future<void> getHomeData({String category = 'airing'}) async {
    final String url = 'https://api.jikan.moe/v3/top/anime/1/$category';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<HomeCardModel> tempData = [];
      List items = response.data['top'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
      print("HomeData:- ${searchList.length}");
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSearchData(String query) async {
    print(query);
    final String url =
        'https://api.jikan.moe/v3/search/anime?q=$query&page=1&limit=12';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<HomeCardModel> tempData = [];
      List items = response.data['results'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
      print("SearchBar:- ${searchList.length}");
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  //final String url = 'https://api.jikan.moe/v3/anime/$malId';
  Future<void> getAnimeData(int malId) async {
    final String url = 'https://api.jikan.moe/v3/anime/$malId';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      animeData = AnimeModel.fromJson(response.data);
      getRecomendationData(animeData.genreId);
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRecomendationData(int generId) async {
    final String url = 'https://api.jikan.moe/v3/genre/anime/$generId/1';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<RecomendationModel> tempList = [];
      List items = response.data['anime'];
      tempList = items
          .map((data) => RecomendationModel.formJson(data))
          .take(10)
          .toList();
      recomendationList = tempList;
      // for (var i = 0; i != recomendationList.length; i++) {
      //   print(recomendationList[i].title);
      // }
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMangaData({String category = 'manga'}) async {
    print(category);
    final String url = 'https://api.jikan.moe/v3/top/manga/1/$category';
    print(url);
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<MangaModel> tempData = [];
      List items = response.data['top'];
      print(items.length);
      tempData = items.map((data) => MangaModel.fromJson(data)).toList();
      mangaList = tempData;
      print("MangaData:- ${mangaList.length}");
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSelectedMangaData(int malId) async {
    final String url = 'https://api.jikan.moe/v3/manga/$malId';
    print(malId);
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      mangaData = MangaModel.fromJson(response.data);
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMangaSearchData(String query) async {
    print(query);
    final String url =
        'https://api.jikan.moe/v3/search/manga?q=$query&page=1&limit=12';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<MangaModel> tempData = [];
      List items = response.data['results'];
      print(items.length);
      tempData = items.map((data) => MangaModel.fromJson(data)).toList();
      mangaList = tempData;
      print("MangaData:- ${mangaList.length}");
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        print(errorMessage);
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  //schedule/monday
  Future<void> getScheduleData({String day = 'sunday'}) async {
    final String url = 'https://api.jikan.moe/v3/schedule/$day';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<ScheduleAnime> tempData = [];
      List items = response.data[day];
      print(items.length);
      tempData = items.map((data) => ScheduleAnime.fromJson(data)).toList();
      scheduleList = tempData;
      print("HomeData:- ${searchList.length}");
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getNewsData() async {
    final String url = 'https://api.jikan.moe/v3/anime/1/news';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<NewsModel> tempData = [];
      List items = response.data['articles'];
      tempData = items.map((data) => NewsModel.fromJson(data)).toList();
      newsList = tempData;
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
