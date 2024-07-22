[doc [title PML Typography Samples]

A document with typography samples of PML elements.

  [ch (id=base) [title Base Typography]

  The first paragraph shouldn’t be indented, but any other paragraph that’s
  preceded by a paragraph should.
  After an interruption in the natural paragraphs flow (a list, quote, heading,
  etc.) the first paragraph should be without indent again.

  Second paragraph: should be indented!
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua.

  Third paragraph, followed by a list.
  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
  aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
  voluptate velit esse cillum dolore eu fugiat nulla pariatur.


  [list
    [el This list interrupts the paragraphs flow.]
    [el Natural spacing should occur.]
  ]

  Fourth paragraph, after the list interruption:
  shouldn’t be indented,
  should be spaced before.
  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
  deserunt mollit anim id est laborum.

    [ch (id=numerals) [title Numerals: Old-style & Lining]

      Numerals within the body text should be styled using [i old-style] form
      (aka [i non-lining] or [i text figures] and [i uppercase] numerals), rather than their [i lining]
      counterparts (aka [i titling] or [i uppercase] numerals: 0123456789.

      Not every font supports both numeral styles, so we’ll have to test it
      here using inline styles to enforce [i lining] numerals via
      [link (url=https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric)
      font-variant-numeric]:

      [list
        [el old-style: 0123456789 (default)]
        [el (html_style="font-variant-numeric: lining-nums;") lining: 0123456789 (forced via inline style)]
      ]

      Exceptions to the rule are the following styles, which all require lining
      numerals:

      [list
        [el [span (html_class="smallcaps") SmallCaps 1234 Style] (via [c .smallcaps] class)]
        [el inline code: [c 1234567890]]
        [el [c <kbd>] tags: [verbatim <kbd>Shit</kbd>+<kbd>F3</kbd> <kbd>F9</kbd> ]]
      ]

      [ch (id=lining-heading) [title Heading with Lining Numerals: 0123456789]

      Headings, on the other hand, should use lining figures.

      ]

    ]

  ]

  [ch (id=headings) [title Headings]

    Headings level 2 through 6, using the [c \[ch] node.

  ]
    [ch [title Heading 2]
      [ch [title Heading 3]
        [ch [title Heading 4]
          [ch [title Heading 5]
            [ch [title Heading 6]
    ]]]]]

    Body text: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
    veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
    commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
    esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
    cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
    est laborum.

  [ch (id=headers) [title Headers]

    A [c \[header] node is described in the PML documentation as a “(small title)
    displayed on a separate line” which is not included in the ToC — i.e. a
    heading of undefined size which plays the role of a “fake heading” but is
    not part of the ToC (and not a “header” as in “header and footer”).

    Example:

    [header I’m Just a Header]

    which is rendered as a [c <div>] with class [c pml-header].

    [note Since the documentation doesn’t define how “small” the header title
          should be, it’s probably up the stylesheet creator to decide which
          font-size to adopt.]

  ]

  [ch (id=captions) [title Captions]

    A [c \[caption] node is described in the PML documentation as a “small title
    that is not part of the table of contents, typically displayed below a block
    element (image, video, table, etc.)”

    Example:

    [caption I’m Just a Caption]

    [note This typographic element needs to be inspected along with another
          element in order to appreciate how the stylesheet handles it.]

  ]

  [ch (id=text-formatting) [title Text Formatting]

    Text formatting examples: [b bold text], then [i italic text],
    then [strike strikethrough text], and some [c inline code].

    We then have [sup superscript text] and [sub subscript text].

    [ch (id=overlapping-styles) [title Overlapping Styles]

      We need to ensure that these styles still look as intended when overlapping
      in various combinations and order:
      [list
        [el [b bold + [i italic]] and [i italic + [b bold]].]
        [el [b bold + [sup superscript]] and [sup superscript + [b bold]].]
        [el [b bold + [sub subscript]] and [sub subscript + [b bold]].]
        [el [b bold + [c inline code]] and [i italic + [c inline code]].]
        [el [strike strikethrough + [b bold]] and [b bold + [strike strikethrough]]]
        [el [strike strikethrough + [i italic]] and [i italic + [strike strikethrough]]]
        [el [strike strikethrough + [sup superscript]] and [sup superscript + [strike strikethrough]]]
        [el [strike strikethrough + [sub subscript]] and [sub subscript + [strike strikethrough]]]
        [el [strike strikethrough + [c inline code]]]
        [el [sup superscript + [c inline code]] and [sub subscript + [c inline code]]]
      ]
    ]
    [ch (id=line-height-integrity) [title Line-Height Integrity]

      We also need to ensure that superscript and subscript styling in a long
      paragraph don’t break the paragraph line-eight.

      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
      [sup ut aliquip ex ea] commodo consequat.
      Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
      dolore eu fugiat nulla pariatur.
      [sub Excepteur sint occaecat] cupidatat non proident, sunt in culpa qui
      officia deserunt mollit anim id est laborum.

      The same goes for inline code, which should have a font-size proportionate
      to that of the body text, and in case it has background color and borders
      these shouldn't break the natural line-height of their hosting element.

      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et [c dolore magna] aliqua.
      Ut enim ad [c minim veniam], quis nostrud exercitation ullamco laboris nisi
      ut aliquip ex ea commodo consequat.
      Duis aute [c irure dolor] in reprehenderit in voluptate velit esse cillum
      dolore eu fugiat nulla pariatur.
      [c Excepteur sint] occaecat cupidatat non proident, sunt in culpa qui
      officia deserunt mollit anim id est laborum.
    ]

    [ch (id=xtra-styles) [title Extra Styles]

      This stylesheet also covers styles for native HTML tags which have no PML
      syntax representation:

      [list
        [el [c <kbd>] tag: [verbatim <kbd>Ctr</kbd>+<kbd>C</kbd>, <kbd>F12</kbd> ]]
        [el [c <mark>] tag: [verbatim <mark>I’m marked text.</mark>&nbsp;&nbsp;
               <mark>I look like I was highlighted with a florescent marker,
               thanks to a realistic CSS effect by Max.</mark>]]
      ]

      and some helper classes for commonly used styles:

      [list
        [el Small Caps \u2192 [span (html_class="smallcaps") Small Caps] (via [c .smallcaps] class)]
        [el All Small Caps \u2192 [span (html_class="all-smallcaps") All Small Caps] (via [c .all-smallcaps] class)]
      ]

    ]
  ]

  [ch (id=lists) [title Lists]

    PML only supports unordered lists natively, other lists types require
    HTML attributes (e.g. ordered lists).

    [list
      [el A bullet list.]
      [el With multiple entries.]
      [el End of parent list.]
    ]

    [ch (id=raw-lists) [title Raw HTML Lists]

      We’ll resort here to a raw HTML blocks to test various string.

      [html
        ~~~
        <ol>
          <li>Apples</li>
          <li>Bananas</li>
          <li>Exotic:
            <ol>
              <li>Kiwi</li>
              <li>papaya</li>
            </ol>
          </li>
        </ol>

        <hr>

        <ul>
          <li>Apples</li>
          <li>Bananas</li>
          <li>Exotic:
            <ul>
              <li>Kiwi</li>
              <li>papaya</li>
            </ul>
          </li>
        </ul>

        <hr>

        <ol>
          <li>Apples</li>
          <li>Bananas</li>
          <li>Exotic:
            <ul>
              <li>Kiwi</li>
              <li>papaya</li>
            </ul>
          </li>
        </ol>

        <hr>

        <ul>
          <li>Apples</li>
          <li>Bananas</li>
          <li>Exotic:
            <ol>
              <li>Kiwi</li>
              <li>papaya</li>
            </ol>
          </li>
        </ul>
        ~~~
      ]

    ]
  ]



  [ch (id=blockquotes) [title Quotation Blocks]

    [quote
      In the animal kingdom, the rule is, eat or be eaten; in the human kingdom,
      define or be defined.
      [qsource Thomas Szasz,
        [i Words to the Wise: A Medical-Philosophical Dictionary], p.65.]
    ]
  ]


  [ch (id=admonitions) [title Admonition Blocks]

    The [c \[note] node and [c \[admon] nodes with custom labels form the group
    of so-called “admonition blocks.”

    [note I’m a [c \[note] block, i.e. an admonition with an implicit “note”
          label. Just syntactic sugar for the most used admonition type.
    ]

    [admon [alabel Tip]
      I’m a "Tip admonition," i.e. an [c \[admon] block with the “Tip” label
      defined via the [c \[alabel] node.
    ]

    [admon [alabel WARNING]
      Users are free to provide whichever label they want (lower- or upper-case,
      short or long, etc.).
      The stylesheet should be flexible enough to accommodate all reasonable
      labels without breaking.
    ]

    [admon [alabel \U0001F525]
      Beware that the [c \[alabel] node might even contain emojis, like in this
      admonition, which uses the “fire” emoji via [c \\U0001F525].
    ]

    [ch (id=labeless-admon) [title Admonition without Label]

      We need to keep into account that a user might create an admonition block
      without an [c \[alabel] node (valid PML, albeit non-idiomatic), and ensure
      that the stylesheet can handle it gracefully.

      [admon I’m a “plain admonition,” i.e. an [c \[admon] block without any label
             defined.
      ]
    ]
  ]

  [ch (id=verbatim) [title Verbatim Blocks]

    PML supports various kinds of “verbatim blocks”:

    [list
      [el Monospace blocks ([c \[monospace] node)]
      [el Code blocks ([c \[code] node)]
      [el Input blocks ([c \[input] node)]
      [el Output blocks ([c \[output] node)]
    ]

    [ch (id=monospace) [title Monospace Block]

      Aka “verbatim” or “preformatted” block, via [c <pre class="pml-monospace">].

      [monospace
        1
      1   1
    1   2   1
  1   3   3   1
      ]

      [ch (id=ascii-art) [title ASCII Art]

        Bear in mind that [c \[monospace] nodes are often used for ASCII Art, which
        might warrant adding a dedicated class to ensure that the font is as tall
        as the line-height.
        [monospace
              _   _
             (.)_(.)
          _ (   _   ) _
         / \\/`-----'\\/ \\
       __\\ ( (     ) ) /__
       )   /\\ \\._./ /\\   (
  jgs   )_/ /|\\   /|\\ \\_(
        ]
      ]
    ]

    [ch (id=codeblocks) [title Code Blocks]

      Aka “listing” or “source” block, the [c \[code] node yields a
      [c <pre class="pml-code"><code>] block.

      [code (lang=Lua)
      ~~~
      -- defines a factorial function
      function fact (n)
        if n == 0 then
          return 1
        else
          return n * fact(n-1)
        end
      end

      print("enter a number:")
      a = io.read("*number")        -- read a number
      print(fact(a))
      ~~~
      ]

    ]

    [ch (id=input) [title Input Blocks]

      The [c \[input] node yields a [c <pre class="pml-input">] block.

      [input
      ~~~
      pmlc pml_to_html article.pml
      ~~~
      ]
    ]

    [ch (id=output) [title Output Blocks]

      The [c \[output] node yields a [c <pre class="pml-output">] block.

      [output
      ~~~
      Congratulations!
      The new database has been created successfully.
      ~~~
      ]
    ]

  ]

]
