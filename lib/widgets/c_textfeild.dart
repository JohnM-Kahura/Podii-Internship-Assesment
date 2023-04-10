import 'package:flutter/material.dart';

Widget customTextFeild(double height, double width, String hint,
    TextEditingController controller, BuildContext context) {
  return LayoutBuilder(builder: (context, constraint) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 204, 199, 199),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            if (constraint.maxWidth < 760) const Icon(Icons.search),
            if (constraint.maxWidth > 760)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  size: 40,
                ),
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: TextField(
                obscureText: false,
                controller: controller,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: constraint.maxWidth < 760
                      ? const TextStyle(fontSize: 15)
                      : const TextStyle(fontSize: 30),
                  fillColor: const Color.fromARGB(255, 204, 199, 199),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 5.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 204, 199, 199),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 204, 199, 199),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            )
          ],
        ));
  });
}
