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
  - Some perl modules do not work (so things like ```git-svn``` are broken).
  - The contrib items are not actually installed, but rather live in
    ```/opt/git/contrib``` (which makes things provided there, such as
    ```git-subtree```, harder to use).

* Lynx:
  - ```Lynx.app``` does not accept dropped targets (URLs, files, nothing...).
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

## License

See LICENSE.txt for actual license text. In spirit, I want "permissive
license, but spread the good around" as the overriding spirit. As far as I
know, this license is compatible with the GPL (which is, of course, used by
some of these projects). While the GPL does not, as far as I am aware, require
the distribution of build scripts and such, some projects may include
additional "glue" to make things more "Mac-like". If I am not in compliance
with the GPL somehow, please inform me of the details of my noncompliance and
I will relicense as appropriate.

