import 'package:flutter/material.dart';

enum DrawerItem {
  home("Ekran główny", Icons.home_rounded),
  clients("Klienci", Icons.person),
  patients("Pacjenci", Icons.donut_small_sharp),
  calendar("Kalendarz", Icons.calendar_month),

  logout("Wyloguj", Icons.logout),
  ;

  final String name;
  final IconData icon;
  const DrawerItem(this.name, this.icon);

  static List<DrawerItem> get drawerItems =>
      [home, clients, patients, calendar];
}
