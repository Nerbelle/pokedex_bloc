import 'package:pokedex_bloc/utiities/constants.dart';

extension StringExt on String {
  String getImageUrl({String? id}) => imageURL.replaceAll(indexReplace, id ?? split('/')[6]);

  String get getId => split('/')[6];

  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}
