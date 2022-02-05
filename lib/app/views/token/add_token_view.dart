import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddTokenView extends GetView<AddTokenController> {
  const AddTokenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuController.to.scaffoldKey = GlobalKey<ScaffoldState>();
    final _formKey = GlobalKey<FormState>();

    return XLayout(
      title: "Create Token Contract",
      isSearchable: false,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            XRowResponsive(
              height: 210,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: XTextField(
                    controller: controller.tokenNameCtrl,
                    label: "Token Name",
                    hintText: "e.g : IDR Token",
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Token name is required'),
                      MinLengthValidator(2,
                          errorText:
                              'Token name must be at least 2 digits long'),
                    ]),
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: XTextField(
                    controller: controller.tokenDecimalCtrl,
                    label: "Decimal Places",
                    hintText: "e.g : 1 - 18",
                    validator: PatternValidator(r'\b(0?[1-9]|[1][0-8]|100)\b',
                        errorText: 'Decimal places must be between 1 to 18'),
                  ),
                ),
              ],
            ),
            XRowResponsive(
              height: 210,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: XTextField(
                    controller: controller.tokenSymbolCtrl,
                    label: "Symbol",
                    hintText: "e.g : IDRT",
                    textCapitalization: TextCapitalization.sentences,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Symbol is required'),
                      MinLengthValidator(2,
                          errorText: 'Symbol must be at least 2 digits long'),
                    ]),
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: XTextField(
                    controller: controller.tokenSupplyCtrl,
                    label: "Total Supply",
                    hintText: "e.g : 100",
                    validator: PatternValidator(r'^(|\d+)$',
                        errorText: 'Total supplay must be bigger or than 0'),
                  ),
                ),
              ],
            ),
            XActionButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.addTokenContract();
                  // controller.addTokenContract(onSucess: () {
                  //   // Get.rootDelegate.toNamed(Routes.ADD_TOKENS);
                  //   // //to close the drawer
                  //   // Navigator.of(context).pop();
                  // });
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('Processing Data')),
                  // );
                }
              },
              label: const Text("Add Token"),
              icon: Icons.add,
              padding: const EdgeInsets.only(top: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
