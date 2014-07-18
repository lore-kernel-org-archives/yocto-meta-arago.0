Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 834B752AC2
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 18:52:39 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X002YT8F4KY00@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 13:52:28 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F04CA259B3; Fri,
	18 Jul 2014 14:52:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 14:51:56 -0400
Message-id: <1405709522-404-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709522-404-1-git-send-email-denis@denix.org>
References: <1405709522-404-1-git-send-email-denis@denix.org>
Subject: [PATCH 05/11] HACK: packagegroup-*-connectivity: disable wpa-gui for not supporting Qt5
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
X-List-Received-Date: Fri, 18 Jul 2014 18:52:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 7b3480c..53eaf4b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r24"
+PR = "r25"
 
 inherit packagegroup
 
@@ -34,9 +34,10 @@ FIRMWARE_AND_DRIVERS = "\
 "
 
 DEMO_APPS = "\
-    wpa-gui-e \
 "
 
+#    wpa-gui-e
+
 BLUETOOTH_STACK = "\
     bluez4 \
     bluez4-agent \
-- 
2.0.0


