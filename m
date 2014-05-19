Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 471DF529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKW3V028462
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKWvG020752
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:32 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8C2001355;	Mon, 19 May 2014 14:20:30 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:55 -0500
Message-ID: <1400527207-17021-8-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 07/19] gst-plugins-vpe: Add TI VPE GStreamer plugins
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
X-List-Received-Date: Mon, 19 May 2014 19:20:33 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Added plugins from meta-arago-glsdk that enable the use of
  the VPE module in GStreamer.  Preserved authorship for Mrinmayee
* Modified the following for upstreaming:
    * Moved to gst-plugins-ti so that the gst-plugins-ti.inc file
      could be used.
    * Modified to use gst-plugins-ti.inc
    * Added DESCRIPTION

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../gst-plugins-ti/gst-plugins-vpe_git.bb          |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb
new file mode 100644
index 0000000..cd6f0af
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "GStreamer elements to use the Video Processing Engine (VPE) found on some TI devices"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+require gst-plugins-ti.inc
+
+PR = "${INC_PR}.0"
+SRCREV = "5107007ca1be8ed66f6a9ec3ffbb70ec7eb0b120"
+
+SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git"
-- 
1.7.9.5


