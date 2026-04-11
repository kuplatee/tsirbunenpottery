                                                                                    


                                                                                                        
  6. Contact feature breaks the architecture contract — MEDIUM                                          
  contact_form.dart:103–107 has a FIXME stub — no BLoC, no repository, form data is lost. Every other
  feature follows the data flow contract; Contact is the exception and shouldn't be.                    


                   
                                  
  photo_with_fallback.dart:191 — _fadeInOpacityAnimation is created and checked for null in build()   
  (line 58) as a guard to show the placeholder, but the animation value is never applied to any     
  widget. The fade-in effectively doesn't work; _controller.forward() runs but nothing listens to it  
  visually. This is either dead code or a broken feature.
                                                                                                      
  ---             
  Design Smells
               
  bloc_status_view.dart:19 — status.status == Status.loading — double .status is a naming smell.
  BlocStatus wraps a field called status of type Status. The outer type and inner field share the same
   concept. Better: status.isLoading or rename the wrapper to BlocState.                            
                                                                                                      
  app_bar_customized.dart:11–12 — mobilePadding and desktopPadding are both 10.0. The conditional
  branching at lines 53–55 is dead code; the distinction is meaningless.                              
                                                                                                      
  items_grid.dart:77 — designsById map is rebuilt on every build() call. Since widget.designs is an
  input, this should be computed in initState/didUpdateWidget or via a late field.                    
                                                                                                      
  items_grid.dart:167 — Magic number / 3 with no comment or named constant. What does dividing by 3
  mean here? Should be a named constant like kNarrowColumnsCount.                                     
                                                                                                      
  ---                             
  Code Hygiene                                                                                        
                  
                                                      
                                                                                                      
  Dead/commented-out code — multiple files:
  - app_bar_customized.dart:45 — commented-out color option                                           
                                                           
  Unresolved FIXMEs in production code — app_bar_left_actions.dart:48,55, items_grid.dart:84,160.   
  FIXME comments should be tracked as issues, not left inline indefinitely.                           
                                                                                                    
  drawer_for_app_bar.dart:38 — The outer .toList() on a list literal is redundant.                    
                                                                                                    
  items_grid.dart:83 — EdgeInsets.only(right: 0.0, top: 30.0) — right: 0.0 is the default; omit it.


             
  

  3. Tests are broken                                                                                                                                  
  products_bloc_test.dart lines 39 and 47 call ProductsRepository() with no arguments, but the constructor requires CommonCloudService. These tests
  don't compile. Nobody is running the tests.                                                                           

                                                                                                                                    
  9. Contact form is a dead stub                                                                                                                       
  A visible submit button that does nothing is a UX lie. Fix: either wire it up or hide the button until implemented.
                                                                                                                                                       
  10. Test setup bypasses constructor requirements
  ProductsRepository() called without its required CommonCloudService in tests — tests either don't compile or use a hole in the API. Fix: pass a      
  mock/fake, establish the real constructor contract in tests.   

                                                                                                                                       
