import 'package:chomoi/app/types/notification/notification_enum.dart';

abstract class ParseNotificationUseCase {
  NotificationType? parseMap(Map<String, dynamic> data);
  String getUrl(Map<String, dynamic> data);
}

class ParseNotificationUseCaseImpl extends ParseNotificationUseCase {
  @override
  NotificationType? parseMap(Map<String, dynamic> data) {
    if ((data['url'] as String).isNotEmpty) {
      return NotificationType.ads;
    }
    return null;
  }

  @override
  String getUrl(Map<String, dynamic> data) {
    if ((data['url'] as String).isNotEmpty) {
      return data['url'];
    }
    return '';
  }
}
