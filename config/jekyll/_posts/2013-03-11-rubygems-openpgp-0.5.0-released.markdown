---
layout: post
published: true
title: rubygems-openpgp 0.5.0 Released
category: releases
---

rubygems-openpgp 0.5.0 Released
===============================

rubygems-openpgp is a rubygems plugin that allows you to sign and
verify your gems with OpenPGP.

Verifying is as simple as:

    gem install openpgp_signed_hola --verify --trust

Signing is as simple as:

    gem build foo.gemspec --sign

Now with ssh-style Key Continuity Checks!
-----------------------------------------

rubygems-openpgp now tracks the keys used to sign your gems and will
error out if the signing key for a given gem has changed.  This works
the same way ssh does when you connect to a host where the key has
changed.

You can then investigate, and assuming the key change is valid, you
can remove the appropriate entry in ~/.rubygems-openpgp/known_gems to
allow installation to complete.

Other Minor Improvements
------------------------

* Gem name is shown before verification status.  Previously it was
  confusing to see multiple verification messages when gem
  dependencies were verified.

* Generic gpg code was extracted into the gpg_status_parser gem for
  easier re-use.

* Signing/verifying now skips X.509 signatures if they exist.  We only
  sign/verify the real payload.

* Minor improvements for Windows users.  We don't output invalid
  unix-style color codes on windows, or print stuff like '~/path' that
  doesn't make sense on windows.

Learn More at the rubygems-openpgp Certificate Authority
--------------------------------------------------------

Several guides, walkthroughs, and documents explaining my motivations
are available at the [rubygems-openpgp Certificate
Authority](http://www.rubygems-openpgp-ca.org).

Note that use of the Certificate Authority itself is entirely
optional; users of rubygems-openpgp can apply whatever trust model
they wish when verifying gems.

Verifying Your Initial Install
------------------------------

Existing users of rubygems-openpgp can verify the install with
rubygems-openpgp itself:

    gem install rubygems-openpgp --verify --trust

It is recommended that new users fetch the gem and verify it against a
detached signature.  Instructions on how to do so can be found at the
[Guide to Verifying Your Initial Install](/blog/the-complete-guide-to-verifying-your-initial-install.html).

### Detached signature for the 0.5.0 release

<pre>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJRPJY3AAoJEP5F5V2hilTWVj8H/2R3Ue+4lJxbpZwu/cOodlWb
ApflZwrhOnGHjxswL7cV7Rf15sPP9WHUvNf/n8Cuc4hHKArW7/wwdw1LP4wmrRz4
8RxKx8kR7An9JFvs9HhrDt1BvS/j9moaKn//lZfZV7LPIEEuHEUTCNCtHkuV/oBG
LH9tNSMs1CO1D1kkPyxc2aXZm0mRpygWrS1YskJPy7xdR2aNQk4LHJNF168m+XJH
2l8U29QgoCpD0W4iL+6ooyY2lyVFWYhQbBd7ojVRG16Q8CxUf4+ZNey+3tgchVEP
qBFa4M/+m2LoVdCGPOL8meFMytDR75J4VGWtGmRxjfhBeOeNVhneIQT5C6fHCfw=
=Qxhv
-----END PGP SIGNATURE-----
</pre>

Enjoy
-----

- Grant