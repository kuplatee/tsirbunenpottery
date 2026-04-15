import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/localization/translations.dart';

class Fi implements Translations {
  @override
  String get language => Language.fi.name;

  @override
  String translate(Translation key) => all[key.name] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'TSIRBUNEN POTTERY',
        'appShortDescription': 'clay to unique treasures',
        'chineseCharacter': '泥',
        'tradeNameBeginning': 'TSIRBUNEN',
        'home': 'Koti',
        'pieces': 'Tuotteet',
        'categories': 'Kategoriat',
        'collections': 'Kokoelmat',
        'designs': 'Mallit',
        'story': 'Tarina',
        'contact': 'Yhteystiedot',
        'english': 'Englanti',
        'finnish': 'Suomi',
        // 'allDesigns': 'Kaikki mallit',
        'allPieces': 'Kaikki tuotteet',
        'designNotFound': 'Mallia ei löydy',
        'productDetails': 'Tuotteen tiedot',
        'foodSafetyTitle': 'Elintarviketurvallisuus',
        'foodSafetyDetails': foodSafetyDetails,
        'contactUs': 'Ota yhteyttä',
        'contactTitlePlaceholder': 'Otsikko...',
        'contactMessagePlaceholder': 'Viesti...',
        'submitLabel': 'Lähetä',
        'emailCopiedToClipboard': 'Sähköposti kopioitu leikepöydälle',
        'tapToCopyEmail': 'Kopioi sähköposti napauttamalla sitä!',
        'contactEmail': 'tsirbunenpottery@gmail.com',
        'storyOnContactPage':
            'Käsityönä valmistettu, intohimolla poltettu - jokaisella kappaleella on tarina. Löydä keramiikkaa, joka tuntuu kodilta.',
        'dataLoadError': 'Tietojen lataus epäonnistui. Yritä myöhemmin uudelleen.',
      };
}

const List<String> foodSafetyInfo = [
  'Käytämme kaupallisesti valmistettuja lasitteita, jotka on tarkoitettu elintarviketurvallisiksi.',
  'Emme kuitenkaan suorita itsenäistä laboratoriotestausta jokaiselle yksittäiselle kappaleelle.',
  'Tarkista kaikki esineet, joita aiot käyttää ruoan kanssa, varmistaaksesi että',
  'lasitettu pinta on täysin ehjä,',
  'siinä ei ole halkeamia, halkeilua tai siruja, ja että',
  'kaikki elintarvikkeiden kanssa kosketuksissa olevat alueet ovat täysin lasitettuja.',
  'Jos olet epävarma, suosittelemme käyttämään esinettä vain koristeellisiin tarkoituksiin.',
  'Turvallisuutesi on meille tärkeää! Kiitos ymmärryksestäsi!'
];

String foodSafetyDetails = foodSafetyInfo.join(' ');
