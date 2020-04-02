plugins {
  id("org.danilopianini.gradle-latex")
}

latex {
    "conference_101719"() {
        bib = "IEEEexample.bib"
    }
}
