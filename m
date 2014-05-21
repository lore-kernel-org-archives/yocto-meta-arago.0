Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2EB9C52A6D
	for <meta-arago@arago-project.org>;
	Wed, 21 May 2014 14:06:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4LE6uQC014298
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 09:06:56 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LE6ufV015666
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 09:06:56 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 May 2014 09:06:56 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4LE6ugv016759;	Wed, 21 May 2014 09:06:56 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1Wn7AV-0002O1-Sl; Wed, 21 May 2014
	10:06:55 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 May 2014 10:06:54 -0400
Message-ID: <1400681214-9143-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [Re-submit: v3] keystone: tisdk-image: change TARGET_IMAGES from keystone-evm to k2hk-evm
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
X-List-Received-Date: Wed, 21 May 2014 14:06:57 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Keystone II SoC family has multiple devices and EVM's: k2hk, k2l and k2e.
All the EVM's share the same core tisdk image. The TARGET_IMAGES should
be set to keystone SoC family rather than a keystone EVM machine config.

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


