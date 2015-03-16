Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id A3C1952099
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2015 22:52:37 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLB008XIU79CV70@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Mar 2015 17:52:22 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=A7bb5BSD c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=INyPL6CyDtHnmBO7HQoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 748D820299;	Mon,
	16 Mar 2015 18:52:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Mar 2015 18:52:02 -0400
Message-id: <1426546322-25230-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1426546322-25230-1-git-send-email-denis@denix.org>
References: <1426546322-25230-1-git-send-email-denis@denix.org>
Subject: [PATCH 7/7][RFC] packagegroup-*-tisdk-addons: enable compiler and build essentials on omap-a15
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
X-List-Received-Date: Mon, 16 Mar 2015 22:52:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8d12018..be38378 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r22"
+PR = "r23"
 
 inherit packagegroup
 
@@ -43,6 +43,8 @@ UTILS_append_ti33x = " switch-config"
 UTILS_append_ti43x = " switch-config libdrm-omap"
 UTILS_append_omap-a15 = " switch-config libdrm-omap stream-openmp"
 
+UTILS_append_omap-a15 = " packagegroup-core-buildessential"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
-- 
2.2.0


