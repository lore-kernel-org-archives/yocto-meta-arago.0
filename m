Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C16EC52093
	for <meta-arago@arago-project.org>;
	Thu, 26 Mar 2015 12:59:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2QCxn4V012852
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 07:59:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QCxm5A012219
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 07:59:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Mar 2015 07:59:48 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QCxljs000624;
	Thu, 26 Mar 2015 07:59:48 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 26 Mar 2015 18:29:45 +0530
Message-ID: <1427374785-18401-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: gstreamer1.0-plugins-bad: Update DEPENDS
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
X-List-Received-Date: Thu, 26 Mar 2015 12:59:51 -0000
Content-Type: text/plain

 * Make the feature additions specific to dra7xx due
   to the dependencies

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index b1cacac..72e67f5 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -2,11 +2,13 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG = "faad wayland"
 
-SRC_URI_append = " \
+DEPENDS_${PN}_append_dra7xx = " libdce libdrm"
+
+SRC_URI_append_dra7xx = " \
         file://0001-Added-GstDRMBufferPool-support.patch \
         file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
         file://0003-Added-KMSsink-support.patch \
         file://0004-waylandsink-Removed-dependency-on-dri2.patch \
         file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
1.7.9.5


