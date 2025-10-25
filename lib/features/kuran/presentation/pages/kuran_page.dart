import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunnet_app/features/kuran/presentation/widgets/kuran_slide_items.dart';

import '../../logic/cubit/kuran_cubit.dart';
import '../../logic/cubit/kuran_state.dart';

class KuranPage extends StatefulWidget {
  const KuranPage({Key? key}) : super(key: key);

  @override
  State<KuranPage> createState() => _KuranPageState();
}

class _KuranPageState extends State<KuranPage> {
  @override
  void initState() {
    super.initState();
    context.read<KuranCubit>().fetchMoreAyah();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KuranCubit, KuranState>(
      builder: (context, state) {
        if (state.isLoading && state.kuranData.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null && state.kuranData.isEmpty) {
          return Center(child: Text('Hata: ${state.error}'));
        }

        return CarouselSlider.builder(
          itemCount: state.kuranData.length,
          itemBuilder: (context, index, realIndex) {
            return KuranSlideItems(kuranModel: state.kuranData[index]);
          },
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 1.0,
            scrollDirection: Axis.vertical,
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            autoPlay: false,
            onPageChanged: (index, reason) {
              if (index >= state.kuranData.length - 2 && !state.isLoading) {
                context.read<KuranCubit>().fetchMoreAyah();
              }
            },
          ),
        );
      },
    );
  }
}
