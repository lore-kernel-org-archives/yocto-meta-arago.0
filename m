Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8992.1645504920671985529
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 23FF940A28
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:42:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIIA0tcsSJPY for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:42:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CE33040C93
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BB383174772
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 15/23] classes: rename old customized fitimage classes for legacy HS devices
Date: Tue, 22 Feb 2022 04:41:43 +0000
Message-Id: <20220222044151.2844138-16-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

These classes are used for creating signed FIT images for legacy HS devic=
es
that use custom process that differs from upstream. To avoid conflict wit=
h
upstream namespace that is used for K3 HS devices, rename them accordingl=
y.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...class =3D> kernel-fitimage-legacyhs.bbclass} |  2 +-
 ...gn.bbclass =3D> uboot-sign-legacyhs.bbclass} |  0
 meta-arago-distro/conf/distro/arago.conf      | 34 +++++++++++++------
 3 files changed, 24 insertions(+), 12 deletions(-)
 rename meta-arago-distro/classes/{kernel-fitimage.bbclass =3D> kernel-fi=
timage-legacyhs.bbclass} (99%)
 rename meta-arago-distro/classes/{uboot-sign.bbclass =3D> uboot-sign-leg=
acyhs.bbclass} (100%)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-ara=
go-distro/classes/kernel-fitimage-legacyhs.bbclass
similarity index 99%
rename from meta-arago-distro/classes/kernel-fitimage.bbclass
rename to meta-arago-distro/classes/kernel-fitimage-legacyhs.bbclass
index f412f4c9..4a006eb6 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage-legacyhs.bbclass
@@ -1,4 +1,4 @@
-inherit kernel-uboot uboot-sign
+inherit kernel-uboot uboot-sign-legacyhs
=20
 FITIMAGE_HASH_ALGO ?=3D "sha1"
 FITIMAGE_PACK_TEE ?=3D "0"
diff --git a/meta-arago-distro/classes/uboot-sign.bbclass b/meta-arago-di=
stro/classes/uboot-sign-legacyhs.bbclass
similarity index 100%
rename from meta-arago-distro/classes/uboot-sign.bbclass
rename to meta-arago-distro/classes/uboot-sign-legacyhs.bbclass
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index f4e935dc..b06c2782 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -36,8 +36,29 @@ SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
 #IMAGE_CLASSES +=3D "image_types_md5"
 #IMAGE_FSTYPES +=3D "tar.xz.md5"
=20
-# FIT image for secure devices
-KERNEL_CLASSES +=3D "kernel-fitimage"
+# FIT image for legacy secure devices
+KERNEL_CLASSES:append:am335x-hs-evm =3D " kernel-fitimage-legacyhs"
+KERNEL_CLASSES:append:am437x-hs-evm =3D " kernel-fitimage-legacyhs"
+KERNEL_CLASSES:append:am57xx-hs-evm =3D " kernel-fitimage-legacyhs"
+KERNEL_CLASSES:append:dra7xx-hs-evm =3D " kernel-fitimage-legacyhs"
+
+KERNEL_IMAGETYPES:am335x-hs-evm =3D "zImage fitImage"
+KERNEL_IMAGETYPES:am437x-hs-evm =3D "zImage fitImage"
+KERNEL_IMAGETYPES:am57xx-hs-evm =3D "zImage fitImage"
+KERNEL_IMAGETYPES:dra7xx-hs-evm =3D "zImage fitImage"
+
+# FIT image for K3 secure devices
+KERNEL_CLASSES:append:am64xx-hs-evm =3D " kernel-fitimage"
+KERNEL_CLASSES:append:am65xx-hs-evm =3D " kernel-fitimage"
+KERNEL_CLASSES:append:j7-hs-evm =3D " kernel-fitimage"
+KERNEL_CLASSES:append:j7200-hs-evm =3D " kernel-fitimage"
+
+KERNEL_IMAGETYPES:am64xx-hs-evm =3D "Image fitImage"
+KERNEL_IMAGETYPES:am65xx-hs-evm =3D "Image fitImage"
+KERNEL_IMAGETYPES:j7-hs-evm =3D "Image fitImage"
+KERNEL_IMAGETYPES:j7200-hs-evm =3D "Image fitImage"
+
+# FIT image settings
 FITIMAGE_HASH_ALGO =3D ""
 FITIMAGE_PACK_TEE =3D "0"
 FITIMAGE_PACK_TEE:am437x-hs-evm =3D "1"
@@ -47,15 +68,6 @@ FITIMAGE_DTB_BY_NAME =3D "1"
 FITIMAGE_TEE_BY_NAME =3D "1"
 FITIMAGE_CONF_BY_NAME =3D "1"
=20
-KERNEL_IMAGETYPES:dra7xx-hs-evm =3D "zImage fitImage"
-KERNEL_IMAGETYPES:am57xx-hs-evm =3D "zImage fitImage"
-KERNEL_IMAGETYPES:am437x-hs-evm =3D "zImage fitImage"
-KERNEL_IMAGETYPES:am335x-hs-evm =3D "zImage fitImage"
-KERNEL_IMAGETYPES:am65xx-hs-evm =3D "Image fitImage"
-KERNEL_IMAGETYPES:am64xx-hs-evm =3D "Image fitImage"
-KERNEL_IMAGETYPES:j7-hs-evm =3D "Image fitImage"
-KERNEL_IMAGETYPES:j7200-hs-evm =3D "Image fitImage"
-
 # Extra boot files for WIC images
 do_image_wic[depends] +=3D "tisdk-uenv:do_deploy"
 IMAGE_BOOT_FILES +=3D "uEnv.txt"
--=20
2.25.1

