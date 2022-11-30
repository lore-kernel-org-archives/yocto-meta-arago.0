Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A78C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 22:38:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.27278.1669847936178757682
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 14:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9EBFA40AC9;
	Wed, 30 Nov 2022 22:38:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_iv3O98xI_j; Wed, 30 Nov 2022 22:38:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8A0EC400CF;
	Wed, 30 Nov 2022 22:38:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 604C9163689;
	Wed, 30 Nov 2022 17:38:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] toolchain-gcc: update toolchain preferences
Date: Wed, 30 Nov 2022 22:38:52 +0000
Message-Id: <20221130223852.330495-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Nov 2022 22:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14125

From: Denys Dmytriyenko <denys@konsulko.com>

Update toolchain preferences to the latest available in master.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/distro/include/toolchain-gcc.inc            | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/me=
ta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 5570594d..87569e10 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -13,9 +13,9 @@ PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED=
_TARGET_ARCH} ?=3D "binutil
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb=
-cross-canadian-${TRANSLATED_TARGET_ARCH}"
=20
 # Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?=3D "11%"
-SDKBINUVERSION ?=3D "2.38%"
-SDKGLIBCVERSION ?=3D "2.35%"
+SDKGCCVERSION ?=3D "12%"
+SDKBINUVERSION ?=3D "2.39%"
+SDKGLIBCVERSION ?=3D "2.36%"
 SDKLINUXLIBCVERSION ?=3D "5.10%"
=20
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?=3D "${SDKGCCVERSION}"
@@ -32,9 +32,9 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?=3D "${SDKGL=
IBCVERSION}"
=20
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
-GCCVERSION ?=3D "11%"
-BINUVERSION ?=3D "2.38%"
-GLIBCVERSION ?=3D "2.35%"
+GCCVERSION ?=3D "12%"
+BINUVERSION ?=3D "2.39%"
+GLIBCVERSION ?=3D "2.36%"
 LINUXLIBCVERSION ?=3D "5.10%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
--=20
2.25.1


