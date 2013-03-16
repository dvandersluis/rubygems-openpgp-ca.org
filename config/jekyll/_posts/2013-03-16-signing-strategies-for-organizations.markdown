---
layout: post
published: false
title: Signing Strategies for Organizations
---

Signing Strategies for Organizations
====================================

Someone on the mailing list asked how organizations can sign gems.  If
an organization has a dozen members, each able to publish a new
version of the gem, then how should they sign it?

I did a quick write-up on strategies decided to expand that here.

Just designate a single signer
------------------------------

This is the simplest method.  Just designate a single person as the
authorized signer and have them use their personal key.

This is the way that that python signs their releases.  The current
download page simply has the note:

> Note: Barry's key id EA5BBD71 is used to sign all Python 2.6 and 3.0 releases. His key id ED9D77D5 is a v3 key and was used to sign older releases.

With rubygems-openpgp you can do a two-phase build/sign, so this
person doesn't need to be the release manager if his time is short.

1. Release Manager builds and delivers to signer.

2. Signer runs `gem sign foo-0.0.0.gem` and publishes.

The signer would still need to be available, but would only need a few
minutes of time.

### Pros

* Simple.  Easy to implement.  You can just start doing it.

### Cons

* Single point of failure.

Establish a signing key that is tied to the project, not an individual
----------------------------------------------------------------------

This is how Ubuntu signs their .iso releases.  They have a single
signing key that isn't tied to a user or email, but a project:

    pub   1024D/FBB75451 2004-12-30
    uid                  Ubuntu CD Image Automatic Signing Key
	                                      <cdimage@ubuntu.com>


A key like this can then be used by multiple people, but also
provides multiple routes for the key to be stolen and/or compromised.

This key could be signed by project members and vice versa to
demonstrate that its the proper key to anyone who has authenticated
any of the project member's key.

### Pros

Provides a single consistent key for end users.

### Cons

Once someone has control of a key it can't be undone.  If a developer
leaves the organization under bad circumstances, they could
conceivably revoke the key, issue forged signature, etc.  This might
force you to revoke the key and generate a new one.

Establish a project master key that authenticates developers keys
-----------------------------------------------------------------

Basically create a mini-authority.  The assumption is that if this key
has certified a developer's key, they are authorized to sign on the
project's behalf.

This is the way apt-get basically works, but I'd need to do some
research to confirm that, so don't hold me to that.

An end user would sign off on the master key and set the appropriate
owner trust and they will have authenticated all of the developers.

### Pros

* Organization members can be added and removed at any time.

* Users have a single consistent identifiable key to trust.

### Cons

This will currently cause problems with ssh-style key continuity
because the actual signing key will change between releases.  But if
this is a requirement for some larger projects I'll find a better
solution.

So
--

Sign your gems.
