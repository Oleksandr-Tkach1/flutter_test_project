import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/ui/main/widgets/product_list.dart';
import 'package:test_project/ui/main/widgets/shimmer.dart';
import 'package:test_project/utils/widgets/main_drawer.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/app_alert_dialog.dart';
import 'cubit/main_cubit.dart';
import 'cubit/main_state.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();
  late MainCubit? _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<MainCubit>(context);
    _cubit!.fetchAllProducts();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _controller.addListener(() {
        setState(() {});
      });
    });
    return BlocBuilder<MainCubit, MainState>(builder: (context, state) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Material(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => Navigator.of(context).push(PageRouteBuilder(
                barrierColor: Colors.black.withOpacity(0.6),
                opaque: false,
                pageBuilder: (context, _, __) => AppAlertDialog(context, 'Sorry', 'but this feature is currently unavailable!'))),
            child: SizedBox(
              height: 65,
              width: 65,
                child: Container(padding: const EdgeInsets.all(16), child: Image.asset('assets/Sacola.png')),
            ),
          ),
        ),
        drawer: mainDrawer(context, () => BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()),),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: SizedBox(
                    height: 65,
                    width: 65,
                    child: Container(padding: const EdgeInsets.all(16), child: SvgPicture.asset('assets/svg/Menu.svg',)),
                  ),
                ),
              );
            },
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: SizedBox(
            height: 40,
            child: Center(
              child: TextField(
                textInputAction: TextInputAction.go,
                onSubmitted: (_) {
                  _cubit!.fetchAllProducts();
                },
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                    fillColor: const Color(0xFFEEEEEE),
                    suffixIcon: _controller.text.isNotEmpty
                        ? IconButton(
                        onPressed: () {
                          setState(() {
                            _controller.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        )) : const Icon(Icons.search, color: Colors.grey, size: 26,),
                    contentPadding: const EdgeInsets.only(left: 14),
                    iconColor: Colors.grey,
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    //border: InputBorder.none
                ),
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundColorApp,
        body: stateStatus(state),
      );
    });
  }

  stateStatus(MainState state) {
    if (state.status == LoadingStatus.loading) {
      return shimmerEffect();
    } else {
      return RefreshIndicator(
          backgroundColor: AppColors.backgroundColorApp,
          color: Colors.black,
          onRefresh: () async {
            _cubit!.fetchAllProducts();
          },
          child: ProductList(state));
    }
  }
}