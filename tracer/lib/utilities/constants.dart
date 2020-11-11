import 'package:flutter/material.dart';

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 8.0,
);

const kAssessmentTextStyle = TextStyle(fontSize: 18, color: Colors.red);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(50),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(colors: [
    Colors.blue,
    Colors.redAccent,
  ]),
  border: Border.all(),
  borderRadius: BorderRadius.circular(50),
);

final kHeadingStyle =
    TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w600);

final kBottomModalSheet =
    TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold);

final kRecommendationText1 = 'Maintain Social Distance';
final kRecommendationText2 = 'Take Self Asssesment Test';
final kRecommendationText3 = 'Check App Regulerly for Updates';

final kSocialDistanceText1 = 'Say Hi without HandShakes';
final kSocialDistanceText2 = 'Avoid Social Gatherings';
final kSocialDistanceText3 = 'Keep Distance atleast 6ft.';

//Frequently asked questions

final kFaqQuestion1 = 'What is Covid-19';
final kFaqAnswer1 =
    'COVID-19 is the infectious disease caused by the coronavirus, SARS-CoV-2, which is a respiratory pathogen. WHO first learned of this new virus from cases in Wuhan, People’s Republic of China on 31 December 2019.';

final kFaqQuestion2 = 'When should I get a test for Covid-19';
final kFaqAnswer2 =
    'Anyone with symptoms should be tested, wherever possible. People who do not have symptoms but have had close contact with someone who is, or may be, infected may also consider testing – check with your local health guidelines. While a person is waiting for test results, they should remain isolated from others. Where testing capacity is limited, tests should first be done for those at higher risk of infection, such as health workers, and those at higher risk of severe illness such as older people, especially those living in seniors’ residences or long-term care facilities.';

final kFaqQuestion3 = 'What about rapid test?';
final kFaqAnswer3 =
    'Rapid tests (sometimes known as a rapid diagnostic test – RDT) detect viral proteins (known as antigens). Samples are collected from the nose and/or throat with a swab. These tests are cheaper than PCR and will offer results more quickly, although they are generally less accurate. We are still learning about how well they perform and when to use them.';

final kFaqQuestion4 =
    'What should individuals do if they think they may have been infected?';
final kFaqAnswer4 =
    'Those who think they may have been exposed to coronavirus, either through travel to an affected area or close contact with someone who has a confirmed case, should call a healthcare professional if they have any of the symptoms.It is important to call first, so that the clinic or hospital can prepare and prevent the spread of infection. Stay home and away from other people if you might have been exposed to COVID-19.';

final kFaqQuestion5 = 'How is the novel coronavirus transmitted?';
final kFaqAnswer5 =
    'The virus that causes COVID-19 is thought to spread mainly through close contact from person-to-person (within about 6 feet). It can be spread through respiratory droplets when an infected person coughs, sneezes, or talks. Recent studies have indicated that COVID-19 may be spread by people who are not showing symptoms, which is why face masks are recommended.';

final kFaqQuestion6 = 'What can people with diabetes do to protect themselves?';
final kFaqAnswer6 =
    'Individuals who have diabetes may be at greater risk of severe illness from COVID-19. If you have diabetes, it is important to continue taking your medication and insulin as usual, test your blood sugar as instructed, and keep track of the results. Stay home as advised, wear a mask, and stay at least six feet away from other people when you do go out in public. Make sure that you have easy-to-fix foods at home and at least a two-week supply of medications and diabetes management supplies.';

final kFaqQuestion7 =
    'What can people with heart disease do to protect themselves?';
final kFaqAnswer7 =
    'COVID-19 can damage the respiratory system and make it harder for the heart to function properly. If you have heart disease, it is important to take your medication exactly as prescribed, including medication to treat high cholesterol or high blood pressure. Make sure that you have at least a two-week supply of heart disease medications and continue to manage and control your blood pressure.';

final kFaqQuestion8 =
    'What can people with lung disease (like asthma) do to protect themselves?';
final kFaqAnswer8 =
    'COVID-19 can cause asthma attacks, may lead to pneumonia and other serious illnesses, and might also cause flare-ups of other chronic lung diseases. If you have lung disease, it is important to keep taking your current medications, including corticosteroids (or “steroids”), and avoid triggers that make your symptoms worse. If you have asthma, it is important to follow your asthma action plan, know how to use your inhaler, and keep your asthma under control.';


//Assessment Questions

final kAssessmentQuestion1=' Are you experiencing any of the following symptoms?';
final kAssessmentQuestion2= ' Have you ever had any one of the following:';
final kAssessmentQuestion3= ' Have you travelled anywhere internationally in the last14 days?';
final kAssessmentQuestion4= '  Which of the following applies to you?';
final kAssessmentQuestion5= 'I have recently interacted or lived with someone who has tested positive for COVID-19';
final kAssessmentQuestion6='I am a healthcare worker and I examined a COVID-19 confirmed case without protective gear.';