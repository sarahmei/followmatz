Follow Matz
===========

Follow Matz is a Rails application that lets you crowdsource the translation
of a user's tweet stream. It's currently in use at followmatz.heroku.com to
translate Matz's tweets from Japanese to English. However, with a few changes
you could use it to translate any Twitter user or search, with any combination
of source and target languages.

Getting Started
---------------

Pull the code:
    git pull git://github.com/sarahmei/followmatz.git

Add a twitter user:
    cd followmatz
    rake twitter:add name=yukihiro_matz

Get the user's updates:
    rake twitter:update 

You can specify the source and target languages. The default is Japanese source,
with English target.
    rake twitter:update from=SPANISH to=FRENCH

Start the server, then check out http://localhost:3000:
    ruby script/server

Dependencies
------------

followmatz depends on the rtranslate and twitter gems.

    sudo gem install sishen-rtranslate
    sudo gem install twitter

vote_fu and paper_trail are installed in the plugins directory.

The app has been tested on Rails 2.3.4 and 2.3.8.

Authors
-------

Sarah Mei. Pull requests happily accepted.

