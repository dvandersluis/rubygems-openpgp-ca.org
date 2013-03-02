---
layout: post
published: true
title: Verifying the rubygems-openpgp Source
---

Verifying the rubygems-openpgp Source
=====================================

Verifying gems is all well and good, but what happens if you want to
build rubygems-openpgp from the source on github.  How can you verify
that you have the right source code?  Fortunately git allows you to
digitally sign tags.  All rubygems-openpgp releases are tagged and
signed in the git repository.

Getting the Source
------------------


    grant@johnicicleboy:~$ git clone git://github.com/grant-olson/rubygems-openpgp.git
    Cloning into 'rubygems-openpgp'...
    remote: Counting objects: 497, done.
    remote: Compressing objects: 100% (313/313), done.
    remote: Total 497 (delta 252), reused 421 (delta 176)
    Receiving objects: 100% (497/497), 74.91 KiB, done.
    Resolving deltas: 100% (252/252), done.

Checking a Release Tag Signature
--------------------------------

All the standard caveats about authenticating signing keys apply.
This step is only useful if you've authenticated my key.

    grant@johnicicleboy:~$ cd rubygems-openpgp/
    grant@johnicicleboy:~/rubygems-openpgp$ git tag -v 0.4.0
    object a8f38e7c41964da034516625ab02a23c93c865db
    type commit
    tag 0.4.0
    tagger Grant Olson <grant@pikimal.com> 1361630125 -0500
    
    0.4.0
    gpg: Signature made Sat 23 Feb 2013 09:35:38 AM EST using RSA key ID A18A54D6
    gpg: Good signature from "Grant T. Olson (Personal email) <kgo@grant-olson.net>"
    gpg:                 aka "Grant T Olson <grant@webkite.com>"
    gpg:                 aka "Grant T. Olson (pikimal) <grant@pikimal.com>"

Checking out the tag
--------------------

    grant@johnicicleboy:~/rubygems-openpgp$ git checkout 0.4.0
    Note: checking out '0.4.0'.
    
    You are in 'detached HEAD' state. You can look around, make experimental
    changes and commit them, and you can discard any commits you make in this
    state without impacting any branches by performing another checkout.
    
    If you want to create a new branch to retain commits you create, you may
    do so (now or later) by using -b with the checkout command again. Example:
    
      git checkout -b new_branch_name
    
    HEAD is now at a8f38e7... Tagged CHANGELOG for release

Go Crazy!
---------

Now you can build, branch off of the tag, etc.

