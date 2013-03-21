---
layout: post
published: true
title: Should Users Be Encouraged to Run `gem cert --add`?
---

Should Users Be Encouraged to Run `gem cert --add`?
===================================================
 
People who are signing gems today via the built-in signing mechanism
are using self-signed certificates.  In general this is a bad idea.
That's why your web browser will give you a nasty warning if you go to
an https site that uses a self-signed certificate.  A self-signed
certificate is the digital equivalent of saying, "Dude! Of course I'm
21! Why would I make that up?"

But there's an even bigger problem with this approach than simply side
stepping the whole issue of authentication.  Some people are starting
to put their certificates on github or their personal web page.  Then
a user is instructed to install it with something like:

    curl http://github.com/blah/blah/user.crt > user.crt
    gem cert --add user.crt
	
The notion is that if you get the certificate from github, and the gem
from rubygems.org, there isn't much likelihood of both delivery
mechanisms being compromised.  Lets assume for the moment that this is
a decent assumption.  You the user can get install the certificate as
listed above and then install an authenticated version of the gem
with:

    gem install -P HighSecurity foo
	
Everything's good, right?

Nope.  There's a problem.  Now that you've trusted the certificate,
you trust it globally.  This is understood but glossed over in any
documentation.  Most users don't realize the implications of adding a
trusted certificate to their system.

## When You Add a Certificate, You're Not Saying You Trust the Authenticity of the Software Package, You're Saying You Completely Trust the Owner

You might have imported that certificate for a json parser you like.
And that json parser might be a fine piece of software.  But now the
holder of that certificate can sign anything and you'll accept it as
trusted.  They can make their own version or rake, rails, rspec, etc,
and get you to install it in the impressive-sounding **HighSecurity**
mode without even providing a warning.

Now of course for this to work an attacker would need to somehow get
you to download the forged version of the software.  This is easier
said than done.  But the whole reason you're checking signatures in
the first place is to catch exploits such as that.

See my gem [nillify](https://github.com/grant-olson/nillify) for a
demonstration of the potential exploit.  The first part of the readme
makes it seem like installing my certificate will make you the gem
user more secure.  And it will, but only if you have reason to believe
that I'm trustworthy.  It won't help if you've just stumbled onto the
github page and have no idea who I really am.

## A Better Solution - Per-Resource Trust

A better solution is per-resource trust.  Instead of declaring that
you trust a particular certificate globally for all things, what you
really want to be able to say is:

> "I trust that this certificate belongs to the author of this
> particular gem I'm using.  If the gem is signed by this certificate
> I'll consider it to be authentic.  If it is unsigned or signed by
> another certificate I will not."

## And This Is All Really a Sales Pitch for rubygems-openpgp

As of [release 0.6.0](/blog/rubygems-openpgp-0.6.0-released.html)
rubygems-openpgp will query rubygems.org to determine a list of owners
for a given gem.  These are the people who are authorized to publish
it.  It will then validate that:

1. The signing key has a user id containing the email of an owner.

1. That the above key and user id has been authenticated by you.

This restricts your trust in any given key to a set of particular
resources instead of establishing an all-or-nothing trust scenario.

So
--

Sign and verify your gems.
