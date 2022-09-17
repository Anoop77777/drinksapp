// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:qabuss_flutter/components/custom_loading.dart';
// import 'package:qabuss_flutter/components/search_component.dart';
// import 'package:qabuss_flutter/modals/user.dart';

// import 'package:qabuss_flutter/pages/shop/common/components/shop_product_grid_item.dart';

// import 'package:qabuss_flutter/pages/shop/shopCategoryPage/bloc/product_list_bloc.dart';
// import 'package:qabuss_flutter/pages/shop/shopCategoryPage/model/productList_model.dart';
// import 'package:qabuss_flutter/pages/shop/shopCategoryPage/widgets/filter_shop.dart';

// import 'package:qabuss_flutter/pages/shop/widget/widget/iconBadge.dart';
// import 'package:qabuss_flutter/services/account_service.dart';
// import 'package:qabuss_flutter/services/language_service.dart';
// import 'package:qabuss_flutter/services/localization.dart';

// class ShopCategoryPage extends StatefulWidget {
//   final String tab;
//   ShopCategoryPage({Key key, @required this.tab}) : super(key: key);

//   @override
//   _ShopCategoryPageState createState() => _ShopCategoryPageState();
// }

// class _ShopCategoryPageState extends State<ShopCategoryPage> {
//   int currentpage, lastpage;

//   List<Result> data = [];
//   List<CategoryShop> categoryData = [];
//   List<int> _filter = [];
//   List<FilterModel> _filterModel = [];
//   int _sort;
//   bool _isSearchActive = false;
//   final FocusNode _searchFocusNode = FocusNode();
//   final TextEditingController _searchController = TextEditingController();

//   void _toggleSearchState({BuildContext context, String cateId, User user}) {
//     setState(() {
//       _isSearchActive = !_isSearchActive;
//     });
//     if (_isSearchActive) {
//       FocusScope.of(context).requestFocus(_searchFocusNode);
//     } else {
//       BlocProvider.of<ProductListBloc>(context)
//         ..add(GetProductList(
//           categoryId: cateId,
//           user: user,
//           sort: _sort,
//           filter: _filter,
//           search: null,
//         ));
//     }
//   }

//   void onFilterClicked({
//     BuildContext context,
//     ProductListBloc bloc11,
//     String cateid,
//     User user111,
//     List<CategoryShop> filterList,
//   }) {
//     setState(() {
//       filterList.forEach((element) {
//         FilterModel f = FilterModel(element.nameEn, element.nameAr, element.id);
//         _filterModel.add(f);
//       });
//     });
//     showModalBottomSheet(
//         //isDismissible: false,
//         context: context,
//         builder: (_) => FilterShop(
//               filter: _filterModel,
//               filterValue: _filter,
//               onFilter: (filter) {
//                 _filter = filter;
//                 bloc11.add(GetProductList(
//                   categoryId: cateid,
//                   sort: _sort,
//                   user: user111,
//                   filter: filter,
//                   search: _searchController.text,
//                 ));

//                 Navigator.pop(context);
//               },
//             )).then((_) => _filterModel.clear());
//   }

//   void onSortByClicked({
//     BuildContext context,
//     ProductListBloc bloc11,
//     String cateid,
//     User user111,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       builder: (_) => Sort(
//         onSort: (sortvalue) {
//           _sort = sortvalue;
//           if (sortvalue == 0) {
//             bloc11.add(GetProductList(
//               categoryId: cateid,
//               sort: null,
//               user: user111,
//               filter: [],
//               search: null,
//             ));
//           } else {
//             bloc11.add(GetProductList(
//               categoryId: cateid,
//               sort: sortvalue,
//               user: user111,
//               filter: _filter,
//               search: _searchController.text,
//             ));
//           }
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final String args = ModalRoute.of(context).settings.arguments;
//     final AccountService auth = Provider.of<AccountService>(context);

//     final User user1 = auth.currentUser;
//     print(args);
//     final blocplb = BlocProvider.of<ProductListBloc>(context);
//     return Scaffold(
//       appBar: _buildAppbar(context: context, cateId: args),
//       body: BlocConsumer<ProductListBloc, ProductListState>(
//         listener: (context, state) {
//           // if (state is ProductListLoading) {
//           //   ScaffoldMessenger.of(context)
//           //       .showSnackBar(SnackBar(content: Text("loading")));
//           // }
//         },
//         builder: (context, state) {
//           if (state is ProductListLoading) {
//             return Center(child: CustomLoader());
//           }
//           if (state is ProductListError) {
//             return Center(
//                 child:
//                     Text(AppLocalizations.of(context).translate('errorText')));
//           }

//           if (state is ProductListLoaded) {
//             data = state.data;
//             categoryData = state.category;
//           }
//           return buildBody(
//               context: context,
//               data: data,
//               arg: args,
//               user11: user1,
//               bloc111: blocplb,
//               filterdata: categoryData);
//         },
//       ),
//     );
//   }

//   Column buildBody(
//       {BuildContext context,
//       List<Result> data,
//       List<CategoryShop> filterdata,
//       String arg,
//       User user11,
//       ProductListBloc bloc111}) {
//     return Column(
//       children: [
//         //Top Bar (filters and sort)
//         Container(
//           margin: EdgeInsets.all(10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   onSortByClicked(
//                     context: context,
//                     bloc11: bloc111,
//                     cateid: arg,
//                     user111: user11,
//                   );
//                   setState(() {});
//                 },
//                 icon: Icon(Icons.sort_outlined),
//               ),
//               IconButton(
//                 onPressed: () => onFilterClicked(
//                   context: context,
//                   bloc11: bloc111,
//                   user111: user11,
//                   cateid: arg,
//                   filterList: filterdata,
//                 ),
//                 icon: Icon(Icons.filter_alt),
//               ),
//             ],
//           ),
//         ),

//         /// Product Grid view

//         data.length > 0
//             ? Expanded(
//                 child: GridView.builder(
//                     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                       mainAxisSpacing: 0,
//                       crossAxisCount: 2,
//                       childAspectRatio:
//                           ((MediaQuery.of(context).size.width - 46 - 10) / 2) /
//                               (((MediaQuery.of(context).size.width - 46 - 10) /
//                                       2) +
//                                   73),
//                       crossAxisSpacing: 10,
//                     ),
//                     itemCount: data.length,
//                     itemBuilder: (BuildContext ctx, index) {
//                       return ShopProductGridItem(
//                         index: index,
//                         tab: widget.tab,
//                         id: data[index].id,
//                         nameAr: data[index].nameAr,
//                         nameEn: data[index].nameEn,
//                         price: data[index].price.toString(),
//                         image: data[index].image,
//                       );
//                     }),
//               )
//             : Expanded(
//                 child: Center(
//                   child: Text("empty"),
//                 ),
//               )
//       ],
//     );
//   }

//   AppBar _buildAppbar({BuildContext context, String cateId}) {
//     final AccountService auth = Provider.of<AccountService>(context);

//     final User user1 = auth.currentUser;
//     return AppBar(
//       iconTheme: IconThemeData(color: Colors.black),
//       centerTitle: false,
//       brightness: Brightness.light,
//       backgroundColor: Colors.white,
//       title: _isSearchActive
//           ? SearchComponent(
//               controller: _searchController,
//               focusNode: _searchFocusNode,
//               onEditingComplete: () =>
//                   _searchEvents(cateId: cateId, user: user1),
//             )
//           : Text(AppLocalizations.of(context).translate('Shopping'),
//               style: Theme.of(context).textTheme.headline6),
//       actions: <Widget>[
//         IconBadge(
//           tab: "shop",
//         ),
//         _isSearchActive
//             ? IconButton(
//                 color: Colors.white,
//                 icon: Icon(
//                   Icons.cancel,
//                   color: Theme.of(context).accentColor,
//                 ),
//                 onPressed: () {
//                   _toggleSearchState(
//                       context: context, cateId: cateId, user: user1);
//                   setState(() {
//                     _searchController.clear();
//                   });
//                 },
//               )
//             : IconButton(
//                 icon: Icon(
//                   Icons.search,
//                   color: Colors.black,
//                 ),
//                 onPressed: () => _toggleSearchState(
//                     context: context, cateId: cateId, user: user1),
//               ),
//       ],
//     );
//   }

//   void _searchEvents({String cateId, User user}) async {
//     BlocProvider.of<ProductListBloc>(context)
//       ..add(GetProductList(
//         categoryId: cateId,
//         user: user,
//         sort: _sort,
//         filter: _filter,
//         search: _searchController.text,
//       ));
//   }
// }

// class Sort extends StatelessWidget {
//   final Function(int) onSort;
//   const Sort({Key key, this.onSort}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final AppLanguage appLanguage = Provider.of<AppLanguage>(context);
//     bool isArabic = false;
//     if (appLanguage.appLocal == Locale('ar')) {
//       isArabic = true;
//     }

//     List<String> items = [
//       "All",
//       'Latest Product',
//       'Product: A to Z',
//       'Product: Z to A',
//       'Price: Low to High',
//       'Price: High to Low',
//     ];

//     List<String> sortTitleAr = [
//       "الكل",
//       "أحدث المنتجات",
//       "الاسم من أ إلى ي",
//       "اسم من ي إلى أ",
//       "السعر من الارخص للاغلى",
//       "سعر مرتفع إلى منخفض",
//     ];
//     return Container(
//       height: MediaQuery.of(context).size.height / 2,
//       padding: EdgeInsets.only(top: 16, right: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 16),
//             child: Text(
//               AppLocalizations.of(context).translate('sort'),
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF343434),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (_, int index) {
//                 return ListTile(
//                   // contentPadding: EdgeInsets.zero,
//                   dense: true,
//                   title: Text(
//                     isArabic ? sortTitleAr[index] : items[index],
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Color(0xFF343434),
//                     ),
//                   ),
//                   onTap: () {
//                     print(index);
//                     onSort(index);
//                     // if (index == 0) {
//                     //   bloc1.add(GetProductList(
//                     //     categoryId: cateId,
//                     //     sort: null,
//                     //     user: user1,
//                     //     filter: [],
//                     //     search: null,
//                     //   ));
//                     // } else {
//                     //   bloc1.add(GetProductList(
//                     //     categoryId: cateId,
//                     //     sort: index,
//                     //     user: user1,
//                     //     filter: [],
//                     //     search: null,
//                     //   ));
//                     // }
//                     Navigator.pop(context);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
