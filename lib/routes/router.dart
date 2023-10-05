import '/resources/pages/profile_page.dart';
import '../resources/pages/auth/login_page.dart';
import '../resources/pages/auth/signup_page.dart';
import '../resources/pages/start/welcome_page.dart';
import '/resources/pages/feed_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.x/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      // Start routes
      router.route(WelcomePage.path, (context) => WelcomePage(),
          initialRoute: true);

      // Auth routes
      router.route(SignupPage.path, (context) => SignupPage());
      router.route(LoginPage.path, (context) => LoginPage());

      // Authenticated routes
      router.route(FeedPage.path, (context) => FeedPage());
      router.route(ProfilePage.path, (context) => ProfilePage());
    });
