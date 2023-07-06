import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:precio_medio_paraguay/app/core/services/snackbar_manager/snackbar_manager.dart';

abstract class AppMessager {
  Future<void> welcomeMessage();
  Future<void> sendMessage({required String phone, required String message});
}

class SystemWhatsappMessage implements AppMessager {
  @override
  Future<void> sendMessage(
      {required String phone, required String message}) async {
    ///final myMessages = message.replaceAll('', '');

    final myMessage = '*ProMedio Paraguay*\n\n$message';

    try {
      final urlCallMeBot =
          'https://api.callmebot.com/whatsapp.php?phone=554599247838&text=$myMessage&apikey=8242887';

      await http.post(Uri.parse(urlCallMeBot));
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
    }
  }

  @override
  Future<void> welcomeMessage() async {
    const myMessage =
        '''*ProMedio Paraguay*\n\nSeja Bem-vindo!\n\nAgradecemos seu interesse em contribuir conosco para a democratização dos Preços no Paraguay. Esperamos facilitar a vida de todos que buscam economia! Esperamos seus informes!\n\nAnote nosso número em sua agenda. Enviaremos sempre que necessário algumas informações por aqui. \n\nEquipe DevPY''';
    try {
      const urlCallMeBot =
          'https://api.callmebot.com/whatsapp.php?phone=554599247838&text=$myMessage&apikey=8242887';

      await http.post(Uri.parse(urlCallMeBot));
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      SnackBarManager().showSuccess(message: 'Mensagem Enviada!');
    }
  }
}

class WhatsAppMessage implements AppMessager {
  @override
  Future<void> sendMessage(
      {required String phone, required String message}) async {
    var whatsappUrl = "https://wa.me/$phone?text=$message";

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Future<void> welcomeMessage() {
    throw UnimplementedError();
  }
}
