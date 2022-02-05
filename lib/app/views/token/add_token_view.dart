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
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: 'Decimal places is required'),
                      RangeValidator(
                          min: 1,
                          max: 18,
                          errorText: 'Decimal places must be between 1 to 18'),
                    ]),
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
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Total supplay is required'),
                      PatternValidator(r'^[1-9]+[0-9]*$',
                          errorText: 'Total supplay must be bigger than 0'),
                    ]),
                  ),
                ),
              ],
            ),
            XActionButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.addTokenContract();
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
