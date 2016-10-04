Return-Path: <poojaprajod@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 49FD15298D
	for <meta-arago@arago-project.org>;
	Tue,  4 Oct 2016 11:52:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u94BqGrw009214
	for <meta-arago@arago-project.org>; Tue, 4 Oct 2016 06:52:16 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u94BqFep001489
	for <meta-arago@arago-project.org>; Tue, 4 Oct 2016 06:52:15 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 4 Oct 2016 06:52:14 -0500
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u94BqDRe018979;	Tue, 4 Oct 2016 06:52:14 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Oct 2016 17:22:11 +0530
Message-ID: <1475581931-5441-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [V2] gst-plugins-ti: SRCREV updates for ducati and vpe plugins
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
X-List-Received-Date: Tue, 04 Oct 2016 11:52:16 -0000
Content-Type: text/plain

Update gst-ducati SRCREV to pick:
gstducati: Fix memleak due to unreffed codec-data

Update gst-vpe SRCREV to pick:
gstvpe: Use SEQ_TB for de-interlacing

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
index c43d272..a8b7c19 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.11"
-SRCREV = "f1d4d67fa7a76f97a49114b1543ee72ecb0192f0"
+PR = "${INC_PR}.12"
+SRCREV = "a8de8d940393131c81aba3ec32e37bf92b72282d"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
            file://ti-video.conf \
-- 
1.9.1


