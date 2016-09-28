Return-Path: <poojaprajod@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DBCE652987
	for <meta-arago@arago-project.org>;
	Wed, 28 Sep 2016 10:55:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8SAtJKR007166
	for <meta-arago@arago-project.org>; Wed, 28 Sep 2016 05:55:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8SAtIYU001434
	for <meta-arago@arago-project.org>; Wed, 28 Sep 2016 05:55:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 05:55:17 -0500
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8SAtGDO000667;	Wed, 28 Sep 2016 05:55:17 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Sep 2016 16:25:13 +0530
Message-ID: <1475060113-11769-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: gst-plugins-ti: SRCREV updates for ducati and vpe plugins
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
X-List-Received-Date: Wed, 28 Sep 2016 10:55:20 -0000
Content-Type: text/plain

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 .../recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index a5d0e80..0f33e7c 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.20"
-SRCREV = "7ce9b730de98ceb9d3b63a5977b2e470fab04efb"
+PR = "${INC_PR}.21"
+SRCREV = "90a8e90f97fff93bd63cd168cfe36a9b69f123d9"
 
 BRANCH ?= "master"
 
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 4e4b82c..bf63153 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.10"
-SRCREV = "f1d4d67fa7a76f97a49114b1543ee72ecb0192f0"
+PR = "${INC_PR}.11"
+SRCREV = "a8de8d940393131c81aba3ec32e37bf92b72282d"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
            file://ti-video.conf \
-- 
1.9.1


