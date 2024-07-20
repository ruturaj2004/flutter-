import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:salesman_app/main.dart';
import '../../utils/api/api_base.dart';
import '../../utils/snackbar/snackbar.dart';
import 'create_customer_state.dart';

class CreateCustomerCubit extends Cubit<CreateCustomerState> {
  final ApiBase _apiBase = ApiBase();
  CreateCustomerCubit() : super(CreateCustomerInitial());

   createCustomer(
    String? name,
    int? phoneNumber,
    String? location,
    int? pinCode,
    BuildContext? context,
  ) async {
    var data = {
      "groupId": apiEndpoints.groupId,
      "password": "12345",
      "phoneNumber": phoneNumber,
      "name": name,
      "gender": "male",
      "pinCode": pinCode,
      "location": location,
      "roleId": 1701427961185,
      "addresses": [
        {
          "locality": "",
          "state": "",
          "country": "",
          "city": "",
          "zip": "",
          "billingAddress": false,
          "shippingAddress": false,
          "default": false
        }
      ],
      "accountDetails": [
        {"phoneNumber": ""}
      ]
    };
    try {
      emit(CreateCustomerLoading());
      // ignore: unused_local_variable
      var response =
          await _apiBase.post(apiEndpoints.createCustomer, data, (data) {
        emit(CreateCustomerSuccess());
      }, (error) {
        emit(CreateCustomerError(errorMessage: error));
      });
    } catch (e) {
      emit(CreateCustomerError(errorMessage: e.toString()));
    }
  }
}
