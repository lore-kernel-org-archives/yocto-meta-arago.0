Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580B2C7EE32
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 04:42:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.38609.1677300159327580706
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 20:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1EA8040C90;
	Sat, 25 Feb 2023 04:42:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wje_SKih_uX6; Sat, 25 Feb 2023 04:42:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F081640C06;
	Sat, 25 Feb 2023 04:42:36 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BBAB516375B;
	Fri, 24 Feb 2023 23:42:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/6] toolchain-gcc: bump preferences for glibc and binutils
Date: Sat, 25 Feb 2023 04:42:30 +0000
Message-Id: <20230225044235.1967733-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 25 Feb 2023 04:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14231

From: Denys Dmytriyenko <denys@konsulko.com>

Update preferred versions for glibc and binutils for internal gcc toolcha=
in.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/me=
ta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 87569e10..18a4c125 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -14,8 +14,8 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARG=
ET_ARCH} =3D "gdb-cross-can
=20
 # Set Cross and SDK toolchain preferences
 SDKGCCVERSION ?=3D "12%"
-SDKBINUVERSION ?=3D "2.39%"
-SDKGLIBCVERSION ?=3D "2.36%"
+SDKBINUVERSION ?=3D "2.40%"
+SDKGLIBCVERSION ?=3D "2.37%"
 SDKLINUXLIBCVERSION ?=3D "5.10%"
=20
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?=3D "${SDKGCCVERSION}"
@@ -33,8 +33,8 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?=3D "${SDKGL=
IBCVERSION}"
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
 GCCVERSION ?=3D "12%"
-BINUVERSION ?=3D "2.39%"
-GLIBCVERSION ?=3D "2.36%"
+BINUVERSION ?=3D "2.40%"
+GLIBCVERSION ?=3D "2.37%"
 LINUXLIBCVERSION ?=3D "5.10%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
--=20
2.25.1


