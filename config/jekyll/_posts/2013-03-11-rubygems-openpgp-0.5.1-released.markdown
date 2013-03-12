---
layout: post
published: true
title: rubygems-openpgp 0.5.1 Released
category: releases
---

rubygems-openpgp 0.5.1 Released
===============================

This release corrects a minor issue where a Windows machine couldn't
sign an existing gem built on linux.

Verifying Your Initial Install
------------------------------

Existing users of rubygems-openpgp can verify the install with
rubygems-openpgp itself:

    gem install rubygems-openpgp --verify --trust

It is recommended that new users fetch the gem and verify it against a
detached signature.  Instructions on how to do so can be found at the
[Guide to Verifying Your Initial Install](/blog/the-complete-guide-to-verifying-your-initial-install.html).

### Detached signature for the 0.5.1 release

    -----BEGIN PGP SIGNATURE-----
    Version: GnuPG v1.4.11 (GNU/Linux)
    
    iQEcBAABAgAGBQJRPMTkAAoJEP5F5V2hilTWuBMH/30hvYMpCP6dawq6LwufKTgB
    w+hsiII3nRshCo6yicYs8kBsT/7oSc7XZg1q3oHXQgJdal/eLBdVEOXdZ8a7zKPh
    SjvuHRSBpei3wA1DjPAvJxqjdGOX883rzDLRtP+pvyzazeO6Fj/8d/c8Y6YArEf5
    gwWdaA2s0XXdecH21yWMZPKD3x2YQEARCJJWhyngt+FW5ZHlaAwXPkhpAptzchEe
    MC8ThY4WZIPRc3+O9II93wGcNJu3T0sOg5NUzgT6vNLzCOtNLNe/hpD/QWUt/5za
    RbwqxGcP0QyNDEZQTVpLTBiiq++qyGRUb7cySTDVBqgwasal19VmVsflhTCbBt0=
    =mU3L
    -----END PGP SIGNATURE-----

Enjoy
-----

- Grant