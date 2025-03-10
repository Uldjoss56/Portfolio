import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/home/presentation/home_screen.dart';
import 'bloc/connected_bloc.dart';

class NetworkChecking extends StatelessWidget {
  const NetworkChecking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, state) {
        if (state is ConnectedSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Internet Connected')));
        } else if (state is ConnectedFailureState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Internet Lost')));
        }
      },
      builder: (context, state) {
        if (state is ConnectedSuccessState) {
          return const HomeScreen();
        }
        // else if (state is ConnectedFailureState) {
        //   return const NoConnectionErorr();
        // }
        else {
          // return Container();
          return const NoConnectionErorr();
          //return const MainPage();
        }
      },
    );
  }
}

class NoConnectionErorr extends StatelessWidget {
  const NoConnectionErorr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LoadingAnimationWidget.staggeredDotsWave(
            //     color: primaryColor, size: 50.0),
            // SizedBox(height: 3.h),
            Text(
              "Connection failed!",
            ),
          ],
        ),
      ),
    );
  }
}
