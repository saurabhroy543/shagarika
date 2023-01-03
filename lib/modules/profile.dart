import 'package:flutter/cupertino.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:shagarika/modules/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'drawer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return  Scaffold(
          backgroundColor:  Colors.cyan[100],
            resizeToAvoidBottomInset: false,
            drawer: SideDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.cyan[700],
              title: const Text('Profile'),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          controller.isLoading(true);
                          controller.onInit();
                          controller.update();
                          controller.isLoading(false);
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Center(
                                child: Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: 'Welcome  ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${Storage.username}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue)),
                                ])),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: const [
                                    Text(
                                      'Profile Details',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.activeBlue),
                                    ),
                                  ],
                                ),
                              ),
                              profileCard(controller),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: const [
                                    Text(
                                      'Basic Details',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.activeBlue),
                                    ),
                                  ],
                                ),
                              ),
                              basicDetailCard(controller),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: const [
                                    Text(
                                      'Bank and FATCA Details',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.activeBlue),
                                    ),
                                  ],
                                ),
                              ),
                              bankDetailCard(controller),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          );
      },
    );
  }

  Widget profileCard(ProfileController controller) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Name',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Mobile',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'E-mail',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'PAN No.',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Address',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      ': ${controller.userDetailModel.msg!.name}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.mobile}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.email}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.panNo}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                      ),
                      child: Text(
                        ': ${controller.userDetailModel.msg!.address}',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget basicDetailCard(ProfileController controller) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Gender',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'PinCode',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'City',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'State',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Address line 2',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Address line 3',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      ': ${controller.userDetailModel.msg!.gender}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.dob}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.pincode}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.city}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.state}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                      ),
                      child: Text(
                        ': ${controller.userDetailModel.msg!.address2}',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                      ),
                      child: Text(
                        ': ${controller.userDetailModel.msg!.address3}',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bankDetailCard(ProfileController controller) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Account Type',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Account No.',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'IFSC Code',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Bank Name',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Bank Branch',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'MICR Code',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Gross Annual Income',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Bank Address',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      ': ${controller.userDetailModel.msg!.bankAccountType}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.accountNo}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.bankIfscCode}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.bankName}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.bankBranch}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.bankMicrCode}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ': ${controller.userDetailModel.msg!.fATCAGrossAnnualIncome}',
                      style: const TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 150,
                      ),
                      child: Text(
                        ': ${controller.userDetailModel.msg!.address}',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
