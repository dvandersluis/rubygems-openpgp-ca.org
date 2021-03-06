---
layout: post
published: true
title: Signing Keys
category: cms
---

Signing Keys
============

Here are fingerprints for the currently active keys.  You can also
find these on the [github project page](https://github.com/grant-olson/rubygems-openpgp-ca.org).

Master Key
----------

This is the secured offline key that is used to sign all of the
actual signing keys.

    pub   4096R/FDBA50FB 2013-02-16 [expires: 2014-02-16]
          Key fingerprint = BEED FE71 7668 50BF A6DE  5A19 25A6 5396 FDBA 50FB
    uid                  rubygems-openpgp Certificate Authority MASTER KEY
		                                  (http://rubygems-openpgp-ca.org)
    sub   4096R/9A39A769 2013-02-16 [expires: 2014-02-16]

Signing Key
-----------

This is the current key used to sign developer's keys.

    pub   2048R/6094090A 2013-02-16 [expires: 2013-04-17]
          Key fingerprint = 88D7 A462 A9BA 0B34 BB80  46F9 3D82 2285 6094 090A
    uid                  rubygems-openpgp Certificate Authority Signing Key
                                           (http://rubygems-openpgp-ca.org)
    sub   2048R/5BAEF314 2013-02-16 [expires: 2013-04-17]
    sub   2048R/129FFDE2 2013-02-16 [expires: 2013-04-17]

Grant's Key
-----------

Used to sign rubygems-openpgp and for personal correspondence.

    pub   2048R/E3B5806F 2010-01-11 [expires: 2014-01-03]
          Key fingerprint = A530 C31C D762 0D26 E2BA  C384 B6F6 FFD0 E3B5 806F
    uid                  Grant T. Olson (Personal email) <kgo at grant-olson dot net>
    uid                  Grant T. Olson (pikimal) <grant at pikimal dot com>
    uid                  Grant T Olson <grant at webkite dot com>
    sub   2048R/6A8F7CF6 2010-01-11 [expires: 2014-01-03]
    sub   2048R/A18A54D6 2010-03-01 [expires: 2014-01-03]
    sub   2048R/D53982CE 2010-08-31 [expires: 2014-01-03]

Full Keys
---------

You really should just grab the keys from the keyservers, but if for
some reason you want to import them directly from here, the following
block contains the public keys for import.

    -----BEGIN PGP PUBLIC KEY BLOCK-----
    Version: GnuPG v2.0.17 (GNU/Linux)
    
    mQENBEtK1bUBCAD39EQGUZmiVzmqT2kWaM4j3cuvZPEcDcZYLFx0w7pScr5202QN
    T240OIKpdaGlb0FfvizFbCV56wemr1FGVSHtqyZWbjCFMbSheZM7pebv9QUtaitN
    RJ5KWjiWfYKoTqPNFByvnBRRES6MW+dQZ0+MTCjo7cxJa+ja+yJV/1+FRQcW/vyl
    Ou1ha3MMD/cDAsnoBZA57V8pwF+hjhk8NSp2yxn5jymJ3diVmdnEpaXyoB5rX87q
    1653+J6CjtAI1TJ9D+hqY7QxcZ5T9eFa/Z8lqw1IkSCAhtQDfLUN+rnQFiQJoIdm
    czfrqXVaDFb55X4C9VfccIqMlBFxhZgNhofhABEBAAG0NUdyYW50IFQuIE9sc29u
    IChQZXJzb25hbCBlbWFpbCkgPGtnb0BncmFudC1vbHNvbi5uZXQ+iQEcBBMBAwAG
    BQJRIiViAAoJED2CIoVglAkKi0MH/j30fV/A4DJM2TEJ3dcPfOyCbrcfKOXfql6h
    42Rjvia4tBXGDKrJl/jD57wPT3vYUrw52PUDdH8zWCQNoaOx4Jd5Lhq/bu1ej5F4
    sQmoF/v1+g9XI96w9T14VyNmtAs7FD/DITxumKhunrL1fpa84AH1jsONJ3C+he9D
    O3TgZ5vOVJhWYVCjakOOcVfBKz7Cnp7pZr5U0EDB0gauG4k9ey7rsw8bkMt+/+9G
    p399EdX42Ied8WqOLA07ux/BO8y9A/AxwaODs8TgnaEawGZkyXkKQR2JbhLRrRxp
    7U81SgWGrt1cvWvP/WyAXFPWFHMW6jMGdBkyK6akX35mL1BEG2aJAT8EEwECACkC
    GwMCHgECF4ACGQEFCwkIBwMFFQoJCAsEFgIDAAUCUOXhTAUJB3w/FwAKCRC29v/Q
    47WAb1ikB/9961aKgAKn4VLoeH4hdOQ1DBiY3WOLDzitN/ZIDjnbYVn5azeesXao
    qjZej1qQOnrGSSbF27F1CWSrFw3zfLZdbepoCPsMaO9XRZOdQFJUAkkoNSvlwy4K
    wwMHw1tLqGXcErKWcFAqLbNujDfEqCLSs2/MkvSL2p9jpdvnQQFv/0+CmLS408Rw
    MP184PpSMVXHhnEwc6sMTJxHv6y8Dk1OTl5hpUlK+q+DuD1v55NuR1um4WHvmDvj
    X1Odw6tPPKt3bgt+7cNzyJRZmmKOy1zl63J0BK2hXOpRd4FSBAqhLcWsZ5vt6gfw
    dQyAJ1yPl0LefS5KBl3YnEwOH3HC5i2QiQIcBBABAgAGBQJRO45TAAoJEK8Ya0Dl
    DfZb2qUQAI08tTb1Rw8ubgHcrPbKGhzNbYv27rvM7bQSQTUaWRR21tPsa5CUEh0e
    KP51mBT5Fskw4+byGBajjyPIYVKMSeK/M2o8d/mYbmy3Q5MUugf7wC0j4xxlHkla
    qwWCJlqAGtcG3ChGvrX/v28Gg3yBoqJDl/Q068vtXtNgM3zz0r/CV3KSKtE3N2br
    vkHzvZ4v3Vg3Zjdy4/pqi+LE1uhdHCyQJ2EKi5RDruWOvbmZF4rcc+YZGwdH7aeZ
    dDwVO/rbi5X81UeJjUU6v6cpjA6ASvrwWWWGYkAVWgZL1gWwQDKtI0NSj+tUmDuh
    I6Y0lLY879lAoCU9fFqwuU7ffujRgnkzwQZa1/FJuwXR0J5ZhiZLSS9eWjBFH8p6
    6dnI1Wy9QbhkWY020djTKJ2KF0M25+bUMZio/Pwvruov2gRqrqTGiSrTkFhlmAa6
    ExM65jL8bPPSYy4teCO79pRfPmWnu6XYFW+rVyEsLLKM4en+MwjVC0ex/GsGtNS9
    wHhLpJCU51JtLKFNTZSBWR1VoJBcL/7Yk3g1X42zPt8G5SYxiDQIecDeK7wNR34Q
    sVfWMYjJSesFoFqXMb6hrmyLIVeN7kn7S2neZmdEwybEGqHoR0JC5+VnyXma33nQ
    iJceqOA6HNnkqExWZZsyjfQZH+AJdHZl0QT7xFR4G/sqXHlRwT7JiQKVBDABAgB/
    BQJRKNmReB0AQWx0aG91Z2ggSSB0cnVzdCB0aGUgYXV0aGVudGljaXR5IG9mIHRo
    aXMga2V5IGl0IGlzIG5vdAphdXRob3JpemVkIHRvIGlzc3VlIHNpZ25hdHVyZXMg
    b24gcnVieWdlbXMtb3BlbnBncC1jYSdzCmJlaGFsZgAKCRAlplOW/bpQ+2m5D/43
    kPUoXT0BuCdsvwKFCcicwIrVgFI7YXoIb3WuM02OO+yCTEKQyWBNoWooBUs9yY5b
    clzNBMucU7Rbh68cfUA5zIw+GAgzBixUXpXmyNhUa2TpO6EUjIsp3IH88kWWJp5T
    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
    804IGKH4JoCcJqgA4Dd33i7jfyiHe2XkhROeWbUB0Z4p9J5WMEUAu6PuxYUavbWu
    mYoopgxNoUfJNZmkWGUHSGAvo+9BtCxHcmFudCBULiBPbHNvbiAocGlraW1hbCkg
    PGdyYW50QHBpa2ltYWwuY29tPokBPAQTAQIAJgIbAwIeAQIXgAULCQgHAwUVCgkI
    CwQWAgMABQJQ5eFTBQkHfD8XAAoJELb2/9DjtYBvqswIANWSASueLmXGa8O0pRZC
    iMjsEn9xjkQ3CqfhYhK+UCV1Dvi2qEcmdATuxxueg+Tw1TdyltD0Mi1eYxEKvOax
    upqmkrZhTTM7Rj5cd9S+oaYJbfphnWTXuMvZl6buWZvMaGO1H8q7X7Thxdi6nZuY
    MhSl0dcI4MnHKV32XKZusnllf0slHAJ+y5J5Sq9IZgSwrSWkD30x7ZUg8ZUU6a/+
    L6Ewgvm0UCpnrW+6xTj2j8FNHpLpkvbBuvOZJlr8kRmtawOZZlGaxeK8oz2kSwjE
    da9rMwUeTKpib06wrcXpgq3l9PYFfYhLujvrBXzJFybbPZg4LreKKhfpsgU8n2y8
    OAOJApUEMAECAH8FAlEo2ZJ4HQBBbHRob3VnaCBJIHRydXN0IHRoZSBhdXRoZW50
    aWNpdHkgb2YgdGhpcyBrZXkgaXQgaXMgbm90CmF1dGhvcml6ZWQgdG8gaXNzdWUg
    c2lnbmF0dXJlcyBvbiBydWJ5Z2Vtcy1vcGVucGdwLWNhJ3MKYmVoYWxmAAoJECWm
    U5b9ulD7QAMP+wXj665Jl1E/+79lErG8JqPvWhR9eGWrzPG+wO7OFQ0lS3PujD6k
    X8gFanqR5N+sPV1k/hPCcE8UFFpIBW+QLmUUIZMRMZRnlldEaY3yfJYhV8+38Avj
    nYUJ2rop7ZdTY5C3H88kTnPZE2zzQZcdghjWan3WZSfG3l30f/t7lnLvP8+lluck
    jYJ+ca2BP8ydy0EUGEjlgORYmZmO7+7UtCNbLMtNpPIlkTEyCt/XYkMeMmhIrSnr
    In8YrQomhBgVYyzRUZ5+MwWphlNChSWS0WHpFPvjsaU1o1U9uz3UHC8JlJ3U11sH
    d8sUB5t1RdjJt8ICrssdueKJNC65HCXRuog1RTee68AWYqXJupbA2bzlfTwhZ8uS
    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
    iDCh9zNj
    =XPQQ
    -----END PGP PUBLIC KEY BLOCK-----
    
