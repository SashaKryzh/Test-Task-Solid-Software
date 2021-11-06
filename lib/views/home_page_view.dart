import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_task_solid_software/view_models/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageViewModel(),
      builder: (context, _) {
        Widget content() {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            color: Color(
                Provider.of<HomePageViewModel>(context).getBackgroundColor),
            child: Center(
              child: Text(
                'Hey there',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 28,
                      color: Provider.of<HomePageViewModel>(context)
                                  .getForegroundBrightness ==
                              Brightness.dark
                          ? Colors.black
                          : Colors.white,
                    ),
              ),
            ),
          );
        }

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value:
              Provider.of<HomePageViewModel>(context).getForegroundBrightness ==
                      Brightness.dark
                  ? SystemUiOverlayStyle.dark
                  : SystemUiOverlayStyle.light,
          child: Scaffold(
            body: GestureDetector(
              child: content(),
              onTap: Provider.of<HomePageViewModel>(context, listen: false)
                  .onTapAnywhere,
            ),
          ),
        );
      },
    );
  }
}
