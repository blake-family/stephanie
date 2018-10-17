# stephanie-blake-music

Using this template - http://html5up.net/twenty

=========

Website project and distribution for TODO

The site is hosted as github pages.  The project uses yeomen, grunt, bower and http://html5up.net/twenty. The site itself might use polymer.

## Running
```
make
```

## Running the distribution version
```
make deploy-dist
```

## Publishing
The site is contained on the gh-pages branch and found in the dist directory. Deployment is handled by a handy script I found (and checked in at the root) - https://github.com/X1011/git-directory-deploy

`./deploy` will push the dist folder up the github as the new site (use `./deploy -s` the first time???).

## Other
See the `Makefile`

##Custom Domain TODO - below is copied from stephanieblakemusic.com site.

###DNS Configuration
I have two @ A name records, 1 pointing to 192.30.252.153 and one pointing to 192.30.252.154.  Then I have a www A name record pointing to 192.30.252.153.

###Github configuration
I have the previously mentioned deploy script which will deploy the dist version to the gh-pages branch.  In the root I have a file, CNAME, which has www.stephanieblakemusic.com.  Including the www means stephanieblakemusic.com will redirect to www.stephanieblakemusic.com.  If I just had stephanieblakemusic.com then www.stephanieblakemusic.com would redirect to stephanieblakemusic.com.
