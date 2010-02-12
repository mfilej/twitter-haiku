# Twitter Haiku

Twitter Haiku is a small script that produces a pdf with haikus from [Twitter][twitter]. It pulls 50 most recent tweets marked with the hashtag #haiku, discards the ones that don't look like haikus and prettifies the rest. It also discards duplicates (usually retweets). Tweet manipulation is handled by ruby while luatex and context take care of the typesetting and pdf generation.

## Running the scripts

There are [Rake][rake] tasks that take care of fetching the twitter feed, normalizing it, building the pdf file and running the tests. Ruby and Rake are required to run the tasks.

The following tasks are available:

    rake build      # Build the pdf file
    rake clean      # Remove generated pdf and temporary files
    rake fetch      # Fetch a fresh twitter feed
    rake prepare    # Rewrites the twitter feed by normalizing tweets
    rake test       # Run tests

To get a fresh pdf file from scratch:

    rake prepare build

If ruby and rake are not available it is still possible to generate the pdf file manually by running:

    context haiku.tex


  [rake]: http://rake.rubyforge.org/
  [twitter]: http://twitter.com/