Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id D1DE2529E0
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 17:33:32 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI0099Z0RO6PV0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 08 Apr 2015 12:33:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=OqT4EJ7o c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8 a=lRxpQPx1AAAA:8	a=GiYyvGnSGGSvNIL3xwcA:9
	a=m2m2x1Mms-QA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A5450200DD;	Wed,
	8 Apr 2015 13:33:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 08 Apr 2015 13:33:24 -0400
Message-id: <1428514404-5400-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] matrix: depend on ca-certificates-native for gitorious/http access
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
X-List-Received-Date: Wed, 08 Apr 2015 17:33:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Can be removed, once repos are moved out from gitorious.org

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 +++-
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 23cb5f7..0d2d8c2 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -3,10 +3,12 @@ LICENSE = "CC-BY-SA-3.0"
 LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
+DEPENDS += "ca-certificates-native"
+
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=http;branch=${BRANCH}"
 SRCREV = "200426006a3ae68bde9d7eb6a864da51fe07298c"
 BRANCH = "master"
-INC_PR = "r30"
+INC_PR = "r31"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 162340e..1110900 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r25"
+DEPENDS += "ca-certificates-native"
+
+PR = "r26"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
-- 
2.2.0


