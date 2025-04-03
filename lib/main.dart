import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_work/db_work/db_work.dart';
import 'package:today_work/pages/no_network/no_network_binding.dart';
import 'package:today_work/pages/no_network/no_network_view.dart';
import 'package:today_work/pages/work_add/work_add_binding.dart';
import 'package:today_work/pages/work_add/work_add_view.dart';
import 'package:today_work/pages/work_edit/work_edit_binding.dart';
import 'package:today_work/pages/work_edit/work_edit_view.dart';
import 'package:today_work/pages/work_first/work_first_binding.dart';
import 'package:today_work/pages/work_first/work_first_view.dart';
import 'package:today_work/pages/work_first/work_list.dart';
import 'package:today_work/pages/work_records/work_records_binding.dart';
import 'package:today_work/pages/work_records/work_records_view.dart';
import 'package:today_work/pages/work_second/work_second_binding.dart';
import 'package:today_work/pages/work_second/work_second_view.dart';
import 'package:today_work/pages/work_tab/work_tab_binding.dart';
import 'package:today_work/pages/work_tab/work_tab_view.dart';

Color primaryColor = const Color(0xff13c79a);
Color bgColor = const Color(0xfff7f7f7);
List<String> itemTitles = ['Day','Week','Month','Year'];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBWork().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Notes,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Notes = [
  GetPage(name:'/', page: () => const WorkEditView(), binding: WorkEditBinding()),
  GetPage(name:'/workTab', page: () => const WorkTabPage(), binding: WorkTabBinding()),
  GetPage(name: '/workFirst', page: () => const WorkFirstPage(), binding: WorkFirstBinding()),
  GetPage(name: '/workSecond', page: () => WorkSecondPage(), binding: WorkSecondBinding()),
  GetPage(name: '/workList', page: () => const WorkList()),
  GetPage(name: '/workRecords', page: () => WorkRecordsPage(), binding: WorkRecordsBinding()),
  GetPage(name: '/workAdd', page: () => WorkAddPage(), binding: WorkAddBinding()),
  GetPage(name: '/no', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
];