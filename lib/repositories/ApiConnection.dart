import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiConnection{
  String link = "http://192.168.147.64:5000/";

  Future<String> sign_in(String login,String password) async{
      final response = await Dio().post(
        "$link/account/sign-in/$login/$password"
      );
      String da = response.data;
      return da;

  }
  Future<bool> register(String login,String password) async{
    final response = await Dio().post(
        "$link/account/register/$login/$password"
    );
    if (response != "no account"){
      return true;
    }
    else{
    return false;
    }
  }
  Future<String> log_out(String token) async{
    final response = await Dio().delete(
        "$link/account/sign-out/$token"
    );
    return response.toString();
  }
  Future<String> remove_note(String token,int id) async{
    final response = await Dio().delete(
        "$link/notes/delete-note/$token/$id"
    );
    return response.toString();
  }
  Future<String> GetNotesList(String token) async{
    final response = await Dio().get(
        "$link/notes/get-notes/$token"
    );
    return response.toString();
  }
  Future<String> change_note(String token,int id, String title, String text) async{
    final response = await Dio().put(
        "$link/notes/update-note/$token/$id/$title/$text"
    );
    return response.toString();
  }
  Future<String> get_note_content(String token,int id) async{
    final response = await Dio().get(
        "$link/notes/get-note-content/$token/$id"
    );
    return response.toString();
  }
  Future<String> new_note(String token,String title,String text) async{
    final response = await Dio().post(
        "$link/notes/add-note/$token/$title/$text"
    );
    return response.toString();
  }
}