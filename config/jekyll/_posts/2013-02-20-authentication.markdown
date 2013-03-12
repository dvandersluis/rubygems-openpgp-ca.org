---
layout: post
published: true
title: Authentication
category: cms
---

Authentication
==============

To verify that a gem you've downloaded is authentic and hasn't been
tampered with, you need to:

* Verify that the gem itself is intact by checking a checksum.

* Verify that the checksum is authentic by checking a digital
  signature issued by the gem's author.

* Verify that the signature is valid by authenticating the key that
issued the signature.

But authentication is hard...
-----------------------------

How do you validate that a key is valid?  At first it seems simple.
Well this is the same key that's on the author's website, so it has to
be good.  But then you realize that if someone hacked the developer's
laptop they could also just change the key on the website.  And then
you think of another problem.  And another loophole.

And before you know it you've realized the only surefire way to
authenticate the key is to meet the developer in person and verify it
face to face.  (And now that you're paranoid, you start to wonder if
that really is the developer, or a clone or robot designed by agents
of Eastasia to deceive you.)

In the software world you may have different authentication
requirements if:

* You're working through a tutorial at home.

* You run an e-commerce site that processes credit cards.

* You're storing sensitive patient medical records.

* You run a nuclear reactor.

Enter the rubygems-openpgp Certificate Authority
------------------------------------------------

We provide some verification of signing keys.  It's not by any means
perfect, but provides a reasonable starting point to trust signing
keys.

We:

* Verify that the person registering the key has control of their
email address by sending a confirmation email.

* We verify that the developer controls the signing key by encrypting
the confirmation link.

* We verify that the developer has a rubygems.org account tied to the
same email account.

* We verify that the developer actually has previously developed and
  published gems to rubygems.org.

* A human verifies the sanity of all of the above elements for
anything suspicious. (For example, a signing key that has user ids for
haxxor@example.org and billg@microsoft.com, that is registered under
the haxxor@example.org account.)

* Once your key has been authenticated, the authentication is locked.
If your email is compromised down the road, the malicious user won't
be able to upload a replacement public key. (Eventually there will be
a revocation policy for lost or compromised keys, but it will not be
automatic.)

By connecting the signing key to the rubygems.org account via email,
we provide some basic assurances that the signing key is the correct
one.

But someone could still fake all that!
--------------------------------------

Yes, someone could perform a zero-day exploit.  They could:

* Compromise a developer's email.

* Perform a password reset on rubygems.

* Create their own private key.

* Register their key here.

* Upload malicious signed gem.

Exploit scenarios that are prevented:

* Registering a forged key without access to developer's email
account.

* Swapping out an existing good signing key for a forged one and
getting it signed by the Certificate Authority.

* A back-end exploit to rubygems.org could upload a compromised gem
with an unauthenticated signing key, but the client would notice that
the key is untrusted and reject the install.

And as time goes on, it becomes less and less likely that a maintained
gem has been compromised and signed by a malicious user.  If someone
does pull off a zero-day exploit, and a developer goes on to do six
releases over the course of a year, at some point someone will
probably notice that something is suspicious.

In conclusion...
----------------

Once again, the authentication scheme isn't perfect.  But it isn't
worthless either.  For most gem users we should provide enough
authentication for your purposes.  And it's better than simply
performing no authentication.

In addition, once developers sign their gems additional authentication
systems can be put into place.  One of the goals of this project is to
provide some incentive to get developers to sign their gems, so that a
variety of additional authentication systems can be put into place.
But we need the signatures first.  There are a variety of systems that
can be put into place after developers sign their gems.

So
--

Sign your gems.