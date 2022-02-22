Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.9186.1645504916490285846
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB0F840A28
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79FOPheTkkgQ for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F164240C8A
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B8E83174773
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 14/23] uboot-config: remove overlayed class
Date: Tue, 22 Feb 2022 04:41:42 +0000
Message-Id: <20220222044151.2844138-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

This class was overlayed locally for a fix. The fix since then got accept=
ed
upstream and there's no need to carry it here anymore.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../classes/uboot-config.bbclass              | 57 -------------------
 1 file changed, 57 deletions(-)
 delete mode 100644 meta-arago-distro/classes/uboot-config.bbclass

diff --git a/meta-arago-distro/classes/uboot-config.bbclass b/meta-arago-=
distro/classes/uboot-config.bbclass
deleted file mode 100644
index 89ff970f..00000000
--- a/meta-arago-distro/classes/uboot-config.bbclass
+++ /dev/null
@@ -1,57 +0,0 @@
-# Handle U-Boot config for a machine
-#
-# The format to specify it, in the machine, is:
-#
-# UBOOT_CONFIG ??=3D <default>
-# UBOOT_CONFIG[foo] =3D "config,images,binary"
-#
-# or
-#
-# UBOOT_MACHINE =3D "config"
-#
-# Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
-
-UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
-
-python () {
-    ubootmachine =3D d.getVar("UBOOT_MACHINE")
-    ubootconfigflags =3D d.getVarFlags('UBOOT_CONFIG')
-    ubootbinary =3D d.getVar('UBOOT_BINARY')
-    ubootbinaries =3D d.getVar('UBOOT_BINARIES')
-    # The "doc" varflag is special, we don't want to see it here
-    ubootconfigflags.pop('doc', None)
-    ubootconfig =3D (d.getVar('UBOOT_CONFIG') or "").split()
-
-    if not ubootmachine and not ubootconfig:
-        PN =3D d.getVar("PN")
-        FILE =3D os.path.basename(d.getVar("FILE"))
-        bb.debug(1, "To build %s, see %s for instructions on \
-                 setting up your machine config" % (PN, FILE))
-        raise bb.parse.SkipRecipe("Either UBOOT_MACHINE or UBOOT_CONFIG =
must be set in the %s machine configuration." % d.getVar("MACHINE"))
-
-    if ubootmachine and ubootconfig:
-        raise bb.parse.SkipRecipe("You cannot use UBOOT_MACHINE and UBOO=
T_CONFIG at the same time.")
-
-    if ubootconfigflags and ubootbinaries:
-        raise bb.parse.SkipRecipe("You cannot use UBOOT_BINARIES as it i=
s internal to uboot_config.bbclass.")
-
-    if len(ubootconfig) > 0:
-        for config in ubootconfig:
-            for f, v in ubootconfigflags.items():
-                if config =3D=3D f:=20
-                    items =3D v.split(',')
-                    if items[0] and len(items) > 3:
-                        raise bb.parse.SkipRecipe('Only config,images,bi=
nary can be specified!')
-                    d.appendVar('UBOOT_MACHINE', ' ' + items[0])
-                    # IMAGE_FSTYPES appending
-                    if len(items) > 1 and items[1]:
-                        bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." %=
 items[1])
-                        d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
-                    if len(items) > 2 and items[2]:
-                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." =
% items[2])
-                        d.appendVar('UBOOT_BINARIES', ' ' + items[2])
-                    else:
-                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." =
% ubootbinary)
-                        d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
-                    break
-}
--=20
2.25.1

