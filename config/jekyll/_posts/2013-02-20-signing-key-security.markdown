---
layout: post
published: true
title: Signing Key Security
category: cms
---

Signing Key Security
====================

It is critical that our signing keys are securely maintained.  If not,
an attacker can issue malicious signatures on our behalf, bypassing
the actual certification process.  Here are the steps we take to
secure the signing keys.

Master Signing Key authenticates the current Signing Key
--------------------------------------------------------

A master signing key authenticates the current active signing key. If
the signing key is compromised, it will be revoked and a new one will
take its place.  The master signing key was generated on a computer
that has never been and will never be on a network.  To compromise the
master key an attacker would need to access this computer physically
at its current undisclosed location.

Master key fingerprint:

    pub   4096R/FDBA50FB 2013-02-16 [expires: 2014-02-16]
          Key fingerprint = BEED FE71 7668 50BF A6DE  5A19 25A6 5396 FDBA 50FB
    uid                  rubygems-openpgp Certificate Authority MASTER KEY
                                           (http://rubygems-openpgp-ca.org)
    sub   4096R/9A39A769 2013-02-16 [expires: 2014-02-16]

The fingerprint can also be retrieved from our [Github
page](https://github.com/grant-olson/rubygems-openpgp-ca.org).

Signing computer is physically located on-site
----------------------------------------------

It is not in the cloud.  It is physically controlled by us.

Signing occurs over an 'air gap'
--------------------------------

Signatures are not issued via the web server where you registered your
key.  After you have authenticated your key with the web server we
sign on another computer with an 'air gap' in place.  If the web
server is compromised, an attacker can't just ssh into the signing
server.

Signing key is on an OpenPGP smart card
---------------------------------------

Once we're on the signing computer, the signing key is contained on an
[OpenPGP smart card](http://g10code.com/p-card.html) that is only
inserted and activated for the duration of signing.

If the signing computer is compromised remotely, an attacker won't be
able to physically insert the smart card and activate it.

If the signing computer is compromised locally, an attacker still
requires access to the smart card.

If the smart card lost or stolen, an attacker only has three attempts
to enter a passphrase before the card lock itself down.  Attempting to
unlock the card unsuccessfully three times will cause the card to self
destruct.  A brute force attack is not possible.

Signing key has a rotating expiration date
------------------------------------------

The signing key is set to expire every sixty days.  At the end of that
sixty days, assuming the key has not been compromised, it is renewed
for another 60 days.  This forces users to practice good keyring
hygiene and refresh their keyring, retrieving any revocations issued
by the signing key, or to the signing key itself.
