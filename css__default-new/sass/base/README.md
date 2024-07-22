# Base Rules

```
sass/base/
```

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Partials List](#partials-list)
- [About Base Rules](#about-base-rules)
- [Base Modules Organization](#base-modules-organization)
- [Base Helpers](#base-helpers)
- [Reference Links](#reference-links)

<!-- /MarkdownTOC -->

-----

# Partials List

- [`_index.scss`][_index] — module entry point, `@forward`s (in order):
    - [`_reset.scss`][_reset] — Custom CSS reset.
    - [`_root.scss`][_root] — [Custom properties] and CSS vars on `:root`.
    - [`_base.scss`][_base] — Base rules.
    - [`_helpers.scss`][_helpers] — Base styles that require classes.

# About Base Rules

In _[Categorizing CSS Rules]_, SMACSS defines Base rules as:

> Base rules are the defaults. They are almost exclusively single element selectors but it could include attribute selectors, pseudo-class selectors, child selectors or sibling selectors. Essentially, a base style says that wherever this element is on the page, it should look like _this_.

and, in _[Base Rules]_, it further states:

> A Base rule is applied to an element using an element selector, a descendent selector, or a child selector, along with any pseudo-classes. It doesn't include any class or ID selectors. It is defining the default styling for how that element should look in all occurrences on the page. [...]
>
> Base styles include setting heading sizes, default link styles, default font styles, and body backgrounds. There should be no need to use `!important` in a Base style.

Clearly, these last statements need to be adapted to the needs of our project, since those native PML elements which have no matching native HTML tag require dedicated classes (and, sometimes, multiple tags) to be rendered. Yet, they still qualify as "Base styles rules" since they define how basic, core elements of the PML syntax should be rendered _wherever they occur on the page_.

Since SMACSS is "more style guide than rigid framework," and was conceived as "a way to examine your design process [...] a way to fit those rigid frameworks into a flexible thought process," it makes sense that we might bend the rules to accommodate our specific needs.

These needs are more apparent when dealing with Base rules, compared to the rest of the SMACSS category types. Whereas SMACSS was conceived in the typical scenario where the web-designer has full control over the HTML tags of the various pages (either directly or through a templating system), the challenge posed by creating a Sass library for a PML stylesheet (as it would with any other lightweight syntax HTML compilers) lies in the fact that we aim to provide a configurable and reusable library which will to create variations of a same basic stylesheet.


# Base Modules Organization

It makes thus sense that we split the Base rules in multiple Sass partials (i.e. dependency files) to be used as re-configurable modules, allowing the end user some degree of control when it comes to tweaking the look and feel of the final stylesheet.

Our ultimate goal is to have our Base rules cover the following features of the stylesheet:

- [ ] **CSS reset or normalize** — i.e. enforce sensible defaults for cross-browser consistency.
- [x] **Root variables** — i.e. expose selected settings of the stylesheet via global [custom properties] and CSS variables, so that end user can easily tweak them, or interface with them via JavaScript.
- [ ] **Typography** — i.e. the typefaces used in the stylesheet, their associated fonts and typeface-specific settings and CSS rules to enforce:
    - [ ] **[Type color]** — i.e. text density/heaviness, controlled by tweaking some CSS rules on a per-font-basis.
    - [x] **[Modular scale]** — i.e. using harmonious font-sizes via a base line-height and font-size that grow according to a fixed ratio, the Web equivalent of [typographic scale].
    - [ ] **[Measure]** — i.e. max number of characters per line in body text.
    - [ ] **Vertical Rhythm**.
- [ ] **Basic HTML/PML elements** — which might be useful to split into sub-categories\:
    - [ ] **Native** — PML syntax elements which have a corresponding HTML tag.
    - [ ] **HTML only** — native HTML elements which don't have a PML node counterpart (e.g. `<kbd>` and `<mark>`).
    - [ ] **Rich PML elements** — native PML elements which don't have a corresponding HTML tag and require the use of classes (e.g. `[admon`, `[input`).

Modularity makes sense as long as it allows to nicely isolate the various components that, together, contribute to build an elegant and maintainable stylesheet project. Being able to intuitively know where to look for any given feature means that the project is structured in a sensible way; whereas having a huge single-partial file with all settings and rules thrown in might be cumbersome to work with, especially if comments provide a detailed documentation of what each set of rules and settings do.

# Base Helpers

Ultimately, there's also the question of where "Base helpers" should go — i.e. those classes that alter the way Base rules behave, but are so commonly used and strictly related to typographic presentation that might not qualify as proper "State rules".

I have the impression that SMACSS [State rules] where intended to gather together those CSS rules that deal with varying states of a component or layout element, and that classes that deal with text-alignment or alternative text coloring might benefit from having a category of their own, such as "Base Helpers," since they don't deal with varying states but typographic presentation, element attributes, and other forms of enhancements or extensions to the Base rules that don't concern either modules or layout elements.

Since one of the goals of SMACSS is to organize stylesheets in a way which mirrors the way we reason about its structure, it seems reasonable to me that in this context we might add the "Base Helpers" category to isolate classes that allow to fine-tune the presentation of native PML/HTML elements. But this is still just a suggestion for now.

-------------------------------------------------------------------------------

# Reference Links

- [Every Layout]\:
    - Rudiments\:
        - [Global and local styling]
        - [Modular scale]
- [MDN Web Docs]\:
    - [CSS Reference]\:
        - [Custom properties (`--*`): CSS variables][Custom properties]

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

<!-- typography -->

[Measure]: https://en.wikipedia.org/wiki/Line_length "Wikipedia » Line length"
[Type color]: https://en.wikipedia.org/wiki/Type_color "Wikipedia » Type color"
[typographic scale]: https://spencermortensen.com/articles/typographic-scale/ "Spencer Mortensen's typographic scale tutorial and online calculator"

<!-- SMACSS -->

[Categorizing CSS Rules]: https://smacss.com/book/categorizing/ "SMACSS » Ch. 3. Categorizing CSS Rules"
[Base Rules]: https://smacss.com/book/type-base/ "SMACSS » Ch. 4. Base Rules"
[State Rules]: https://smacss.com/book/type-state/ "SMACSS » Ch. 7. State Rules"

<!-- Every Layout -->

[Every Layout]: https://every-layout.dev "Every Layout: Relearn CSS layout"
[Global and local styling]: https://every-layout.dev/rudiments/global-and-local-styling/ "Every Layout » Rudiments » Global and local styling"
[Modular scale]: https://every-layout.dev/rudiments/modular-scale/ "Every Layout » Rudiments » Modular Scale"

<!-- MDN Web Docs -->

[MDN Web Docs]: https://developer.mozilla.org/ "MDN Web Docs"
[CSS Reference]: https://developer.mozilla.org/en-US/docs/Web/CSS "MDN Web Docs » References » CSS"
[Custom properties]: https://developer.mozilla.org/en-US/docs/Web/CSS/--* "MDN Web Docs » References » CSS » Custom properties (--*): CSS variables"

<!-- project files -->

[_base]: ./_base.scss
[_helpers]: ./_helpers.scss
[_index]: ./_index.scss
[_reset]: ./_reset.scss
[_root]: ./_root.scss

<!-- EOF -->
