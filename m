Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id CECAD529F0
	for <meta-arago@arago-project.org>;
	Wed, 27 Jun 2018 17:23:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5RHNEQw103534
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 12:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530120194;
	bh=R/kzIh/TWWotTLrbZMeLxRxA0VvWuPM4JhC5pTkqRJI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=grltGQNOKf6eVeHT8sHAVGGCjcTQkcKsND6hMUFdU7MAp2oEqel+sJUueim8PZJQl
	BHIsdMyNVf5jNSThrf9XUDbLFs+asqE+XdbLSDp/cP2KsqlaPkhI13hardc7axKJSl
	DelUk6BOowtKJqlnGT4tzKYmV3N7yL6g0Ej0up7w=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RHNEsF026634
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 12:23:14 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 27 Jun 2018 12:23:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 27 Jun 2018 12:23:14 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RHNDF8012629;
	Wed, 27 Jun 2018 12:23:14 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jun 2018 13:11:52 -0400
Message-ID: <1530119512-30012-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530119512-30012-1-git-send-email-j-stiffler@ti.com>
References: <1530119512-30012-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 3/3] tisdk-image: enhance cleanup of image
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
X-List-Received-Date: Wed, 27 Jun 2018 17:23:22 -0000
Content-Type: text/plain

* The upstream image class is creating many more directories and file
  by default in an image.
* As this SDK image is not a filesystem, we do not need these
  defaults.
* Clean up these directories and files using a customizable list.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 39e6461..4ae3a80 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -859,12 +859,23 @@ tisdk_image_build () {
     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
 }
 
+TISDK_IMAGE_CLEANUP_DIRS ?= "var etc lib boot dev home media mnt proc run sbin sys tmp usr"
+TISDK_IMAGE_CLEANUP_FILES ?= "bin/bash bin/bash.bash bin/sh"
+
 tisdk_image_cleanup () {
+    # Some extra files are now pulled in by the general image class, so remove
+    # them.
+    for file in ${TISDK_IMAGE_CLEANUP_FILES}
+    do
+        [ ! -f ${IMAGE_ROOTFS}/$file ] || rm -f ${IMAGE_ROOTFS}/$file
+    done
+
     # Move the var/etc directories which contains the opkg data used for the
     # manifest (and maybe one day for online updates) to a hidden directory.
-    mv ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/.var
-    mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
-    mv ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/.lib
+    for dir in ${TISDK_IMAGE_CLEANUP_DIRS}
+    do
+        [ ! -d ${IMAGE_ROOTFS}/$dir ] || mv ${IMAGE_ROOTFS}/$dir ${IMAGE_ROOTFS}/.$dir
+    done
 }
 
 license_create_manifest() {
-- 
2.7.4


