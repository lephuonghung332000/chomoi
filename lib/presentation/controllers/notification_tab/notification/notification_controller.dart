import 'package:get/get.dart';

class NotificationController extends GetxController {
  final _notifications = NotificationsService.get.notifications;

  List<UserNotificationResponseModel> get notifications =>
      _notifications.toList();

  final _state = NotificationsService.get.state.value.obs;

  NotificationsScreenState get state => _state.value;

  final ParseNotificationUseCase parseNotificationUseCase;
  final MarkNotificationAsReadUseCase markNotificationAsReadUseCase;

  NotificationsController({
    required this.parseNotificationUseCase,
    required this.markNotificationAsReadUseCase,
  });

  Worker? _stateTracker;
  Worker? _notificationsTracker;

  @override
  void onInit() {
    _initWorker();
    super.onInit();
  }

  void onRefresh() {
    NotificationsService.get.getNotifications(isLoadScreen: true);
  }

  void _initWorker() {
    _stateTracker = NotificationsService.get.addNotificationsListener((value) {
      _notifications.value = value;
    });
    _notificationsTracker =
        NotificationsService.get.addNotificationsScreenStateListener((value) {
          _state.value = value;
        });
  }

  @override
  void onClose() {
    _stateTracker?.dispose();
    _notificationsTracker?.dispose();
    super.onClose();
  }

  void routeToNotificationDetail(UserNotificationResponseModel notification) {
    final id = notification.id;
    final uri = Uri.tryParse(notification.data?.url ?? '');
    final isRead = notification.isRead;
    if (id == null || uri == null) {
      return;
    }
    final type = parseNotificationUseCase.parse(id, uri);
    if (type is Invoice) {
      final invoiceId = type.invoiceId;

      if (isRead != null && !isRead) {
        _markNotificationAsRead(notification);
        markNotificationAsReadUseCase.markNotificationAsRead([id]);
      }
      _routeToInvoiceDetail(invoiceId: invoiceId);
      return;
    }

    if (type is Patient) {
      final patientId = type.patientId;
      final visitId = type.visitId;

      if (isRead != null && !isRead) {
        _markNotificationAsRead(notification);
        markNotificationAsReadUseCase.markNotificationAsRead([id]);
      }
      _routeToPatientDetail(patientId: patientId, visitId: visitId);
      return;
    }
  }

  void _markNotificationAsRead(UserNotificationResponseModel notification) {
    // Mark local data as read so we don't have to reload from backend
    notification.isRead = true;
    NotificationsService.get.notifications.refresh();
  }

  void _routeToInvoiceDetail({required int invoiceId}) {
    final tag = invoiceId.toString();
    Get.toNamed(
      AppPages.invoiceDetailPage.name,
      arguments: {
        'viewModel': InvoiceRowViewModel.fromInvoiceId(invoiceId),
        'tag': tag
      },
    );
  }

  void _routeToPatientDetail({required int patientId, required int visitId}) {
    final tag = Get.globalNavigator.toString() + (patientId.toString());
    MainController.notificationsNavigator?.pushNamed(
      NotificationsTabNavigatorRoutes.hospitalizedDetail,
      arguments: {
        'viewModel': HospitalizationRowViewModel.fromVisitIdAndPatientId(
            visitId: visitId, patientId: patientId),
        'tag': tag,
      },
    );
  }
}
