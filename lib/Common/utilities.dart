


import 'package:flutter/material.dart';

SizedBox h5 = const SizedBox(
  height: 5,
);
SizedBox h10 = const SizedBox(
  height: 10,
);
SizedBox h15 = const SizedBox(
  height: 15,
);
SizedBox h20 = const SizedBox(
  height: 20,
);
SizedBox w5 = const SizedBox(
  width: 5,
);
SizedBox w10 = const SizedBox(
  width: 10,
);
SizedBox w15 = const SizedBox(
  width: 15,
);
SizedBox w20 = const SizedBox(
  width: 20,
);

SnackBar comingSoonSnackBar() {
  return SnackBar(
    content: const Text('Coming soon!'),
    action: SnackBarAction(
      label: 'Yay!',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}