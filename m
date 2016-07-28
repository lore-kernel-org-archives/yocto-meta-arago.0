Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 40E8D52AB9
	for <meta-arago@arago-project.org>;
	Thu, 28 Jul 2016 13:04:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6SD1U8K025910
	for <meta-arago@arago-project.org>; Thu, 28 Jul 2016 08:01:30 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6SD4uuu010693
	for <meta-arago@arago-project.org>; Thu, 28 Jul 2016 08:04:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 28 Jul 2016 08:04:55 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6SD4piM022138;	Thu, 28 Jul 2016 08:04:55 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Jul 2016 18:34:48 +0530
Message-ID: <1469711089-3342-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1469711089-3342-1-git-send-email-a0393906@ti.com>
References: <1469711089-3342-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] gstreamer1.0-plugins-ducati: upgrade to gst 1.6.3
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
X-List-Received-Date: Thu, 28 Jul 2016 13:04:58 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb         | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 11ec8f9..a5d0e80 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,7 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.4"
-SRCREV = "b2afa71ef76518ef8d368c6669c94d823e7972ba"
+PR = "${INC_PR}.20"
+SRCREV = "7ce9b730de98ceb9d3b63a5977b2e470fab04efb"
 
-SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git"
+BRANCH ?= "master"
+
+SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git;branch=${BRANCH} \
+          "
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.9.1


