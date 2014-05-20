msg_sender:
  - sending json data to url

msg_receiver:
	- receiving json data from url, process it, and store it in local database


To use:
$ ./msg_sender																		$shotgun -p 7654 (@msg_receiver side)


To install bundles (in Gemfile)
  - gem install bundler
  - bundle install




To run mongodb on Mac
http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/

[localhost ~]$ brew install mongodb                                                             
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/mongodb-2.6.1.mavericks.bottle.tar.gz
######################################################################## 100.0%
==> Pouring mongodb-2.6.1.mavericks.bottle.tar.gz
==> Caveats
To have launchd start mongodb at login:
    ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
Then to load mongodb now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
Or, if you don't want/need launchctl, you can just run:
    mongod --config /usr/local/etc/mongod.conf
==> Summary
í ¼í½º  /usr/local/Cellar/mongodb/2.6.1: 17 files, 317M
