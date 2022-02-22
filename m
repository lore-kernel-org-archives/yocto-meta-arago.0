Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.9172.1645504912198212239
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 92BAB40A28
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GS8zCabAnsCA for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 87F3040C7B
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4A6BF17476F
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 04/23] toolchain-gcc: update preferred versions for internal toolchain
Date: Tue, 22 Feb 2022 04:41:32 +0000
Message-Id: <20220222044151.2844138-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core now uses GCC 11, plus newer glibc and binutils.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/distro/include/toolchain-gcc.inc        | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/me=
ta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 6f09ecbe..5570594d 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -13,10 +13,10 @@ PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLAT=
ED_TARGET_ARCH} ?=3D "binutil
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb=
-cross-canadian-${TRANSLATED_TARGET_ARCH}"
=20
 # Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?=3D "10%"
-SDKBINUVERSION ?=3D "2.36%"
-SDKGLIBCVERSION ?=3D "2.33%"
-SDKLINUXLIBCVERSION ?=3D "5.4%"
+SDKGCCVERSION ?=3D "11%"
+SDKBINUVERSION ?=3D "2.38%"
+SDKGLIBCVERSION ?=3D "2.35%"
+SDKLINUXLIBCVERSION ?=3D "5.10%"
=20
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?=3D "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?=3D "${SDKGCCVERSION}=
"
@@ -32,10 +32,10 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?=3D "${SDK=
GLIBCVERSION}"
=20
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
-GCCVERSION ?=3D "10%"
-BINUVERSION ?=3D "2.36%"
-GLIBCVERSION ?=3D "2.33%"
-LINUXLIBCVERSION ?=3D "5.4%"
+GCCVERSION ?=3D "11%"
+BINUVERSION ?=3D "2.38%"
+GLIBCVERSION ?=3D "2.35%"
+LINUXLIBCVERSION ?=3D "5.10%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_binutils ?=3D "${BINUVERSION}"
--=20
2.25.1

