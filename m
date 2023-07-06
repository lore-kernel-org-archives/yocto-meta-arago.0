Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F3AC001E0
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 21:23:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.36461.1688678589907847405
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 14:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB26140C8A;
	Thu,  6 Jul 2023 21:23:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5XUuyZwBWvjH; Thu,  6 Jul 2023 21:23:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB82740C83;
	Thu,  6 Jul 2023 21:23:07 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3C1E4163BF0;
	Thu,  6 Jul 2023 17:23:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 3/6] meta-arago-distro: remove old secondary toolchain support
Date: Thu,  6 Jul 2023 21:23:01 +0000
Message-Id: <20230706212304.1893414-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706212304.1893414-1-denis@denix.org>
References: <20230706212304.1893414-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:23:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14778

From: Denys Dmytriyenko <denys@konsulko.com>

This was a rather hacky way to add a secondary toolchain for K3R5, based
on external-arm-toolchain. This doesn't work with the internal toolchain,
which is a default now.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/distro/include/toolchain-arm.inc              |  6 ------
 .../meta/external-arm-secondary-sdk-toolchain.bb       |  4 ----
 .../packagegroups/packagegroup-cross-canadian.bbappend | 10 ----------
 3 files changed, 20 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-seco=
ndary-sdk-toolchain.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-cross-canadian.bbappend

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/me=
ta-arago-distro/conf/distro/include/toolchain-arm.inc
index 9b76917d..47e1f846 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -9,9 +9,6 @@ EAT_TARGET_SYS:arm =3D "${EAT_TARGET_SYS_ARMV5}"
 EAT_TARGET_SYS:armv7a =3D "${EAT_TARGET_SYS_ARMV7}"
 EAT_TARGET_SYS:aarch64 =3D "${EAT_TARGET_SYS_ARMV8}"
=20
-SECONDARY_TARGET_ARCH =3D "invalid"
-SECONDARY_TARGET_ARCH:k3 =3D "armv7a"
-
 TARGET_VENDOR =3D ""
=20
 TOOLCHAIN_BASE ?=3D "/opt"
@@ -34,9 +31,6 @@ PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARG=
ET_ARCH} ?=3D "external-arm
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D=
 "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
 #PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "ex=
ternal-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
=20
-PREFERRED_PROVIDER_gcc-cross-canadian-${SECONDARY_TARGET_ARCH} ?=3D "ext=
ernal-arm-secondary-sdk-toolchain-${SECONDARY_TARGET_ARCH}"
-PREFERRED_PROVIDER_binutils-cross-canadian-${SECONDARY_TARGET_ARCH} ?=3D=
 "external-arm-secondary-sdk-toolchain-${SECONDARY_TARGET_ARCH}"
-
 # Special case for gdb to be built as part of canadian-cross-sdk, instea=
d of packaged from external toolchain
 bindir:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${exec_prefi=
x}/bin"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb=
-cross-canadian-${TRANSLATED_TARGET_ARCH}"
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-secondary-s=
dk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-arm-second=
ary-sdk-toolchain.bb
deleted file mode 100644
index 22a8aa0a..00000000
--- a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-tool=
chain.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-TARGET_ARCH :=3D "${SECONDARY_TARGET_ARCH}"
-MACHINEOVERRIDES :=3D "${SECONDARY_TARGET_ARCH}"
-
-require recipes-core/meta/external-arm-sdk-toolchain.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cr=
oss-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-cross-canadian.bbappend
deleted file mode 100644
index 46df17f9..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-can=
adian.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-PR:append =3D ".arago0"
-
-SECONDARY_TARGET_ARCH ?=3D "invalid"
-
-SECONDARY_TOOLCHAIN =3D "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
-                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
-
-RDEPENDS:${PN}:append =3D " \
-    ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', 'invalid', '', '${S=
ECONDARY_TOOLCHAIN}', d)} \
-"
--=20
2.25.1


