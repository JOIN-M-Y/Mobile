import 'package:rxdart/rxdart.dart';

final blocStudy = StudyBloc();

class StudyBloc {
  final BehaviorSubject<List<RecommendStudy>> _subjectBestStudy =
      BehaviorSubject<List<RecommendStudy>>();

  final BehaviorSubject<List<RecommendStudy>> _subjectRecommendStudy =
  BehaviorSubject<List<RecommendStudy>>();

  Stream<List<RecommendStudy>> get streamBestStudy =>
      _subjectBestStudy.stream;

  Stream<List<RecommendStudy>> get streamRecommendStudy =>
      _subjectRecommendStudy.stream;

  addAllBestStudy(List<RecommendStudy> study) =>
      _subjectBestStudy.sink.add(study);

  addAllRecommendStudy(List<RecommendStudy> study) =>
      _subjectRecommendStudy.sink.add(study);

  dispose() {
    _subjectBestStudy.close();
    _subjectRecommendStudy.close();
  }
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
