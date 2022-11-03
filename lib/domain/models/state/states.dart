import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

@freezed
class States<T> with _$States<T> {
  const factory States.init({required T entity}) = _initState<T>;
  const factory States.loading() = _loadingState;
  const factory States.failure(Exception exception) = _failureState;
  const factory States.success({required T entity}) = _successState<T>;
}
