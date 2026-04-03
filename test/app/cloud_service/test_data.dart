final mockCategoryDocsData = [
  {
    'id': 'cat-1',
    'names': {
      'en': 'Mugs and Cups',
      'fi': 'Mukit ja kupit',
    },
  },
  {
    'id': 'cat-2',
    'names': {
      'en': 'Plates and Bowls',
      'fi': 'Lautaset ja kulhot',
    },
  },
  {
    'id': 'cat-3',
    'names': {
      'en': 'Kitchen Accessories',
      'fi': 'Keittiötarvikkeet',
    },
  },
  {
    'id': 'cat-4',
    'names': {
      'en': 'Empty Category',
      'fi': 'Tyhjä kategoria',
    },
  },
];

final mockCollectionDocsData = [
  {
    'id': 'coll-1',
    'names': {
      'en': 'White on White',
      'fi': 'Valkoista valkoisella',
    },
  },
  {
    'id': 'coll-2',
    'names': {
      'en': 'Yellow Cottage',
      'fi': 'Keltainen mökki',
    },
  },
  {
    'id': 'coll-3',
    'names': {
      'en': 'Empty Collection',
      'fi': 'Tyhjät kokoelmat',
    },
  },
];

// mock_design_docs_data.dart

final mockDesignDocsData = [
  {
    'id': 'design-1',
    'names': {
      'en': 'Waking Light',
      'fi': 'Heräävä valo',
    },
    'categoryIds': [
      'cat-1', // mugsAndCups.id
    ],
    'description': {
      'en':
          'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
      'fi':
          'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.',
    },
    'details': {
      'en': '''{
        "Approximate capacity": "75 ml",
        "Dimensions": "Height ~6.5 cm, Diameter ~6.8 cm",
        "Material": "High-fired stoneware",
        "Glaze": "Commercial glaze",
        "Finish": "Glazed inside, unglazed outside"
      }''',
      'fi': '''{
        "Arvioitu tilavuus": "75 ml",
        "Mitat": "Korkeus ~6.5 cm, Halkaisija ~6.8 cm",
        "Materiaali": "Korkeassa lämpötilassa poltettu kivitavara",
        "Päällyste": "Teollinen lasitus",
        "Viimeistely": "Lasitettu sisältä, lasittamaton ulkoa"
      }''',
    },
  },
  {
    'id': 'design-2',
    'names': {
      'en': 'Soft Linen',
      'fi': 'Pehmeä pellava',
    },
    'categoryIds': [
      'cat-1', // mugsAndCups.id
      'cat-3', // kitchenAccessories.id
    ],
    'description': {
      'en':
          'The soft linen design is inspired by the natural beauty of linen fabric. The gentle texture and muted colors create a calming and serene atmosphere, perfect for any kitchen or dining space.',
      'fi':
          'Pehmeä pellavadesign on inspiroitunut pellavakankaan luonnollisesta kauneudesta. Pehmeä rakenne ja hillityt värit luovat rauhoittavan ja rauhallisen tunnelman, joka sopii täydellisesti mihin tahansa keittiöön tai ruokailutilaan.',
    },
    'details': {
      'en': '''{
        "Approximate capacity": "300 ml",
        "Dimensions": "Height ~8 cm, Diameter ~7.5 cm",
        "Material": "High-fired stoneware",
        "Glaze": "Commercial glaze",
        "Finish": "Glazed inside, unglazed outside"
      }''',
      'fi': '''{
        "Arvioitu tilavuus": "300 ml",
        "Mitat": "Korkeus ~8 cm, Halkaisija ~7.5 cm",
        "Materiaali": "Korkeassa lämpötilassa poltettu kivitavara",
        "Päällyste": "Teollinen lasitus",
        "Viimeistely": "Lasitettu sisältä, lasittamaton ulkoa"
      }''',
    },
  },
  {
    'id': 'design-3',
    'names': {
      'en': 'Salt & Foam',
      'fi': 'Suola ja vaahto',
    },
    'categoryIds': [
      'cat-2', // platesAndBowls.id
    ],
    'description': {
      'en':
          'The Salt & Foam design captures the essence of coastal living. The textured surface and ocean-inspired colors evoke a sense of tranquility and connection to nature, making it a perfect addition to any table setting.',
      'fi':
          'Suola ja vaahto -design vangitsee rannikkotunnelman. Teksturoitu pinta ja merihenkiset värit herättävät rauhoittavan tunnelman ja yhteyden luontoon, mikä tekee siitä täydellisen lisän mihin tahansa kattaukseen.',
    },
    'details': {
      'en': '''{
        "Approximate capacity": "500 ml",
        "Dimensions": "Height ~10 cm, Diameter ~9 cm",
        "Material": "High-fired stoneware",
        "Glaze": "Commercial glaze",
        "Finish": "Glazed inside, unglazed outside"
      }''',
      'fi': '''{
        "Arvioitu tilavuus": "500 ml",
        "Mitat": "Korkeus ~10 cm, Halkaisija ~9 cm",
        "Materiaali": "Korkeassa lämpötilassa poltettu kivitavara",
        "Päällyste": "Teollinen lasitus",
        "Viimeistely": "Lasitettu sisältä, lasittamaton ulkoa"
      }''',
    },
  },
];

final mockPieceDocsData = [
  {
    'id': 'pcs-1',
    'serialNumber': 3,
    'designId': 'design-1', // wakingLight.id
    'imageFileNames': [
      'waking_light_1.jpg',
      'waking_light_2.jpg',
    ],
    'collectionId': 'coll-1', // whiteOnWhite.id
  },
  {
    'id': 'pcs-2',
    'serialNumber': 4,
    'designId': 'design-2', // softLinen.id
    'imageFileNames': [
      'soft_linen_1.jpg',
      'soft_linen_2.jpg',
    ],
    'collectionId': 'coll-1',
  },
  {
    'id': 'pcs-3',
    'serialNumber': 5,
    'designId': 'design-2',
    'imageFileNames': [
      'soft_linen_3.jpg',
      'soft_linen_4.jpg',
    ],
    'collectionId': 'coll-1',
  },
  {
    'id': 'pcs-4',
    'serialNumber': 6,
    'designId': 'design-3', // saltAndFoam.id
    'collectionId': 'coll-2', // yellowCottage.id
    'imageFileNames': [
      'salt_and_foam_1.jpg',
      'salt_and_foam_2.jpg',
    ],
  },
  {
    'id': 'pcs-5',
    'serialNumber': 7,
    'designId': 'design-3',
    'collectionId': 'coll-2',
    'imageFileNames': [
      'salt_and_foam_3.jpg',
      'salt_and_foam_4.jpg',
    ],
  },
  {
    'id': 'pcs-6',
    'serialNumber': 8,
    'designId': 'design-3',
    'collectionId': 'coll-2',
    'imageFileNames': [
      'salt_and_foam_5.jpg',
      'salt_and_foam_6.jpg',
    ],
  },
];
