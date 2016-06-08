Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id EE5F6529DB
	for <meta-arago@arago-project.org>;
	Wed,  8 Jun 2016 17:34:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u58HXoSj010585
	for <meta-arago@arago-project.org>; Wed, 8 Jun 2016 12:33:50 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u58HY4HI028808
	for <meta-arago@arago-project.org>; Wed, 8 Jun 2016 12:34:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Jun 2016 12:34:03 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u58HY0PC008007;	Wed, 8 Jun 2016 12:34:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Jun 2016 13:33:23 -0400
Message-ID: <1465407203-15939-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] tisdk-rootfs-image: add opencl-extra packagegroup
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
X-List-Received-Date: Wed, 08 Jun 2016 17:34:05 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 98988b2..8747e52 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -8,6 +8,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-qte \
     packagegroup-arago-tisdk-addons \
     ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
-- 
2.7.4


