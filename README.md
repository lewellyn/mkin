# mkin: Make Installers

## Synopsis (tl;dr)

```mkin``` makes installers. Ok. It makes a couple things which aren't
installers, too. But the entire intent is to create a simple .dmg of things
people might want.

## About

```mkin``` is my tool to create Universal Binaries in a user-friendly format
for Mac OS X 10.4 "Tiger" systems. (The first systems to support both PowerPC
and Intel CPUs, and the last to support the Classic Macintosh OS 9
environment. Both are popular retrocomputing choices for running this OS
release.)

I realize that there are various solutions for users to install third-party
software (MacPorts, fink, homebrew, etc.). I also realize that those are a lot
of work for something like "I just want a recent copy of Git" and I further
realize that a proper Apple Installer package with an uninstaller is far, far
simpler than pitting the different compile-it-yourself systems against each
other.

The resulting packages try hard to be minimally invasive to the system. If at
all possible, they install into ```/opt``` in UNIX tradition and only place
items in ```/usr/local``` optionally (and by default, for principle of least
surprise). Additionally, whenever possible, system-provided resources
(libraries et cetera) will be used to minimize the disk footprint.

```mkin``` is a collection of shell scripts which I've been creating and
modifying over the course of a few years. They're not perfect and they're
definitely not examples of good scripting (organic growth of scripts causes
that).

Also, note that most of the installers have OS version checks. This is not
accidental.

## Installing

It's probably easiest to stick the checkout of ```mkin``` in your $PATH.
Otherwise, just invoke it wherever you keep your sources (such as
```$HOME/src```). Of course, be sure you have all the requirements listed
below.

## Usage

Invoke ```Get``` with the project you wish to build and the version number.
Then, invoke ```Package``` with the same information. These are specifically
kept as separate tasks to make it easier to check for differences between
versions instead of blindly hoping things will "just work". That's dangerous
on a well-unsupported platform.

The output, in the current directory, will be:

1. The downloaded source archive(s).
2. A copy of the extracted source archive(s).
3. In the ```InstallerOutput``` directory, a directory with the package name
   and version, normalized.
4. In the aforementioned directory, various temporary files *and* a .dmg file
   that is ready for distribution
5. In that same directory, a ```build``` directory with the contents of the
   .dmg, if you want to verify what's on it without mounting it.

Once the ```Package``` script completes successfully, the disk image will open
so that you may review its contents. Be sure to eject it before building the
same target again, or the results are undefined. In some cases, a reboot will
be necessary if you forget. This is your only warning.

### Example

To get the testing version of git 2.2.0.rc0 and then build and package it,
the following invocation would work:

```$ mkin/Get git -t 2.2.0.rc0 && mkin/Package git 2.2.0.rc0```

## Currently-supported package targets

* Git: Use ```Get``` with ```-t``` option to obtain a "testing" version.
  Otherwise, this is a basic git build to a prefix.

* Lynx: Bundles new-ish CA certificates, some Mac OS X modifications, some
  user-experience improvements (I hope...), and an iconic launcher for
  ```/Applications``` (so it can go in your Dock!).

## Known issues

* Git:
  - See ```Readme-Git.md```

* Lynx:
  - ```Lynx.app``` does not accept dropped targets (URLs, files, nothing...).
  - ```Lynx.app``` does not stay "open" as it simply invokes
    ```Terminal.app```. Investigation into how to best remove the
    ```Terminal.app``` dependency is ongoing.
  - There are font issues involved with "printing".
  - CA certs are a bit dated (see **URL forthcoming** for more information).

## Limitations

The limitations are pretty much design decisions.

* Destination is not configurable.
* The source directory is not cleaned, nor is the ```build/``` output in the
  DMG creation destination, upon successful completion of the appropriate
  ```PackageScript```. (The destination *is* cleaned before packaging.)

## Requirements

* [ ] To be written

## Using this for your own works

While I have no problems with anyone using this (see the license), even to
target different systems, it's of limited utility. I may be persuaded to make
it friendly to creating newer packages, as well. Specifically, I'd have an
interest in making it emit 10.5 packages (as these are the earliest which can
be massaged in such a way that they can be installed on newer OS X versions
with Gatekeeper). But I realize that the market is already niche and it might
be more worthwhile to just make the current 10.4 packages work properly on
10.5 if they don't already in whatever case.

As for use on not-OS-X systems? Sure, have at it. Let me know about it. But it
may be far, far easier to just use your system's native package-generation
tooling. It's (hopefully) superior and more mature than this stuff.

## Contributing

Just send a pull request. But do note that ```create-dmg``` is a git subtree.
See Atlassian's introduction to working with subtrees at
http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/
for some information about working with them.

### create-dmg/ tips

To update the create-dmg subtree to reflect the latest changes in the master:

mkin $ git remote add create-dmg git@github.com:lewellyn/yoursway-create-dmg.git
mkin $ git subtree pull --prefix create-dmg create-dmg master

To push changes from the create-dmg subtree:

    $ git remote add create-dmg git@github.com:lewellyn/yoursway-create-dmg.git
    $ git subtree push --prefix create-dmg create-dmg master

Of course, if you're working with a personal clone of the yoursway-create-dmg
repository, you will update the remote URLs appropriately. :)

It is not recommended to try to work with the create-dmg subtree if your git
does not have the subtree module available. The git provided by this repo
does include the subtree module, of course.

## License

See LICENSE.txt for actual license text. I want "permissive license, but spread
the good around" as the overriding spirit of the license choice. Not everything
this repo can package will be under the GPL, and I don't want to restrict people
from using things they find in this repo from using what they find for what they
are working on themselves. So, the license choice reflects that. As far as I am
aware, this license is compatible with the GPL (which is, of course, used by
some of these projects). Some projects may include additional "glue" beyond the
build scripts to make things more "Mac-like". If I am not in compliance with the
GPL somehow for the glue or any other aspect, please inform me of the details of
my noncompliance and I will relicense as appropriate.

