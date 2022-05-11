// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

class OptionsModel {
  String? option;

  OptionsModel({this.option});

  setSelected(String value) {
    option = '';
    option = value;
  }
}
