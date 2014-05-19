Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1177552A8E
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 13:55:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JDtSW9012278
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 08:55:28 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JDtRRt027511
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 08:55:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 08:55:27 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JDtRo7029764;	Mon, 19 May 2014 08:55:27 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WmO2J-0005pe-Cb; Mon, 19 May 2014
	09:55:27 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 09:55:21 -0400
Message-ID: <1400507721-22387-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [Re-submit: v2] keystone: tisdk-image: change machine config from keystone-evm to k2hk-evm
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
X-List-Received-Date: Mon, 19 May 2014 13:55:29 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Keystone II SoC family has multiple devices and EVM's: k2hk, k2l and k2e.
Each EVM should have a machine specific tisdk image, and keystone-evm
machine name should be renamed to k2hk-evm.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index f25db51..1dd9d6d 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -27,7 +27,7 @@ DTB_FILTER_keystone = "k2hk"
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 
 # Some devices do not support display and use a server image instead
-TARGET_IMAGES_keystone-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
+TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 
-- 
1.7.9.5


