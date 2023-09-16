import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class ConnectUsView extends StatefulWidget {
  const ConnectUsView({super.key});

  @override
  State<ConnectUsView> createState() => _ConnectUsViewState();
}

class _ConnectUsViewState extends State<ConnectUsView> {
  final name = TextEditingController();
  final email = TextEditingController();
  final description = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    email.dispose();
    description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(27),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            topPartText(),
            const SizedBox(height: 50),
            CustomTextFieldWidget(
              icon: Image.asset('assets/Group.png'),
              controller: name,
              valid: (String? value) {
                if (value == null) {
                  return 'Not Valid empty value';
                }
              },
              hintText: 'Full name',
            ),
            const SizedBox(height: 20),
            CustomTextFieldWidget(
              icon: Image.asset('assets/Group.png'),
              controller: email,
              valid: (String? value) {
                if (value == null) {
                  return 'Not Valid empty value';
                }
              },
              hintText: 'Email',
            ),
            const SizedBox(height: 20),
            CustomTextFieldWidget(
              maxLines: 8,
              controller: description,
              valid: (String? value) {
                if (value == null) {
                  return 'Not Valid empty value';
                }
              },
              hintText: 'message',
            ),
            const SizedBox(height: 40),
            CustomButton(
              function: () {},
              color: AppColors.primaryColor,
              textColor: AppColors.white,
              fontSize: .04,
              title: ' Send Message',
            ),
          ]),
        ),
      ),
    );
  }

  Column topPartText() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect Us',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Any questions or remarks ?  Just write us a message',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF7B7B7B),
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  AppBar settingAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () => pop(),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.only(start: 10),
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.10000000149011612),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
