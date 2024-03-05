// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:research_flutter_unit_test/common/component/component.dart';
import 'package:research_flutter_unit_test/utils/emoji_unicode.dart';
import 'package:research_flutter_unit_test/utils/string_format.dart';
import 'package:research_flutter_unit_test/utils/styles.dart';
import 'package:research_flutter_unit_test/widgets/svg_image_custom.dart';

class TextFieldCustom extends StatefulWidget {
  final bool isPhone;
  final bool isPassword;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final int? limit;
  final bool? readOnly;
  final bool? isArea;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool? isRequired;
  final bool? Function()? isValid;
  final String? errorText;
  final String? prefixPath;
  final Function(String)? onSelectString;
  final List<String>? selectList;
  final Function(DateTime)? onSelectDate;
  final List<String>? tagList;
  final Function(List<String>)? onUpdateTagList;
  final Color? backgroundTextField;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final double? sizePrefix;
  final bool? onlyAlphabet;
  final bool? denySpecialCharacters;
  final bool denyEmoji;
  final OutlineInputBorder? borderCustom;
  final OutlineInputBorder? disableBorderCustom;
  final OutlineInputBorder? errorBorderCustom;
  final String? suffixPath;
  final double? sizeSuffix;
  final Function()? onTapPrefix;

  const TextFieldCustom({
    Key? key,
    this.isPhone = false,
    this.isPassword = false,
    this.labelText,
    this.hintText,
    this.controller,
    this.limit,
    this.readOnly = false,
    this.isArea = false,
    this.inputFormatters,
    this.inputType,
    this.minLines = 5,
    this.onChanged,
    this.focusNode,
    this.isRequired = false,
    this.isValid,
    this.errorText = "",
    this.prefixPath,
    this.onSelectString,
    this.selectList,
    this.onSelectDate,
    this.tagList,
    this.onUpdateTagList,
    this.backgroundTextField,
    this.style,
    this.hintStyle,
    this.sizePrefix,
    this.onlyAlphabet = false,
    this.denyEmoji = false,
    this.borderCustom,
    this.disableBorderCustom,
    this.errorBorderCustom,
    this.onTapPrefix,
    this.denySpecialCharacters = false,
    this.suffixPath,
    this.sizeSuffix,
    this.maxLines,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  // PopupService popupService = Get.find();
  GlobalKey textFieldKey = GlobalKey();
  late TextEditingController textEditingController;
  String text = "";
  bool isError = false;
  FocusNode focusNode = FocusNode();
  Offset? position;
  Size? size;
  late List<String> tagList;

  @override
  void initState() {
    super.initState();
    tagList = widget.tagList ?? [];
    textEditingController = widget.controller ?? TextEditingController();
    textEditingController.addListener(() {
      setState(() {
        text = textEditingController.value.text;
        if (isError) {
          isError = false;
        }
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  List<TextInputFormatter>? getInputFormatters() {
    List<TextInputFormatter> list = widget.inputFormatters != null ? widget.inputFormatters! : [];
    if (widget.limit != null) {
      list.addAll([LengthLimitingTextInputFormatter(widget.limit)]);
    }

    if (widget.onlyAlphabet!) {
      list.addAll([
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
      ]);
    }

    if (widget.denySpecialCharacters!) {
      list.addAll([
        FilteringTextInputFormatter.deny(RegExp("[0-9]")),
        FilteringTextInputFormatter.deny(RegExp(
            r'(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])')),
        FilteringTextInputFormatter.deny(RegExp(r'[`!@#$%^&*/()_+\-=\[\]{};\:\"|,.<>?~₫/×√π÷•¶∆£€¢°©®™✓¥¤《》¡¿]')),
        FilteringTextInputFormatter.deny(RegExp(r"[`\'\\]"))
      ]);
    }

    if (widget.isPhone) {
      list.addAll([
        FilteringTextInputFormatter.deny(RegExp('[\\.|\\,|\\-|\\ ]')),
      ]);
    }

    if (widget.denyEmoji) {
      list.addAll([
        FilteringTextInputFormatter.deny(emojiRegExp),
      ]);
    }

    return list;
  }

  onTap() async {
    if (widget.onUpdateTagList != null) {
      //show popup choose tags
      var list = ["GT: Giá trị 1", "MT: Giá trị 3", "MT: Giá trị 3", "MT: Giá trị 3", "MT: Giá trị 3", "MT: Giá trị 3"];
      setState(() {
        tagList = list;
      });
      widget.onUpdateTagList!(list);
      textEditingController.text = " ";
    }
    if (widget.onSelectDate != null) {
      final DateTime currentDate = DateTime.now();
      // ? Min 16 tuổi, Max 100 tuổi
      final DateTime firstAllowedDate = DateTime(currentDate.year - 100, currentDate.month, currentDate.day);
      final DateTime lastAllowedDate = DateTime(currentDate.year - 16, currentDate.month, currentDate.day);
      var initialDate = textEditingController.text.isNotEmpty
          ? DateFormat(StringFormat.dmy).parse(textEditingController.text)
          : lastAllowedDate;

      var date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstAllowedDate,
        lastDate: lastAllowedDate,
        locale: const Locale('vi', 'VN'),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Component.color.primary,
              colorScheme: ColorScheme.light(primary: Component.color.secondary),
              buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        cancelText: 'close'.tr,
        confirmText: 'selecte'.tr,
      );
      if (date != null) {
        textEditingController.text = DateFormat(StringFormat.dmy).format(date);
        widget.onSelectDate!(date);
      }
      return;
    }
    if (widget.onSelectString != null && widget.selectList != null && widget.selectList!.isNotEmpty) {
      showHint();
      return;
    }
  }

  onRemoveTag(String text) {
    var list = tagList;
    var index = list.indexOf(text);
    if (index != -1) {
      setState(() {
        list.removeAt(index);
      });
      if (list.isEmpty) {
        textEditingController.clear();
      }

      widget.onUpdateTagList!(list);
    }
  }

  showHint() {
    // findParent();
    // popupService.overlayEntry.value = overlayEntryBuilder();
    // Overlay.of(textFieldKey.currentContext!).insert(popupService.overlayEntry.value!);
    // popupService.isHintShown.value = true;
  }

  findParent() {
    RenderBox renderBox = textFieldKey.currentContext!.findRenderObject() as RenderBox;

    setState(() {
      position = renderBox.localToGlobal(Offset.zero); // get textfield position
      size = renderBox.size; // get textfield size
    });
  }

  overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        double heightOverlay = height(152);

        return Positioned(
          top: Get.height - position!.dy > heightOverlay
              ? position!.dy
              : null, // Check if the rest height of screen is enough to show overlay widget or not
          bottom: Get.height - position!.dy > heightOverlay ? null : Get.height - position!.dy - size!.height,
          left: position!.dx,
          height: heightOverlay,
          width: size!.width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: Component.radius.radius8,
              // boxShadow: Component.shadow.widgetShadow,
            ),
            child: ListView.separated(
              padding: padding(all: 16),
              itemCount: widget.selectList!.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 5,
              ),
              itemBuilder: (context, index) => renderSelectRow(index, widget.selectList![index]),
            ),
          ),
        );
      },
    );
  }

  renderSelectRow(int index, String text) {
    return InkWell(
      onTap: () {
        // popupService.closeHint();
        textEditingController.text = text;
        widget.onSelectString!(text);
      },
      child: Ink(
        padding: padding(bottom: 12, top: index == 0 ? 0 : 12),
        child: Text(
          text,
        ),
      ),
    );
  }

  Future<bool> willPopCallback() async {
    // if (popupService.isHintShown.value) {
    //   popupService.closeHint();
    //   return Future.value(false);
    // }
    return Future.value(true);
  }

  renderLabel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.labelText ?? "",
          style: Component.textStyle.size_14_w_400
              .copyWith(color: isError ? Component.color.warningColor : Component.color.dark),
        ),
        widget.isRequired!
            ? Text(
                " *",
                style: Component.textStyle.size_14_w_400.copyWith(color: Component.color.warningColor),
              )
            : Container()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var isDisable = widget.readOnly! ||
        widget.onSelectString != null ||
        widget.onSelectDate != null ||
        widget.onUpdateTagList != null;
    
    return WillPopScope(
      onWillPop: willPopCallback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              key: textFieldKey,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TextFormField(
                    onChanged: widget.onChanged,
                    focusNode: widget.focusNode ?? focusNode,
                    controller: textEditingController,
                    readOnly: isDisable,
                    enabled: !isDisable,
                    style: widget.style ?? Component.textStyle.size_14_w_400.copyWith(color: Component.color.dark),
                    inputFormatters: getInputFormatters(),
                    keyboardType: widget.inputType ??
                        (widget.isPhone
                            ? TextInputType.number
                            : widget.isArea!
                                ? TextInputType.multiline
                                : TextInputType.text),
                    obscureText: widget.isPassword,
                    minLines: widget.isArea! ? widget.minLines : 1,
                    maxLines: widget.isArea! ? widget.maxLines : 1,
                    validator: (value) {
                      if (widget.isValid != null) {
                        setState(() {
                          isError = !widget.isValid!()!;
                        });
                        if (isError) {
                          return "";
                        }
                      }
                      return null;
                    },
                    cursorColor: Component.color.secondary,
                    decoration: InputDecoration(
                      label: widget.labelText != null ? renderLabel() : null,
                      filled: true,
                      isDense: true,
                      fillColor: widget.backgroundTextField ?? Component.color.secondary.withOpacity(0.05),
                      contentPadding: padding(vertical: 16, horizontal: 16),
                      border: widget.borderCustom ?? Component.border.borderTextField,
                      enabledBorder: widget.borderCustom ?? Component.border.borderTextField,
                      focusedBorder: widget.borderCustom ?? Component.border.borderTextField,
                      disabledBorder: widget.borderCustom ?? Component.border.borderDisableTextField,
                      errorBorder: widget.errorBorderCustom ?? Component.border.borderErrorTextField,
                      focusedErrorBorder: widget.errorBorderCustom ?? Component.border.borderErrorTextField,
                      hintText: widget.hintText,
                      hintStyle: widget.hintStyle ??
                          Component.textStyle.size_14_w_400.copyWith(color: Component.color.dark.withOpacity(0.5)),
                      suffixIconConstraints: BoxConstraints(maxWidth: width(24 + 16 + 8)),
                      suffixIcon: widget.suffixPath != null
                          ? Padding(
                              padding: padding(left: 16, right: 8),
                              child: SvgImageCustom(
                                imagePath: widget.suffixPath!,
                                size: widget.sizeSuffix ?? 24,
                                color: Component.color.secondary,
                              ),
                            )
                          : (widget.onSelectString != null ||
                                  widget.onSelectDate != null ||
                                  widget.onUpdateTagList != null
                              ? Padding(
                                  padding: padding(right: 16, left: 8),
                                  child: SvgImageCustom(
                                    imagePath: widget.onSelectDate != null
                                        ? Component.iconPaths.ic_apple
                                        : Component.iconPaths.ic_apple,
                                    size: 24,
                                  ),
                                )
                              : null),
                      prefixIconConstraints: BoxConstraints(maxWidth: width(24 + 16 + 8)),
                      errorStyle: TextStyle(height: 0, fontSize: 0, color: Component.color.disable),
                      prefixIcon: widget.prefixPath != null
                          ? Padding(
                              padding: padding(left: 16, right: 8),
                              child: GestureDetector(
                                onTap: () {
                                  if (widget.onTapPrefix != null) {
                                    widget.onTapPrefix!();
                                  }
                                },
                                child: SvgImageCustom(
                                  imagePath: widget.prefixPath!,
                                  size: widget.sizePrefix ?? 24,
                                  color: Component.color.secondary,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
                  tagList.isNotEmpty
                      ? Container(
                          margin: padding(left: 16, right: 16 + 24 + 8),
                          height: height(24),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: tagList.length,
                            itemBuilder: (context, index) => Container(
                              height: height(24),
                              padding: padding(horizontal: 8),
                              margin: padding(right: 4),
                              decoration: BoxDecoration(
                                  borderRadius: Component.radius.radius39, color: Component.color.disable),
                              child: Row(
                                children: [
                                  Text(
                                    tagList[index],
                                    style: Component.textStyle.size_14_w_400,
                                  ),
                                  SizedBox(
                                    width: width(4),
                                  ),
                                  GestureDetector(
                                    onTap: () => onRemoveTag(tagList[index]),
                                    child: SvgImageCustom(
                                      imagePath: Component.iconPaths.default_avatar_png,
                                      size: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          isError
              ? Padding(
                  padding: padding(left: 4, top: 4),
                  child: Text(widget.errorText ?? "",
                      style: Component.textStyle.size_14_w_400.copyWith(color: Component.color.warningColor)),
                )
              : Container()
        ],
      ),
    );
  }
}
