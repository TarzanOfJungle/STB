This repository contains source code of Split the Bill application.
Authors: Ondřej Němec, Michal Musil

# Split the bill

is Flutter framework application for handling group shoppings, calculating spendings and it offers a chat between users. Users log in with created accounts. It is written in Dart language and use principles such as dependency injection with inversion of control, local caching or push notifications. Simple repository pattern was used for code hierarchy. The application work in connection with C# REST API, which is **not** part of this repository. STB is optimized for mobile devices and works on both android and IOS.

# Some screenshots:

| Home screen            | User chat              |
| ---------------------- | ---------------------- |
| ![Screenshot_20240606-172837](https://github.com/TarzanOfJungle/STB/assets/119301349/deb72363-324a-4ecf-b575-96b3b4f14b82) | ![Screenshot_20240606-172929](https://github.com/TarzanOfJungle/STB/assets/119301349/05c88bea-89ff-4b69-8350-814a21835dfc) |


| Shopping screen                     | Items screen                         |
| ----------------------------------- | ----------------------------------- |
| ![Screenshot_20240606-172948](https://github.com/TarzanOfJungle/STB/assets/119301349/6137abff-2371-43b9-a8a5-f8f663a9b3e0) | ![Screenshot_20240606-172939](https://github.com/TarzanOfJungle/STB/assets/119301349/c6c3518e-a7fe-4cee-b098-c1a5d03833fc) |


| Purchase               | Dialog                 |
| ---------------------- | ---------------------- |
| ![Screenshot_20240606-173034](https://github.com/TarzanOfJungle/STB/assets/119301349/8933bc8c-de54-4f3f-8c61-666604e621d7) | ![Screenshot_20240606-173138](https://github.com/TarzanOfJungle/STB/assets/119301349/a3572172-7e0c-4ceb-a10b-2abd3221a913) |


The code is mostly located in `/lib` and divided into subdirectories based on apps feature.

To start the app run `lib/main.dart`

The containarization is missing and will be added for possible deployment.

This app was developed in the end of 2023 in about three months as part of a school project.
