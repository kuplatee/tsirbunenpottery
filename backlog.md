                                                                                    
                                                                                                          
⏺ Here are the top priority findings, roughly in order of impact:                                       
                                                                                                        
                                                                                               
  3. Force-unwrapped theme properties — MEDIUM                                                          
  contact_form.dart:115,131,137,145, piece_card.dart:76, drawer_route_item.dart, etc. use ! on nullable
  theme properties (bodyMedium!, labelMedium!). One custom theme or platform edge case = crash.         
                                                                                                        
  4. Navigation model is split-brain — MEDIUM                                                           
  lib/widgets/app_bar/app_bar_left_actions.dart:45–57 has a string-contains heuristic for detecting     
  sub-routes and a hardcoded path alias hack. A FIXME acknowledges the browser back button bypasses the 
  entire custom history stack — the two navigation models are never reconciled.                         
                                                                                                        
  5. Error details thrown away — MEDIUM                                                                 
  BLoCs store BlocStatus(Status.error, message: e.toString()), but                                      
  lib/widgets/bloc_status_view/bloc_status_view.dart renders a generic Translation.dataLoadError and    
  ignores status.message. Debugging is blind in prod.
                                                                                                        
  6. Contact feature breaks the architecture contract — MEDIUM                                          
  contact_form.dart:103–107 has a FIXME stub — no BLoC, no repository, form data is lost. Every other
  feature follows the data flow contract; Contact is the exception and shouldn't be.                    
                  
  7. ImageStreamListener never disposed — MEDIUM                                                        
  lib/widgets/photo_with_fallback/photo_with_fallback.dart:136 has a FIXME: the listener registered on
  the image stream is never explicitly removed. Leaks on long sessions with many images.                
  
  ---                                                                                                   
  Which of these do you want to tackle first? Issues #1 and #2 are the most likely to cause silent
  production bugs.  
  
  
  
  
  3. Tests are broken                                                                                                                                  
  products_bloc_test.dart lines 39 and 47 call ProductsRepository() with no arguments, but the constructor requires CommonCloudService. These tests
  don't compile. Nobody is running the tests.                                                                           

                                                                                                                                    
  9. Contact form is a dead stub                                                                                                                       
  A visible submit button that does nothing is a UX lie. Fix: either wire it up or hide the button until implemented.
                                                                                                                                                       
  10. Test setup bypasses constructor requirements
  ProductsRepository() called without its required CommonCloudService in tests — tests either don't compile or use a hole in the API. Fix: pass a      
  mock/fake, establish the real constructor contract in tests.   

                                                                                                                                       
