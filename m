Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 554B7529A2
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2019 00:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 73F4E40BC6;
	Thu,  1 Aug 2019 00:53:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TM78BuAuDv2P; Thu,  1 Aug 2019 00:53:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5A40540BAE;
	Thu,  1 Aug 2019 00:53:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 44ADB170EC2;
	Wed, 31 Jul 2019 20:53:11 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 31 Jul 2019 20:53:09 -0400
Message-Id: <1564620790-9157-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] recipes: tisdk-image.bbclass -> tisdk-bundle.bbclass, arago-core-tisdk-image -> arago-core-tisdk-bundle
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Aug 2019 00:54:08 -0000

Since tisdk-image.bbclass and the corresponding arago-core-tisdk-image.bb
recipe produce a tarball with different artifacts, which is not a rootfs
image, avoid any possible confusion and rename it to use "bundle" moniker,
instead of a regular "image" one.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/{tisdk-image.bbclass => tisdk-bundle.bbclass} | 0
 meta-arago-distro/conf/distro/include/branding-bleeding.inc             | 2 +-
 .../images/{arago-core-tisdk-image.bb => arago-core-tisdk-bundle.bb}    | 2 +-
 .../images/{arago-core-tisdk-image.inc => arago-core-tisdk-bundle.inc}  | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-distro/classes/{tisdk-image.bbclass => tisdk-bundle.bbclass} (100%)
 rename meta-arago-distro/recipes-core/images/{arago-core-tisdk-image.bb => arago-core-tisdk-bundle.bb} (92%)
 rename meta-arago-distro/recipes-core/images/{arago-core-tisdk-image.inc => arago-core-tisdk-bundle.inc} (99%)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
similarity index 100%
rename from meta-arago-distro/classes/tisdk-image.bbclass
rename to meta-arago-distro/classes/tisdk-bundle.bbclass
diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 91177f1..bb6944c 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -15,4 +15,4 @@ SRCREV_pn-optee-test = "${AUTOREV}"
 SRCREV_pn-arm-trusted-firmware = "${AUTOREV}"
 
 # Build and assemble TI-SDK, but don't package it
-IMAGE_FSTYPES_pn-arago-core-tisdk-image = ""
+IMAGE_FSTYPES_pn-arago-core-tisdk-bundle = ""
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb
similarity index 92%
rename from meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
rename to meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb
index 263c265..8b8740b 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb
@@ -1,4 +1,4 @@
-require arago-core-tisdk-image.inc
+require arago-core-tisdk-bundle.inc
 
 DEPLOY_SPL_NAME_omapl138 = ""
 DEPLOY_SPL_NAME_k2hk = ""
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
similarity index 99%
rename from meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
rename to meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
index bff7a55..7740467 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 IMAGE_FSTYPES = "tar.xz"
 IMAGE_NAME_SUFFIX = ""
 
-inherit tisdk-image
+inherit tisdk-bundle
 
 COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap-a15|keystone|k3"
 
-- 
2.7.4


