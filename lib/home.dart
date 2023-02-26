import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/model/github_release.dart';
import 'package:http/http.dart' as http;

import 'firebase_options.dart';
import 'generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GhRelease? release;
  String? iOSRelease;
  String? androidRelease;

  @override
  void initState() {
    _requestGhRelease();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    super.initState();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _requestGhRelease() async {
    Uri uri = Uri.parse(
        'https://api.github.com/repos/andychucs/conning_tower/releases/latest');
    var response = await http.get(uri);

    setState(() {
      release = GhRelease.fromJson(json.decode(response.body));
      var asserts = release?.assets;
      if (asserts!.length >= 2) {
        asserts.forEach((element) {
          if (element.browserDownloadUrl.endsWith("arm64-v8a-release.apk")) {
            androidRelease = element.browserDownloadUrl;
          }
          if (element.browserDownloadUrl.endsWith("ipa")) {
            iOSRelease = element.browserDownloadUrl;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(primaryColor: CupertinoColors.label),
      debugShowCheckedModeBanner: false,
      title: '${S.of(context).Title} - ${S.of(context).TitleDescription}',
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: AutoSizeText(
                S.of(context).Title,
                maxLines: 1,
              ),
            ),
          ),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                iconSize: 26,
                onPressed: () {
                  _launchUrl("https://github.com/andychucs/conning_tower");
                },
                icon: const Icon(FontAwesomeIcons.github),
              ),
              IconButton(
                iconSize: 26,
                onPressed: () {
                  _launchUrl("https://twitter.com/conntower");
                },
                icon: const Icon(FontAwesomeIcons.twitter),
              ),
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(top: 100, bottom: 100),
                      child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/logo.png')),
                    ),
                    SizedBox(
                      height: 100,
                      child: FittedBox(
                        child: Text(
                          S.of(context).Title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child:
                          Center(child: Text(S.of(context).TitleDescription)),
                    ),
                    Center(child: Text("Latest Version: ${release?.tagName}")),
                    SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                              child: const AutoSizeText("Download for iOS/iPadOS"),
                              color: CupertinoDynamicColor.withBrightness(
                                  color: CupertinoColors.label,
                                  darkColor:
                                      CupertinoColors.lightBackgroundGray),
                              onPressed: () {
                                if (iOSRelease != null) {
                                  _launchUrl(iOSRelease!);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Not Found Release")));
                                }
                              }),
                          SizedBox(
                            width: 20,
                          ),
                          CupertinoButton(
                              color: CupertinoDynamicColor.withBrightness(
                                  color: CupertinoColors.label,
                                  darkColor:
                                      CupertinoColors.lightBackgroundGray),
                              child: const AutoSizeText("Download for Android"),
                              onPressed: () {
                                if (androidRelease != null) {
                                  _launchUrl(androidRelease!);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Not Found Release")));
                                }
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
