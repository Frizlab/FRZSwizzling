/*
Copyright 2019 happn

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */

/* See http://stackoverflow.com/questions/2567498/objective-c-categories-in-static-library
 * Objective-c categories are not real symbols. So a lib with only categories
 * is seen as empty by the linker and it compiles with a warning. To get rid of
 * the warning, this symbol is added to categories-only libs. */
void _HPNSwizzling_heyTheresARealSymbolInThisLib_(void) {}
