Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CFDC752A6B
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKist012708
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKi7L020825
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:43 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8C6001355;	Mon, 19 May 2014 14:20:42 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:59 -0500
Message-ID: <1400527207-17021-12-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 11/19] libgbm: Add TI specific version of libgbm
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
X-List-Received-Date: Mon, 19 May 2014 19:20:45 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* This was migrated from meta-ti-glsdk to meta-arago because it
  is not a BSP component.  Preserved authorship for Mrinmayee
* Changes made for upstreaming:
    * Removed un-needed .inc file since there is only one version
    * Renamed to just libgbm instead of libgbm-glsdk which also
      means that the PROVIDES line could be removed.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-graphics/gbm/libgbm_9.0.0.bb           |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb

diff --git a/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb b/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb
new file mode 100644
index 0000000..8b20dbb
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Userspace interface for the kernel GBM services."
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
+DEPENDS = "libdrm"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+inherit autotools pkgconfig
+
+SRCREV = "cb86a2f2cecd41023bf1bf12fbcf11be11220f31"
+
+SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git"
+
+S = "${WORKDIR}/git"
-- 
1.7.9.5


