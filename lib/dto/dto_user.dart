import 'package:slark/dto/dto_ws.dart';

class DtoUser {
  String username = '';
  String email = '';
  String id = '';
  List<DtoWS> workspaces = [];

  DtoUser() {
    print('In DTO USER');
    print(username);
    print(workspaces);
  }
}
