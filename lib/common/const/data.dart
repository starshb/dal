import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

final storage = FlutterSecureStorage();

//localhost
final emulatorIp = '10.0.2.2:3000';
final simulatorIp = '127.0.0.1:3000';

//Platform은 반드시 dart.io에서 불러올 것
final ip = Platform.isIOS ? simulatorIp : emulatorIp;
//[client] Supabase instance의 client
final client = Supabase.instance.client;
