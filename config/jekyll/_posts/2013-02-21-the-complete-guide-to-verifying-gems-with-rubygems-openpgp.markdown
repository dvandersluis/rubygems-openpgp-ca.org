---
layout: post
published: true
title: The Complete Guide to Verifying Gems with rubygems-openpgp
---

The Complete Guide to Verifying Gems with rubygems-openpgp
==========================================================

rubygems-openpgp allows you to verify a gem by checking the digital
signature.  This helps to ensure that the gem you are using is
actually the gem published by the author and that it hasn't been
replaced with malicious code.

Gem users can verify their gems with a few simple steps.

## Setup

### Install the rubygems plugin

    gem install rubygems-openpgp

### Install gpg if you need too

* [Windows](http://www.gpg4win.org)
* [OSX](https://www.gpgtools.org/)
* Linux - installed

Not sure if you need to? Run:

    gpg --version
    
## Install and verify the test gem

There is a signed version of the hola gem on rubygems.org.  Try to
install it.

    gem install openpgp_signed_hola --verify

This will probably fail because you don't have the user's public
signing key yet. This is required to verify the signature. Try again
with an extra option to retrieve the public key automatically.

    gem install openpgp_signed_hola --verify --get-key

Now we will retrieve the key and the signature can be verified.

    OUTPUT

Note that we were able to verify the signature, but it's listed as
unverified.

This is because even though you've downloaded the key, you have no
idea if it is authentic. Anyone can make a key with any email and
upload it. (In fact there are several forged keys out there now that
are
[attributed to president@whitehouse.gov](http://pool.sks-keyservers.net:11371/pks/lookup?op=vindex&search=president%40whitehouse.gov&fingerprint=on)
.)

## Authenticating the key

Because someone can easily create a forged key, you need to
authenticate the key. We'll cover authentication in another post in
the future. For the purposes of this discussion, lets be hand-wavy
about that and assume that you've somehow authenticated the key.

## Signing the key

Now that you've authenticated the key you want to sign the key. This
is done by issuing a cryptographic signature saying that you believe
this is the correct key.

But before you do that, you'll need to generate a gpg key if you
haven't already.

### Generating your signing key

    gpg --gen-key

For the most part you can follow the defaults.  I'll write in more
detail about generating keys in another post, but for now lets just
keep moving and generate a key quickly.

### Signing the test package author's key

    gpg --lsign 0xE3B5806F

### Verifying against the authenticated key

    gem install openpgp_signed_hola --install --verify

Now you'll see that the signature is verified **and** trusted.

    OUTPUT

### Cleaning up

Since this was just a test and you didn't really autenticate the key,
lets clean up the keyring by deleting your signature.

    gpg --del-sig 0xE3B5806F


## Using the certificate authority

Authenticating keys can get to be a bit of a pain.  You need to
verify the key for the developers of every gem you need to use.  In a
complex project that can number in the hundreds.

A certificate authority steps in as a trusted third-party, issuing
its own signatures against developer keys that it trusts.  Now you, as
the user, only need to decide to authenticate and trust the
certificate authority instead of 100's of individual developers.

This obviously isn't as safe as performing the verifications yourself,
but provides a reasonable middle ground that saves you time.

If you want to use a certificate authority, you need to tell gpg that
you think the key is authentic, and that you trust the signatures it's
issued.

### Getting the CA key

### Authenticating the key

A little less hand wavy here.

### Signing the CA key

### Assigning trust to the CA key

### Verifying the test gem

### Summary

Blah blah blah.

