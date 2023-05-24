Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8963CC77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 13:44:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9201.1684935883465915242
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 06:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=qovSLgbF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34ODifQX097468;
	Wed, 24 May 2023 08:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684935881;
	bh=bSY3oukKYEdgf285B37pbQLfv+EBAeggaNWo2t9Cajo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qovSLgbFBO41wPWSrj1BVP8xZpLx99m2Ut/+s5rViuxeHoafKEXJd7Gua42GbfKV9
	 fDHsojdy8mVXip4Y+KJnD0AK952QDtO0phiN0CI6gU7BBvCZZykWMAKF6IEA+Y70jN
	 BA9K+EbyTEeqjrP2yB+wk+PJQEvnkLHbsZ9zfXww=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34ODifkr030202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 08:44:41 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 08:44:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 08:44:40 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34ODieeT061057;
	Wed, 24 May 2023 08:44:40 -0500
Message-ID: <600ea8c8-69b0-11f5-1e1f-ba6dd92961d6@ti.com>
Date: Wed, 24 May 2023 08:44:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][RESEND PATCH 1/2] v4l-utils: Add recipe for
 v1.23.0
To: Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        Sai
 Sree Kartheek Adivi <s-adivi@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Raghavendra, Vignesh"
	<vigneshr@ti.com>,
        "Bhatia, Aradhya" <a-bhatia1@ti.com>, "Nori, Sekhar"
	<nsekhar@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>
References: <20230523094422.1633390-1-j-luthra@ti.com>
 <80f116aa-3863-2990-f582-40f5d7a5b9b4@ti.com>
 <1f00c11f-f413-c015-c2fd-24afb475295b@ti.com>
 <41947a40-4346-d223-2a05-cce342569190@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <41947a40-4346-d223-2a05-cce342569190@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 34ODifQX097468
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 13:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14461



On 5/24/2023 6:14 AM, Devarsh Thakkar wrote:
> Hi Ryan,
>=20
> Thanks for the feedback,
>=20
> On 23/05/23 21:06, Ryan Eatmon wrote:
>>
>>
>> On 5/23/2023 6:48 AM, Devarsh Thakkar wrote:
>>> Hi Jai,
>>>
>>> Thanks for the patch.
>>>
>>> On 23/05/23 15:14, Jai Luthra wrote:
>>>> An older recipe (v1.22.0) is present in the meta-openembedded/meta-o=
e
>>>> layer for kirkstone.
>>>>
>>>> TI's 6.1 based kernel has backported multistream routing APIs [1] fr=
om
>>>> upstream kernel, which requires a few patches to v4l-utils [2] that =
only
>>>> apply cleanly on top of v1.23.0.
>>>>
>>>> Thus we override the recipe in this layer to the latest (v1.23.0) fo=
und
>>>> from meta-oe master.
>>>>
>>>> Link:
>>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=3Dca5=
5d70b41e [1]
>>>> Link:
>>>> https://lore.kernel.org/all/20230210115546.199809-1-tomi.valkeinen@i=
deasonboard.com/ [2]
>>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>>> ---
>>>>  =C2=A0 ...-Don-t-install-libmediactl-and-libv4.patch | 44 +++++++++=
+
>>>>  =C2=A0 ...02-original-patch-mediactl-pkgconfig.patch | 21 +++++
>>>>  =C2=A0 ...iginal-patch-export-mediactl-headers.patch | 24 +++++
>>>>  =C2=A0 .../v4l-utils/0004-Do-not-use-getsubopt.patch | 60 +++++++++=
++++
>>>>  =C2=A0 .../v4l-utils/v4l-utils_1.23.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 87 +++++++++++++++++++
>>>
>>> As per my opinion, not a good idea to bump up package version than de=
fault
>>> package version shipped by kirkstone i.e. 1.22.1
>>> (meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb)
>>>
>>> As a general rule of thumb, there could be other layers (for e.g. add=
ed by
>>> vendors) having bbappends assuming shipped package version same as in
>>> kirkstone and also build time and runtime dependencies w.r.t other pa=
ckages
>>> are guaranted if all packages stay with same version as shipped by ki=
rkstone
>>> and with this new recipe I believe we are kind of deviating from that
>>> protection and so my suggestion is to rebase on top of existing packa=
ge
>>> version i.e. 1.22.1
>>
>> If you were talking about meta-ti then I would 100% agree with you, bu=
t this
>> is meta-arago.=C2=A0 And as a distribution layer, we are perfectly wit=
hin our
>> purvue to advance to a later version of a tool beyond what the other u=
pstream
>> repos are at, or change config files, etc...
>>
>> Meta-ti as a BSP layer needs to play nice in the sandbox with other la=
yers and
>> not change versions without guards.
>>
>=20
> I am not sure what exactly you mean by guards, is it possible to share =
an
> example? Also I think we did change linux kernel version to 6.1 in meta=
-ti
> from the one supported in kirkstone (which I believe was 5.18) although=
 that
> has its set of advantages since it is latest LTS.

Check out the recent patch that Denys submitted for meta-ti kirkstone=20
for optee.  Basically, hide any changes we make to something that is=20
upstream behind an override so that the change only applies when=20
building one our machine targets.

https://lists.yoctoproject.org/g/meta-ti/message/16574


>> If you wanted to be extra careful you could include the guards in arag=
o as
>> well, but since arago is not a yocto compliant layer it is not strictl=
y needed
>> at this time.
>>
>>
>=20
> I think the crux of the issue here is gap between v4l-utils version (wh=
ich is
> 1.22.1 released couple of years back as Jai mentioned ) in kirkstone an=
d the
> linux version being used which is 6.1 (which got released this year) re=
quiring
> us to bump up v4l-utils to match the latest features added in 6.1 and t=
his is
> because since we bumped up linux version to 6.1 from official kirkstone
> supported version which I think is 5.18.
>=20
> But I agree with Jai and you that it's better to bump up the recipe ver=
sion
> directly since anyway kernel version is bumped up and latest v4l-utils =
is a
> better match.
>=20
> On a sidenote is it fine if we try and decide to bump up gstreamer vers=
ion too
> from 1.20.5 to 1.22 series which was released this year since it has mo=
re
> features and compatible to kernel version 6.1 ?

I would be fine with that.


> Regards
> Devarsh
>>> Regards
>>> Devarsh
>>>
>>>>  =C2=A0 5 files changed, 236 insertions(+)
>>>>  =C2=A0 create mode 100644
>>>> meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert=
-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>>>>  =C2=A0 create mode 100644
>>>> meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-origin=
al-patch-mediactl-pkgconfig.patch
>>>>  =C2=A0 create mode 100644
>>>> meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-origin=
al-patch-export-mediactl-headers.patch
>>>>  =C2=A0 create mode 100644
>>>> meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0004-Do-not=
-use-getsubopt.patch
>>>>  =C2=A0 create mode 100644
>>>> meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.23.0.bb
>>>
>>>
>>>>
>>>> diff --git
>>>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Reve=
rt-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-arago-extra=
s/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert-media-ctl-Don-t-inst=
all-libmediactl-and-libv4.patch
>>>> new file mode 100644
>>>> index 00000000..8ac8fbe1
>>>> --- /dev/null
>>>> +++
>>>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Reve=
rt-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>>>> @@ -0,0 +1,44 @@
>>>> +From 0d5c0e9a75eca43667b0e29155b635e50622b66a Mon Sep 17 00:00:00 2=
001
>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>> +Date: Fri, 27 Feb 2015 21:55:36 +0000
>>>> +Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
>>>> +
>>>> + libv4l2subdev"
>>>> +
>>>> +This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
>>>> +
>>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> +
>>>> +Conflicts:
>>>> +=C2=A0=C2=A0=C2=A0 utils/media-ctl/Makefile.am
>>>> +
>>>> +---
>>>> + utils/media-ctl/Makefile.am | 10 +++-------
>>>> + 1 file changed, 3 insertions(+), 7 deletions(-)
>>>> +
>>>> +diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile=
.am
>>>> +index c48c8d6..e255e16 100644
>>>> +--- a/utils/media-ctl/Makefile.am
>>>> ++++ b/utils/media-ctl/Makefile.am
>>>> +@@ -1,8 +1,7 @@
>>>> +-noinst_LTLIBRARIES =3D libmediactl.la libv4l2subdev.la
>>>> +-
>>>> ++lib_LTLIBRARIES =3D libmediactl.la libv4l2subdev.la
>>>> + libmediactl_la_SOURCES =3D libmediactl.c mediactl-priv.h
>>>> +-libmediactl_la_CFLAGS =3D -static $(LIBUDEV_CFLAGS)
>>>> +-libmediactl_la_LDFLAGS =3D -static $(LIBUDEV_LIBS)
>>>> ++libmediactl_la_CFLAGS =3D $(LIBUDEV_CFLAGS)
>>>> ++libmediactl_la_LDFLAGS =3D $(LIBUDEV_LIBS)
>>>> +
>>>> + media-bus-format-names.h: ../../include/linux/media-bus-format.h
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 $(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT=
/ ! d; s/.*FMT_//; /FIXED/
>>>> d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
>>>> +@@ -18,9 +17,6 @@ CLEANFILES =3D $(BUILT_SOURCES)
>>>> + nodist_libv4l2subdev_la_SOURCES =3D $(BUILT_SOURCES)
>>>> + libv4l2subdev_la_SOURCES =3D libv4l2subdev.c
>>>> + libv4l2subdev_la_LIBADD =3D libmediactl.la
>>>> +-libv4l2subdev_la_CFLAGS =3D -static
>>>> +-libv4l2subdev_la_LDFLAGS =3D -static
>>>> +-
>>>> + mediactl_includedir=3D$(includedir)/mediactl
>>>> + noinst_HEADERS =3D mediactl.h v4l2subdev.h
>>>> +
>>>> diff --git
>>>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-orig=
inal-patch-mediactl-pkgconfig.patch b/meta-arago-extras/recipes-multimedi=
a/v4l-utils/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
>>>> new file mode 100644
>>>> index 00000000..52fc2d7a
>>>> --- /dev/null
>>>> +++
>>>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-orig=
inal-patch-mediactl-pkgconfig.patch
>>>> @@ -0,0 +1,21 @@
>>>> +From 320b8378ee30eb5e0fe83a8b397f822f2f88a4c1 Mon Sep 17 00:00:00 2=
001
>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>> +Date: Sun, 1 Mar 2015 22:25:07 +0000
>>>> +Subject: [PATCH] %% original patch: mediactl-pkgconfig.patch
>>>> +
>>>> +---
>>>> + utils/media-ctl/Makefile.am | 1 +
>>>> + 1 file changed, 1 insertion(+)
>>>> +
>>>> +diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile=
.am
>>>> +index e255e16..ff7b417 100644
>>>> +--- a/utils/media-ctl/Makefile.am
>>>> ++++ b/utils/media-ctl/Makefile.am
>>>> +@@ -20,6 +20,7 @@ libv4l2subdev_la_LIBADD =3D libmediactl.la
>>>> + mediactl_includedir=3D$(includedir)/mediactl
>>>> + noinst_HEADERS =3D mediactl.h v4l2subdev.h
>>>> +
>>>> ++pkgconfig_DATA =3D libmediactl.pc
>>>> + bin_PROGRAMS =3D media-ctl
>>>> + media_ctl_SOURCES =3D media-ctl.c options.c options.h tools.h
>>>> + media_ctl_LDADD =3D libmediactl.la libv4l2subdev.la
>>>> diff --git
>>>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-orig=
inal-patch-export-mediactl-headers.patch b/meta-arago-extras/recipes-mult=
imedia/v4l-utils/v4l-utils/0003-original-patch-export-mediactl-headers.pa=
tch
>>>> new file mode 100644
>>>> index 00000000..39dc3383
>>>> --- /dev/null
>>>> +++
>>>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-orig=
inal-patch-export-mediactl-headers.patch
>>>> @@ -0,0 +1,24 @@
>>>> +From f7109d6b2fcb291824d795071c04a492d9fbc45b Mon Sep 17 00:00:00 2=
001
>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>> +Date: Sun, 1 Mar 2015 22:25:07 +0000
>>>> +Subject: [PATCH] %% original patch: export-mediactl-headers.patch
>>>> +
>>>> +---
>>>> + utils/media-ctl/Makefile.am | 4 ++--
>>>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> +
>>>> +diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile=
.am
>>>> +index ff7b417..6ce656f 100644
>>>> +--- a/utils/media-ctl/Makefile.am
>>>> ++++ b/utils/media-ctl/Makefile.am
>>>> +@@ -17,8 +17,8 @@ CLEANFILES =3D $(BUILT_SOURCES)
>>>> + nodist_libv4l2subdev_la_SOURCES =3D $(BUILT_SOURCES)
>>>> + libv4l2subdev_la_SOURCES =3D libv4l2subdev.c
>>>> + libv4l2subdev_la_LIBADD =3D libmediactl.la
>>>> +-mediactl_includedir=3D$(includedir)/mediactl
>>>> +-noinst_HEADERS =3D mediactl.h v4l2subdev.h
>>>> ++otherincludedir =3D $(includedir)/mediactl
>>>> ++otherinclude_HEADERS =3D mediactl.h v4l2subdev.h
>>>> +
>>>> + pkgconfig_DATA =3D libmediactl.pc
>>>> + bin_PROGRAMS =3D media-ctl
>>>> diff --git
>>>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0004-Do-n=
ot-use-getsubopt.patch b/meta-arago-extras/recipes-multimedia/v4l-utils/v=
4l-utils/0004-Do-not-use-getsubopt.patch
>>>> new file mode 100644
>>>> index 00000000..fb844acb
>>>> --- /dev/null
>>>> +++
>>>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0004-Do-n=
ot-use-getsubopt.patch
>>>> @@ -0,0 +1,60 @@
>>>> +From 6e7e52de7afe29597016952a7317faf9c3ea3268 Mon Sep 17 00:00:00 2=
001
>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>> +Date: Sat, 30 Nov 2019 18:50:34 -0800
>>>> +Subject: [PATCH] Do not use getsubopt
>>>> +
>>>> +POSIX says that behavior when subopts list is empty is undefined.
>>>> +musl libs will set value to NULL which leads to crash.
>>>> +
>>>> +Simply avoid getsubopt, since we cannot rely on it.
>>>> +
>>>> +Imported from Alpine Linux
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> +
>>>> +Adapt patch to 1.23.0.
>>>> +
>>>> +(v4l-utils rev fd544473800d02e90bc289434cc44e5aa8fadd0f).
>>>> +
>>>> +%% original patch: 0007-Do-not-use-getsubopt.patch
>>>> +
>>>> +Signed-off-by: Daniel Gomez <daniel@qtec.com>
>>>> +---
>>>> + utils/v4l2-ctl/v4l2-ctl-common.cpp | 18 ++++++++++--------
>>>> + 1 file changed, 10 insertions(+), 8 deletions(-)
>>>> +
>>>> +diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>> b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>> +index d77f7104..838c297d 100644
>>>> +--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>> ++++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>> +@@ -994,15 +994,17 @@ static bool parse_subset(char *optarg)
>>>> +
>>>> + static bool parse_next_subopt(char **subs, char **value)
>>>> + {
>>>> +-=C2=A0=C2=A0=C2=A0 static char *const subopts[] =3D {
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nullptr
>>>> +-=C2=A0=C2=A0=C2=A0 };
>>>> +-=C2=A0=C2=A0=C2=A0 int opt =3D v4l_getsubopt(subs, subopts, value)=
;
>>>> ++=C2=A0=C2=A0=C2=A0 char *p =3D *subs;
>>>> ++=C2=A0=C2=A0=C2=A0 *value =3D *subs;
>>>> +
>>>> +-=C2=A0=C2=A0=C2=A0 if (opt < 0 || *value)
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>>> +-=C2=A0=C2=A0=C2=A0 fprintf(stderr, "Missing suboption value\n");
>>>> +-=C2=A0=C2=A0=C2=A0 return true;
>>>> ++=C2=A0=C2=A0=C2=A0 while (*p && *p !=3D ',')
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p++;
>>>> ++
>>>> ++=C2=A0=C2=A0=C2=A0 if (*p)
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *p++ =3D '\0';
>>>> ++
>>>> ++=C2=A0=C2=A0=C2=A0 *subs =3D p;
>>>> ++=C2=A0=C2=A0=C2=A0 return false;
>>>> + }
>>>> +
>>>> + void common_cmd(const std::string &media_bus_info, int ch, char *o=
ptarg)
>>>> +--
>>>> +2.35.1
>>>> +
>>>> diff --git
>>>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.23.0.bb
>>>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.23.0.bb
>>>> new file mode 100644
>>>> index 00000000..21a08022
>>>> --- /dev/null
>>>> +++ b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.23.=
0.bb
>>>> @@ -0,0 +1,87 @@
>>>> +SUMMARY =3D "v4l2 and IR applications"
>>>> +LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48da9957849056017dc568bb=
c43d8975 \
>>>> +
>>>> file://COPYING.libv4l;md5=3Dd749e86a105281d7a44c2328acebc4b0"
>>>> +PROVIDES =3D "libv4l media-ctl"
>>>> +
>>>> +DEPENDS =3D "jpeg \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.=
utils.contains('DISTRO_FEATURES', 'x11',
>>>> 'virtual/libx11', '', d)} \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.=
utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
>>>> '', d)} \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.=
utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '',
>>>> d)} \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.=
utils.contains_any('PACKAGECONFIG', 'qv4l2 qvidcap',
>>>> 'qtbase qtbase-native', '', d)}"
>>>> +
>>>> +DEPENDS:append:libc-musl =3D " argp-standalone"
>>>> +DEPENDS:append:class-target =3D " udev"
>>>> +LDFLAGS:append =3D " -pthread"
>>>> +# v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
>>>> +# both 32 and 64 bit file APIs.=C2=A0 But it does not handle the ti=
me side?
>>>> +# Needs further investigation
>>>> +GLIBC_64BIT_TIME_FLAGS =3D ""
>>>> +
>>>> +inherit autotools gettext pkgconfig
>>>> +
>>>> +PACKAGECONFIG ??=3D "media-ctl"
>>>> +PACKAGECONFIG[media-ctl] =3D "--enable-v4l-utils,--disable-v4l-util=
s,,"
>>>> +PACKAGECONFIG[qv4l2] =3D ",--disable-qv4l2"
>>>> +PACKAGECONFIG[qvidcap] =3D ",--disable-qvidcap"
>>>> +
>>>> +SRC_URI =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 git://git.linuxtv.org/v4l-utils.git;protocol=3Dh=
ttps;branch=3Dmaster \
>>>> +=C2=A0=C2=A0=C2=A0 file://0001-Revert-media-ctl-Don-t-install-libme=
diactl-and-libv4.patch \
>>>> +=C2=A0=C2=A0=C2=A0 file://0002-original-patch-mediactl-pkgconfig.pa=
tch \
>>>> +=C2=A0=C2=A0=C2=A0 file://0003-original-patch-export-mediactl-heade=
rs.patch \
>>>> +=C2=A0=C2=A0=C2=A0 file://0004-Do-not-use-getsubopt.patch \
>>>> +"
>>>> +
>>>> +SRCREV =3D "9431e4b26b4842d1401e80ada9f14593dca3a94c"
>>>> +
>>>> +PV .=3D "+git${SRCPV}"
>>>> +
>>>> +S =3D "${WORKDIR}/git"
>>>> +
>>>> +do_configure:prepend() {
>>>> +=C2=A0=C2=A0=C2=A0 cd ${S}; ./bootstrap.sh; cd -
>>>> +}
>>>> +
>>>> +EXTRA_OECONF =3D "--enable-shared --with-udevdir=3D${base_libdir}/u=
dev \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
>>>> +
>>>> +VIRTUAL-RUNTIME_ir-keytable-keymaps ?=3D "rc-keymaps"
>>>> +
>>>> +PACKAGES =3D+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev q=
v4l2
>>>> qvidcap"
>>>> +
>>>> +RPROVIDES:${PN}-dbg +=3D "libv4l-dbg"
>>>> +
>>>> +FILES:media-ctl =3D "${bindir}/media-ctl ${libdir}/libmediactl.so.*=
"
>>>> +FILES:qv4l2 =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${bindir}/qv4l2 \
>>>> +=C2=A0=C2=A0=C2=A0 ${datadir}/applications/qv4l2.desktop \
>>>> +=C2=A0=C2=A0=C2=A0 ${datadir}/icons/hicolor/*/apps/qv4l2.* \
>>>> +"
>>>> +FILES:qvidcap =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${bindir}/qvidcap \
>>>> +=C2=A0=C2=A0=C2=A0 ${datadir}/applications/qvidcap.desktop \
>>>> +=C2=A0=C2=A0=C2=A0 ${datadir}/icons/hicolor/*/apps/qvidcap.* \
>>>> +"
>>>> +
>>>> +FILES:ir-keytable =3D "${bindir}/ir-keytable
>>>> ${base_libdir}/udev/rules.d/*-infrared.rules"
>>>> +RDEPENDS:ir-keytable +=3D "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
>>>> +RDEPENDS:qv4l2 +=3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'qv4l2', '=
qtbase', '', d)}"
>>>> +RDEPENDS:qvidcap +=3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap',=
 'qtbase', '', d)}"
>>>> +
>>>> +FILES:rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
>>>> +
>>>> +FILES:${PN} =3D "${bindir} ${sbindir}"
>>>> +
>>>> +FILES:libv4l +=3D "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so
>>>> ${libdir}/libv4l/plugins/*.so \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/libdvbv5*${SOLIBS} \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/libv4l/*-decomp"
>>>> +
>>>> +FILES:libv4l-dev +=3D "${includedir} ${libdir}/pkgconfig \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/libv4l*${SO=
LIBSDEV} ${libdir}/*.la \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/v4l*${SOLIB=
SDEV} ${libdir}/libv4l/*.la
>>>> ${libdir}/libv4l/plugins/*.la"
>>>> +
>>>> +PARALLEL_MAKE:class-native =3D ""
>>>> +BBCLASSEXTEND =3D "native"
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

