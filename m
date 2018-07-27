Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BAE9A52987
	for <meta-arago@arago-project.org>;
	Fri, 27 Jul 2018 20:15:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6RKFVCq126798
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 15:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532722531;
	bh=OYdSZ9OrMsSYC3eMc/GzObzadS/0SlhtdyNEbQU1R1o=;
	h=From:To:CC:Subject:Date;
	b=LNL4YnFbFT54l8DEBZhhsljXLLxmSM5RC8EG3mz9Vkiefn2ybLzHW/ZNUc8bG3P2a
	o9ICMtR4sCcuZfWsiYCkda9aKXFtnLSE4i3kRDn0dp1xBbdA4hoR38ULw6RKRAGOcD
	kulM4eiaG3HcGARN8+4RpL/mH12JcoAdU5CB8cI4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RKFVcd001032
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 15:15:31 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 27 Jul 2018 15:15:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 27 Jul 2018 15:15:31 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RKFVuK023457;
	Fri, 27 Jul 2018 15:15:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Jul 2018 20:13:36 +0000
Message-ID: <20180727201336.3501-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] arago-core-tisdk-image: switch K3 from server to full rootfs image
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
X-List-Received-Date: Fri, 27 Jul 2018 20:15:40 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc            | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 4ad3ac34..dddec2c2 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -39,7 +39,6 @@ TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
 # Some devices do not support display and use a server image instead
 TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
 TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
-TARGET_IMAGES_k3 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
@@ -48,8 +47,6 @@ TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago-tisdk-server"
 TOOLCHAIN_SUFFIX_keystone = "-tisdk-server"
 TISDK_TOOLCHAIN_omapl138 = "meta-toolchain-arago-tisdk-server"
 TOOLCHAIN_SUFFIX_omapl138 = "-tisdk-server"
-TISDK_TOOLCHAIN_k3 = "meta-toolchain-arago-tisdk-server"
-TOOLCHAIN_SUFFIX_k3 = "-tisdk-server"
 
 IMAGE_INSTALL_QT = "\
     packagegroup-arago-tisdk-qte-sdk-host \
@@ -57,7 +54,6 @@ IMAGE_INSTALL_QT = "\
 
 IMAGE_INSTALL_QT_keystone = ""
 IMAGE_INSTALL_QT_omapl138 = ""
-IMAGE_INSTALL_QT_k3 = ""
 
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
-- 
2.17.1


