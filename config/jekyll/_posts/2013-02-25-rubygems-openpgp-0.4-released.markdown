---
layout: post
published: false
title: rubygems-openpgp 0.4 Released
---

rubygems-openpgp 0.4 Released
=============================

Now with Trust!
---------------

Previous versions could only verify signatures.  They didn't take your
gnupg trust settings into account.  You can now provide the `--trust`
flag and gems will only be installed if you trust the signing key.

    gem install openpgp_signed_hola --verify --trust

And the install fail if the key isn't trusted.

<pre><code><span style='color:GoldenRod;'>Signature for data.tar.gz from user Grant T. Olson (Personal email)
    &lt;kgo@grant-olson.net&gt; key 0x0E3B5806F isGOODSIG, VALIDSIG and TRUST_UNDEFINED</span>
<span style='color:red'>Trust Undefined and you've specified --trust.  Won't install.</span>
ERROR:  Trust Undefined and you've specified --trust.  Won't install.
</code></pre>

Learn more at [The Complete Guide to Verifying Gems with
rubygems-openpgp](./the-complete-guide-to-verifying-gems-with-rubygems-openpgp.html)

Release Signature
-----------------

Previous users of rubygems-openpgp should be able to verify this
release with rubygems-openpgp.  New users may want to manually check
the initial install.

Save the release signature locally and then:

    gem fetch rubygems-openpgp
    gpg --verify saved_sig.asc rubygems-openpgp-0.4.0.gem
    gem install rubygems-openpgp-0.4.0.gem

The release signature for 0.4.0 is:

    XXXX