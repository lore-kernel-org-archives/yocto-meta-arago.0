Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1609852972
	for <meta-arago@arago-project.org>;
	Wed,  1 Oct 2014 09:05:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s91958R6019808
	for <meta-arago@arago-project.org>; Wed, 1 Oct 2014 04:05:08 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s919581i023627
	for <meta-arago@arago-project.org>; Wed, 1 Oct 2014 04:05:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 1 Oct 2014 04:05:07 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s919566j029448;	Wed, 1 Oct 2014 04:05:07 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Oct 2014 14:31:45 +0530
Message-ID: <1412154105-13382-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [master][PATCH v2] example-applications: Adding repository of GLSDK example applications
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
X-List-Received-Date: Wed, 01 Oct 2014 09:05:09 -0000
Content-Type: text/plain

This repository contains the following tests
 * drm-tests
 * gst-test-player used for trickplay
 * messageq based application for profiling IPC performance
 * thermal tests
 * vpe related test cases

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../glsdk-example-apps/glsdk-example-apps.bb       |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
new file mode 100644
index 0000000..c7470bf
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -0,0 +1,15 @@
+SUMMARY = "GLSDK example applications"
+HOMEPAGE = "http://git.ti.com/glsdk"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
+
+DEPENDS = "gstreamer libdrm ti-ipc"
+
+COMPATIBLE_MACHINE = "dra7xx-evm"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
+SRCREV = "a21dd98d5686a6c4563f89966cb459158085dd1b"
+
+PR = "r0"
-- 
1.7.9.5


