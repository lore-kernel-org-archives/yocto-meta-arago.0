Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2E03F52A80
	for <meta-arago@arago-project.org>;
	Wed, 18 Nov 2015 19:31:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAIJVmZu012012
	for <meta-arago@arago-project.org>; Wed, 18 Nov 2015 13:31:48 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAIJVmvt020201
	for <meta-arago@arago-project.org>; Wed, 18 Nov 2015 13:31:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Nov 2015 13:31:48 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAIJVlAm025252;
	Wed, 18 Nov 2015 13:31:47 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zz8SJ-0005fV-EU; Wed, 18 Nov 2015 14:31:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Nov 2015 14:31:44 -0500
Message-ID: <1447875105-21755-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] arago-core-tisdk-image: Extend DTB_FILTER for k2e, k2l, and k2g
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
X-List-Received-Date: Wed, 18 Nov 2015 19:31:49 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index aede390..ed61d23 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -22,7 +22,10 @@ DTB_FILTER_omap5-evm = "omap5"
 DTB_FILTER_dra7xx-evm = "dra7"
 DTB_FILTER_am57xx-evm = "am57xx"
 DTB_FILTER_ti43x = "am43"
-DTB_FILTER_keystone = "k2hk"
+DTB_FILTER_k2hk-evm = "k2hk"
+DTB_FILTER_k2l-evm = "k2l"
+DTB_FILTER_k2e-evm = "k2e"
+DTB_FILTER_k2g-evm = "k2g"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
-- 
1.9.1


