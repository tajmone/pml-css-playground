[doc (id=test)  [title Document Title]
      [subtitle And Subtitle]

  The PML documentation doesn't mention the use of a [c \[subtitle] node for
  the main [c \[doc] node, so this might not be an idiomatic example, even
  though it compiles without error.

  The document subtitle is omitted from the [c <title>] tag contents in the
  generated [c <head>] section, rather than being included with a separator.

  [admon [alabel WARNING]
    Unlike "chapter" (i.e. sections) subtitles, a document-level subtitle is
    not only rendered by PMLC as another level 1 heading, immediately following
    the title heading, but in this case the same [c pml-doc-title] class is used
    for both, which points to the fact that it's not an idiomatic use case:

    [code
    ~~~
    <article id="test" class="pml-doc-text">
      <h1 class="pml-doc-title">Document Title</h1>
      <h1 class="pml-doc-title">And Subtitle</h1>
    ~~~
    ]

    At least, with section subtitles, we have the [c pml-chapter-title] and
    [c pml-chapter-subtitle] classes to distinguish between title and subtitle,
    whereas in this case there is no such distinction.

    Although no stylesheet can fix such broken semantics, it might at least fix
    their visual presentation by adopting a smaller font-size for the subtitle.
    The absence of a proper dedicated class complicates the task, leaving us
    with no choice but to use selectors combinators to target an [c <h1>] tag
    that immediately follows another [c <h1>] tag.
  ]

  The HTML spec doesn't provide clear indications on how to treat subtitles
  (it doesn't even provide any semantics for a subtitle element), but clearly
  using two consecutive headings of the same level is not the solution.

]
