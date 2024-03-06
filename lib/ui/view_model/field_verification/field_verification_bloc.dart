import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/residential_data/residential_data.dart';
import 'package:panakj_app/core/service/field_verification_service.dart';

part 'field_verification_event.dart';
part 'field_verification_state.dart';
part 'field_verification_bloc.freezed.dart';



class FieldVerificationBloc
    extends Bloc<FieldVerificationEvent, FieldVerificationState> {
  final FieldVerificationService residentialService;
  FieldVerificationBloc(this.residentialService)
      : super(FieldVerificationState.initial()) {
    on<Postfieldverification>((event, emit) async {
      try {
        print('-----------------------------------------field verification success');

        final response =
            await residentialService.fieldVerificationService(name: 'dd');

        emit(state.copyWith(
            isLoading: false,
            isError: false,
            successorFailure: optionOf(right(response as ResidentialData))));
      } catch (e) {
        // ignore: avoid_print
        print('----------------------------------------field verification failure');
        // ignore: avoid_print
        print('Error: $e'); // Add this line

        emit(state.copyWith(
            isLoading: false,
            isError: true,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
      await Future.delayed(Duration.zero);
      emit(FieldVerificationState.initial());
    });
  }
}
