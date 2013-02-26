---
layout: post
published: true
title: How Many People Need to Verify Software to Make Signing Useful?
category: rants
---

How Many People Need to Verify Software to Make Signing Useful?
===============================================================

## Lets do a quick straw poll.

Raise your hand if you're concerned with being able to verify
software.  I imagine everyone has their hands up now.  After all,
this site is dedicated to software verification.

Keep your hand up if you've ever downloaded a linux distribution from
the web.  I imagine a few hands dropped, but we're all software
developers here, and most of us have probably played with linux.

Now keep your hand up if you actually checked the checksums on the ISO
image you downloaded to verify the image.  What? Did a few hands just
drop there?

For those of you with your hands still up, did you actually check the
OpenPGP signature of the checksum file you downloaded?  Nope?  Drop
your hands.  I imagine we just about lost everyone there.

And now we're left with the few and the proud.  The ones that followed
the full process.  And I've got one question for you heroes among men.
How many of you performed any meaningful authentication on the signing
keys?  If you just grabbed the key from the keyservers without any
thought put your hand down.

Does anyone still have their hand up?  Maybe one or two people if
we're lucky.

## Those checksums and signatures must be useless...

I don't believe so.

Less and less people followed along at each step in the above
verification process.  I imagine if we were able to get real numbers
and draw a chart, we'd basically see exponential decay.  Most people
won't perform any verification.  Some people will perform some
verification.  And a small few will go through a full verification of
the software.

For a distribution as popular as Ubuntu, that is probably enough.
[Linus' Law](http://en.wikipedia.org/wiki/Linus%27s_Law) states that
"given enough eyeballs, all bugs are shallow."  The same holds true
for a software compromise, assuming that proper validation tools are
in place.  Most people just don't care at all.  Some are moderately
security conscious.  A few are highly conscious.

## But the proud brave few can't verify at all without tools

Even if you, as a security conscious user, wants to verify your
software packages, it's up to the developer and/or distributor to
provide the tools for you to do so.  That user needs a signature and a
way to verify the signing key.

rubygems-openpgp aims to provide new tools that the users who choose to
can use now.  The existing solution has been around since July 2005
and has seen basically no adoption for a variety of reasons that I
won't get into here.  (And in fairness, I suggest you try signing and
verifying a gem both with the existing tools and rubygems-openpgp and
decide for yourself what is better.)

## But not everyone everywhere can use rubygems-openpgp today

By far the biggest complaint about rubygems-openpgp is that it
currently uses gpg as the back end.  This is additional software that
(for example) a Windows user would need to install to take advantage
of software verification.

Keep in mind that a user in this context is a software developer, it's
not the stereotypical grandma who can't even use a smart phone.  And
that signing and verifying is completely optional.  Nothing breaks if
you choose not to use it.

But I'll save that argument for another time.


## Back to the original question

How many people need to verify software to make signing useful?

I don't believe we need to have 100% of people verifying software to
make signing useful.  I also believe that having a number greater than
what we have now, which is effectively 0%, is useful.  I don't buy the
argument that because some people can't or won't verify software, we
shouldn't let anyone verify software.

I also believe that once some people start using software, any
software, it will find itself being improved.  As time goes on, these
improvements make it easier to use by less interested people.  I
believe once 1% of gem users sign and verify software, it won't be
long before the tools are good enough for 2%, and then 4%, and so on
and so on.

## So start signing your gems

This is the first step in the journey of a thousand miles.  The tools
are there.  But developers need to sign their gems before users can
verify them.

And I'm not just talking rubygems-openpgp here.  Give the integrated
signing a try too. In fact, rubygems-openpgp isn't incompatible with
the existing solution.  You can sign with both solutions if you want.

Please just give it a try...
