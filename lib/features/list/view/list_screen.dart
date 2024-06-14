import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwards_app/features/bottom_nav_bar/bloc/bottom_nav_cubit.dart';
import 'package:hogwards_app/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:hogwards_app/features/list/bloc/students_list_bloc.dart';
import 'package:hogwards_app/features/list/widgets/widgets.dart';
import 'package:hogwards_app/features/student_details/student_details.dart';
import 'package:hogwards_app/repositories/student_repository.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late StudentsListBloc _studentsListBloc;

  @override
  void initState() {
    super.initState();
    _studentsListBloc = StudentsListBloc();
    _studentsListBloc.add(LoadStudentsList());
  }

  @override
  void dispose() {
    _studentsListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Screen"),
        actions: [
          TextButton(
            onPressed: () {
              _studentsListBloc.add(ResetAll());
            },
            child: const Text(
              "Reset",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: BlocBuilder<StudentsListBloc, StudentsListState>(
        bloc: _studentsListBloc,
        builder: (context, state) {
          if (state is StudentsListLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state is StudentsListLoaded) {
            return _buildLoadedState(context, state);
          } else if (state is StudentsListLoadingFailure) {
            return const Center(child: Text("ERROR"));
          }
          return const Center(
              child: CircularProgressIndicator(color: Colors.black));
        },
      ),
    );
  }

  GestureDetector _buildLoadedState(
      BuildContext context, StudentsListLoaded state) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            AttemptRow(
              success:
                  StudentRepository().calculateSuccessAttempts(state.students),
              failed: StudentRepository().calculatefailedAttempts(state.students),
            ),
            const SizedBox(height: 20),
            SearchBarWidget(studentsListBloc: _studentsListBloc),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.students.length,
              itemBuilder: (context, index) {
                final student = state.students[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentDetailsScreen(student: student),
                      ),
                    ),
                    child: StudentTile(
                      student: student,
                      onRetry: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => BottomNavCubit(),
                            child: BottomNavBarScreen(
                                indexOfTryAgain: state.indexes[index]),
                          ),
                        ),
                        (route) => false,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
