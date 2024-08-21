part of 'assesment_bloc.dart';

@immutable
sealed class AssesmentState {}

final class AssesmentLoading extends AssesmentState {}

final class AssesmentSucces extends AssesmentState{
  final List<AssessmentModel> assemntList;
   final List<RoutinsModel> routins;
     final ChallengeModel cehllange;
  AssesmentSucces({
    required this.assemntList,
    required this.routins,
    required this.cehllange
  });
}