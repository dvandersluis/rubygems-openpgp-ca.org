---
layout: post
published: true
title: The Complete Guide Signing the Certificate Authority Keys
---

The Complete Guide Signing the Certificate Authority Keys
=========================================================

In a perfect world you would meet the developer of every gem you use
in person, verify their OpenPGP key, and sign off on it.  But this
approach doesn't scale very well.  Even if you skip the in person part
of the verification and trust each developer's github page, you can
still end up with hundreds of keys that need to be verified.

A Certificate Authority can help with that.  The basic idea is that
the Certificate Authority does its own verification on keys and
publishes that information.  Then you simply trust (or not) the single
Certificate Authority.  Now you only have one verification to perform.

Our Signing Key Configuration
-----------------------------

All OpenPGP 'settings' are stored as digital signatures issued by
signing keys.  If you trust a key is authentic, you sign a little
document saying so.  If you want to expire an old key, you sign a
little document saying so.  If settings were just stored in a file,
then someone who has compromised your computer could just change the
`trusted_keys.txt` file.  A signature requires control of the private
key which is usually encrypted.

We have two different types of keys.  The **master key** and the **signing
key(s)**.

The master key is secured on a computer in an undisclosed location
that has never been on the Internet.  It is only fired up when we need
to issue a certification for a new signing key, which may happen once
or twice a year.  This certification is then transported via USB key
to another computer and distributed to the keyserver network.  This
makes it very difficult to compromise the master key.

The **signing keys** are used to perform the day-to-day signing of
developer's keys.  They are contained on OpenPGP smartcards which
provide a few layers of security.  A PIN code must be entered every
time a signature is issued.  The card will only allow three pin
attempts before locking.  An attacker would need to physically possess
the card and know the PIN to issue a forged signature.

As you can see, the signing keys are still very secure.  But in the
event one is compromised the **master key** can revoke its
certification and issue a new certification on a new signing key.  It
just adds another layer of security to the process.

Telling gnupg That You Trust Our Keys
-------------------------------------

You'll want to issue a trust signature on the master key.  This says
that you trust signatures issued by any key that has been signed by
the master key itself.  In short, this means that you will ultimately
trust the **signing keys** and everything will work the way you want
it to.

But before you do that, you'll need to generate a gpg key if you
haven't already.

### Generating your signing key

    gpg --gen-key

For the most part you can follow the defaults.  I'll write in more
detail about generating keys in another post, but for now lets just
keep moving and generate a key quickly using the defaults.

### Retrieving the Master Key

    gpg --keyserver pool.sks-keyservers.net --recv-keys 0xFDBA50FB

### Verifying the fingerprint

    gpg --fingerprint --list-key 0xFDBA50FB

This will show you the fingerprint of the key installed locally.

    pub   4096R/FDBA50FB 2013-02-16 [expires: 2014-02-16]
          Key fingerprint = BEED FE71 7668 50BF A6DE  5A19 25A6 5396 FDBA 50FB
    uid                  rubygems-openpgp Certificate Authority MASTER KEY
	                                  (http://rubygems-openpgp-ca.org)
    sub   4096R/9A39A769 2013-02-16 [expires: 2014-02-16]

You'll want to compare this with a copy of the fingerprint retrieved
from a trusted source.  In an ideal world, you would do this in
person.  But this can be impractical.

For now, lets assume that the [copy listed at
github](https://github.com/grant-olson/rubygems-openpgp-ca.org) is
safe.  Now a malicious user would have to compromise both this site
and a github account to replace both key ids and fingerprints.

Another option would be to verify that the key you have is signed by
the same key I use for [release announcements on
ruby-talk](http://www.ruby-forum.com/topic/4411248#new).  That adds
another layer that a malicious user would need to compromise.  They'd
need to hack my email, and my personal OpenPGP key.

At some point you'll have decided that that key is authentic based on
your own personal standards.

### Issuing the trust signature

    gpg --edit-key 0xFDBA50FB

This will fire up an interactive session.  The settings can get a
little confusing so lets walk through them.

    grant@johnicicleboy:~$ gpg --edit-key 0xFDBA50FB
    gpg (GnuPG) 1.4.11; Copyright (C) 2010 Free Software Foundation, Inc.
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
    
    
    pub  4096R/FDBA50FB  created: 2013-02-16  expires: 2014-02-16  usage: SC  
                         trust: unknown       validity: unknown
    sub  4096R/9A39A769  created: 2013-02-16  expires: 2014-02-16  usage: E   
    [ unknown] (1). rubygems-openpgp Certificate Authority MASTER KEY
                                     (http://rubygems-openpgp-ca.org)
    
    gpg>

First you'll want to tell gpg that you're issuing a local trust
signature.  

The **local** part means that this signature will only
work on your local machine.  You will not advertise to the world that
you signed this key.

The **trust** part means that you're issuing a trust signature as
discussed above.

    gpg> tlsign
    
    pub  4096R/FDBA50FB  created: 2013-02-16  expires: 2014-02-16  usage: SC  
                         trust: unknown       validity: unknown
     Primary key fingerprint: BEED FE71 7668 50BF A6DE  5A19 25A6 5396 FDBA 50FB
    
         rubygems-openpgp Certificate Authority MASTER KEY
	                  (http://rubygems-openpgp-ca.org)
    
    This key is due to expire on 2014-02-16.
    Please decide how far you trust this user to correctly verify other users' keys
    (by looking at passports, checking fingerprints from different sources, etc.)
    
      1 = I trust marginally
      2 = I trust fully
    
    Your selection?

Next it will ask how much you trust the key.  This has to do with the
way the OpenPGP Web-of-Trust works, which I'll hopefully discuss in a
later post.  For now, say you trust it fully:

    Your selection? 2
    
    Please enter the depth of this trust signature.
    A depth greater than 1 allows the key you are signing to make
    trust signatures on your behalf.
    
    Your selection?

By setting a depth of 2, the signing keys' signatures are trusted, but
developer keys are not.

    Your selection? 2
    
    Please enter a domain to restrict this signature, or enter for none.
    
    Your selection? 

Just hit enter here.

    Are you sure that you want to sign this key with your
    key "Test User <test@example.org>" (25D38721)
    
    The signature will be marked as non-exportable.
    
    Really sign? (y/N)

Select yes

    Really sign? (y/N) y
    
    You need a passphrase to unlock the secret key for
    user: "Test User <test@example.org>"
    2048-bit RSA key, ID 25D38721, created 2013-02-09
    
You'll be prompted for a password.  Enter it.  At this point gnupg
still won't save the signature until you quit and save.
    
    gpg> quit
    Save changes? (y/N) y

### Download the current signing key

    gpg --keyserver pool.sks-keyservers.net --recv-keys 0x6094090A

### Test with the test gem

If you've already installed the test gem and certified the signing
key, delete the key.

    gpg --delete-key 0xE3B5806F

Run the install with `--verify`, `--trust`, and `--get-key` args.

    gem install openpgp_signed_hola --verify --trust --get-key

If everything is setup correctly, you should trust the package based
on the Certificate Authority signature on the key:

<pre><code><span style='color:green;'>Signature for data.tar.gz from user Grant T. Olson (Personal email)
    <kgo@grant-olson.net> key 0x0E3B5806F is GOODSIG, VALIDSIG and TRUST_FULLY
Signature for metadata.gz from user Grant T. Olson (Personal email)
    <kgo@grant-olson.net> key 0x0E3B5806F is GOODSIG, VALIDSIG and TRUST_FULLY</span>
Successfully installed openpgp_signed_hola-0.0.0
1 gem installed</code></pre>

Now you're set!
---------------

Congratulations!
