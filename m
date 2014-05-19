Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D34EA529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKlvp028498
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKlbj017372
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:46 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8C7001355;	Mon, 19 May 2014 14:20:45 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:20:00 -0500
Message-ID: <1400527207-17021-13-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 12/19] kmscube: Add kmscube demo application
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
X-List-Received-Date: Mon, 19 May 2014 19:20:48 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Migrated from meta-arago-glsdk and preserved authorship for
  Mrinmayee
* Modified for upstream:
    * Add a DESCRIPTION
    * Remove unneeded FILESEXTRAPATHS variable

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
new file mode 100644
index 0000000..9f55d4e
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Demo application to showcase 3D graphics on SGX using kms and gbm"
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8f3969dd53b6bf158"
+
+DEPENDS = "libdrm libgbm-glsdk omap5-sgx-ddk-um-linux"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+inherit autotools pkgconfig
+
+PR = "r2"
+SRCREV = "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
+
+SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+INSANE_SKIP_kmscube += "dev-deps"
-- 
1.7.9.5


