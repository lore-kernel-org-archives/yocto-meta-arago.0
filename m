Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0377EC3DA7C
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 22:12:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.58756.1671747137219178124
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 14:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3021540C47;
	Thu, 22 Dec 2022 22:12:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzioaB3DExhE; Thu, 22 Dec 2022 22:12:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1989A40BA9;
	Thu, 22 Dec 2022 22:12:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C34571636B5;
	Thu, 22 Dec 2022 17:12:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell][PATCH 3/4] input-utils: fix bashisms
Date: Thu, 22 Dec 2022 22:12:04 +0000
Message-Id: <20221222221205.1312505-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222221205.1312505-1-denis@denix.org>
References: <20221222221205.1312505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Dec 2022 22:12:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14138

From: Denys Dmytriyenko <denys@konsulko.com>

Add patch from Debian that fixes bashism in the Makefile.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../input-utils/fix-ftbfs-echo.patch          | 20 +++++++++++++++++++
 .../input-utils/input-utils_1.0.bb            |  3 ++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/input-utils/input-=
utils/fix-ftbfs-echo.patch

diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-utils/f=
ix-ftbfs-echo.patch b/meta-arago-extras/recipes-devtools/input-utils/inpu=
t-utils/fix-ftbfs-echo.patch
new file mode 100644
index 00000000..39880694
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/input-utils/input-utils/fix-ftbf=
s-echo.patch
@@ -0,0 +1,20 @@
+Description: Fix FTBFS due to -e leaking into Make.config
+ If /bin/sh is configured to point to dash, echo does not support -e swi=
tch
+ which is used by mk/Autoconf.mk file to generate Make.config. Use 'env =
echo'
+ instead.
+Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Bug-Debian: http://bugs.debian.org/750265
+Forwarded: no
+Last-Update: 2014-07-09
+
+--- input-utils-1.0.orig/mk/Autoconf.mk
++++ input-utils-1.0/mk/Autoconf.mk
+@@ -162,7 +162,7 @@ config: Make.config
+ 	@true
+=20
+ Make.config: $(srcdir)/GNUmakefile
+-	@echo -e "$(make-config-q)" > $@
++	@env echo -e "$(make-config-q)" > $@
+ 	@echo
+ 	@echo "Make.config written, edit if needed"
+ 	@echo
diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-utils_1=
.0.bb b/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
index 6fbc8b60..0c18aefa 100644
--- a/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
+++ b/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c23=
36e835926c2166c28b"
 PV =3D "1.0"
 PR =3D "r0"
=20
-SRC_URI =3D "http://ftp.de.debian.org/debian/pool/main/i/input-utils/inp=
ut-utils_1.0.orig.tar.gz"
+SRC_URI =3D "http://ftp.de.debian.org/debian/pool/main/i/input-utils/inp=
ut-utils_1.0.orig.tar.gz \
+	file://fix-ftbfs-echo.patch"
 SRC_URI_append_arm =3D " file://0001-autoconf-fix-for-cross-compilation-=
for-ARM.patch"
=20
 SRC_URI[md5sum] =3D "3e58772e8647093b1de2f2c90bfb9ee8"
--=20
2.25.1


