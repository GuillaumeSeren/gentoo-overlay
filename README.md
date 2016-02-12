gentoo-overlay
==============

My Gentoo overlay mostly live-ebuilds.

## IDEA
Provide upgraded bump and live-ebuilds for various project I follow.

## DISCLAIMER
This overlay is not official, and not tested outside of my setup,
so take some time to read before installing things.

! USE IT AT YOUR OWN RISK !

## INSTALL
```
layman -a https://raw.github.com/GuillaumeSeren/gentoo-overlay/master/overlay.xml
# Then search the ebuild like:
emerge --search alot
# If the version (9999 for exemple of a live-ebuild) did not show-up,
# you might need to search it more precisely, like:
emerge -pv "=mail-client/alot-9999"
# The ebuild might need a keyword change to be able to install
# You can add the entry in /etc/portage/
# example for alot-9999.ebuild:
# required by =mail-client/alot-9999 (argument)
=mail-client/alot-9999 ~amd64
# Then you can install the ebuild
emerge -av "=mail-client/alot-9999"
```

## CONTENT

Software     | DESCRIPTION
-------------|------------
`cockatrice` | A cross-platform virtual tabletop for multiplayer card games
`kakoune`    | mawww's experiment for a better code editor
`alot`       | A commandline MUA using notmuch and urwid [alot]
`kpcli`      | A command line interface to KeePass database files [kpcli]
`git-extras` | GIT utilities -- repo summary, repl, changelog population, author commit percentages and more [git-extras]

## PARTICIPATE
If find any bugs or problem related to those ebuild I suggest that you fill a __Issue__.
If you fix something and want to share back you can open a __Pull Request__.


[alot]: https://github.com/pazz/alot
[kpcli]: http://kpcli.sourceforge.net/
[git-extras]: https://github.com/tj/git-extras
