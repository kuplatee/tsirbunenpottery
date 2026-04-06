enum Translation {
  // Page names:
  home,
  pieces,
  categories,
  collections,
  designs,
  story,
  contact,
  // App and app bar labels:
  tradeName,
  appShortDescription,
  chineseCharacter,
  // Languages:
  english,
  finnish,
  // // All designs title:
  // allDesigns,
  allPieces,
  // Design view:
  designNotFound,
  productDetails,
  foodSafetyTitle,
  foodSafetyDetails,
  // Contact us view:
  contactUs,
  contactTitlePlaceholder,
  contactMessagePlaceholder,
  submitLabel,
  emailCopiedToClipboard,
  tapToCopyEmail,
  contactEmail,
  storyOnContactPage,
  dataLoadError,
}

extension TranslationToKey on Translation {
  String toKey() {
    return toString().split('.').last;
  }
}
