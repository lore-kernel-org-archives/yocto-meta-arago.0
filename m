Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id A97F952A23
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 19:34:14 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X00FOQACMSC00@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 14:33:59 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8EE1520087; Fri,
	18 Jul 2014 15:33:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 15:33:56 -0400
Message-id: <1405712036-14671-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709522-404-5-git-send-email-denis@denix.org>
References: <1405709522-404-5-git-send-email-denis@denix.org>
Subject: [PATCH v2 05/11] packagegroup-*-connectivity: conditionally disable wpa-gui for not supporting Qt5
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
X-List-Received-Date: Fri, 18 Jul 2014 19:34:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - make logic conditional based on Qt version

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 7b3480c..458a2f9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r24"
+PR = "r25"
 
 inherit packagegroup
 
@@ -34,7 +34,7 @@ FIRMWARE_AND_DRIVERS = "\
 "
 
 DEMO_APPS = "\
-    wpa-gui-e \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'wpa-gui-e', d)} \
 "
 
 BLUETOOTH_STACK = "\
-- 
2.0.0


