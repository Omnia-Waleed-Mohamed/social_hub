// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(id) => "Album #${id}";

  static String m1(userId) => "User #${userId}";

  static String m2(postId) => "Post #${postId}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "albumNumber": m0,
        "albumOwner": m1,
        "albums": MessageLookupByLibrary.simpleMessage("Albums"),
        "albumsLoadError": MessageLookupByLibrary.simpleMessage(
            "Unable to load albums. Please try again."),
        "albumsSubtitle": MessageLookupByLibrary.simpleMessage(
            "Discover photo collections shared by the community."),
        "albumsTitle": MessageLookupByLibrary.simpleMessage("Explore Albums"),
        "createPost": MessageLookupByLibrary.simpleMessage("Create post"),
        "createPostComingSoon": MessageLookupByLibrary.simpleMessage(
            "Create post feature is coming soon."),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "homeGreeting":
            MessageLookupByLibrary.simpleMessage("Good Morning! 👋"),
        "homeSubtitle": MessageLookupByLibrary.simpleMessage(
            "Explore what\'s new in your community"),
        "invalidCredentials": MessageLookupByLibrary.simpleMessage(
            "Invalid username or password"),
        "loginSubtitle":
            MessageLookupByLibrary.simpleMessage("Sign in to continue"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("Welcome Back!"),
        "networkError": MessageLookupByLibrary.simpleMessage(
            "Please check your internet connection"),
        "noAlbums":
            MessageLookupByLibrary.simpleMessage("No albums available."),
        "noAlbumsFound": MessageLookupByLibrary.simpleMessage(
            "No albums match your search."),
        "noInternet": MessageLookupByLibrary.simpleMessage(
            "No internet connection. Please check your Wi‑Fi or mobile data and try again."),
        "noPosts": MessageLookupByLibrary.simpleMessage(
            "No posts available right now."),
        "noUsers": MessageLookupByLibrary.simpleMessage("No users available."),
        "noUsersFound":
            MessageLookupByLibrary.simpleMessage("No users match your search."),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordHint":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "passwordRequired":
            MessageLookupByLibrary.simpleMessage("Please enter your password"),
        "postNumber": m2,
        "postsLoadError": MessageLookupByLibrary.simpleMessage(
            "Something went wrong while loading posts. Please try again."),
        "postsTitle": MessageLookupByLibrary.simpleMessage("Recent Posts"),
        "retry": MessageLookupByLibrary.simpleMessage("Try Again"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "searchAlbums":
            MessageLookupByLibrary.simpleMessage("Search albums by title"),
        "searchUsers": MessageLookupByLibrary.simpleMessage(
            "Search by name, username or email"),
        "serverError": MessageLookupByLibrary.simpleMessage(
            "Server error. Please try again later"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "social": MessageLookupByLibrary.simpleMessage("SocialHub"),
        "sslHandshake": MessageLookupByLibrary.simpleMessage(
            "SSL connection problem. The network or certificate is blocking secure access."),
        "timeout": MessageLookupByLibrary.simpleMessage(
            "Request timed out. Please check your internet connection and try again."),
        "todos": MessageLookupByLibrary.simpleMessage("Todos"),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "Something went wrong. Please try again"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "usernameHint":
            MessageLookupByLibrary.simpleMessage("Enter your username"),
        "usernameRequired":
            MessageLookupByLibrary.simpleMessage("Please enter your username"),
        "users": MessageLookupByLibrary.simpleMessage("Users"),
        "usersLoadError": MessageLookupByLibrary.simpleMessage(
            "Unable to load users. Please try again."),
        "usersSubtitle": MessageLookupByLibrary.simpleMessage(
            "Connect with people in your community."),
        "usersTitle": MessageLookupByLibrary.simpleMessage("Discover People")
      };
}
