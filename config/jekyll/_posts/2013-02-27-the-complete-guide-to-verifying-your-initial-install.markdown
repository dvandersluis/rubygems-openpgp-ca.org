---
layout: post
published: false
title: The Complete Guide to Verifying Your Initial Install
category: guides
---

The Complete Guide to Verifying Your Initial Install
====================================================

Assuming you have already installed rubygems-openpgp, you can use it
to verify new releases:

<pre><code>johnmudhead:~ grant$ gem install rubygems-openpgp --verify --trust
<span style='color:green;'>Signature for data.tar.gz from user Grant T. Olson (Personal email) <kgo@grant-olson.net> key 0x0E3B5806F is GOODSIG, VALIDSIG and TRUST_ULTIMATE
Signature for metadata.gz from user Grant T. Olson (Personal email) <kgo@grant-olson.net> key 0x0E3B5806F is GOODSIG, VALIDSIG and TRUST_ULTIMATE</span>
Successfully installed rubygems-openpgp-0.4.0
1 gem installed
Installing ri documentation for rubygems-openpgp-0.4.0...
Installing RDoc documentation for rubygems-openpgp-0.4.0...
</code></pre>

But how can you verify your initial install?  If you initially install
a malicious version of rubygems-openpgp, it could do anything.  It
could lie and tell you that the signature was authentic.  Every time a
new version of the software is released, it could secretly download a
new malicious version and once again lie and say the signature was
authentic.

To protect against this, you can check your initial install with a
detached signature.

Obtain and Authenticate My Public Key
-------------------------------------

Save the Detached Signature
---------------------------

The signature for the 0.4.0 release is:

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

Copy this and save it into a file `saved_sig.asc`

Fetch, verify, and install rubygems-openpgp
-------------------------------------------

Instead of just installing the gem, fetch it first to get a local
copy:

    johnmudhead:~ grant$ gem fetch rubygems-openpgp
    Fetching: rubygems-openpgp-0.4.0.gem (100%)
    Downloaded rubygems-openpgp-0.4.0

Verify the detached signature:

    johnmudhead:~ grant$ gpg --verify saved_sig.asc rubygems-openpgp-0.4.0.gem 
    gpg: Signature made Sat Feb 23 09:36:02 2013 EST using RSA key ID A18A54D6
    gpg: Good signature from "Grant T. Olson (Personal email) <kgo@grant-olson.net>"
    gpg:                 aka "Grant T. Olson (pikimal) <grant@pikimal.com>"
    gpg:                 aka "Grant T Olson <grant@webkite.com>"

Install the verified gem:

    johnmudhead:~ grant$ gem install rubygems-openpgp-0.4.0.gem 
    Successfully installed rubygems-openpgp-0.4.0
    1 gem installed
    Installing ri documentation for rubygems-openpgp-0.4.0...
    Installing RDoc documentation for rubygems-openpgp-0.4.0...

That's it!
----------

You've installed a manually verified copy of rubygems-openpgp.  Now
that you've done that, you'll be able to update new versions using
rubygems-openpgp itself.

Detached Signatures For All Public Releases
-------------------------------------------

### 0.4.0

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


### 0.3.0

    -----BEGIN PGP SIGNATURE-----
    Version: GnuPG/MacGPG2 v2.0.17 (Darwin)
    
    iQEcBAABCgAGBQJRF6YqAAoJEP5F5V2hilTWDYQH/jEDDhI6MrgMtJrjtUY7RDdN
    +MTwkTutOIZ8P35KnKen1gOrNKzrS+Pl5p7m2fa09VBv1e1v7XNsV4Rweh4jQcuP
    YDR9h0Cn4rexWj9ABC0rGVpvQrTDEJK1acTbBXI0PFs4w0m9DOT/0U5l147W+mii
    Sg7nUM3Tgvxk38d4djS3ifD+Aq6+Nm3F2hRhamTVfdaerjWJSy4Bg7HW+FaXTqyE
    dFob+Mv1PZG+VPG78zszq+4WMbhvNAUtegmsXvfl8+j9S142emw2HU2Mcs71QBo4
    /Tb6iPyaQsXAtR15Z9vO3W/bMTCyZsTq5Hwwgp01MIr+Ek+TjM6DK8wfT65sab8=
    =N+W6
    -----END PGP SIGNATURE-----

### 0.2.1

    -----BEGIN PGP SIGNATURE-----
    Version: GnuPG v1.4.10 (GNU/Linux)
    
    iQEcBAABAwAGBQJN5DZLAAoJEP5F5V2hilTWRT0H/0pOYJrQXeIWZHd1O/zu8Fk4
    dYlHy4Dpm3BrskJaq0EQm81BLVeHGawTPYIUr/tI3Wnmfy+pSBxpAgA7OZMkHnu2
    sHzLqU/FixMmYPMBkfZ0bDDsSgr1fAOINRCy6wlpQvlpnuMiybB7+UDboQEfaLLa
    c8kvCenhEWiI6MO3lyye7PKfgNXNbML5vGJ/WcI3HIQpAgJ8+ItB16tLnw22JlPe
    qv+IS9SlHE/0vY6HdAB3wnfuQpLXM5JZlpcErFR37dCGrvlcgetjWN84pEtm6jIO
    Jsk6YyxWu5uxE84UEc8HWzbFrb5sVstYLKW+vwqIVV76spK5EvAaKCOrMnzP/Qg=
    =Lltd
    -----END PGP SIGNATURE-----

