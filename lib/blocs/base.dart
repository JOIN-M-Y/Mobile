import 'package:join/model/base_model.dart';
import 'package:join/repository/respository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends BaseModel>{
  final repository = Repository();
  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}