import 'package:dio/dio.dart';
import 'package:test_in_action/app/dao/quiz/quiz.dart';
import 'package:test_in_action/app/dao/quiz/userLogin.dart';
import 'package:test_in_action/services/auth/auth_service.dart';

class QuizDao {
  static final dio = Dio();

  // static final url = "http://1.14.140.53:7777/quiz";
  static final url = "http://localhost:7777/quiz";

  static Future<List<Quiz>> list(String text) async {
    final response = await dio.get(
        '$url/list?keyword=$text&token=${AuthService.to.state.token.value}');
    List<Quiz> list =
        (response.data as List<dynamic>).map((e) => Quiz.fromJson(e)).toList();
    return list;
  }

  static Future<void> updateCount(num quizId, num remark) async {
    await dio.post(
        '$url/mark?quizId=$quizId&userId=${AuthService.to.state.userId.value}&remark=$remark&token=${AuthService.to.state.token.value}');
  }

  static Future<UserLogin> login(String username, String password) async {
    final response =
        await dio.post('$url/login?username=$username&password=$password');
    return UserLogin.fromJson(response.data);
  }
}
