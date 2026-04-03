import 'package:madmudmobile/features/products/domain/models/category/category.dart';
import 'package:madmudmobile/features/products/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/domain/models/piece/piece.dart';
import 'package:madmudmobile/features/products/domain/models/products/products.dart';
import 'package:madmudmobile/localization/languages.dart';

// Test Collections
const whiteOnWhite = Collection(id: 'coll-1', description: {
  Language.en: "Test description for White on White collection.",
  Language.fi: "Testikuvaus White on White -kokoelmalle."
}, names: {
  Language.en: 'White on White',
  Language.fi: 'Valkoista valkoisella'
});
const yellowCottage = Collection(id: 'coll-2', description: {
  Language.en: "Test description for Yellow Cottage collection.",
  Language.fi: "Testikuvaus Yellow Cottage -kokoelmalle."
}, names: {
  Language.en: 'Yellow Cottage',
  Language.fi: 'Keltainen mökki'
});
const emptyCollection = Collection(id: 'coll-3', description: {
  Language.en: "Test description for Empty Collection.",
  Language.fi: "Testikuvaus tyhjälle kokoelmalle."
}, names: {
  Language.en: 'Empty Collection',
  Language.fi: 'Tyhjät kokoelmat'
});

// Test Categories
const mugsAndCups = Category(
    id: 'cat-1',
    names: {Language.en: 'Mugs and Cups', Language.fi: 'Mukit ja kupit'});
const platesAndBowls = Category(id: 'cat-2', names: {
  Language.en: 'Plates and Bowls',
  Language.fi: 'Lautaset ja kulhot'
});
const kitchenAccessories = Category(id: 'cat-3', names: {
  Language.en: 'Kitchen Accessories',
  Language.fi: 'Keittiötarvikkeet'
});
const emptyCategory = Category(
    id: 'cat-4',
    names: {Language.en: 'Empty Category', Language.fi: 'Tyhjä kategoria'});

// Test Designs
final wakingLight = Design(
  id: 'design-1',
  names: {Language.en: 'Waking Light', Language.fi: 'Heräävä valo'},
  categoryIds: [mugsAndCups.id],
  description: {
    Language.en:
        'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.',
    Language.fi:
        'Rakastan hitaiden aamukahvien rituaalia, ja nämä latte-mukit on tehty juuri sitä varten. Mukit ovat tilavia ja mukautuvat käteen hyvin, joten ne sopivat täydellisesti suosikkilatteesi, mukavaan teehetkeen tai jopa kuumaan suklaaseen kermavaahdon kera.'
  },
  details: {
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
  },
);
final softLinen = Design(
  id: 'design-2',
  names: {Language.en: 'Soft Linen', Language.fi: 'Pehmeä pellava'},
  categoryIds: [mugsAndCups.id, kitchenAccessories.id],
  description: {
    Language.en:
        'The soft linen design is inspired by the natural beauty of linen fabric. The gentle texture and muted colors create a calming and serene atmosphere, perfect for any kitchen or dining space.',
    Language.fi:
        'Pehmeä pellavadesign on inspiroitunut pellavakankaan luonnollisesta kauneudesta. Pehmeä rakenne ja hillityt värit luovat rauhoittavan ja rauhallisen tunnelman, joka sopii täydellisesti mihin tahansa keittiöön tai ruokailutilaan.'
  },
  details: {
    Language.en: {
      'Approximate capacity': '300 ml',
      'Dimensions': 'Height ~8 cm, Diameter ~7.5 cm',
      'Material': 'High-fired stoneware',
      'Glaze': 'Commercial glaze',
      'Finish': 'Glazed inside, unglazed outside'
    },
    Language.fi: {
      'Arvioitu tilavuus': '300 ml',
      'Mitat': 'Korkeus ~8 cm, Halkaisija ~7.5 cm',
      'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
      'Päällyste': 'Teollinen lasitus',
      'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
    }
  },
);
final saltAndFoam = Design(
  id: 'design-3',
  names: {Language.en: 'Salt & Foam', Language.fi: 'Suola ja vaahto'},
  categoryIds: [platesAndBowls.id],
  description: {
    Language.en:
        'The Salt & Foam design captures the essence of coastal living. The textured surface and ocean-inspired colors evoke a sense of tranquility and connection to nature, making it a perfect addition to any table setting.',
    Language.fi:
        'Suola ja vaahto -design vangitsee rannikkotunnelman. Teksturoitu pinta ja merihenkiset värit herättävät rauhoittavan tunnelman ja yhteyden luontoon, mikä tekee siitä täydellisen lisän mihin tahansa kattaukseen.'
  },
  details: {
    Language.en: {
      'Approximate capacity': '500 ml',
      'Dimensions': 'Height ~10 cm, Diameter ~9 cm',
      'Material': 'High-fired stoneware',
      'Glaze': 'Commercial glaze',
      'Finish': 'Glazed inside, unglazed outside'
    },
    Language.fi: {
      'Arvioitu tilavuus': '500 ml',
      'Mitat': 'Korkeus ~10 cm, Halkaisija ~9 cm',
      'Materiaali': 'Korkeassa lämpötilassa poltettu kivitavara',
      'Päällyste': 'Teollinen lasitus',
      'Viimeistely': 'Lasitettu sisältä, lasittamaton ulkoa'
    }
  },
);

// Test Pieces
final testPieces = [
  Piece(
      id: 'pcs-1',
      // serialNumber: 3,
      designId: wakingLight.id,
      imageFileNames: ['waking_light_1.jpg', 'waking_light_2.jpg'],
      collectionId: whiteOnWhite.id),
  Piece(
      id: 'pcs-2',
      // serialNumber: 4,
      designId: softLinen.id,
      imageFileNames: ['soft_linen_1.jpg', 'soft_linen_2.jpg'],
      collectionId: whiteOnWhite.id),
  Piece(
      id: 'pcs-3',
      // serialNumber: 5,
      designId: softLinen.id,
      imageFileNames: ['soft_linen_3.jpg', 'soft_linen_4.jpg'],
      collectionId: whiteOnWhite.id),
  Piece(
      id: 'pcs-4',
      // serialNumber: 6,
      designId: saltAndFoam.id,
      imageFileNames: ['salt_and_foam_1.jpg', 'salt_and_foam_2.jpg'],
      collectionId: yellowCottage.id),
  Piece(
      id: 'pcs-5',
      // serialNumber: 7,
      designId: saltAndFoam.id,
      imageFileNames: ['salt_and_foam_3.jpg', 'salt_and_foam_4.jpg'],
      collectionId: yellowCottage.id),
  Piece(
      id: 'pcs-6',
      // serialNumber: 8,
      designId: saltAndFoam.id,
      imageFileNames: ['salt_and_foam_5.jpg', 'salt_and_foam_6.jpg'],
      collectionId: yellowCottage.id),
];

final testPiecesById = {
  for (final piece in testPieces) piece.id: piece,
};

final testProducts = Products(
  pieces: testPieces,
  designs: [wakingLight, softLinen, saltAndFoam],
  categories: [mugsAndCups, platesAndBowls, kitchenAccessories, emptyCategory],
  collections: [whiteOnWhite, yellowCottage, emptyCollection],
);
