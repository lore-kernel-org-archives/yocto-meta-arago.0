Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44054C4167E
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.205.1667598074321536173
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E89A40D8B
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kez-nTWgLElp for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 030C540D86
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9761B163680
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 08/14] meta-arago: Use new J7 SoC names over specific board names
Date: Fri,  4 Nov 2022 21:41:06 +0000
Message-Id: <20221104214112.1221365-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14105

From: Andrew Davis <afd@ti.com>

Now that we have SoC names, we can avoid adding features based on the
board name. We expect folks to create their own boards based on these
SoCs, and so using the TI made EVM board name everywhere adds extra churn
when adding a new board. Plus it is more correct for most of these
features as they depend on the SoC, not on the EVM board.

One other thing we do here is to not use the generic "j7" name,
the current and future J7 devices are far to feature diverse
to group at this level. Grouping like that will lead to the wrong
things getting enabled as new J7 SoCs are added.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb  | 3 +--
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 4 +++-
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb     | 2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend      | 6 +-----
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b=
/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index ec4e0344..b49548a6 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -12,8 +12,7 @@ DEPLOY_SPL_NAME:k3 =3D "tispl.bin tiboot3.bin"
=20
 DEPLOY_IMAGES_NAME:k3 =3D "bl31.bin bl32.bin"
 DEPLOY_IMAGES_NAME:append:am65xx =3D " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:j721e-evm =3D " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:j721e-hs-evm =3D " sysfw.itb"
+DEPLOY_IMAGES_NAME:append:j721e =3D " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-evm =3D " sysfw-am65x-evm.itb sysfw-am6=
5x_sr2-evm.itb"
=20
 ARAGO_TISDK_IMAGE ?=3D "tisdk-core-bundle"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc =
b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 90b5ccef..9da4b0d0 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -24,7 +24,9 @@ DTB_FILTER:am57xx-hs-evm =3D "${DTB_FILTER:am57xx-evm}"
 DTB_FILTER:ti43x =3D "am43"
 DTB_FILTER:omapl138 =3D "da850"
 DTB_FILTER:am65xx =3D "am65"
-DTB_FILTER:j7 =3D "j721e"
+DTB_FILTER:j721e =3D "j721e"
+DTB_FILTER:j7200 =3D "j7200"
+DTB_FILTER:j721s2 =3D "j721s2"
=20
 # List of target side images to build for the SDK
 TARGET_IMAGES =3D "tisdk-base-image tisdk-default-image tisdk-thinlinux-=
image tisdk-bootstrap-image"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 99a6cc82..ca4e254e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -78,7 +78,7 @@ ARAGO_TI_TEST:append:k3 =3D " \
     k3conf \
 "
=20
-ARAGO_TI_TEST:append:j7 =3D " \
+ARAGO_TI_TEST:append:j721e =3D " \
     ufs-utils \
 "
=20
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstrea=
mer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index de9f1c7d..5cc57460 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad_1.16.%.bbappend
@@ -28,11 +28,7 @@ SRC_URI:append:am65xx =3D " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
=20
-SRC_URI:append:j721e-evm =3D " \
-    ${GSTDRM_WAYLANDSINK_PATCHES} \
-"
-
-SRC_URI:append:j721e-hs-evm =3D " \
+SRC_URI:append:j721e =3D " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
=20
--=20
2.25.1


