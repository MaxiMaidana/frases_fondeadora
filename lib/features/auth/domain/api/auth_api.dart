import 'package:dio/dio.dart';

import '../../../../data/datasource/dio_data_source.dart';
import '../../../../data/repository/auth_repository.dart';
import '../usercases/sign_in.dart';

class AuthApi {
  ///Metodo para iniciar sesion
  ///
  ///Utilizo asi de esta manera, ya que es correcto pasar en la capa de dominio
  ///la url que se esta llamando ni el repositorio
  ///
  ///De esta manera todo lo que tiene que ver con los llamados queda encapsulado en esta capa.
  Future<bool> signIn({required String email, required String pass}) async {
    final repository = AuthRepository(
      dataSource: DioDataSource(
        client: Dio(),
        url: '',
      ),
    );
    bool res = await SignIn(authRepository: repository)
        .sigin(email: email, pass: pass);
    return res;
  }
}
