---
layout: post
published: true
title: rubygems-openpgp 0.6.0 Released
category: releases
---

rubygems-openpgp 0.6.0 Released
===============================

rubygems-openpgp is a rubygems plugin that allows you to sign and
verify your gems with OpenPGP.

Verifying is as simple as:

    gem install openpgp_signed_hola --trust

Signing is as simple as:

    gem build foo.gemspec --sign

Now With rubygems.org Owner Verification Checks
-----------------------------------------------

When verifying a gem we now query rubygems.org for a list of valid gem
owners and ensure that the gem's signature comes from:

*   One of the listed owners at rubygems.org.

*   Via a UID that has been authenticated by the user.

This prevents a few potential exploits:

*   Previously a user could get you to authenticate their key for a
    legitimate gem, somehow deliver an illegitimate gem, and you would
    have trusted the signature.
	
	The owner verification check will now fail because this particular
	user doesn't have rights on this particular gem.

*   A user could get you to authenticate their key for a legitimate
    gem via an innocuous email address such as foo123@gmail.com and
    then later add a UID for a known user like dhh@37signals in an
    attempt to obfuscate the signing key's origin.

    The owner verification check will now ignore the new forged email
    address because it hasn't been authenticated by the user.

Verification can be shut off with the flag `--ignore-owner-check` if
(for example) you're installing a gem without a network connection.

Other Minor Improvements
------------------------

*   --trust now automatically assumes that you want to verify.  You
    don't need both flags.

*   We provide installer links if we can't detect a working copy of
    gpg.
	
*   Added --trust option to the `gem verify` command.

*   We properly display OpenPGP short ids as 8 characters of hex, not
    nine.

Learn More at the rubygems-openpgp Certificate Authority
--------------------------------------------------------

Several guides, walkthroughs, and documents explaining my motivations
are available at the [rubygems-openpgp Certificate
Authority](https://www.rubygems-openpgp-ca.org).

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

### Detached signature for the 0.6.0 release

<pre>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQEcBAABAgAGBQJRRf0qAAoJEP5F5V2hilTWnhwIAIeCxmyiUT4C7/VPLvpwPypX
IGrhaA3hZZzknAh2MxKx+OPiWDt7ynvSlfdbdYbkSbiKv4ho4husLrhfGV7COKws
HImXCE4SF+Zhb2WifI7haSCRfrZ4M0z/4adalcB4GpkDRmRYuw1RI92PDLOADLSD
u80FPfEF2ekRJqFAUU1Ayzpl8MCfl8e6uzj2CZ8CKtceApb6HZbdWA/jhvuIjXXM
tJDAE22rugFw8ba6e9iinFHYpo9XYMG551YzR70lAqWXtxjgAM3jVDGlAXpkQGxM
9WTas7RRYmLH1h+JvB/DFR61oZaC3gzBP1IS42KOnXywwcq/rK6/CltPf6MZtco=
=aA4r
-----END PGP SIGNATURE-----
</pre>

Enjoy
-----

- Grant
