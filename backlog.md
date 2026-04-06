                                                                                    
  3. Tests are broken                                                                                                                                  
  products_bloc_test.dart lines 39 and 47 call ProductsRepository() with no arguments, but the constructor requires CommonCloudService. These tests
  don't compile. Nobody is running the tests.                                                                           


                              
                                                                                                                                         
  1. Silent error swallowing in CommonCloudService                                                                                                     
  print(e) + return null means Firestore failures are invisible. No user feedback, no debugging. Fix: propagate errors via Either/exceptions and handle
   them in blocs.                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                  
  4. No error state rendered in UI                                                                                                                     
  Blocs have a Status.error field but zero pages actually check it. Users see an empty screen on Firestore failure. Fix: all BlocBuilders must handle  
  loading/error/data states explicitly.                                                                                                                
                                                                                                                                                       
  5. (item as dynamic).id in ProductsRepository                                                                                                        
  as dynamic is a type-safety escape hatch that defeats null safety and generics. Fix: use a proper generic or typed abstraction.                      
                                                                                                                                                       
  6. Language.values.firstWhere(...) without fallback                                                                                                  
  A typo in a Firestore key throws an uncaught StateError and crashes the parse. Fix: firstWhereOrNull + log + fallback.                               
                                                                                                                                                       
  7. firstWhere crash risk in products_view.dart                                                                                                       
  If a category/collection ID doesn't match, it throws. Fix: firstWhereOrNull with a safe fallback string.                                             
                                                                                                                                                       
  8. No loading/error bloc states in organizeProductsData                                                                                              
  Data transform silently drops orphaned references. On a production app this masks data integrity bugs. Fix: log discarded items, surface counts in   
  debug mode.                                                                                                                                          
                  
  9. Contact form is a dead stub                                                                                                                       
  A visible submit button that does nothing is a UX lie. Fix: either wire it up or hide the button until implemented.
                                                                                                                                                       
  10. Test setup bypasses constructor requirements
  ProductsRepository() called without its required CommonCloudService in tests — tests either don't compile or use a hole in the API. Fix: pass a      
  mock/fake, establish the real constructor contract in tests.   

                                                                                                                                       
