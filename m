Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 131AA52094
	for <meta-arago@arago-project.org>;
	Thu,  3 Sep 2015 17:56:27 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NU400GGE4HBUQE0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 03 Sep 2015 12:56:04 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=ep9c97GEGqMFH5HtDY0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 052BC161BD0;	Thu,
	3 Sep 2015 13:55:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 03 Sep 2015 13:55:58 -0400
Message-id: <1441302958-31169-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH] img-pve-sdk: Makefile doesn't have clean target, suppress
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
X-List-Received-Date: Thu, 03 Sep 2015 17:56:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 8943501..bc4ad9b 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -1,7 +1,9 @@
-DESCRIPTION = "Imagination PowerVR SDK binaries for Jacinto6 SoC"
+DESCRIPTION = "Imagination PowerVR SDK binaries/examples"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8837c339e15fd4a5044a8c"
 
+CLEANBROKEN = "1"
+
 BRANCH_omap-a15 = "master"
 BRANCH_ti33x = "am4/k4.1"
 BRANCH_ti43x = "am4/k4.1"
@@ -11,7 +13,7 @@ SRCREV_omap-a15 = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
 SRCREV_ti33x = "f753b6c00168f9dd534c2b34206845d3cdddabe6"
 SRCREV_ti43x = "f753b6c00168f9dd534c2b34206845d3cdddabe6"
 
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "dra7xx|ti43x|ti33x"
 
-- 
2.2.0


