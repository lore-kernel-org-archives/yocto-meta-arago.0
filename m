Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A41C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 16:13:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.36710.1701879221926564094
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 08:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=BIoXKypf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6GDd5S005875;
	Wed, 6 Dec 2023 10:13:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701879219;
	bh=AAALf/ZxDfjQ7bNv9iiNsl470cxm2KNiZCeq0ZKr9GE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=BIoXKypfWxIFwQfMZIlJVXPmVBtzHrtBaOQ3hVwgQLdfEMAM369NpL1v/v03EvPYt
	 D8cjgS0Khji/r0h+wcE9hxuMHvtZXFt8UCeHWXl5sdCO2lrIPXCwRnaRYiNNe8QK3j
	 WlmhFBdM+DZwoescXtJLBLKG76B1eop1/EmSSBg0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6GDd6R084081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 10:13:39 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 10:13:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 10:13:38 -0600
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6GDcY4031973;
	Wed, 6 Dec 2023 10:13:38 -0600
Message-ID: <1a55c53e-db92-410f-99b3-a3b8b01129dc@ti.com>
Date: Wed, 6 Dec 2023 10:13:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] qtbase: Patch to support xkbcommon
 1.6.0
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <179DF9DADB1B9582.18076@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <179DF9DADB1B9582.18076@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 3B6GDd5S005875
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 16:13:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15044


This patch has now been accepted on master, so reverting this patch.


On 12/5/2023 9:42 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> xkbcommon 1.6.0 (and newer) remove 4 defintions that qtbase seems to us=
e.
> Backport an upstream patch to look to see if they are defined and
> ignore them if they're not.
>=20
> This is a temporary patch to fix our master builds while we wait for th=
e
> meta-q5 patch [1] to make it to the master branch.  This will be
> reverted once that patch is promoted.
>=20
> [1] https://github.com/meta-qt5/meta-qt5/pull/545
>=20
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../recipes-qt/qt5/qtbase-native_%.bbappend   |  7 +++
>   ...ld-with-libxkbcommon-1.6.0-and-later.patch | 55 ++++++++++++++++++=
+
>   .../recipes-qt/qt5/qtbase_%.bbappend          |  1 +
>   3 files changed, 63 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-native_%.b=
bappend
>   create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0027-xkb-f=
ix-build-with-libxkbcommon-1.6.0-and-later.patch
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-native_%.bbappend =
b/meta-arago-distro/recipes-qt/qt5/qtbase-native_%.bbappend
> new file mode 100644
> index 00000000..e49941db
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-native_%.bbappend
> @@ -0,0 +1,7 @@
> +
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/qtbase:"
> +
> +SRC_URI +=3D "\
> +    file://0027-xkb-fix-build-with-libxkbcommon-1.6.0-and-later.patch =
\
> +"
> +
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0027-xkb-fix-build=
-with-libxkbcommon-1.6.0-and-later.patch b/meta-arago-distro/recipes-qt/q=
t5/qtbase/0027-xkb-fix-build-with-libxkbcommon-1.6.0-and-later.patch
> new file mode 100644
> index 00000000..ab6e92cc
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0027-xkb-fix-build-with-l=
ibxkbcommon-1.6.0-and-later.patch
> @@ -0,0 +1,55 @@
> +From 8946e4874d0e071b182ba5ac438fb4d52d2a44d0 Mon Sep 17 00:00:00 2001
> +From: Mark Hatle <mark.hatle@amd.com>
> +Date: Fri, 1 Dec 2023 08:17:51 -0700
> +Subject: [PATCH] xkb: fix build with libxkbcommon 1.6.0 and later
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Disable the 4 XKB_KEY_dead functions to support libxkbcommon 1.6.0.  S=
ee:
> +
> +https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/merge_requests/7=
0
> +
> +The above URL points to a commit in qt which was used as a basis for t=
he fix.
> +
> +Upstream-Status: Backport
> +[https://github.com/qt/qtbase/commit/8af35d27e8f02bbb99aef4ac495ed406e=
50e3cca]
> +
> +  xkb: fix build with libxkbcommon 1.6.0 and later
> +
> +  A few XKB_KEY_dead_* defines got removed from 1.6.0. See also
> +  https://github.com/xkbcommon/libxkbcommon/blob/6073565903488cb5b9a8d=
37fdc4a7c2f9d7ad04d/NEWS#L9-L14
> +  https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/merge_requests=
/70/diffs?commit_id=3Dcb44799b72f611eb4c9d7cc185bc3b09e070be08
> +
> +  Pick-to: 6.6 6.5 6.2 5.15
> +  Fixes: QTBUG-117950
> +  Change-Id: I55861868f2bb29c553d68365fa9b9b6ed01c9aea
> +  Reviewed-by: Tor Arne Vestb=C3=B8 <tor.arne.vestbo@qt.io>
> +
> +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> +---
> + src/platformsupport/input/xkbcommon/qxkbcommon.cpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/platformsupport/input/xkbcommon/qxkbcommon.cpp b/src/=
platformsupport/input/xkbcommon/qxkbcommon.cpp
> +index b713c19447..ecf02de6db 100644
> +--- a/src/platformsupport/input/xkbcommon/qxkbcommon.cpp
> ++++ b/src/platformsupport/input/xkbcommon/qxkbcommon.cpp
> +@@ -273,10 +273,14 @@ static constexpr const auto KeyTbl =3D qMakeArra=
y(
> +         Xkb2Qt<XKB_KEY_dead_small_schwa,        Qt::Key_Dead_Small_Sc=
hwa>,
> +         Xkb2Qt<XKB_KEY_dead_capital_schwa,      Qt::Key_Dead_Capital_=
Schwa>,
> +         Xkb2Qt<XKB_KEY_dead_greek,              Qt::Key_Dead_Greek>,
> ++/* The following four XKB_KEY_dead keys got removed in libxkbcommon 1=
.6.0
> ++   The define check is kind of version check here. */
> ++#ifdef XKB_KEY_dead_lowline
> +         Xkb2Qt<XKB_KEY_dead_lowline,            Qt::Key_Dead_Lowline>=
,
> +         Xkb2Qt<XKB_KEY_dead_aboveverticalline,  Qt::Key_Dead_Abovever=
ticalline>,
> +         Xkb2Qt<XKB_KEY_dead_belowverticalline,  Qt::Key_Dead_Belowver=
ticalline>,
> +         Xkb2Qt<XKB_KEY_dead_longsolidusoverlay, Qt::Key_Dead_Longsoli=
dusoverlay>,
> ++#endif
> +
> +         // Special keys from X.org - This include multimedia keys,
> +         // wireless/bluetooth/uwb keys, special launcher keys, etc.
> +--
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-=
arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> index 8ae8110b..3d875683 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> @@ -21,6 +21,7 @@ SRC_URI +=3D "\
>       file://0001-deform-Fix-how-controls-are-shown.patch \
>       file://0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.=
patch \
>       file://0001-eglfs-Force-888-format-only-on-env-flag.patch \
> +    file://0027-xkb-fix-build-with-libxkbcommon-1.6.0-and-later.patch =
\
>   "
>  =20
>   python do_patch:append() {

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

