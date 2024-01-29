import 'package:flutter/material.dart';
import 'package:shop/ApiData/sharePrefrences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EnterPage extends StatefulWidget {

  const EnterPage({Key? key}) : super(key: key);

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {

  final PageController pageController = PageController();
   int CurrentPage = 0;

  List<Widget> pages = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Image.asset(
              "images/-متجر-إلكتروني-من-الصفر-e1661346539687.jpg",
              fit: BoxFit.fill,
              height: 300,
              width: 400,
            )),
        const SizedBox(
          height: 30,
        ),
        const Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enjoy free shipping on all orders",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                " Hot discounts",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Image.asset(
              "images/5620.jpg_wh860.jpg",
              fit: BoxFit.fill,
              height: 300,
              width: 400,
            )),
        const SizedBox(
          height: 30,
        ),
        const Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Start your shopping adventure today!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                " Free shipping",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Image.asset(
              "images/images.png",
              fit: BoxFit.fill,
              height: 300,
              width: 400,
            )),
        const Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Get the most out of your shopping experience ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                " Shop by category",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      CurrentPage = value;
                    });
                  },
                  controller: pageController,
                  itemBuilder: (context, i) {
                    return pages[CurrentPage];
                  },
                  itemCount: pages.length,
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: pages.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.deepOrange,
                      dotColor: Colors.yellow,
                      dotHeight: 15,
                      dotWidth: 15,
                      spacing: 10,
                      expansionFactor: 5,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (CurrentPage == pages.length - 1) {
                        SharedPreferencesHelper
                            .getData(key: "key")
                            .then((value) {
                          if (value == true) {
                            Navigator.of(context)
                                .pushReplacementNamed("Home_Page");
                          } else {
                            Navigator.of(context).pushReplacementNamed("LogIn");
                          }
                        }).catchError((error) {});
                      }
                      pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    },
                    child: const Icon(Icons.arrow_forward),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
