import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/data/database/database.dart';
import '../../../../common/data/tag_repository.dart';
import '../../cubit/tag_selector/tags_cubit.dart';

class TagSelectorScope extends StatelessWidget {
  const TagSelectorScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TagsCubit(
        tagRepository: TagRepository(
          tagProvider: context.read<Database>(),
        ),
      ),
      child: child,
    );
  }

  static TagsCubit of(BuildContext context) {
    return context.read<TagsCubit>();
  }
}
