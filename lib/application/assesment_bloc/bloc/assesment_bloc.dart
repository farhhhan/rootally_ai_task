import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rootaly_task/domain/assesment/assesment_model.dart';
import 'package:rootaly_task/domain/chellanges/chellangeModel.dart';
import 'package:rootaly_task/domain/rouins/routinsModel.dart';
import 'package:rootaly_task/infrastructure/assesmentrepo.dart';

part 'assesment_event.dart';
part 'assesment_state.dart';

class AssesmentBloc extends Bloc<AssesmentEvent, AssesmentState> {
  AssesmentBloc() : super(AssesmentLoading()) {
    on<AssesmentEvent>((event, emit) async{
        try{
            final assesmentList=await AssesmentRepo().getAssesment();
            final routinList =await  AssesmentRepo().getRoutins();
            final chellangeLiust =await  AssesmentRepo().getChellanges();
            emit(AssesmentSucces(assemntList: assesmentList, routins: routinList,cehllange: chellangeLiust));
        }catch(e){
            throw Exception(e);
        }
    });
  }
}
