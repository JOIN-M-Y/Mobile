import 'package:rxdart/rxdart.dart';

final blocRecommend = RecommendBloc();

class RecommendBloc {
  final BehaviorSubject<List<RecommendStudy>> _subjectRecommendStudy =
      BehaviorSubject<List<RecommendStudy>>();

  Stream<List<RecommendStudy>> get streamRecommendStudy =>
      _subjectRecommendStudy.stream;

  addAllRecommendStudy(List<RecommendStudy> study) =>
      _subjectRecommendStudy.sink.add(study);

  dispose() => _subjectRecommendStudy.close();
}

class RecommendStudy {
  String studyType;
  String studyTitle;
  String studySubTitle;
  int likeCount;
  int index;

  RecommendStudy(
    this.studyType,
    this.studyTitle,
    this.studySubTitle,
    this.likeCount,
    this.index,
  );
}
