[doc [title Headings with Subtitles]

  Each inner heading (i.e. except the main document title) can have a subtitle
  via the [c \[subtitle] node.

  [ch (id=h2) [title Heading 2 Title]
      [subtitle And Subtitle]
    [ch (id=h3) [title Heading 3 Title]
        [subtitle And Subtitle]
      [ch (id=h4) [title Heading 4 Title]
          [subtitle And Subtitle]
        [ch (id=h5) [title Heading 5 Title]
            [subtitle And Subtitle]
          [ch (id=h6) [title Heading 6 Title]
              [subtitle And Subtitle]
  ]]]]]

  [ch (id=notes) [title Developer Notes]

    The PMLC approach to subtitles is rather odd, to say the least.
    The main document title doesn't support a subtitle, only sub-sections do.

    For some reason, PML doesn't include the subtitle in the ToC, which would
    be a reasonable behavior for the main title (especially in books) but not
    for chapters or sections, which are usually indexed treating title and
    subtitle as a single entry.

    [admon [alabel WARNING]
      Subtitles are rendered by PMLC as another heading of the same level,
      immediately following the title heading. E.g.

      [code
      ~~~
      <section id="h2" class="pml-chapter">
        <h2 class="pml-chapter-title">Heading 2 Title</h2>
        <h2 class="pml-chapter-subtitle">And Subtitle</h2>
      </section>
      ~~~
      ]

      Although no stylesheet can fix such broken semantics, it might at least fix
      their visual presentation by adopting a smaller font-size for the subtitle.
    ]

    The HTML spec doesn't provide clear indications on how to treat subtitles
    (it doesn't even provide any semantics for a subtitle element), but clearly
    using two consecutive headings of the same level is not the solution.

  ]

]
