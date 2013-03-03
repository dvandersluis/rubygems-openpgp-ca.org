---
layout: post
published: true
title: Key Revocation
---

Key Revocation
==============

If your key is compromised or simply lost, you'll need to revoke it.
This relies on generation of a revocation key.

Backing Up Your Key and Generating a Revocation Certificate
-----------------------------------------------------------

If you are signing your gems and haven't done this yet, please do so:

    gpg --armor --export-secret-keys > /media/usb_stick/key_backup.asc
    gpg --gen-revoke 0xDEADBEEF > /media/usb_stick/key_revoke.asc

Note that the exported secret key is still encrypted with your
passphrase and relatively safe.  However, the revocation certificate
is not.  if someone gains access to your revocation certificate, they
can revoke your key without any safeguards.

Revoking Your Own Key
---------------------

In the event you decide you need to revoke your own key, run:

    gpg --import /media/usb_stick/key_revoke.asc
    gpg --keyserver pool.sks-keyservers.net --send-keys 0xDEADBEEF

And this will publish the revocation.

Keeping Your Keyring Up-to-date
-------------------------------

Even after a revocation has been published, users need to get that
updated information.  To keep your keyring up-to-date, you should
periodically run:

    gpg --keyserver pool.sks-keyservers.net --refresh-keys

This will grab any updates for any keys on your keyring.

Forcing Users to Keep Their Keyrings Up-to-date
-----------------------------------------------

One way to force users to update their keyring is to set a revolving
expiration date on your key.  This way the system will tell them the
key is expired and they will need to refresh their keyring to get the
updated expiration information.

I set my personal key to expire yearly for this reason.  I've also set
the official CA signing key to have a rotating expiration of 60 days
to hopefully force rubygems-openpgp users to keep their keyrings
up-to-date.

If All Else Fails, the CA Should be Able to Revoke Its Signature
----------------------------------------------------------------

Of course eventually someone is going start signing their gems, fail
to generate backups, and somehow lose their key.  We'll need some way
to revoke the CA's certification signature.  There currently isn't a
policy in place.

It seems a user should be able to request that we revoke their key.
However, we now end up in a situation where a malicious user only
needs access to a user's email address to reset their password and
issue a revocation.  They would then be able to submit a new signing
key.

Right now I think the only solution is to have a time-out period after
this revocation is requested.  If we implement the ability to request
revocation via the website only, the signature will be revoked, and
there will be a 60 day cooling off period where we won't accept a new
key.

This isn't perfect, but it minimizes the amount of damage a malicious
user could do before the actual user realizes their email has been
compromised.

What Do You Think?
------------------

Is the above proposal reasonable?  Is there a better way?  Should we
simply leave revocation in the hands of users and not allow our
certification to be revoked?
