Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C1E1C529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKF74028416
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:15 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKEFd020549
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:14 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8Bu001355;	Mon, 19 May 2014 14:20:12 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:49 -0500
Message-ID: <1400527207-17021-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 01/19] libdce: Add libdce version 2.0 support from glsdk
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
X-List-Received-Date: Mon, 19 May 2014 19:20:16 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Migrated the recipe from meta-ti-glsdk and moved to meta-arago
  since it is not part of a BSP.  Preserved authorship for
  Mrinmayee
* Made the following modifications for upstreaming:
    * Added a DESCRIPTION field
    * Added a PV that matches the version in the git repository
    * Removed FILESEXTRAPATHS_prepend setting since it is not used.
    * Use STAGING_INCDIR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-multimedia/libdce/libdce_git.bb        |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb b/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
new file mode 100644
index 0000000..a127c4e
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Library used for remotely invoking the hw accelerated codec on IVA-HD"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
+
+inherit autotools pkgconfig
+
+PR = "r0+gitr${SRCPV}"
+PV = "2.0"
+
+DEPENDS = "libdrm ti-ipc"
+
+SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
+SRCREV = "0c7eee9ffdd480063a579013161bcf85ada376b1"
+
+S = "${WORKDIR}/git"
+EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
1.7.9.5


