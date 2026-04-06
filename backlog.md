⏺ Assessment: Strong senior move. Type-safe routes eliminate an entire class of string-path bugs at       
  compile time. The GoRouteData classes already exist — they're just not wired up. Finishing this is      
  low-risk and pays forward.                                                                              
                                                                                                          
  ---                                                                                                   
  Here's what needs to change across 4 files + codegen:                                                   
                                                                                                          
  1. routes.dart — the annotation is structurally broken
  Currently all routes are nested as sub-routes of HomeRoute (producing paths like //pieces). Fix:        
  - One @TypedGoRoute annotation per top-level route                                                      
  - Sub-routes (:id) use relative path ':id', not absolute                                                
  - Add buildPage override returning NoTransitionPage (replaces current manual pageBuilder)               
  - Drop fromRoute from PieceRoute — it's not a URL param; leaving it would silently become a query param 
                                                                                                          
  2. route_controller.dart — replace the entire GoRoute tree with:                                        
  GoRouter(routes: $appRoutes)                                                                            
                                                                                                          
  3. Two manual string navigation call sites:                                                             
  - piece_card.dart:65 → PieceRoute(id: piece.id).go(context)
  - pottery_grid.dart:156 → needs to dispatch to CollectionRoute or CategoryRoute based on                
  widget.routeRoot (need to check)
                                                                                                          
  4. Run codegen after changes.
                                                                                                          
  footer.dart, drawer_route_item.dart, horizontal_navigation.dart already read from *Route.path static    
  constants via RouteEnum — no change needed there.
                                                                                                          
  Want me to proceed with all of it?



QUESTIONS:
* Is it a good idea to have scroll data and route history data in the same bloc? And is a separate "god" of scrolling data a good idea at all or should we instead have the scroll data somewhere else, for example in the pieces bloc?
* Is it a good idea to have the term "bloc" in any file or folder? It would be the same as having "products_array" somewhere?








Now I see it. The real top-level issues:                                                                                        
  3. Tests are broken                                                                                                                                  
  products_bloc_test.dart lines 39 and 47 call ProductsRepository() with no arguments, but the constructor requires CommonCloudService. These tests
  don't compile. Nobody is running the tests.                                                                           



                                                                                
  5. DesignsBloc fires at startup but has no UI                                                         
  It's registered, seeded, and fetches data — but nothing reads it yet. This is wasted work at startup.
                                                                                                          
  Which of these do you want to tackle first?                                                                                                                                                  
                                              

⏺ Here are the top issues, ordered by impact:                                                                                                          
                                                                                                                                                       
  ---                                                                                                                                                  
  1. Silent error swallowing in CommonCloudService                                                                                                     
  print(e) + return null means Firestore failures are invisible. No user feedback, no debugging. Fix: propagate errors via Either/exceptions and handle
   them in blocs.                                                                                                                                      
                                                                                                                                                       
  2. Direct getIt.get<>() calls inside widgets                                                                                                         
  Widgets reaching into the service locator directly couples presentation to DI infrastructure, kills testability, and breaks the BLoC contract. Fix:  
  inject blocs only through BlocProvider/context.read<>().                                                                                             
                                                                                                                                                                                                                                                                          
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

                                                                                                                                       
