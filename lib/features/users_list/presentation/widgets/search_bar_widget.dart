import 'package:bilytica_assignment/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: const BoxDecoration(
          color: AppPallete.kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppPallete.kWhiteColor,
                        )),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Dating List',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppPallete.kWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: AppPallete.kWhiteColor,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppPallete.kWhiteColor,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintStyle: const TextStyle(color: AppPallete.kGreyColor),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: AppPallete.kBlackColor),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
