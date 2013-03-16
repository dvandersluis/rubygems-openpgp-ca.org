---
layout: post
published: true
title: Change to Authentication Policy
---

Change to Authentication Policy
===============================

Our previous authentication policy required that you registered with
the same email address as your rubygems.org account.  The *intent* was
to demonstrate that you were authorized to publish to the rubygems
account.

We've run into a few cases where this wasn't practical.  In one case a
user wanted to use an
[organizational key](http://pool.sks-keyservers.net:11371/pks/lookup?op=index&search=software-signing%40phusion.nl)
that wasn't tied to the actual rubygems.org user email.  In a few
other cases, users had previously registered with legacy emails and
were unable to change them.

Since the *intent* was to demonstrate that a user was authorized to
publish to that account, we've added an alternate way to demonstrate
this.  Simply publish a gem signed by your signing key to rubygems.org
prior to applying for certification.  This demonstrates that you are
indeed able to publish to your account.
