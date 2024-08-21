import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rootaly_task/application/assesment_bloc/bloc/assesment_bloc.dart';
import 'package:rootaly_task/application/bloc_index/bloc/index_bloc.dart';
import 'package:rootaly_task/presentation/home/widgets/custom_appBar.dart';
import 'package:rootaly_task/presentation/home/widgets/custom_appoiment.dart';
import 'package:rootaly_task/presentation/home/widgets/custom_assesments.dart';
import 'package:rootaly_task/presentation/home/widgets/custom_challanges.dart';
import 'package:rootaly_task/presentation/home/widgets/custom_head.dart';
import 'package:rootaly_task/presentation/home/widgets/custom_workouts.dart';
import 'package:rootaly_task/presentation/home/widgets/flotingBar_custom.dart';
import 'package:rootaly_task/presentation/home/widgets/skell_structure/custom_skell.dart';
import 'package:rootaly_task/presentation/home/widgets/skell_structure/home_skell.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AssesmentBloc>().add(GetAssesmentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: BlocBuilder<AssesmentBloc, AssesmentState>(
          builder: (context, states) {
             if(states is AssesmentSucces){
               return ListView(
              children: [
                CustomAppBar(),
                ChoiceStackContainer(),
                BlocBuilder<IndexBloc, IndexState>(
                  builder: (context, state) {
                    if (state.idx == 0) {
                         return CustomAssesment(
                          assesmentList: states.assemntList,
                        );
                    } else {
                      return CustomAppoment();
                    }
                  },
                ),
                CustomChallange(
                  title: "Challanges",
                ),
                CustomeChallanges(challengeModel: states.cehllange,),
                CustomChallange(
                  title: "Work Out Routines",
                ),
                CustomWorkOutes(
                  routinList: states.routins,
                )
              ],
            );
             }else{
              return Center(child:HomeSkell(),);
             }
          },
        ),
      ),
    );
  }
}
