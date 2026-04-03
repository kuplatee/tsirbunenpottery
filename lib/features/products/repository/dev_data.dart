import 'package:madmudmobile/features/products/domain/models/category/category.dart';
import 'package:madmudmobile/features/products/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/domain/models/piece/piece.dart';
import 'package:madmudmobile/features/products/domain/models/products/products.dart';
import 'package:madmudmobile/localization/languages.dart';

// Define Collections
const whiteOnWhite =
    Collection(id: '4f7c938e-863d-4b91-9026-f097b5b5041a', description: {
  Language.en: 'Description for White on White collection',
  Language.fi: 'Kuvaus valkoista valkoisella -kokoelmalle'
}, names: {
  Language.en: 'White on White',
  Language.fi: 'Valkoista valkoisella'
});
const yellowCottage =
    Collection(id: 'c2dce464-9259-4e2c-8f13-748dc9c12ff7', description: {
  Language.en: 'Description for Yellow Cottage collection',
  Language.fi: 'Kuvaus keltaisesta mökistä -kokoelmalle'
}, names: {
  Language.en: 'Yellow Cottage',
  Language.fi: 'Keltainen mökki'
});
const midnightForest =
    Collection(id: 'acc3a2c1-c002-4a6e-a05f-d6c60b9ae43f', description: {
  Language.en: 'Description for Midnight Forest collection',
  Language.fi: 'Kuvaus keskiyön metsä -kokoelmalle'
}, names: {
  Language.en: 'Midnight Forest',
  Language.fi: 'Keskiyön metsä'
});
const oceanBreeze =
    Collection(id: '91b5b4de-bb86-4de6-b33d-7c3e0ac83c9a', description: {
  Language.en: 'Description for Ocean Breeze collection',
  Language.fi: 'Kuvaus meren tuuli -kokoelmalle'
}, names: {
  Language.en: 'Ocean Breeze',
  Language.fi: 'Meren tuuli'
});

// Test Categories
const mugsAndCups = Category(
    id: 'a5d3e4e6-45f5-48f3-98a7-944a634c5680',
    names: {Language.en: 'Mugs and Cups', Language.fi: 'Mukit ja kupit'});
const platesAndBowls = Category(
    id: '11f3b13c-716e-4ef7-952e-2b6d8a77df51',
    names: {Language.en: 'Plates and Bowls', Language.fi: 'Laudat ja kulhot'});
const kitchenAccessories = Category(
    id: '984a27dc-e017-4f86-a019-08354ec01b9c',
    names: {
      Language.en: 'Kitchen Accessories',
      Language.fi: 'Keittiö tarvikkeet'
    });

// Define Designs
final goodMorning =
    Design(id: 'd7c17494-2c2b-4a3b-84f2-11f1391e9d6e', categoryIds: [
  mugsAndCups.id
], names: {
  Language.en: 'Espresso cup Rwanda',
  Language.fi: 'Laiska aamu'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final wakingLight =
    Design(id: 'a5d3e4e6-45f5-48f3-98a7-944a634c5680', categoryIds: [
  mugsAndCups.id,
  kitchenAccessories.id
], names: {
  Language.en: 'Coffee cup Ethiopia',
  Language.fi: 'Heräävä valo'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final softLinen =
    Design(id: '11f3b13c-716e-4ef7-952e-2b6d8a77df51', categoryIds: [
  mugsAndCups.id,
  kitchenAccessories.id
], names: {
  Language.en: 'Soft Linen',
  Language.fi: 'Pehmeä pellava'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final sunlitGarden =
    Design(id: '5b91aaec-7a39-45db-a43d-c0f4c7c28d62', categoryIds: [
  mugsAndCups.id
], names: {
  Language.en: 'Sunlit Garden',
  Language.fi: 'Aurinkopuutarha'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final buttercup =
    Design(id: '58f49d0b-b2f3-4725-99c6-1a6fa8e14397', categoryIds: [
  platesAndBowls.id
], names: {
  Language.en: 'Buttercup',
  Language.fi: 'Voikukka'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final lemonLight =
    Design(id: '5f177701-9b52-4c4d-91df-3b437a3510a3', categoryIds: [
  platesAndBowls.id
], names: {
  Language.en: 'Lemon Light',
  Language.fi: 'Sitruunavalo'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final goldenHour =
    Design(id: '07f7b118-eac6-42cf-9828-77810dce05f1', categoryIds: [
  platesAndBowls.id
], names: {
  Language.en: 'Golden Hour',
  Language.fi: 'Kultainen hetki'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final rusticCharm =
    Design(id: '207da2ac-5b9e-456a-91a4-7f0e55b92d2b', categoryIds: [
  platesAndBowls.id
], names: {
  Language.en: 'Rustic Charm',
  Language.fi: 'Maalaistunnelma'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final cornfield =
    Design(id: '48f935ec-92d7-4027-91b3-379bf29bc2eb', categoryIds: [
  platesAndBowls.id
], names: {
  Language.en: 'Cornfield',
  Language.fi: 'Maissipelto'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final sunbeam =
    Design(id: '92a270a3-e2d4-4c6a-9a5d-bfa560c6e679', categoryIds: [
  platesAndBowls.id
], names: {
  Language.en: 'Sunbeam',
  Language.fi: 'Auringonsäde'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final mossTwilight =
    Design(id: '7f68b927-6810-4f30-9d45-0104e65c2be3', categoryIds: [
  kitchenAccessories.id
], names: {
  Language.en: 'Moss Twilight',
  Language.fi: 'Sammalen hämärä'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final blueDrift =
    Design(id: '8c4f82c5-6402-4a7a-90cc-884ec112cb4d', categoryIds: [
  platesAndBowls.id,
  kitchenAccessories.id
], names: {
  Language.en: 'Blue Drift',
  Language.fi: 'Sininen virta'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final saltAndFoam =
    Design(id: '984a27dc-e017-4f86-a019-08354ec01b9c', categoryIds: [
  kitchenAccessories.id
], names: {
  Language.en: 'Salt & Foam',
  Language.fi: 'Suola ja vaahto'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final pebbleShore =
    Design(id: '663924d4-1c40-4e1f-8e59-9493aa2b4e49', categoryIds: [
  mugsAndCups.id,
  kitchenAccessories.id
], names: {
  Language.en: 'Pebble Shore',
  Language.fi: 'Sora ranta'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});
final seaGlass =
    Design(id: 'ed2a1a8c-bde2-4a92-b9d2-fb8889a6537b', categoryIds: [
  kitchenAccessories.id
], names: {
  Language.en: 'Sea Glass',
  Language.fi: 'Meren lasi'
}, description: {
  Language.en:
      'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
  Language.fi:
      'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
}, details: {
  Language.en: {
    'Approximate capacity': '75 ml',
    'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
    'Material': 'High-fired stoneware',
    'Glaze': 'Commercial glaze',
    'Finish': 'Glazed inside, unglazed outside'
  },
  Language.fi: {
    'Arvioitu tilavuus': '75 ml',
    'Mitat': 'Korkeus ~6.5 cm, Halkaisija ~6.8 cm',
    'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
    'Päällyste': 'Teollinen lasitus',
    'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
  }
});

// Define Pieces
final pieces = [
  Piece(
      id: 'ff0fe6b3-fa6e-4a23-b349-b7f628db6926',
      // serialNumber: 1,
      designId: goodMorning.id,
      imageFileNames: ['good_morning_1.jpg'],
      collectionId: whiteOnWhite.id,
      sold: false),
  Piece(
      id: '0f88f0fa-3c93-437e-b46c-b93c1cb1a733',
      // serialNumber: 2,
      designId: goodMorning.id,
      imageFileNames: ['good_morning_2.jpg'],
      collectionId: whiteOnWhite.id,
      sold: false),
  Piece(
      id: '0ea63bfd-a29c-4cfe-ae2a-0a8f4f77a30a',
      // serialNumber: 3,
      designId: wakingLight.id,
      imageFileNames: ['waking_light_1.jpg'],
      collectionId: whiteOnWhite.id,
      sold: false),
  Piece(
      id: '5b5cfc91-37b1-4a3b-b900-2613361069d4',
      // serialNumber: 4,
      designId: softLinen.id,
      imageFileNames: ['soft_linen_1.jpg'],
      collectionId: whiteOnWhite.id,
      sold: false),
  Piece(
      id: '7420ff74-e073-4cbb-b027-5aa91361916f',
      // serialNumber: 5,
      designId: softLinen.id,
      imageFileNames: ['soft_linen_2.jpg'],
      collectionId: whiteOnWhite.id,
      sold: false),
  Piece(
      id: '69af1dba-055e-4493-8c89-d20177b67d5c',
      // serialNumber: 7,
      designId: sunlitGarden.id,
      imageFileNames: ['sunlit_garden_1.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: '9f52afce-13c7-491c-92de-d0e193f23bc3',
      // serialNumber: 8,
      designId: sunlitGarden.id,
      imageFileNames: ['sunlit_garden_2.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: '65a14786-7756-4ab0-a19d-acd2ace0734e',
      // serialNumber: 9,
      designId: buttercup.id,
      imageFileNames: ['buttercup_1.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: 'cb000204-b7b0-4adc-8b12-0185c93dc0d0',
      // serialNumber: 10,
      designId: buttercup.id,
      imageFileNames: ['buttercup_2.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: '3e453fdd-a011-4eb9-86ca-bf927a4e1204',
      // serialNumber: 11,
      designId: buttercup.id,
      imageFileNames: ['buttercup_3.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: '1ce2e768-4cd3-48b0-a37f-65d0e0606580',
      // serialNumber: 12,
      designId: lemonLight.id,
      imageFileNames: ['lemon_light_1.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: '48d88578-458a-4fc5-a91c-03b4de162838',
      // serialNumber: 13,
      designId: lemonLight.id,
      imageFileNames: ['lemon_light_2.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: '71aacfa9-9b87-426c-ba58-eb969aa13112',
      // serialNumber: 14,
      designId: goldenHour.id,
      imageFileNames: ['golden_hour_1.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: 'c23b7ac5-b8d7-4f24-a25b-dc404fed4bbe',
      // serialNumber: 15,
      designId: goldenHour.id,
      imageFileNames: ['golden_hour_2.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: 'be52a0e3-31af-4724-9073-1c2f14d45e28',
      // serialNumber: 16,
      designId: rusticCharm.id,
      imageFileNames: ['rustic_charm_1.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: '4517636c-ee3b-4980-b084-968bafa53473',
      // serialNumber: 17,
      designId: rusticCharm.id,
      imageFileNames: ['rustic_charm_2.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: 'fd5a0e16-41c7-4a70-b10c-4731c46e13fc',
      // serialNumber: 18,
      designId: rusticCharm.id,
      imageFileNames: ['rustic_charm_3.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: 'a738a8b2-2686-40f9-b7a4-08129cd150f1',
      // serialNumber: 19,
      designId: cornfield.id,
      imageFileNames: ['cornfield_1.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: '15ca2e39-8335-4d8e-93c4-44a039925d2a',
      // serialNumber: 20,
      designId: sunbeam.id,
      imageFileNames: ['sunbeam_1.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: '6755cbcd-d014-47c9-98e9-135dac76da58',
      // serialNumber: 21,
      designId: sunbeam.id,
      imageFileNames: ['sunbeam_2.jpg'],
      collectionId: yellowCottage.id,
      sold: false),
  Piece(
      id: 'f75eff1b-9904-488d-a885-961e56c3e661',
      // serialNumber: 22,
      designId: mossTwilight.id,
      imageFileNames: ['moss_twilight_1.jpg'],
      collectionId: midnightForest.id,
      sold: false),
  Piece(
      id: 'd2d5f6b8-8600-4fe8-86e8-fbdce220462a',
      // serialNumber: 23,
      designId: mossTwilight.id,
      imageFileNames: ['moss_twilight_2.jpg'],
      collectionId: midnightForest.id,
      sold: false),
  Piece(
      id: '685a0dfb-d25a-45be-b0a8-559931650140',
      // serialNumber: 24,
      designId: mossTwilight.id,
      imageFileNames: ['moss_twilight_3.jpg'],
      collectionId: midnightForest.id,
      sold: false),
  Piece(
      id: 'b77a33cd-c76e-4476-854c-3eaa374f09b8',
      // serialNumber: 25,
      designId: blueDrift.id,
      imageFileNames: ['blue_drift_1.jpg'],
      collectionId: oceanBreeze.id,
      sold: false),
  Piece(
      id: 'a8a4eca6-6d59-4bb9-958d-355aaa2f32ed',
      // serialNumber: 26,
      designId: blueDrift.id,
      imageFileNames: ['blue_drift_2.jpg'],
      collectionId: oceanBreeze.id,
      sold: false),
  Piece(
      id: '4083298a-9b40-41eb-b912-494e5bb6baa2',
      // serialNumber: 27,
      designId: saltAndFoam.id,
      imageFileNames: ['salt_and_foam_1.jpg'],
      collectionId: oceanBreeze.id,
      sold: false),
  Piece(
      id: '39b2ce1a-f03f-4c7b-9c72-0e4793f65083',
      // serialNumber: 28,
      designId: pebbleShore.id,
      imageFileNames: ['pebble_shore_1.jpg'],
      collectionId: oceanBreeze.id,
      sold: false),
  Piece(
      id: '1afb9e69-8924-4ccc-b28a-ce6075692e91',
      // serialNumber: 29,
      designId: pebbleShore.id,
      imageFileNames: ['pebble_shore_2.jpg'],
      collectionId: oceanBreeze.id,
      sold: false),
  Piece(
      id: 'b3aba2bb-e38c-4745-a69e-dc24a1fa8e6d',
      // serialNumber: 30,
      designId: pebbleShore.id,
      imageFileNames: ['pebble_shore_3.jpg'],
      collectionId: oceanBreeze.id,
      sold: false),
  Piece(
      id: 'bc2f3e16-577a-45a2-97c7-434a037e11e7',
      // serialNumber: 31,
      designId: seaGlass.id,
      imageFileNames: ['sea_glass_1.jpg'],
      collectionId: oceanBreeze.id,
      sold: false),
  Piece(
      id: '6d77f82f-95b1-41a9-8737-5e06f620f674',
      // serialNumber: 32,
      designId: seaGlass.id,
      imageFileNames: ['sea_glass_2.jpg'],
      collectionId: oceanBreeze.id,
      sold: false),
  Piece(
      id: 'd951486b-8738-4d50-9a53-073d93913a90',
      // serialNumber: 33,
      designId: seaGlass.id,
      imageFileNames: ['sea_glass_3.jpg'],
      collectionId: oceanBreeze.id,
      sold: false),
];

final products = Products(
  collections: [whiteOnWhite, yellowCottage, midnightForest, oceanBreeze],
  categories: [mugsAndCups, platesAndBowls, kitchenAccessories],
  designs: [
    goodMorning,
    wakingLight,
    softLinen,
    sunlitGarden,
    buttercup,
    lemonLight,
    goldenHour,
    rusticCharm,
    cornfield,
    sunbeam,
    mossTwilight,
    blueDrift,
    saltAndFoam,
    pebbleShore,
    seaGlass
  ],
  pieces: pieces,
);
