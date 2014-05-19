Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E3754529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKqob012742
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKqRj017425
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:51 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8C9001355;	Mon, 19 May 2014 14:20:50 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:20:02 -0500
Message-ID: <1400527207-17021-15-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 14/19] packagegroup-arago-gst: Add accelerated MM packages
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
X-List-Received-Date: Mon, 19 May 2014 19:20:53 -0000
Content-Type: text/plain

* Add the gst-plugins-ducati and gst-plugins-vpe packages for
  OMAP5 and DRA7xx.  gsp-plugins-vpe is only used for dra7xx-evm
  machines.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroups/packagegroup-arago-gst.bb        |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 82265a1..9e35f26 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
@@ -14,7 +14,12 @@ GSTREAMER = " \
     gst-plugins-bad-meta \
 "
 
+GSTREAMER_ACCEL_MM = ""
+GSTREAMER_ACCEL_MM_omap-a15 = "gst-plugins-ducati"
+GSTREAMER_ACCEL_MM_append_dra7xx-evm = " gst-plugins-vpe"
+
 RDEPENDS_${PN} = "\
     ${GSTREAMER} \
+    ${GSTREAMER_ACCEL_MM} \
     gst-ffmpeg \
     "
-- 
1.7.9.5


