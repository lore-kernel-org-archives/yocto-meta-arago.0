Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4E74552A27
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 20:00:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4K0KvL003635
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:20 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K0J79018055
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:20 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 14:00:20 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA4K0JUq001906;	Wed, 4 Nov 2015 14:00:19 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Nov 2015 15:00:11 -0500
Message-ID: <1446667217-21466-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446667217-21466-1-git-send-email-h-gou@ti.com>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] branding-processor-sdk: add back wayland DISTRO_FEATURES for ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 20:00:21 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 31507dc..0c5e41c 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -1,8 +1,7 @@
 ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
 
-# Remove wayland from ti33x and ti43x DISTRO_FEATURES.
+# Remove wayland from ti33x DISTRO_FEATURES.
 DISTRO_FEATURES_remove_ti33x = "wayland"
-DISTRO_FEATURES_remove_ti43x = "wayland"
 
 # Set CMEM reserved memory region
 CMEM_BASE_omap-a15 ?= "a0000000"
-- 
1.9.1


