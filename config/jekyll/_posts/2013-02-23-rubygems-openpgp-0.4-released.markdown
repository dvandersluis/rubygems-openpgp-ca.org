---
layout: post
published: true
title: rubygems-openpgp 0.4 Released
category: releases
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
    &lt;kgo@grant-olson.net&gt; key 0x0E3B5806F is GOODSIG, VALIDSIG and TRUST_UNDEFINED</span>
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

    -----BEGIN PGP SIGNATURE-----
    Version: GnuPG/MacGPG2 v2.0.17 (Darwin)
    
    iQEcBAABCgAGBQJRKNPSAAoJEP5F5V2hilTWMS4IAIfrL21CuSrZCof8UcrFPZds
    LvCEhBKbfE4aB4Jgf8QBc6PXrm916TU8+IcfhWVzHc98ENRui+xUVtJ1LOF7tx31
    eUcck9VqGZQ7RkI9GpX5Dcbj+0SzL3ghVgVv+UMttwwAahqT8VXvPlS6ttHjroqD
    87flVoUED/MNFeT8AfGvDp4IOJ+lQl8Y7x6JUJJv+OCOSnG6e/xtQZcMaTf9LKWW
    z6FO9iplsjbLdwCndKjbPT6bygYRmw8/mF/t3DSJb7wf4HbFjLri24TkwNVZ5o9T
    hiUjubQJuZrjVTqpaPW7ZF0iL/0xgERCz7gN6SsvIM5MIm3Hok1oZ2oVMS8fzZQ=
    =RUfl
    -----END PGP SIGNATURE-----
