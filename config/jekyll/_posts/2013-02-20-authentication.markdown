---
layout: post
published: true
title: Authentication
category: cms
---

Authentication
==============

Authentication is hard...
-------------------------

How do you validate that a signing key is authentic?  At first it
seems simple.  Well this is the same key that's on the author's
website or github page, so it has to be good.  But then you realize
that if someone hacked the developer's email they could also just
reset a password and publish a forged key on the website.  And then
you think of another problem.  And another loophole.

And before you know it you've realized the only surefire way to
authenticate the key is to meet the developer in person and verify it
face to face.  (And now that you're paranoid, you start to wonder if
that really is the developer, or a clone or robot designed by agents
of Eastasia to deceive you.)

Enter the rubygems-openpgp Certificate Authority
------------------------------------------------

We attempt to provide some base-level authentication of gem
developer's signing keys.  It's not by any means perfect, but provides
a reasonable starting point to trust signing keys without having to
authenticate hundreds of individual developer's keys.

### When we've signed off on a key, we're asserting...

#### The applicant controlled the email account attached to the signing key.

Anyone can generate a key with any email.  We confirm the applicant is
actually in possession of the email address used to sign by sending a
confirmation email.

#### The applicant controlled their signing key

This is why we send an encrypted confirmation link.  A applicant won't
be able to complete confirmation without control of their personal
signing key.

#### The applicant actually is an active applicant

We check to see that the applicant has a rubygems.org account, has
contributed a non-trivial gem, and is on some level a member of the
ruby community.

#### The applicant is authorized to publish on rubygems.org

We do this by confirming either:

* That the applicant has the same email account on rubygems.org as
they do on the application.  (They could reset their password on
rubygems.org)
  
Or, in the case the applicant is using an organizational signing key:

* That the applicant has successfully published a gem to rubygems.org
  signed by their signing key.

### All signing is manually verified by a human

A human verifies the sanity of all of the above elements for anything
suspicious. (For example, a signing key that has user ids for
haxxor@example.org and billg@microsoft.com, that is registered under
the haxxor@example.org account.)

### Once your key has been authenticated, the authentication is locked.
	
If your email is compromised down the road, the malicious user won't
be able to upload a replacement public key. (Eventually there will be
a revocation policy for lost or compromised keys, but it will not be
automatic.)

What we do not authenticate
---------------------------

#### That a applicant has no malicous intent.

They could still upload a gem that runs `rm -rf /`

#### That the applicant has good security practices

We can't guarantee that an applicant:

* Properly secures their signing key.

* Used a strong password at rubygems.org.

* Etc.


## Our system isn't the be-all and end-all to authentication, it's just the beginning


The authentication scheme isn't perfect.  But it isn't worthless
either.  We think this should provide enough authentication
for most users.  And it's better than simply performing no
authentication.

One of the goals of this project is to provide some incentive to get
developers to sign their gems, so that a variety of additional
authentication systems can be put into place.  

Imagine a world where in addition to our certification any or all of
the following happened:

* Developers who knew each other personally authenticated each others keys.
  
* Local user groups authenticated keys, establishing not only
  authenticity but that the signee is considered to be a member in
  good standing with the local community.
  
* Keys were signed by something like "RailsConf 2013" establishing
  that the user has been at said conference.

* And more...

But for that we need the signatures first.

So
--

Sign your gems.
