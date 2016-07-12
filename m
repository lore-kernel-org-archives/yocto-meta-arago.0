Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 2ED14529DB
	for <meta-arago@arago-project.org>;
	Tue, 12 Jul 2016 20:31:32 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA700CP7YBHLN20@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Jul 2016 15:31:04 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=WHPBM2EqFMQH-IDVMdsA:9
Received: by 100.15.86.14 with SMTP id 733cf5af; Tue, 12 Jul 2016 20:31:04 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 818921620A3;	Tue, 12 Jul 2016 16:30:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Jul 2016 16:30:51 -0400
Message-id: <1468355452-18244-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] Revert "gstreamer1.0-plugins-ducati: Upgrade to GST 1.6.3"
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
X-List-Received-Date: Tue, 12 Jul 2016 20:31:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit ba93c0fa7dbe6592821b570b06c54aaaa868a9b5.
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb         | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 7b24eeb..11ec8f9 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,12 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.11"
-SRCREV = "be329c73f19f48faec3d2c323532ba1ec1d22395"
+PR = "${INC_PR}.4"
+SRCREV = "b2afa71ef76518ef8d368c6669c94d823e7972ba"
 
-BRANCH ?= "master"
-
-SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git;branch=${BRANCH} \
-          "
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git"
-- 
2.7.4


