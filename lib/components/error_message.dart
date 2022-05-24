import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class ErrorMessageCard extends StatelessWidget {
  final String errorMessage;
  const ErrorMessageCard({Key? key, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkGiffyDialog(
      onlyOkButton: true,
      onOkButtonPressed: () {
        Navigator.of(context).pop();
      },
      image: _getGifError(errorMessage),
      title: Text(
        errorMessage,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Image _getGifError(String errorMessage) {
    if (_gifErrors.containsKey(errorMessage)) {
      return _gifErrors[errorMessage]!;
    }

    // Unknown error gif
    return Image.asset('images/unknown.gif');
  }

  static final Map<String, Image> _gifErrors = {
    'Bad request': Image.asset('images/bad_request.gif'),
    'Not found': Image.asset('images/404.gif'),
    'request timeout': Image.asset('images/timeout.gif'),
    'Internal server error': Image.asset('images/internal.gif'),
  };
}
