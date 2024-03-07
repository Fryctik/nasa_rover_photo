import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/models/nasa.dart';
import 'package:task1/requests/api.dart';
import 'package:task1/requests/nasa_cubit_state.dart';

class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaLoadingState());

  Future<void> loadData() async {
    try {
      
      Map<String, dynamic> apiData = await getNasaData();
      Nasa nasaData = Nasa.fromJson(apiData);
      emit(NasaLoadedState(data: nasaData));
    } catch (e) {
      emit(NasaErrorState());
      return;
    }
  }
}