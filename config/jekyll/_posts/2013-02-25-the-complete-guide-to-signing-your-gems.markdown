---
layout: post
published: true
title: The Complete Guide to Signing Your Gems
category: cms
---

The Complete Guide to Signing Your Gems
=======================================

By signing your gems you allow other users to verify the gem was
actually written and build by you.

OpenPGP Key Setup
-----------------

You'll need to generate a signing key and publish it to the keyservers
so that users can retrieve the key.

### Install gpg if not installed.

* [Windows](http://www.gpg4win.org)
* [OSX](https://www.gpgtools.org/)
* Linux - installed

Not sure if you need to? Run:

    gpg --version

### Generating the key

    gpg --gen-key

All the defaults are fine.  You will want to use a real email address
so users can tie the key to your account.

### Publishing the key

This allows users worldwide to retrieve your public key.

    gpg --keyserver pool.sks-keyservers.net --send-key 0xDEADBEEF

### Backups

Since you have actually published your key, it is highly advisable
that you back it up onto some safe offline media.  There is no way to
re-generate the key if you lose the copy on your machine.

In addition, you'll want to generate a revocation certificate.  This
allows you to send a revocation to the keyserver network in the event
your key is compromised.

    cd /media/usb_stick
    gpg --export-secret-key 0xDEADBEEF > key_backup.gpg
    gpg --gen-revoke 0xDEADBEEF > key_revoke.gpg

Please note that the revocation certificate is unencrypted, and anyone
who can gain access to it can revoke your key worldwide.

### The More You Know...

Since you will be using your key publicly, it is highly advisable that
you read up more on gnupg and OpenPGP.  But that's out of scope for
this article.

Signing Your Gem
----------------

Install rubygems-openpgp if you haven't yet.

    gem install rubygems-openpgp

Sign your gem before publishing.

    gem build foo.gemspec --sign

Check the signature.

    gem verify foo-0.0.0.gem

Publish the gem.

    gem push foo-0.0.0.gem

And that's it!

At this point anyone can download your gem, retrieve your public key,
and verify the contents.  However, they don't have an easy way to
authenticate your key.  You may want to register it with this site.

Registering Your Public Key with rubygems-openpgp-ca.org
--------------------------------------------------------

Fill out [the application](/users/sign_up).

You will receive an email with some encrypted text:

    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v1.4.11 (GNU/Linux)
    
    hQEMAxRYvMtqj3z2AQf+I1+9b6RAysFonkr+A0ETE6paWAw6enZw8Z0uj24DBIjr
    iRQf3s/HFKntOPs5ziLHWZS+5B7KuxvIiJQzvLDroLteBKYo0XwZTe3DTYAQz54b
    aqe8Yk58dPvmAGJSqFhICXV2kv3QJftLTzXka5OxjhA93EJtK8Z+Orl1ZHgml/70
    QAVqBEt83jLQhTfFJOYASoctAIJmTZzfUexGLReghOMBEF/hU85/9mMuMwHMrHou
    ctpQ6IfxTEtVy+rUnOiJ6rK4Ky5th2NA7KoLnlDtB15xkkr7vWwTD2NuMX3KQZ87
    GbvhqE272xCdJTGUAH9O1QcCMta6RSCKur19DkpBptI/AVKGxBdghd76yS8ImC7J
    E5kQJdGMXbV1NWTE8azfKnvf1/0PbW9VjjB0CIc62hyYEwkh/WLp2LPnQPjQ1FiY
    =qAbC
    -----END PGP MESSAGE-----

If you're not using an [encryption enabled email
client](http://enigmail.net/home/index.php) you'll need to copy the
encrypted text into a file and decrypt manually:

    gpg saved_text.asc
    cat saved_text

Follow the unencrypted link to complete the process.

We'll review the application, hopefully sign off on your key, and
notify you one way or the other.

Retrieving Our Signature
------------------------

After we've sent our signature to the keyservers you'll want to
retreive a copy by refreshing your keyring:

    gpg --keyserver pool.sks-keyservers.net --refresh-keys
    
This will look for new signatures on all keys on your keyring.  You
want to do this periodically to retrieve any new signatures,
revocations, and expirations that have been published after you
originally retrieved any given key.

You can now confirm that your key has been signed.  Just use the
command `gpg --list-sigs 0xDEADBEEF`.  You'll see something like:

    johnmudhead:pikimal grant$ gpg --list-sigs 0xE3B5806F
    pub   2048R/E3B5806F 2010-01-11 [expires: 2014-01-03]
    uid                  Grant T. Olson (Personal email) <kgo@grant-olson.net>
    sig 3        E3B5806F 2013-01-03  Grant T. Olson (Personal email) <kgo@grant-olson.net>
    sig 3        6094090A 2013-02-18  rubygems-openpgp Certificate Authority
                                      Signing Key (http://rubygems-openpgp-ca.org)
    uid                  Grant T. Olson (pikimal) <grant@pikimal.com>


And now that you've done all that, please be sure to...

Backup your public key
----------------------

And after that...

Backup your public key
----------------------

You did create a backup, right?

And you're done
---------------

That wasn't too bad, was it?
