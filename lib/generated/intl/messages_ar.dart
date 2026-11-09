// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "invalidCredentials": MessageLookupByLibrary.simpleMessage(
            "اسم المستخدم أو كلمة المرور غير صحيحة"),
        "loginSubtitle": MessageLookupByLibrary.simpleMessage(
            "سجّل الدخول للتواصل مع مجتمعك."),
        "loginTitle": MessageLookupByLibrary.simpleMessage("مرحبًا بعودتك!"),
        "networkError": MessageLookupByLibrary.simpleMessage(
            "يرجى التحقق من اتصالك بالإنترنت"),
        "noInternet": MessageLookupByLibrary.simpleMessage(
            "لا يوجد اتصال بالإنترنت. يرجى التحقق من شبكة Wi‑Fi أو البيانات المتنقلة ثم المحاولة مرة أخرى."),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "passwordHint":
            MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور"),
        "passwordRequired":
            MessageLookupByLibrary.simpleMessage("من فضلك أدخل كلمة المرور"),
        "serverError": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ في الخادم. حاول مرة أخرى لاحقًا"),
        "signIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "sslHandshake": MessageLookupByLibrary.simpleMessage(
            "مشكلة في اتصال SSL. غالبًا بسبب شبكة أو شهادة تمنع الاتصال الآمن."),
        "timeout": MessageLookupByLibrary.simpleMessage(
            "انتهت مهلة الطلب. يرجى التحقق من اتصالك بالإنترنت ثم المحاولة مرة أخرى."),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ غير متوقع. حاول مرة أخرى"),
        "username": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
        "usernameHint":
            MessageLookupByLibrary.simpleMessage("أدخل اسم المستخدم"),
        "usernameRequired":
            MessageLookupByLibrary.simpleMessage("من فضلك أدخل اسم المستخدم")
      };
}
