import 'package:madmudmobile/localization/languages.dart';

const description_fi = '''
Etsitkö kahvimukia, nuudelikulhoa tai salaattilautasta? 
Piristäisikö posliinisormus tai seinäreliefi arkeasi?
Nämä ja paljon muuta löydät 
Tsirbunen Potteryn valikoimasta.

Kaikki tuotteet on yksitellen käsin rakennettu, 
eikä kahta täysin samanlaista tuotetta löydy. 
Valikoima elää: kun yksi työ lähtee uuteen kotiin, 
tilalle tulee jotain muuta. 

Jos valikoimasta ei löydy oikeanlaista tuotetta, 
ota rohkeasti yhteyttä - kuvan kanssa tai ilman!
Toteutan mielelläni tilaustöitä.
''';

String description_en = '''
Looking for a coffee mug, noodle bowl, or salad plate?
Would a porcelain ring or a wall relief bring 
something extra to your everyday life?
These and much more can be found in 
the Tsirbunen Pottery collection.

Each piece is hand-built one by one,
and no two items are ever exactly the same. 
The collection is always evolving:
when something goes out, something else comes in.

I also make custom pieces to order, so if 
you don’t find quite what you’re looking for,
feel free to get in touch 
(with or without a reference image).
''';

String description(Language language) {
  return switch (language) {
    Language.fi => description_fi,
    Language.en => description_en,
  };
}

String tagline(Language language) {
  return switch (language) {
    Language.fi => '- ylellisempää arkea ripaus kerrallaan -',
    Language.en => '- a touch of luxury to everyday life -',
  };
}

String title = 'tsirbunen pottery';
