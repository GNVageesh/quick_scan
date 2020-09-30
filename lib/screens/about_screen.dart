import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_scan/Utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

void launchWebsite(String urlString) async {
  if (await canLaunch(urlString)) {
    await launch(urlString);
  } else {
    print("Couldn't launch the url");
  }
}

class AboutScreen extends StatelessWidget {
  static String route = "AboutScreen";
  final String vjlink = "http://codeintheblog.unaux.com/contact-me/";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 10,
          centerTitle: true,
          backgroundColor: CupertinoColors.activeOrange,
          title: RichText(
            text: TextSpan(
              text: 'About',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: primaryColor),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: 'Quick',
                      style: TextStyle(
                          fontSize: 20,
                          color: CupertinoColors.activeGreen,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                            text: 'Scan',
                            style: TextStyle(color: Colors.green)),
                        TextSpan(
                          text:
                              ' is a app that creates PDFs out-off the pictures you take. There is no watermark being added to your PDFs.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Center(
                  child: Text(
                    "Developed By :-",
                    style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.activeBlue,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ContactCard(
                      name: "GN Vageesh",
                      link: vjlink,
                      image: AssetImage('assets/ic_launcher.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String link;
  final String name;
  final AssetImage image;

  const ContactCard({Key key, this.link, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => launchWebsite(link),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        elevation: 10.0,
        child: Container(
          margin: EdgeInsets.all(8.0),
          height: size.width * 0.4,
          width: size.width * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: CupertinoColors.opaqueSeparator,
                radius: size.width * 0.13,
                backgroundImage: image,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                'Tap for more',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
