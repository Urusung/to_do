// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gap/gap.dart';
// import 'package:go_router/go_router.dart';
// import 'package:to_do_list_riverpod/data/models/to_do.dart';
// import 'package:to_do_list_riverpod/presentaion/viewmodels/to_do_lists_provider.dart';

// class ToDoListsView extends ConsumerWidget {
//   final MyLists myList;

//   const ToDoListsView({
//     super.key,
//     required this.myList,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final myListName = myList.name;
//     final myListColor = myList.colorValue;
//     final toDoLists = ref.watch(toDoListsProvider(myList));

//     return Scaffold(
//       backgroundColor: Theme.of(context).canvasColor,
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).canvasColor,
//         toolbarHeight: 0,
//         scrolledUnderElevation: 0,
//       ),
//       body: SafeArea(
//         bottom: false,
//         child: CustomScrollView(
//           slivers: [
//             CupertinoSliverNavigationBar(
//               alwaysShowMiddle: false,
//               backgroundColor: Theme.of(context).canvasColor,
//               border: const Border(),
//               leading: GestureDetector(
//                 onTap: () {
//                   context.pop();
//                 },
//                 child: Container(
//                   width: 28,
//                   color: Colors.transparent,
//                   alignment: Alignment.centerLeft,
//                   child: Icon(
//                     Icons.arrow_back_ios_rounded,
//                     color: Theme.of(context).colorScheme.primary,
//                     size: 24,
//                   ),
//                 ),
//               ),
//               middle: Text(
//                 myListName,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineMedium!
//                     .copyWith(color: Color(myListColor)),
//               ),
//               largeTitle: Text(
//                 myListName,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineLarge!
//                     .copyWith(color: Color(myListColor)),
//               ),
//             ),
//             SliverList.builder(
//               itemCount: toDoLists.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     print(index);
//                   },
//                   child: Slidable(
//                     key: Key(toDoLists[index].key.toString()),
//                     endActionPane: ActionPane(
//                       motion: const StretchMotion(),
//                       children: [
//                         SlidableAction(
//                           onPressed: (context) {},
//                           backgroundColor: Colors.red,
//                           foregroundColor: Colors.white,
//                           icon: Icons.delete,
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             toDoLists[index].title,
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                           Checkbox(
//                             value: toDoLists[index].isCompleted,
//                             onChanged: (value) {},
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(left: 12, right: 16, bottom: 34),
//         child: GestureDetector(
//           child: Row(
//             children: [
//               Icon(
//                 CupertinoIcons.add_circled_solid,
//                 color: Theme.of(context).colorScheme.primary,
//                 size: 28,
//               ),
//               const Gap(8),
//               Text(
//                 'New To Do List',
//                 style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.primary,
//                     ),
//               ),
//             ],
//           ),
//           onTap: () {},
//         ),
//       ),
//     );
//   }
// }
