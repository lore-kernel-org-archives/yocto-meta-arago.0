Return-Path: <hzhang@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 70A7D52ABC
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 19:27:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJRo4e004696
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:27:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJRoZs014102
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:27:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:27:50 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4GJRo23027405;	Fri, 16 May 2014 14:27:50 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WlNnK-0006Wa-81; Fri, 16 May 2014
	15:27:50 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 May 2014 15:27:49 -0400
Message-ID: <1400268469-25050-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 3/3] keystone: ti-sdk: add k2e-evm core ti-sdk image
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
X-List-Received-Date: Fri, 16 May 2014 19:27:51 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

---
 .../recipes-core/images/arago-core-tisdk-image.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 9bbeaf1..dc8a1e5 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -29,6 +29,7 @@ TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 # Some devices do not support display and use a server image instead
 TARGET_IMAGES_k2hk-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
 TARGET_IMAGES_k2l-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
+TARGET_IMAGES_k2e-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 
-- 
1.7.9.5


