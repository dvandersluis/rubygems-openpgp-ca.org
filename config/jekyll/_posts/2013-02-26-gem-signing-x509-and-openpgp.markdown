---
layout: post
published: false
title: Gem Signing: X.509 vs OpenPGP
---

Gem Signing: X.509 vs OpenPGP
=============================

This is a contentious topic.  It's right up there with Emacs vs Vim.
Kirk vs Picard.  Jesus vs Santa.  All that.

I feel like some people have been dismissive of rubygems-openpgp.
"Why use something that doesn't run natively in ruby?  Then the lowly
Windows developers can use it."  And I'm ashamed to say I've been
equally dismissive.  "Because X.509 sucks and it's broken!"

I'm going to try to take a step back and articulate why I don't think
we'll ever have a decent X.509 solution.  I'll avoid the more arcane
technical details of each standard, and I actually won't flame too
much.

State of the Union
------------------

Basic functionality do sign gems with X.509 was introduced in release
0.8.11 of rubygems, in July of 2005.  And 7-1/2 years later we
have... basic functionality to sign gems with X.509.  In theory this
can be used by anyone using rubygems.  In practice it's used by no one.

Central Thesis, in Terms Anyone Can Understand
----------------------------------------------

* An X.509 based system requires a complete **centralized** end-to-end
  authentication system to be in designed and implemented **before** it
  is useful to gem developers and users.

* An OpenPGP system allows gem developers and users to sign and verify
  in a useful way *immediately*.  Authentication systems can be added
  **after** the fact in a **decentralized** fashion.

X.509 is the cathedral, OpenPGP is the bazaar.

Why does X.509 Need the Authentication System First?
----------------------------------------------------

X.509 certificate chains start with a root Certificate Authority, may
have intermediate Certificate Authorities, that ultimately sign off on
developer's certificates.  They are strict tree structures.  Because
they are trees, each certificate can only have a single parent.

As in biology, the parent must exist before the child.  Without a
Certificate Authority system in place before hand, a developer is left
with no choice but to issue a self-signed certificate.  This
conveniently sidesteps the ability to reliably authenticate the
signature.  Hence those nasty browser notices when you got to a
[self-signed web page](https://web.monkeysphere.info/).

Why doesn't OpenPGP?
--------------------

OpenPGP's trust model is a Web of Trust.  A developer creates a
signing key.  After that, other key issuers can create signatures that
'point' to the keys they think are authentic.  Multiple issuers can
say they trust the same key.  The trust model is a directed graph.

These signatures are issued *after* key creation at any time by anyone
with or without involvement of the original developer.

Practical Implications
----------------------

### X.509

#### The Certificate Authority structure must be in place *before* developers can create their own certificates

A developer can't create their own certificate until the CA structure is
designed and implemented.  They need to wait for the system to be in
place first.

If there is no CA structure in place, the only alternative they have
is to issue a self-signed certificate, essentially declaring
themselves a mini-CA.  

In addition to mostly side-stepping the authentication issue,
thousands of self-signed certificates don't scale if a user actually
tries to authenticate self-signed keys.

#### A Certificate Authority can't approve old packages

If a developer later wants to switch over to a newly formed CA, they
must generate new certificates signed by the CA and republish their
software.

At the same time, if a Certificate Authority wants to authenticate an
existing package, they need to convince the developer to do all of the
above.

There are currently 50,000+ gems on rubygems.org that would need to
retroactively be re-signed and republished if a new CA was introduced.

#### Single point of failure

Since each certificate can only have a single parent, if any parent or
grandparent becomes invalid and revoked, the developer's certificate
immediately becomes invalid as well.  The certificate chain cannot be
followed.

In this event a developer needs to issue a new certificate signed by a
new CA and republish their software.  An existing package can't be
re-certified.

### OpenPGP

#### You can generate a usable key anytime you want

There is no need to wait for **the man** to build a CA framework and
setup signing keys.  Developers can make their keys and start using
them.  There is no penalty imposed by doing this.

A third party (or multiple parties) can declare the key authentic
after the fact.  This can be done without having to republish the
software and with or without the cooperation of the developer.

#### Multiple trust paths can be established

Multiple trust paths can be established to a developer's key.  If one
trust path becomes compromised there may be alternate trust paths that
can be used.  If an end user doesn't like a particular trust path,
they can choose to ignore that and go with another.

#### Trees are subsets of directed graphs

You can implement a tree structure in a directed graph but not vice
versa.  And that's exactly what our Certificate Authority does.  It
models a CA-style tree on top the Web of Trust.

The problem with a volunteer X.509 solution
-------------------------------------------

X.509 has a chicken-and-egg problem:

1. The system isn't usable until the Certificate Authority is designed
and implemented.

1. The design and implementation of said Certificate Authority takes
serious time and effort.

1. This system needs a mostly global consensus between the CA, gem
developers, and gem users to be useful.  It is difficult to achieve
between thousands of people with different goals and needs.

1. There's no guarantee that the system will be adopted, making the
time and effort to develop such a system high-risk.

And that's why I think we still don't have a usable signing mechanism
7-1/2 years after it was ostensibly possible for developers to sign
gems.  No one wants to spend a significant amount of time and energy
developing a solution in isolation that has no guarantee of being
used.

OpenPGP-based systems don't have that problem
---------------------------------------------

1. A developer can start signing packages in a useful fashion with a
five minute time investment.

1. Various authentication systems can be implemented *after* there are
a significant number of signed gems in circulation and it's easier to
demonstrate their usefulness.

1. These systems can be as experimental as you want.  They don't
require anything near universal adoption.  They can be used in
parallel.  Niche systems can be useful to some users but not the
community at large.

People can implement systems incrementally, and get the out there
where they can be seen by the community.  They can iteratively work on
a system and interact with other interested people from the beginning.


So what's better for a loosely based confederation of thousands of open source developers?
------------------------------------------------------------------------------------------

### A system that:

* Is centralized?

* Requires up front design and implementation before it can be used
  by *anyone*?

* Is strictly hierarchical with a single point of failure?

* Requires republishing to establish a certificate chains on
  existing signed software?

### Or an system that:

* Is decentralized?

* Is immediately usable by developers?

* Is fault tolerant with multiple potential trust paths?

* Allows end users to pick-and choose their authentication systems?

* Allows various experimental authentication systems to fight-it-out
  in a Darwinian fashion?

* Allows certification to be performed after the fact without
  republishing software packages?

The Answer is Obvious to Me
---------------------------

So Start signing your gems.
