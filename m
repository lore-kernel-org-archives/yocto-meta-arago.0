Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3119752A31
	for <meta-arago@arago-project.org>;
	Mon, 16 Feb 2015 09:32:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1G9WIiU004484
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 03:32:18 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1G9WHtk032306
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 03:32:17 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Feb 2015 03:32:16 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1G9WFcb015843;
	Mon, 16 Feb 2015 03:32:16 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Feb 2015 15:02:14 +0530
Message-ID: <1424079134-2421-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: omapdrmtest: Updated applications for GLSDK 7.00EA
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
X-List-Received-Date: Mon, 16 Feb 2015 09:32:19 -0000
Content-Type: text/plain

 * dmabuftest: Use single planar buffers
 * capturevpedisplay: Request interlaced capture and pass field ids
 * v4l2: Add latency measurement
 * dmabuftest: Return from thread if streamon fails
 * dmabuftest: Remove switch thread logic
 * display-kmscube: Render full video buffer
 * display-kmscube: Render multiple videos on cube faces

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 04fc2e7..1c878c3 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm omap5-sgx-ddk-um-linux"
 
 inherit autotools pkgconfig
 
-PR = "r4"
-SRCREV = "04da689692ec7cd3ef0f315c9c00d9051cefdd10"
+PR = "r5"
+SRCREV = "a2f483ef833ce7a6f3e0b975d9e49267960b288e"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git"
 
-- 
1.7.9.5


