Return-Path: <hzhang@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B9B8E52ABC
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 19:27:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJRkWp004628
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:27:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJRk4f014075
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:27:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:27:45 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4GJRj9m024017;	Fri, 16 May 2014 14:27:45 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WlNnF-0006Vy-Jj; Fri, 16 May 2014
	15:27:45 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 May 2014 15:27:44 -0400
Message-ID: <1400268464-25012-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 2/3] keystone: ti-sdk image: add k2l-evm core ti-sdk image
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
X-List-Received-Date: Fri, 16 May 2014 19:27:46 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 4f775b4..9bbeaf1 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -28,6 +28,7 @@ TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 
 # Some devices do not support display and use a server image instead
 TARGET_IMAGES_k2hk-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
+TARGET_IMAGES_k2l-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 
-- 
1.7.9.5


