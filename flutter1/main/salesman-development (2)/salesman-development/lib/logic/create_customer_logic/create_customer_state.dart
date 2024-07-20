import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CreateCustomerState {}

class CreateCustomerInitial extends CreateCustomerState {}

class CreateCustomerSuccess extends CreateCustomerState {}

class CreateCustomerLoading extends CreateCustomerState {}

class CreateCustomerError extends CreateCustomerState {
  final String? errorMessage;

  CreateCustomerError({required this.errorMessage});
}
