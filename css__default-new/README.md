# New Default PML Stylesheet

An attempt to Sassify and improve the default PML stylesheet according to [SMACSS].

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [About](#about)
- [Goals](#goals)
    - [Going SMACSS](#going-smacss)
- [Links](#links)
    - [CSS for Printed Media](#css-for-printed-media)

<!-- /MarkdownTOC -->

-----

# About

This theme is based on the default PML stylesheets, as found in `%APPDATA%\PML_Companion\4_0\config\PML_to_HTML\css\`:

- `pml-default.css`
- `pml-print-default.css`

which here have been converted to Sass partials in order to use them with Sass.

> **NOTE** — Currently the `pml-print-default.css` is being left out from the generated stylesheet because it requires being loaded separately, via ` media="print"` in the HTML source:
>
> ```html
> <link rel="stylesheet" href="css/pml-default.css">
> <link rel="stylesheet" href="css/pml-print-default.css" media="print">
> ```
>
> ... whereas in this project I'm focusing on creating single stylesheets, and doing so will require some adaptation work for print stylesheet to work.


# Goals

Right now, my sole goal is to Sassify the stylesheet for the screen (postponing the printed media version) and to improve its general look and feel.

## Going SMACSS

I'm also striving to apply the [SMACSS] principles to the new Sass stylesheet, organizing its modules according to the five types of SMACSS categories:

1. Base
2. Layout
3. Module
4. State
5. Theme

Probably the original method might need some adaptation for the needs of PML, since some native PML elements don't match native HTML tags and require classes, while still qualifying as "Base" elements in their own right — we'll most likely have to compromise on the original SMACSS method and extend the "Base" rules to include native PML elements such as admonitions, footnotes, etc., which obviously don't qualify as "Layout", "Module", "State" or "Theme" rules.

Furthermore, using Sass might also justify some wiggle-room in the SMACSS method, e.g. when compounding rules beyond their strict domain of belonging results in less-verbose and easier to maintain code.

It should still be possible to adhere to the general principles and goals of SMACSS, which are mainly concerned with creating sound stylesheets which are maintainable and provide good separation of concerns between each module, and CSS rules which are not encumbered by excessive inheritance or specificity.

The true value of SMACSS is that it forces you to think about your stylesheets from the correct perspective. For example, while trying to split the original stylesheet into the SMACSS categories, I immediately notices that layout in the default PML stylesheet is not using IDs where it should, relying instead on classes to identify and expose to CSS parts of the template which are known to be unique.

Furthermore, the fact that all classes are prefixed with `pml-` doesn't help much either in "SMACSS terms," where a better choice would have been to employ prefixes carrying semantics related to the SMACSS categories (e.g. `l-` for layout rules, etc.)

But then, since currently PML doesn't empower the end user to control the generated HTML tags and their classes, we'll have to work with what we can, and "make do" whatever PML throws at us. Hopefully, comments in the Sass sources will help to clarify the pros and cons of the current PML template situation, and help up work around such limitations.

-------------------------------------------------------------------------------

# Links

- [SMACSS] — _Scalar and Modular Architecture for CSS_ (+ free eBook).

## CSS for Printed Media

- [W3C » CSS Paged Media Module Level 3]
- [W3C » CSS Generated Content for Paged Media Module]

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

<!-- CSS Refs -->

[W3C » CSS Paged Media Module Level 3]: https://www.w3.org/TR/css-page-3/
[W3C » CSS Generated Content for Paged Media Module]: https://www.w3.org/TR/css-gcpm-3/

<!-- CSS schools -->

[SMACSS]: http://smacss.com "SMACSS website + free book"

<!-- EOF -->
