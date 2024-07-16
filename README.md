# PML CSS Playground

[![PML Version][PML badge]][Get PML]&nbsp;
[![Ruby][Ruby badge]][Ruby link]&nbsp;
[![Dart Sass][sass badge]][sass link]&nbsp;
[![MIT License][License badge]][LICENSE]&nbsp;

A playground for testing [PML] stylesheets.

- <https://github.com/tajmone/pml-css-playground>

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Project Structure](#project-structure)
- [About](#about)
- [The Themes](#the-themes)
    - [Why Themes Instead of Stylesheets?](#why-themes-instead-of-stylesheets)
    - [Adding New Themes](#adding-new-themes)
- [The Sample Documents](#the-sample-documents)
- [License](#license)
- [Links](#links)

<!-- /MarkdownTOC -->

-----

# Project Structure

- [`/_assets/`][_assets/] — toolchain assets.
- [`/css__default-new/`][css__default-new/] — an attempt to Sassify and improve the default theme.
- [`/samples/`][samples/] — shared sample and test PML docs.
- [`LICENSE`][LICENSE] — MIT License.
- [`Rakefile`][Rakefile] — build automation script (Ruby/Rake)


# About

The goal of this repository is to explore alternative stylesheets for [PML], the Practical Markup Language lightweight syntax by [Christian Neumanns].

I had attempted a similar project before, as part of the **[PML Playground]** project, which included a [stylesheets sub-project] (among others), but it soon became too cumbersome to maintain a single shared build script for all its projects, especially due to the frequent breaking changes of PML updates. Also, many of the sub-projects in the **PML Playground** have gone stale, for one reason or another.

So I've now moved the old **PML Style Sheets** project to this new dedicated repository, which will replace it entirely.


# The Themes

- `/css__*/`

Every folder with a name starting in `css__` is treated as a "theme" by the Rakefile, which will automatically handle its build, provided that the theme contains a Sass/SCSS source named `sass/styles.scss`, which Rake will compile to `css/styles.css`.

For each theme, every shared sample document from the [`/samples/`][samples/] folder will be converted to HTML in the theme root folder, using the theme stylesheet.

Any `*.pml` document present in the theme folder will also be converted to HTML in place.

## Why Themes Instead of Stylesheets?

They are called "themes" and not just "stylesheets" because in the future they might also provide custom HTML templates along with the CSS stylesheet, i.e. when PMLC will properly support custom templates (right now, only the header and footer can be customized). Furthermore, a theme might also include other dependencies assets, like JavaScript, images, etc., therefore not every theme will consist of a just a single stylesheet.

## Adding New Themes

To add a new theme simply create a folder named `css__` + the name of your theme, e.g.:

- `/css__my-theme/`

Then you need to add the main Sass source file:

- `/css__my-theme/sass/styles.scss`

That's it! Rake will take care of everything, including tracking dependencies in the `sass/` folder (`_*.scss` and `*.css`). Your stylesheet will automatically be compiled to:

- `/css__my-theme/css/styles.css`

Any `*.pml` test/sample documents in your theme folder will also be automatically tracked and converted by Rake, along with the shared documents.

Rake will also add a dedicated task for your theme, named as your theme folder minus the `css__` prefix (e.g. `my-theme` in our example).


# The Sample Documents

The PML documents in the [`/samples/`][samples/] folder are intended as test documents for the new themes, and also as references for comparison, since they will also be converted to HTML in their source folder, using the default PML stylesheet.

In the course of time, the sample documents will eventually cover all PML elements, their various combinations, and edge cases that need to be handled properly by any stylesheet.


# License

- [`LICENSE`][LICENSE]

The **PML CSS Playground** is Copyright (c) by [Tristano Ajmone], released under the terms of the MIT License.

```
MIT License

Copyright (c) 2024 Tristano Ajmone

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```

-------------------------------------------------------------------------------

# Links

- [www.pml-lang.dev] — PML website:
    + [PML Changelog]
    + [PML Nodes Reference Manual]
    + [PML User Manual]
    + [PMLC Commands Reference Manual]

<!-- MarkdownTOC:excluded -->
## Articles

Articles by [Christian Neumanns]:

- [_We need a new document markup language — here is why_][2019article]
- _[The advantages of Document Markup Languages vs WYSIWYG editors]_

<!-- MarkdownTOC:excluded -->
## PML on GitHub

- [@pml-lang] — __PML Lang__ organization:
    + [pml-lang/pml-companion] — source code (Java) repository of the PML Companion tool.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

<!-- PML -->

[www.pml-lang.dev]: https://www.pml-lang.dev "Visit PML website"
[PML]: https://www.pml-lang.dev "Visit PML website"
[Get PML]: https://www.pml-lang.dev/downloads/install.html "Go to the PML download page"
[PML binaries]: https://www.pml-lang.dev/downloads/install.html "Download precompiled PML binaries"

<!-- PML Docs & Articles -->

[PML Changelog]: https://www.pml-lang.dev/docs/changelog/index.html "View the PML Changelog"
[PML Nodes Reference Manual]: https://www.pml-lang.dev/docs/reference_manual/index.html "Read the online PML Nodes Reference Manual"
[PML User Manual]: https://www.pml-lang.dev/docs/user_manual/index.html "Read the online PML User Manual"
[PMLC Commands Reference Manual]: https://www.pml-lang.dev/docs/commands_manual/index.html "Read the online PMLC Commands Reference Manual"

[2019article]: https://www.freecodecamp.org/news/we-need-a-new-document-markup-language-c22e0ec44e15/ "Read full article at freeCodeCamp"
[The advantages of Document Markup Languages vs WYSIWYG editors]: https://www.pml-lang.dev/docs/articles/advantages-markup-language-vs-word-processor/index.html "Read full article at PMl website"

<!-- PML GitHub -->

[@pml-lang]: https://github.com/pml-lang "View GitHub profile of the Practical Markup Language organization"
[pml-lang/pml-companion]: https://github.com/pml-lang/pml-companion "Visit repository on GitHub"

<!-- PML Playground -->

[PML Playground]: https://github.com/tajmone/pml-playground "Visit the PML Playground repository at GitHub"
[stylesheets sub-project]: https://github.com/tajmone/pml-playground/tree/main/stylesheets "PML Playground » PML Style Sheets"


<!-- badges -->

[PML badge]: https://img.shields.io/badge/PML-4.0.0-yellow "Supported PML version (click for PML Companion download page)"

[License badge]: https://img.shields.io/badge/License-MIT-blue

[sass badge]: https://img.shields.io/badge/Dart_Sass-1.77.8-yellow
[sass link]: https://github.com/sass/dart-sass/releases/tag/1.77.8 "download Dart Sass v1.77.8"

[ruby badge]: https://img.shields.io/badge/Ruby-3.2.2-yellow
[ruby link]: https://rubyinstaller.org/downloads/ "download RubyInstaller"

<!-- project folders and files -->

[_assets/]: ./_assets/
[css__default-new/]: ./css__default-new/
[samples/]: ./samples/

[LICENSE]: ./LICENSE "View MIT License"
[Rakefile]: ./Rakefile

<!-- people -->

[Christian Neumanns]: https://github.com/pml-lang "View Christian Neumanns's GitHub profile"
[Tristano Ajmone]: https://github.com/tajmone "View Tristano Ajmone's GitHub profile"

<!-- EOF -->
