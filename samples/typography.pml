[doc [title PML Typography Samples]

A document with typography samples of PML elements.

  [ch (id=headings) [title Headings]

    Headings level 2 through 6, using the [c \[ch] node.

  ]
    [ch [title Heading 2]
      [ch [title Heading 3]
        [ch [title Heading 4]
          [ch [title Heading 5]
            [ch [title Heading 6]
    ]]]]]

  [ch (id=headers) [title Headers]

    A [c \[header] node is described in the PML documentation as a "(small title)
    displayed on a separate line" which is not included in the ToC — i.e. a
    heading of undefined size which plays the role of a "fake heading" but is
    not part of the ToC (and not a "header" as in "header and footer).

    Example:

    [header I'm Just a Header]

    which is rendered as a [c <div>] with class [c pml-header].

    [note Since the documentation doesn't define how "small" the header title
          should be, it's probably up the stylesheet creator to decide which
          font-size to adopt.]

  ]

  [ch (id=captions) [title Captions]

    A [c \[caption] node is described in the PML documentation as a "small title
    that is not part of the table of contents, typically displayed below a block
    element (image, video, table, etc.)"

    Example:

    [caption I'm Just a Caption]

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
      paragraph don't break the paragraph line-eight.

      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
      [sup ut aliquip ex ea] commodo consequat.
      Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
      dolore eu fugiat nulla pariatur.
      [sub Excepteur sint occaecat] cupidatat non proident, sunt in culpa qui officia
      deserunt mollit anim id est laborum.
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
    of so-called "admonition blocks".

    [note I'm a [c \[note] block, i.e. an admonition with an implicit "note"
          label. Just syntactic sugar for the most used admonition type.
    ]

    [admon [alabel Tip]
      I'm a "Tip admonition," i.e. an [c \[admon] block with the "Tip" label
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
      admonition, which uses the "fire" emoji via [c \\U0001F525].
    ]

    [ch (id=labeless-admon) [title Admonition without Label]

      We need to keep into account that a user might create an admonition block
      without an [c \[alabel] node (valid PML, albeit non-idiomatic), and ensure
      that the stylesheet can handle it gracefully.

      [admon I'm a "plain admonition," i.e. an [c \[admon] block without any label
             defined.
      ]
    ]
  ]

  [ch (id=verbatim) [title Verbatim Blocks]

    PML supports various kinds of "verbatim blocks":

    [list
      [el Monospace blocks ([c \[monospace] node)]
      [el Code blocks ([c \[code] node)]
      [el Input blocks ([c \[input] node)]
      [el Output blocks ([c \[output] node)]
    ]

    [ch (id=monospace) [title Monospace Block]

      Aka "verbatim" or "preformatted" block, via [c <pre class="pml-monospace">].

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

      Aka "listing" or "source" block, the [c \[code] node yields a
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
