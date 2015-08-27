Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9930A529F8
	for <meta-arago@arago-project.org>;
	Thu, 27 Aug 2015 08:47:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7R8lHBu002735
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 03:47:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7R8lH7V027472
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 03:47:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 27 Aug 2015 03:47:17 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7R8lGXR027209;
	Thu, 27 Aug 2015 03:47:17 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Aug 2015 14:17:14 +0530
Message-ID: <1440665234-1913-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [daisy, master] omapdrmtest: Update SRCREV with bug fixes
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
X-List-Received-Date: Thu, 27 Aug 2015 08:47:18 -0000
Content-Type: text/plain

The following issues will be resolved with this update:
 * viddec3test: move a global variable to demux structure
 * vpe: Correct the colorspace field
 * display-kmscube: fix race condition for buffer to face mapping
 * vpe: Pass correct colorspace to s_fmt ioctl

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 5ed1783..5d17409 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm omap5-sgx-ddk-um-linux wayland"
 
 inherit autotools pkgconfig
 
-PR = "r7"
-SRCREV = "a2f483ef833ce7a6f3e0b975d9e49267960b288e"
+PR = "r9"
+SRCREV = "152713c45d7972ed08f506255c43ce7ff634a9f5"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git"
 
-- 
1.7.9.5


