Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 85C31529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKIub012415
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:18 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKIPd017021
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:17 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8Bv001355;	Mon, 19 May 2014 14:20:15 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:50 -0500
Message-ID: <1400527207-17021-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 02/19] gstreamer: Add append to use TI version
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
X-List-Received-Date: Mon, 19 May 2014 19:20:18 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Add append to use the version of gstreamer provided at
  git.ti.com/glsdk.  This recipe was moved from the
  meta-arago-glsdk layer and authorship was preserved for
  Mrinmayee
* Make machines specific due to changed SRC_URI

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../gstreamer/gstreamer_0.10.36.bbappend           |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
new file mode 100644
index 0000000..3c97b63
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
@@ -0,0 +1,14 @@
+SRC_URI_omap-a15 = "git://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
+SRCREV = "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
+
+# Make MACHINE specific since we pull different sources per MACHINE
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR_append = "-arago1"
+
+S_omap-a15 = "${WORKDIR}/git"
+
+do_configure_prepend_omap-a15() {
+	git submodule init && git submodule update
+	autopoint -f
+}
-- 
1.7.9.5


