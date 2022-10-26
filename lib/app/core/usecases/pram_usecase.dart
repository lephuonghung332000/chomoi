abstract class ParamUseCase<Type, Params> {
  Future<Type> call(Params params);
}
