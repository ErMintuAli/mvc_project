import 'package:flutter/material.dart';
import 'package:mvc_project/Model/Into/intro_model.dart';
import 'package:mvc_project/News/news_api_controller.dart';
import 'package:mvc_project/View/Colors/colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final ArticalController _cotroller = ArticalController();
  late List<IntroModel> articales;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articales = _cotroller.getArtical();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(child: Text("Listing",style: TextStyle(color: AppColors.titleColor),)),
      ),
      drawer: Drawer(),
      body: ListView.builder(
        itemCount: articales.length,
        itemBuilder: (context,index){
          final artical = articales[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(artical.imgUrl,
                width: 120,
                height: 120,),

              ),
              title: Text(artical.title),
              subtitle: Column(
                children: [
                  Text(artical.subTitle),
                  Text(artical.description),

                ],
              )

            ),
          );
        }
          ),
    );
  }
}
