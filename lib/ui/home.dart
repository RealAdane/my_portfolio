import 'package:flutter/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/models/contact.dart';
import 'package:portfolio/models/experience.dart';
import 'package:portfolio/utils/screen/screen_utils.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'dart:html' as html;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF7F8FA),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (ScreenUtil.getInstance().setWidth(108))), //144
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: LayoutBuilder(builder: (context, constraints) {
            return _buildBody(context, constraints);
          }),
        ),
      ),
    );
  }



  //Screen Methods:-------------------------------------------------------------
  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
        child: ResponsiveWidget(
          largeScreen: _buildLargeScreen(context),
          mediumScreen: _buildMediumScreen(context),
          smallScreen: _buildSmallScreen(context), key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: _buildContent(context)),
                _buildIllustration(),
              ],
            ),
          ),
          _buildFooter(context)
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: _buildContent(context)),
              ],
            ),
          ),
          _buildFooter(context)
        ],
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(flex: 1, child: _buildContent(context)),
          Divider(),
          _buildCopyRightText(context),
          SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),

        ],
      ),
    );
  }

  // Body Methods:--------------------------------------------------------------
  Widget _buildIllustration() {
    return Image.network(
      Assets.me,
      height: ScreenUtil.getInstance().setWidth(345), //480.0
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 0.0),
        _buildFullName(context),
        SizedBox(height: 4.0),
        _buildTitle(context),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 24.0),

        ResponsiveWidget.isSmallScreen(context)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildExperinces(),
                    SizedBox(height: 24.0), 
                _buildProjectInfo(context),
                  SizedBox(height: 24.0),
                  _buildContact(context),
                
                ],
              )
            : _buildContactAndExperience(context),

               
      ],
    );
  }

  Widget _buildProjectInfo(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
 Text(
      "Final Project",
      style: TextStyles.sub_heading,
    ),
    
Text(
    'Bubbles, I Built a location-based social network app with Flutter, using GPS, WiFi, NFC, and Bluetooth for precise location and improved user interactions,\nVideo Demonstration:',
    style: TextStyles.body.copyWith(
    color: Color(0xFF45405B),
    ),
    ),


      SizedBox(height: 8.0),
      GestureDetector(
        onTap: () {
        
          html.window.open('https://youtu.be/ADrEeZ47ztg', 'YouTube');
        },
         child: Image.asset(
        Assets.youtube,
        width: 50, 
        height: 50,
    ),
      ),
    ],
  );
}



  Widget _buildFullName(BuildContext context) {
    return RichText(
      text: TextSpan(
 
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: Strings.first_name,
            style: TextStyles.heading.copyWith(
              fontFamily: Fonts.nexa_light,
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 45.0,
            ),
          ),
          TextSpan(
            text: Strings.last_name,
            style: TextStyles.heading.copyWith(
              color: Color(0xFF50AFC0),
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 45.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      ResponsiveWidget.isSmallScreen(context)
          ? Strings.headline
          : Strings.headline.replaceFirst(RegExp(r' f'), '\nf'),
      style: TextStyles.sub_heading,
    );
  }



  Widget _buildContactAndExperience(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _buildExperinces(),
        ),
        SizedBox(width: 40.0),
      
         Expanded(child: _buildProjectInfo(context)),
        SizedBox(width: 40.0),
        Expanded(
          flex: 1,
          child: _buildContact(context),
        ),
      ],
    );
  }

  // Experiences Methods:
  final experiencesList = [
    Experience(
      '2022',
      '2023',
      'Specialized in AWS cloud architecture, focusing on system monitoring, data management (SQL), visualization (Grafana), Python scripting, and cloud security',
      'Software Engineer, KLA',
    ),
    Experience(
      'Apr 2021',
      'Apr 2022',
      'Proficient in Python scripting for Jenkins pipeline integration and developing standalone software tools',
      'QA Automation, KLA',
    ),
      Experience(
      '2020',
      '2021',
      'provided dedicated tutoring in Mathematics and Physics to small study groups',
      'Teaching Assistant, SCE',
    ),
    Experience(
      '2019',
      '2023',
      'Grade: 90\nPursued in-depth studies in Security during my degree, enhancing my expertise in the digital security domain',
      'Software Engineer Student, SCE',
    ),
  ];

  Widget _buildExperinces() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
      "Experience",
      style: TextStyles.sub_heading,
    ),
        SizedBox(height: 8.0),
        _buildExperienceTimeline(),
      ],
    );
  }
 
  Widget _buildExperienceTimeline() {
    final List<Widget> widgets = experiencesList
        .map((experience) => _buildExperienceTile(experience))
        .toList();
    return Column(children: widgets);
  }

  Widget _buildExperienceTile(Experience experience) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '${experience.post}',
            style: TextStyles.company,
          ),
          Text(
            '${experience.organization}',
            style: TextStyles.body.copyWith(
              color: Color(0xFF45405B),
            ),
          ),
          Text(
            '${experience.from}-${experience.to}',
            style: TextStyles.body,
          ),
        ],
      ),
    );
  }

// Contact Methods:
final List<ContactMethod> contactMethods = [
  ContactMethod(
    label: 'Email',
    iconPath: Assets.gmail, 
    url: 'mailto:real.adane.adgo@gmail.com',
  ),
  ContactMethod(
    label: 'LinkedIn',
    iconPath: Assets.linkedin, 
    url: 'https://www.linkedin.com/in/adaneadgo',
  ),
  ContactMethod(
    label: 'GitHub',
    iconPath: Assets.github, 
    url: 'https://github.com/RealAdane',
  ),
];

Widget _buildContact(BuildContext context) {
  final List<Widget> widgets = contactMethods
      .map((method) => Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: _buildContactButton(context, method),
          ))
      .toList();

  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Contact",
        style: TextStyles.sub_heading,
      ),
      Column(children: widgets),
    ],
  );
}

Widget _buildContactButton(BuildContext context, ContactMethod method) {
  return InkWell(
    onTap: () {
      html.window.open(method.url, method.label);
    },
    child: Image.asset(
      method.iconPath,
      width: 50, 
      height: 50,
    ),
  );
}


  // Footer Methods:------------------------------------------------------------
  Widget _buildFooter(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                child: _buildCopyRightText(context),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCopyRightText(BuildContext context) {
    return Text(
      Strings.rights_reserved,
      style: TextStyles.body1.copyWith(
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 8 : 10.0,
      ),
    );
  }

}