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

### Install gpg if not installed.

* [Windows](http://www.gpg4win.org)
* [OSX](https://www.gpgtools.org/)
* Linux - installed

Not sure if you need to? Run:

    gpg --version
    
## Install and verify the test gem

There is a signed version of the hola gem on rubygems.org.  Try to
install it.

    gem install openpgp_signed_hola --verify

This will probably fail with the following error:

<pre><code><span style='color:red;'>You don't have the public key.  Use --get-key to automagically retrieve from keyservers
Fail!</span>
ERROR:  Fail!
</code></pre>

This is because you don't have the user's public signing key yet. This
is required to verify the signature. Try again with an extra option to
retrieve the public key automatically.

    gem install openpgp_signed_hola --verify --get-key

Now we will retrieve the key and the signature can be verified.

<pre><code><span style='color:GoldenRod;'>Signature for data.tar.gz from user Grant T. Olson (Personal email)
    &lt;kgo@grant-olson.net&gt; key 0x0E3B5806F isGOODSIG, VALIDSIG and TRUST_UNDEFINED
Signature for metadata.gz from user Grant T. Olson (Personal email)
    &lt;kgo@grant-olson.net&gt; key 0x0E3B5806F is GOODSIG, VALIDSIG and TRUST_UNDEFINED</span>
Successfully installed openpgp_signed_hola-0.0.0
1 gem installed
Installing ri documentation for openpgp_signed_hola-0.0.0...
Installing RDoc documentation for openpgp_signed_hola-0.0.0...
</code></pre>    

Note that we were able to verify the signature, but it's listed as
**TRUST_UNDEFINED**.

This is because even though you've downloaded the key, you have no
idea if it is authentic. Anyone can make a key with any email and
upload it. (In fact there are several forged keys out there now that
are
[attributed to president@whitehouse.gov](http://pool.sks-keyservers.net:11371/pks/lookup?op=vindex&search=president%40whitehouse.gov&fingerprint=on)
.)  Hence the lack of trust.

rubygems-openpgp has a `--trust` flag that will make sure you only
install trusted gems.

    gem install openpgp_signed_hola --verify --trust

Will fail because the key isn't trusted.

<pre><code><span style='color:GoldenRod;'>Signature for data.tar.gz from user Grant T. Olson (Personal email)
    &lt;kgo@grant-olson.net&gt; key 0x0E3B5806F isGOODSIG, VALIDSIG and TRUST_UNDEFINED</span>
<span style='color:red'>Trust Undefined and you've specified --trust.  Won't install.</span>
ERROR:  Trust Undefined and you've specified --trust.  Won't install.
</code></pre>


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

    gem install openpgp_signed_hola --verify --trust

Now you'll see that the signature is verified **and** trusted.

<pre><code><span style='color:green;'>Signature for data.tar.gz from user Grant T. Olson (Personal email)
    &lt;kgo@grant-olson.net&gt; key 0x0E3B5806F is GOODSIG, VALIDSIG and TRUST_FULLY
Signature for metadata.gz from user Grant T. Olson (Personal email)
    &lt;kgo@grant-olson.net&gt; key 0x0E3B5806F is GOODSIG, VALIDSIG and TRUST_FULLY</span>
Successfully installed openpgp_signed_hola-0.0.0
1 gem installed
Installing ri documentation for openpgp_signed_hola-0.0.0...
Installing RDoc documentation for openpgp_signed_hola-0.0.0...
</code></pre>

The warning is gone and the gem installs.

## Congratulations, you've just authenticated your first gem!

That's all there is to it.  And it's all well and good for a single
gem.  But the process doesn't scale very well.  You need to verify the
key for the developers of every gem you need to use.  In a complex
project that can number in the hundreds.

A certificate authority steps in as a trusted third-party, issuing
its own signatures against developer keys that it trusts.  Now you, as
the user, only need to decide to authenticate and trust the
certificate authority instead of 100's of individual developers.

In another post, we'll describe how to configure your system to trust
the rubygems-openpgp-ca keys, hopefully making the authentication
process easier.
