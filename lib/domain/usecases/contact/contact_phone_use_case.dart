import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/app/util/phone_extension.dart';
import 'package:chomoi/app/util/url_launcher.dart';

class ContactPhoneUseCase extends ParamUseCase<bool, String> {
  @override
  Future<bool> call(String params) {
    return UrlLauncher.callToPhone(params.trimExtraCharactersInPhoneNumber);
  }
}
