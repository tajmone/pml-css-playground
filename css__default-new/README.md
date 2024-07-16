# New Default PML Stylesheet

An attempt to Sassify and improve the default PML stylesheet.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [About](#about)
- [Goals](#goals)
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


-------------------------------------------------------------------------------

# Links

## CSS for Printed Media

- [W3C » CSS Paged Media Module Level 3]
- [W3C » CSS Generated Content for Paged Media Module]

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[W3C » CSS Paged Media Module Level 3]: https://www.w3.org/TR/css-page-3/
[W3C » CSS Generated Content for Paged Media Module]: https://www.w3.org/TR/css-gcpm-3/

<!-- EOF -->
