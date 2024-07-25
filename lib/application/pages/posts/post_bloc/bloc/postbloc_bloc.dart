import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/domain/entities/post_entity.dart';
import 'package:myapp/domain/usecases/post_usecase.dart';

part 'postbloc_event.dart';
part 'postbloc_state.dart';

class PostblocBloc extends Bloc<PostblocEvent, PostblocState> {
  PostblocBloc() : super(PostblocInitial()) {
    on<PostblocEvent>((event, emit) async{
    try{
      final posts = await PostUsecase().getPostDataSource();
      emit(Postblocloaded(posts: posts));
    }catch(e){
      emit(Postblocerror(error: e.toString()));
    }
      
    });
  }
}
