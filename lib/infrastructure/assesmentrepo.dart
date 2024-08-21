import 'package:rootaly_task/domain/assesment/assesment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rootaly_task/domain/chellanges/chellangeModel.dart';
import 'package:rootaly_task/domain/rouins/routinsModel.dart';

class AssesmentRepo {
  Future<List<AssessmentModel>> getAssesment() async {
    List<AssessmentModel> assesmentList = [];
    try {
      final datas =
          await FirebaseFirestore.instance.collection('assestment').get();
      datas.docs.forEach((element) {
        print(element.data());
        assesmentList.add(AssessmentModel.fromJson(element.data()));
      });
      print("${assesmentList.length} is lenght");
      return assesmentList;
    } catch (e) {
      print(e.toString());
      return assesmentList;
    }
  }

  Future<List<RoutinsModel>> getRoutins() async {
    List<RoutinsModel> assesmentList = [];
    try {
      final datas = await FirebaseFirestore.instance
          .collection("routins")
          .orderBy("title", descending: false)
          .get();
      datas.docs.forEach((element) {
        print(element.data());
        assesmentList.add(RoutinsModel.fromJson(element.data()));
      });
      print("${assesmentList.length} is lenght");
      return assesmentList;
    } catch (e) {
      print(e.toString());
      return assesmentList;
    }
  }
  Future<ChallengeModel> getChellanges() async {
    List<ChallengeModel> chellangeList = [];
    try {
      final datas = await FirebaseFirestore.instance
          .collection("chellanges")          .get();
      datas.docs.forEach((element) {
        print(element.data());
        chellangeList.add(ChallengeModel.fromMap(element.data()));
      });
      print("${chellangeList.length} is lenght");
      return chellangeList[0];
    } catch (e) {
      print(e.toString());
      return chellangeList[0];
    }
  }
}
