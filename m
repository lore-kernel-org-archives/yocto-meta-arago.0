Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 8A3A55299E
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2015 01:43:48 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKR00MZ7OSIWGE0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 05 Mar 2015 19:43:31 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpCc6mbq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=dmon3PNSDLXxq5kzSs8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F133220076;	Thu,
	5 Mar 2015 20:43:29 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 05 Mar 2015 20:43:29 -0500
Message-id: <1425606209-28305-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-core-tisdk-image: unify SDK images by passing specific name via branding
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
X-List-Received-Date: Fri, 06 Mar 2015 01:43:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-amsdk.inc        | 1 +
 meta-arago-distro/recipes-core/images/arago-amsdk-image.bb      | 5 -----
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 3 ++-
 3 files changed, 3 insertions(+), 6 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-amsdk-image.bb

diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
index 08990b8..3f3c5e4 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -1,3 +1,4 @@
+ARAGO_TISDK_IMAGE = "arago-amsdk-image"
 
 QT_PROVIDER := "${@bb.utils.contains('SOC_FAMILY','omap-a15:dra7xx','qt5','qt4e',d)}"
 
diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
deleted file mode 100644
index 5995507..0000000
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require arago-core-tisdk-image.inc
-
-DEPLOY_SPL_NAME_omapl138 = ""
-
-export IMAGE_BASENAME = "arago-amsdk-image"
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index ccddbc1..f313494 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -3,4 +3,5 @@ require arago-core-tisdk-image.inc
 DEPLOY_SPL_NAME_omapl138 = ""
 DEPLOY_SPL_NAME_keystone = ""
 
-export IMAGE_BASENAME = "arago-core-tisdk-image"
+ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
+export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.2.0


