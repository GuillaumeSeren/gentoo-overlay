gentoo-overlay
==============

My Gentoo overlay mostly bump/live-ebuilds, but I try also to have stable ebuilds,
for things that are in Gentoo or not upgraded in Gentoo.

# DISCLAIMER
This overlay is *not official*, and *not tested outside of my setup*,
so take some time to read ebuild before installing things.

_! USE IT AT YOUR OWN RISK !_

# INSTALL
You can install this overlay using the new [Portage/Sync system](https://wiki.gentoo.org/wiki/Project:Portage/Sync).
Add the overlay in '/etc/portage/repos.conf/guillaumeseren.conf':
```
[GuillaumeSeren]
location = /usr/local/portage/guillaumeseren
sync-type = git
sync-uri = https://github.com/GuillaumeSeren/gentoo-overlay.git
masters = gentoo
priority = 50
auto-sync = yes
```

Then you can sync the overlay with 'emerge --sync' *or* 'emaint sync --auto'.
To pull the overlay directly just:
```
emaint sync --repo  GuillaumeSeren
```

You should mask all ebuild by default in my overlay and just unmask,
the specific one you want
```
echo '*/*::GuillaumeSeren' >> /etc/portage/package.mask/guillaumeseren-repo
```

You also need to accept the package, you can do it per package, or for all of
them like
```
echo '*/*::GuillaumeSeren' > /etc/portage/package.accept_keywords/guillaumeseren-repo'
```

Then search the ebuild like:
```
emerge --search git-extras
```

As we masked the whole overlay, the package you want should be masked,
you might need to search it more precisely, like:
```
$ emerge --search git-extras
[ Results for search key : git-extras ]
Searching...

*  dev-vcs/git-extras [ Masked ]
      Latest version available: 9999
      Latest version installed: 9999
      Size of files: 0 KiB
      Homepage:      https://github.com/tj/git-extras
      Description:   GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
      License:       MIT

[ Applications found : 1 ]

```

To install this version you will need to *unmask*, the version from my overlay (::GuillaumeSeren).
```
$ echo '=dev-vcs/git-extras-9999::GuillaumeSeren' >>  /etc/portage/package.unmask/git-extras
```

Now you can install it
```
$ emerge -av dev-vcs/git-extras
These are the packages that would be merged, in order:

Calculating dependencies... done!
[ebuild   R   #] dev-vcs/git-extras-9999::GuillaumeSeren  USE="-savedconfig" 0 KiB

Total: 1 package (1 reinstall), Size of downloads: 0 KiB

Would you like to merge these packages? [Yes/No]
```

# CONTENT
Here the list of stuff that are packaged here.

Software                                | DESCRIPTION
----------------------------------------|------------
[cockatrice][cockatrice]                | A cross-platform virtual tabletop for multiplayer card games
[alot][alot]                            | A commandline MUA using notmuch and urwid
[git-extras][git-extras]                | GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
[composer][composer]                    | Dependency Manager for PHP
[phpunit][phpunit]                      | The PHP Unit Testing framework
[bedup][bedup]                          | Btrfs deduplication
[mixxx][mixxx]                          | Mixxx is Free DJ software that gives you everything you need to perform live mixes
[winetricks][winetricks]                | Winetricks is an easy way to work around problems in Wine
[laptop-mode-tools][laptop-mode-tools]  | Linux kernel laptop_mode user-space utilities


## PARTICIPATE
If find any bugs or problem related to those ebuild I suggest that you fill a __Issue__.
If you fix something and want to share back you can open a __Pull Request__.

[cockatrice]: https://github.com/Cockatrice/Cockatrice
[alot]: https://github.com/pazz/alot
[git-extras]: https://github.com/tj/git-extras
[composer]: https://getcomposer.org
[phpunit]: https://github.com/sebastianbergmann/phpunit
[bedup]: https://github.com/g2p/bedup
[mixxx]: http://mixxx.org
[winetricks]: https://github.com/Winetricks/winetricks
[laptop-mode-tools]: https://github.com/rickysarraf/laptop-mode-tools/wiki
