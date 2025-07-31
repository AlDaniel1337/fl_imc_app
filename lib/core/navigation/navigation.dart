import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_app/presentation/home/home.page.dart';
import 'package:imc_app/presentation/result/result.page.dart';

class Navigation{

  // Ruta principal
  static const String home = HomePage.route;
  static const String result = ResultPage.route;
  
  /// Listado con las rutas de la app
  static List<GetPage> getRoutes(){    
    List<GetPage> pages = [
      GetPage(name: home, page:() => const HomePage()),
      GetPage(name: result, page:() => const ResultPage()),
    ];
    
    return pages;
  } 

  static goToPage({required String page}) => Get.toNamed(page);
  static goBack({required BuildContext context}) => Navigator.of(context).pop(true);

}