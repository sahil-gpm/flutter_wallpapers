import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/home/ui/home_view.dart';
import 'package:flutter_wallpapers/splash/widgets/splash_widgets.dart';
import 'package:flutter_wallpapers/global_widgets/button_widget.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //the animating line widget
                const LineWidget(),

                const SizedBox(
                  height: 30,
                ),

                //stack widget to show the image and text stack
                const StackWidget(),

                //Button and the most important message

                const SizedBox(
                  height: 50,
                ),

                //Button widget for the navigation button
                ButtonWidget(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .9,
                  text: 'Start exploring',
                  backgroundColor: Colors.black,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()));
                  }, textColorSignal: 1,
                ),

                const SizedBox(
                  height: 20,
                ),

                const Center(child: Text("@flutterwallpapers"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
