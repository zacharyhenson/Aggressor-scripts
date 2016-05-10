# Aggressor Scripts
This is just a random collection of Aggressor Scripts I've written for [Cobalt Strike](https://www.cobaltstrike.com) 3.x.

Please note that most of them probably don't work properly, and could probably use some tweaking to better suit your environment.

Shoot me any questions and feel free to submit a pull request for any improvements you may have!

## Using this repository

I make use of [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules), so clone this repo with ```git clone --recursive```

If you didn't follow my instructions and already cloned the repo, go to the root of the repo and run ```git submodule update --init --recursive```

## List of Scripts

>Pushover/

[Pushover](https://pushover.net) support for Cobalt Strike, ridiculously useful.

See ```pushover-cs.sh``` for instructions.

>Persistence/

A few persistence tricks I use. All are untested and ```OutlookPersistence``` I haven't started on yet, so pretend it's not there.

>beaconCheckIn/

Not working properly, supposed to send just one notfication the next time a selected beacon checks in.

>beaconInfo/

A debugging script I use to get beacon IDs. Works with the beacon menu, and by running ```!beaconinfo``` in the script console.

>inveigh/ 

I couldn't get this to work properly, but it's supposed to be [Inveigh](https://github.com/Kevin-Robertson/Inveigh) support for Cobalt Strike.

>postExploit/

A number of different post-exploit features, including some hilarious ones.