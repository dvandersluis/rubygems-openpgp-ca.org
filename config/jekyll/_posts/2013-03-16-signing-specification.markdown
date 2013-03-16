---
layout: post
published: true
title: Signing Specification
category: cms
---

Signing Specification
=====================

Here's some brief documentation on the file format for OpenPGP
signing.  With it you should know enough to be able to either manually
verify or build signed gems without using rubygems-openpgp itself.

Basic .gem format
-----------------

A gem is actually a tar-file.  If you use tar to extract it you will
extract payload files: `data.tar.gz` and `metadata.gz`.  Rubygems 2.0
also adds in `checksums.yaml.gz`.

X.509 signatures
----------------

If a gem has X.509 signatures they are simply generated for each of
the real payload files, creating `data.tar.gz.sig`, `metadata.gz.sig`,
and (on rubygems 2.0) `checksums.yaml.gz.sig`.

OpenPGP signatures
------------------

OpenPGP signatures are generated for the payload files only.  There is
no point in re-signing the X.509 signatures.  Signatures are
ascii-armored and saved with the .asc extension.

These are the exact same files that would be generated if you ran:

    gpg --armor --detach-sign data.tar.gz
    gpg --armor --detach-sign metadata.gz
    gpg --armor --detach-sign checksums.yaml.gz

Full file formats
-----------------

### Rubygems 1.8-style gem

<pre>
+ foo.gem
\
 +- data.tar.gz
 +- <b>data.tar.gz.asc</b> [OpenPGP Sig]
 +- metadata.gz
 +- <b>metadata.gz.asc</b> [OpenPGP Sig]
</pre>

### Rubygems 1.8-style gem - X.509 Signed

<pre>
+ foo.gem
\
 +- data.tar.gz
 +- data.tar.gz.sig [X.509 Sig]
 +- <b>data.tar.gz.asc</b> [OpenPGP Sig]
 +- metadata.gz
 +- metadata.gz.sig [X.509 Sig]
 +- <b>metadata.gz.asc</b> [OpenPGP Sig]
</pre>

### Rubygems 2.0-style gem
<pre>
+ foo.gem
\
 +- data.tar.gz
 +- <b>data.tar.gz.asc</b> [OpenPGP Sig]
 +- metadata.gz
 +- <b>metadata.gz.asc</b> [OpenPGP Sig]
 +- checksums.yaml.gz
 +- <b>checksums.yaml.gz.asc</b> [OpenPGP Sig]
</pre>

### Rubygems 2.0-style gem - X509 Signed
<pre>
+ foo.gem
\
 +- data.tar.gz
 +- data.tar.gz.sig [X.509 Sig]
 +- <b>data.tar.gz.asc</b> [OpenPGP Sig]
 +- metadata.gz
 +- metadata.gz.sig [X.509 Sig]
 +- <b>metadata.gz.asc</b> [OpenPGP Sig]
 +- checksums.yaml.gz
 +- checksums.yaml.gz.sig[X.509 Sig]
 +- <b>checksums.yaml.gz.asc</b> [OpenPGP Sig]
</pre>

