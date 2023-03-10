import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/model/github_release.dart';
import 'package:http/http.dart' as http;

import 'generated/l10n.dart';

class IosHomePage extends StatefulWidget {
  const IosHomePage({super.key});

  @override
  State<IosHomePage> createState() => _IosHomePageState();
}

class _IosHomePageState extends State<IosHomePage> {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('ios'),);
  }
}

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
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, '/ios');
              }, child: Text("Go To iOS")),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Spacer(flex: 1,),

                          Expanded(
                            flex: 2,
                            child: CupertinoButton(
                              color: const CupertinoDynamicColor.withBrightness(
                                  color: CupertinoColors.label,
                                  darkColor:
                                      CupertinoColors.lightBackgroundGray),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (iOSRelease != null) {
                                  _launchUrl(iOSRelease!);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Not Found Release")));
                                }
                              },
                              child: CupertinoButtonCustomChild(text: S.of(context).DownloadIPA, iconData: FontAwesomeIcons.download,)
                            ),
                          ),
                          Spacer(flex: 1,),

                          Expanded(
                            flex: 2,

                            child: CupertinoButton(
                              color: const CupertinoDynamicColor.withBrightness(
                                  color: CupertinoColors.label,
                                  darkColor:
                                      CupertinoColors.lightBackgroundGray),
                              padding: EdgeInsets.zero,
                              child: CupertinoButtonCustomChild(text: S.of(context).DownloadIPA, iconData: FontAwesomeIcons.download,),
                              onPressed: () {
                                if (androidRelease != null) {
                                  _launchUrl(androidRelease!);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Not Found Release")));
                                }
                              },
                            ),
                          ),
                          Spacer(flex: 1,),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(flex: 1,),
                          Expanded(
                            flex: 2,

                            child: CupertinoButton(
                              color: const CupertinoDynamicColor.withBrightness(
                                  color: CupertinoColors.label,
                                  darkColor:
                                      CupertinoColors.lightBackgroundGray),
                              padding: EdgeInsets.zero,
                              child: CupertinoButtonCustomChild(text: S.of(context).DownloadPlayStore, iconData: FontAwesomeIcons.googlePlay,),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(S.current.ComingSoon)));
                              },
                            ),
                          ),
                          Spacer(flex: 1,),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          S.of(context).Copyright,
                          style: const TextStyle(
                              color: CupertinoColors.inactiveGray),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
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

class CupertinoButtonCustomChild extends StatelessWidget {
  const CupertinoButtonCustomChild({
    super.key,
    required this.text, required this.iconData,
  });
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 1,),
        Icon(iconData),
        Spacer(flex: 1,),
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 50,
            child: Center(
              child: AutoSizeText(
                text,
                minFontSize: 8,
                maxLines: 1,
              ),
            ),
          ),
        ),
        Spacer(flex: 1,),

      ],
    );
  }
}
