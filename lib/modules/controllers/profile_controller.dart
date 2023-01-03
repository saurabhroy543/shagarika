import 'package:get/get.dart';
import 'package:shagarika/data/repositories/user_detail_repo.dart';
import 'package:shagarika/utils/storage.dart';
import '../../data/models/user_details.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  final userDetailRepo = UserDetailRepository();
  late UserDetailModel userDetailModel;

  @override
  void onInit() async {
    await getUserDetail();
    update();
    isLoading(false);
    super.onInit();
  }

  Future getUserDetail() async {
    userDetailModel = await userDetailRepo.fetchProfileDetail(Storage.userId);
    update();
  }
}
