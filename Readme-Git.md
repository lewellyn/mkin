# About this Git

## Synopsis (tl;dr)

This ```git``` is enhanced from the standard distribution. This should not
cause problems for most users.

## Changes from standard Git

This is a standard distribution without any source changes, plus
the additions below. The only way that this distribution functionally
differs is by creating symbolic links instead of hard links as the
packaging process does not maintain the hard links, plus the addition of some
useful, but optional, tools.

There may be changes in the future and they will be documented here.

## Additions to this git

* Items available from contrib/ which are in the path:
    - contacts (without the documentation)
    - credential/netrc
    - credential/osxkeychain
    - diff-highlight
    - git-jump
    - subtree
    - workdir
* git-fat - Store binary files outside the repository, using rsync.
    - https://github.com/ozkandikmen-work/git-fat/tree/gunter-from-master
* git-forest / gfl - Console tree view of a repository.
    - https://github.com/calebthompson/gfl
    - Documentation is available in ```/opt/git/share/extra/doc/gfl``` or at
      file:///opt/git/share/extra/doc/gfl in your browser.
* git-last - Shows recent commits for objects in the current directory.
    - https://raw.githubusercontent.com/EugeneKay/scripts/master/bash/git-last.sh
* A few useful cheatsheets, available in ```/opt/git/share/extra/cheat```
    - http://jan-krueger.net/development/git-cheat-sheet-extended-edition
    - http://wall-skills.com/2013/git-cheat-sheet/

## Notes

* Unlike the Apple-provided distribution available with newer OS X versions,
  this distribution has a working ```gitk``` utility.
* HTML documentation is available in ```/opt/git/doc``` or at
  file:///opt/git/doc/index.html in your browser.
* Man page documentation is available in ```/opt/git/share/man```.

## Known issues

* Some perl modules do not work (so things like ```git-svn``` are broken).
  Most contrib items are not actually installed, but rather live in
  ```/opt/git/contrib``` (which makes things provided there harder to use).
* The binaries provided from contrib/ are not built as fat binaries yet.

## Limitations

* No limitations are known which only affect this packaging of Git and which
  are not documented above.

## To Do

* It would be nice to also add the bash completions and remote-helpers.
    - Related, https://github.com/petervanderdoes/git-flow-completion
* Add git-blameall. https://github.com/ddev/git-blameall
* Add git-diffall. https://github.com/thenigan/git-diffall
* Add git-flow. https://github.com/petervanderdoes/gitflow
* Add git-ftp. https://github.com/git-ftp/git-ftp
* Add git-hg. https://github.com/cosmin/git-hg
* Add git-merge-changelog.
  http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob;f=lib/git-merge-changelog.c
* Add git-now. https://github.com/iwata/git-now
* Add git-remote-bzr.
    - https://github.com/felipec/git/wiki/git-remote-bzr
    - https://github.com/felipec/git-remote-bzr
* Add git-remote-hg.
    - https://github.com/felipec/git/wiki/git-remote-hg
    - https://github.com/felipec/git-remote-hg
* Add git-timetrack.
    - http://wadobo.com/trac/dtt
    - http://web.archive.org/web/20130309005645/http://wadobo.com/trac/dtt
* Add git-what-branch. https://github.com/SethRobertson/git-what-branch
* Investigate including git-age. https://github.com/krig/git-age/wiki
* Investigate including git-gitlab-init.
  https://github.com/qguv/git-gitlab-init
* Investigate including git-imerge. https://github.com/mhagger/git-imerge
* Investigate including git-link. https://github.com/gvalkov/git-link
* Investigate including git-media. https://github.com/alebedev/git-media
* Investigate including git-stitch-repo.
  https://metacpan.org/pod/git-stitch-repo
* Investigate including hub. https://github.com/github/hub
* Determine if any of the tools here are interesting:
    - http://git-wt-commit.rubyforge.org/
    - http://gitorious.org/willgit/mainline/commits/master
* Consider adopting some of felipec's patches.
  https://github.com/felipec/git/wiki/My-patches
* Consider adding bup either to this package or another package.
  https://github.com/bup/bup

## Requirements

* [ ] To be written

