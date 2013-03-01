---
layout: post
published: true
title: There's Trust and Then There's Trust and Then There's Trust
---

There's Trust and Then There's Trust and Then There's Trust
===========================================================

Trust is important when it comes to software packages.  Unfortunately
it's also an overloaded word that has multiple meanings.  Lets talk
about three different kinds of trust.

Trust (a.k.a. Trustworthiness)
------------------------------

This one is the most important.  Unfortunately it's also the hardest
one to verify pragmatically.  How do you know that this gem you
install won't fry your hard drive?  That it won't install a
key-logger?  You don't.  And unfortunately this is very hard to verify
in any Turing complete programming language, especially one with as
dynamic and with as many meta-programming hooks as ruby.

Still not all hope is lost.  Being able to verify that a package comes
from an author that you consider trustworthy is important.  Most
people would consider an authentic rails gem to be more trustworthy
than a 0.0.1 version gem from a totally unknown person.

Digital signatures allow you to verify that a software package does
indeed come from a source you consider trustworthy by other means.

Trust (a.k.a. Authenticity)
---------------------------

This is also important.  You need to be able to trust that a package
is authentic.  This is something that can be solved with technology
and digital signatures.

If you want any of those pawn shop shows, you've seen someone bring in
some autographed merchandise.  But they don't have any sort of
certificate of authenticity.  And the pawn shop owners need to call in
an expert.

Just because a digital signature claims a software package has been
signed by Racer X, it doesn't mean it actually was signed by Racer X.
However, if you can either verify yourself that the signing key is
authentic,, you can ensure that you're at least installing the right
version of the package.  Hopefully from a trusted (a.k.a. trustworthy)
source.

Trust (a.k.a. the Vouch)
--------------------------

This is when you trust a party to vouch for another source.  I may not
be able to trust (a.k.a. Authenticate) Racer X directly.  However,
maybe my friend did.  I consider him to be generally trustworthy, I've
authenticated his signing key's authenticity, and I trust him to vouch
for the identity of another.  In this case I can infer that I have the
proper signing key for Racer X.

This is where either a Certificate Authority or the Web of Trust comes
into play.  You put your faith in other parties that you believe are:

1. Trustworthy.

1. Authentic.

1. Reliable regarding authentication of others.

To simplify the process of authenticating entities that you've never
met perfectly.  Of course this still doesn't do anything to establish
Racer X's trustworthiness, but does establish who the real Racer X is.


Gnupg Implementation Detail
---------------------------

Unfortunately gnupg uses the term trust in two contexts.  The first is
trust (a.k.a. authenticity).  The trust for a key indicates that you
consider the key to be authentic and belong to the listed owner.  It
also has the concept of **owner trust** (a.k.a the Vouch).  You need
to set the owner trust on a key to help with Web of Trust
calculations.  And of course the third form of trust (a.k.a
trustworthiness) is bypassed altogether.

And That's the Three Different Kinds of Trust
---------------------------------------------

Next time you hear the term **trust** in the context of software
authentication ask yourself which kind of trust we're actually talking
about.


So
--

Sign your gems.