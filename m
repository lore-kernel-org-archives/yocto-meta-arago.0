Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EA9A3529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKfnj018363
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:41 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKfaX020812
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:41 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:41 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8C5001355;	Mon, 19 May 2014 14:20:39 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:58 -0500
Message-ID: <1400527207-17021-11-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 10/19] omapdrmtest: Test application for OMAP DRM interface
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
X-List-Received-Date: Mon, 19 May 2014 19:20:42 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Migrated from meta-arago-glsdk and preserved authorship for
  Mrinmayee
* Updated for upstream:
    * Added DESCRIPTION value
    * Removed unneeded FILESEXTRAPATHS variable

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
new file mode 100644
index 0000000..d24130f
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Test applications for OMAP DRM interface"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://viddec3test.c;beginline=1;endline=16;md5=c391f44e40a29096285e3121923041df"
+DEPENDS += "libdrm libdce libav"
+
+inherit autotools pkgconfig
+
+PR = "r3"
+SRCREV = "64e4e389dd8be4947c107a057f34556a4280281a"
+
+SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+INSANE_SKIP_omapdrmtest = "dev-deps"
-- 
1.7.9.5


