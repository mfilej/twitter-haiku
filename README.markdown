# Twitter Haiku

Twitter Haiku is a set of small scripts that produce a pdf with haikus from [Twitter][twitter]. It pulls 50 recent tweets marked with the hashtag #haiku, discards the ones that don't look like haikus and prettifies the rest. It also discards duplicates (usually retweets). Tweet manipulation is handled by ruby while LuaTeX and ConTeXt take care of the typesetting and pdf generation.

## Running the scripts

There are [Rake][rake] tasks that take care of fetching the twitter feed, normalizing it, building the pdf file and running the tests. Ruby and Rake are required to run the tasks.

The following tasks are available:

    rake build      # Build the pdf file
    rake clean      # Remove generated pdf and temporary files
    rake fetch      # Fetch a fresh twitter feed
    rake prepare    # Rewrite the twitter feed by normalizing tweets
    rake test       # Run tests

To get a fresh pdf file from scratch:

    $ rake

If ruby and rake are not available it is still possible to generate the pdf file manually:

    $ context haiku.tex

## Installing LuaTeX

Depending on the availability or lack of packages for your platform of choice it may not be the easiest task. [Contextgarden][luatex] might be a good start.

## About the project

Written by [Miha Filej][mfilej] for the course Typographic programming taught by [Petr Sojka][sojka] at [FI-MUNI][fi].


  [rake]:    http://rake.rubyforge.org/
  [twitter]: http://twitter.com/
  [mfilej]:  http://twitter.com/mfilej
  [luatex]:  http://minimals.contextgarden.net/
  [sojka]:   http://www.fi.muni.cz/usr/sojka/
  [fi]:      http://fi.muni.cz/
  [typo]: https://is.muni.cz/auth/predmety/predmet.pl?lang=en;id=519265;zpet=..%2Fpredmety%2Fkatalog.pl%3Ffakulta%3D1433%3Blang%3Den%3Bhledret%3DPV126%3Bhledv%3Dnaz%3Bhledv%3Dkod%3Bfak%3D1433%3Buhledat%3D1;zpet_text=Back%20to%20course%20search

