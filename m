Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B97C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 04:44:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3171.1668573880372464009
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Nov 2022 20:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF1E840D53;
	Wed, 16 Nov 2022 04:44:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oujPavURYZuz; Wed, 16 Nov 2022 04:44:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B4BE540D43;
	Wed, 16 Nov 2022 04:44:38 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5BB54163674;
	Tue, 15 Nov 2022 23:44:34 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] meta-arago: remove old deprecated long-SDKPATH hack
Date: Wed, 16 Nov 2022 04:44:37 +0000
Message-Id: <20221116044437.2893722-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Nov 2022 04:44:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14113

From: Denys Dmytriyenko <denys@konsulko.com>

The long-SDKPATH hack was used for pre-allocating large enough fields
in the ELF headers of nativesdk binaries, so when they are relocated
the new path to the dynamic loader and libraries would fit. This is
no longer necessary for some time, so time to remove the hack.

Change the default SDKPATHINSTALL to include the SDK/distro version.
Also drop all workarounds that were needed due to the unusual SDKPATH.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf             |  6 +-----
 .../recipes-devtools/perl/perl_%.bbappend            | 12 ------------
 .../recipes-devtools/python/python3_%.bbappend       | 12 ------------
 .../recipes-core/meta/meta-toolchain-arago.bb        |  2 +-
 4 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/perl/perl_%.bbappe=
nd
 delete mode 100644 meta-arago-distro/recipes-devtools/python/python3_%.b=
bappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 57eeb57a..d675b077 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -28,8 +28,7 @@ SDK_NAME_PREFIX =3D "arago"
 SDK_VERSION =3D "${DISTRO_VERSION}"
 SDK_VENDOR =3D "-${SDK_NAME_PREFIX}"
 SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_VERSION}"
-SDKPATH_REAL =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
-SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
+SDKPATHINSTALL =3D "/opt/${SDK_NAME}"
=20
 IMAGE_FSTYPES +=3D "tar.xz.md5sum"
=20
@@ -214,6 +213,3 @@ LICENSE_FLAGS_ACCEPTED =3D "commercial_gst-ffmpeg com=
mercial_gstreamer1.0-libav co
=20
 # Do not package own copy of perl into devkit, rely on host one
 ASSUME_PROVIDED +=3D "nativesdk-perl"
-
-# Disable empty-dirs QA check, which trips on our devkit default SDKPATH
-ERROR_QA:remove =3D "empty-dirs"
diff --git a/meta-arago-distro/recipes-devtools/perl/perl_%.bbappend b/me=
ta-arago-distro/recipes-devtools/perl/perl_%.bbappend
deleted file mode 100644
index 9af89cbc..00000000
--- a/meta-arago-distro/recipes-devtools/perl/perl_%.bbappend
+++ /dev/null
@@ -1,12 +0,0 @@
-# In arago.conf, we pre-allocate SDK path very long to reserve enough sp=
ace in ELF headers
-# and then it gets replaced with a short real path at the time of SDK cr=
eation:
-# SDKPATH_REAL =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
-# SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
-# Unfortunately, that triggers the new shebang-size QA check in nativesd=
k-perl packages
-
-python() {
-    if d.getVar('CLASSOVERRIDE') =3D=3D "class-nativesdk":
-        pkgs =3D d.getVar("PACKAGES").split()
-        for p in pkgs:
-            d.appendVar('INSANE_SKIP:%s' % (p), ' shebang-size')
-}
diff --git a/meta-arago-distro/recipes-devtools/python/python3_%.bbappend=
 b/meta-arago-distro/recipes-devtools/python/python3_%.bbappend
deleted file mode 100644
index 2afb2b37..00000000
--- a/meta-arago-distro/recipes-devtools/python/python3_%.bbappend
+++ /dev/null
@@ -1,12 +0,0 @@
-# In arago.conf, we pre-allocate SDK path very long to reserve enough sp=
ace in ELF headers
-# and then it gets replaced with a short real path at the time of SDK cr=
eation:
-# SDKPATH_REAL =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
-# SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
-# Unfortunately, that triggers the new shebang-size QA check in nativesd=
k-python3 packages
-
-python() {
-    if d.getVar('CLASSOVERRIDE') =3D=3D "class-nativesdk":
-        pkgs =3D d.getVar("PACKAGES").split()
-        for p in pkgs:
-            d.appendVar('INSANE_SKIP:%s' % (p), ' shebang-size')
-}
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index ab484a1e..81affa16 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -178,7 +178,7 @@ if [ "$INST_ARCH" !=3D "$SDK_ARCH" ]; then
 	fi
 fi
=20
-DEFAULT_INSTALL_DIR=3D"${SDKPATH_REAL}"
+DEFAULT_INSTALL_DIR=3D"${SDKPATHINSTALL}"
 TMPSDKPATH=3D"${SDKPATH}"
 SUDO_EXEC=3D""
 target_sdk_dir=3D""
--=20
2.25.1


