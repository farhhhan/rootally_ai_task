import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rootaly_task/application/bloc_index/bloc/index_bloc.dart';

class ChoiceStackContainer extends StatefulWidget {
  @override
  _ChoiceStackContainerState createState() => _ChoiceStackContainerState();
}

class _ChoiceStackContainerState extends State<ChoiceStackContainer> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          child: Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(
                  255, 227, 238, 241), // Light grey background
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => context.read<IndexBloc>().add(ChangeIndexEvent(idx: 0)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: state.idx == 0
                                ? Colors.white
                                : Color.fromARGB(255, 227, 238, 241)),
                        child: Center(
                          child: Text("My Assesment",style: TextStyle(
                              fontSize:  state.idx == 0
                                ? 16
                                : 15,
                                fontWeight:  state.idx == 0
                                ? FontWeight.w500
                                : FontWeight.normal,
                            color:  state.idx == 0
                                ? Colors.blue
                                : Color.fromARGB(255, 149, 152, 153)),),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Space between buttons
                Expanded(
                  child: GestureDetector(
                    onTap: () => context.read<IndexBloc>().add(ChangeIndexEvent(idx: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: state.idx == 1
                                ? Colors.white
                                : Color.fromARGB(255, 227, 238, 241)),
                        child: Center(
                          child:Text("My Appoiments",style: TextStyle(
                            fontSize:  state.idx == 1
                                ? 16
                                : 15,
                                 fontWeight:  state.idx == 1
                                ? FontWeight.w500
                                : FontWeight.normal,
                            color:  state.idx == 1
                                ? Colors.blue
                                : Color.fromARGB(255, 149, 152, 153)),),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
