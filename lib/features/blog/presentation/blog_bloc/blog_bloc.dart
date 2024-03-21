import 'dart:io';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/domain/usecases/get_all_blogs.dart';
import 'package:blog_app/features/blog/domain/usecases/upload_blog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;
  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
  })  : _uploadBlog = uploadBlog,
        _getAllBlogs = getAllBlogs,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));

    on<BlogUpload>(onBlogUpload);
    on<BlogFetchAllBlogs>(onFetchAllBlogs);
  }

  void onBlogUpload(BlogUpload event, Emitter<BlogState> emit) async {
    final response = await _uploadBlog.call(UploadBlogParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics));

    response.fold((failure) => emit(BlogFailure(failure.message)),
        (blogData) => emit(BlogUploadSuccess()));
  }

  void onFetchAllBlogs(BlogFetchAllBlogs event, Emitter<BlogState> emit) async {
    final response = await _getAllBlogs.call(NoParams());

    response.fold((failure) => emit(BlogFailure(failure.message)),
        (blogs) => emit(BlogDisplaySuccess(blogs)));
  }
}
