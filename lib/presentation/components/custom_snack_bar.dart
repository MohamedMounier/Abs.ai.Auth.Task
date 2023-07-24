import 'package:flutter/material.dart';

showCustomSnackBar({required BuildContext context,required bool isError,required String message}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:isError?Colors.red:Colors.green,content: Text(message,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),));
}