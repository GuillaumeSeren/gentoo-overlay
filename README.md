gentoo-overlay
==============

My Gentoo overlay mostly live-ebuilds, but I try also to have stable ebuilds,
for things that are not already in Gentoo.

## DISCLAIMER
This overlay is *not official*, and not tested outside of my setup,
so take some time to read before installing things.

_! USE IT AT YOUR OWN RISK !_

## INSTALL
```
layman -o https://raw.github.com/GuillaumeSeren/gentoo-overlay/master/guillaumeseren.xml -f -a guillaumeseren
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

Software                          | DESCRIPTION
----------------------------------|------------
[cockatrice][cockatrice]          | A cross-platform virtual tabletop for multiplayer card games
[kakoune][kakoune]                | mawww's experiment for a better code editor
[alot][alot]                      | A commandline MUA using notmuch and urwid
[kpcli][kpcli]                    | A command line interface to KeePass database files
[git-extras][git-extras]          | GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
[composer][composer]              | Dependency Manager for PHP
[git][git]                        | Git Source Code Mirror
[rkt][rkt]                        | rkt is an App Container runtime for Linux
[docker-machine][docker-machine]  | Machine management for a container-centric world
[phpunit][phpunit]                | The PHP Unit Testing framework
[s3fs][s3fs-fuse]                 | FUSE-based file system backed by Amazon S3


## PARTICIPATE
If find any bugs or problem related to those ebuild I suggest that you fill a __Issue__.
If you fix something and want to share back you can open a __Pull Request__.

[cockatrice]: https://github.com/Cockatrice/Cockatrice
[kakoune]: https://github.com/mawww/kakoune
[alot]: https://github.com/pazz/alot
[kpcli]: http://kpcli.sourceforge.net/
[git-extras]: https://github.com/tj/git-extras
[composer]: https://github.com/composer/composer
[git]: https://github.com/git/git
[rkt]: https://github.com/coreos/rkt
[docker-machine]: https://github.com/docker/machine
[phpunit]: https://github.com/sebastianbergmann/phpunit
[s3fs-fuse]: https://github.com/s3fs-fuse/s3fs-fuse
