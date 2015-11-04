Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1275252A27
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 20:00:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4K0LEe017942
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:21 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K0LBr018196
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 14:00:21 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA4K0JUu001906;	Wed, 4 Nov 2015 14:00:21 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Nov 2015 15:00:15 -0500
Message-ID: <1446667217-21466-6-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446667217-21466-1-git-send-email-h-gou@ti.com>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] kmscube: add support on ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 20:00:22 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index f20bd5c..3e088d8 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8
 
 DEPENDS = "libdrm libgbm omap5-sgx-ddk-um-linux"
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "ti43x|omap-a15"
 
 inherit autotools pkgconfig
 
-PR = "r2"
+PR = "r3"
 SRCREV = "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
-- 
1.9.1


