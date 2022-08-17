class AppEndpoint {
  AppEndpoint._();
  static const String BASE = 'http://localhost:4000';

  static const String BASE_URL_DEV = 'http://192.168.1.203:3000/api';
  static const String BASE_URL_PROD = 'http://192.168.1.203:3000/api';

  static const String BASE_SOCKET = 'http://192.168.1.203:4000';

  static const String BASE_MEDIA = 'https://backendlessappcontent.com/2D866C83-7891-28FE-FF30-B43753E33600/90F5F65B-EA5B-45D0-A9A5-EE84A0880701/files';

  static const String TEST_API = 'https://jsonplaceholder.typicode.com/posts';
  static const String SEND_FCM_TOKEN = 'https://fcm.googleapis.com/fcm/send';

  static const int connectionTimeout = 1500;
  static const int receiveTimeout = 1500;
  static const String keyAuthorization = 'Authorization';

  static const int SUCCESS = 1;
  static const int FAILED = 0;
  static const int ERROR_TOKEN = 401;
  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;

  static const String UPLOAD_AVATAR = '/upload/avatar/';
  static const String UPLOAD_BACKGROUND = '/upload/background/';

  //Authentication
  static const String LOGIN_NORMAL = '/auth/loginNormal';
  static const String REGISTER = '/auth/register';
  static const String LOGIN_SOCIAL = '/auth/loginSocial';
  static const String AUTHORIZED = '/auth/authorized';

  //User
  static const String USER_GET_ALL = '/user/getAll';

  //Conversation
  static const String CONVERSATION_GET_ALL = '/conversation/getAll';
  static const String MESSAGE_GET_ALL = '/conversation/message';
}
