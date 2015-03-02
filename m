Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4B3B552A62
	for <meta-arago@arago-project.org>;
	Mon,  2 Mar 2015 15:46:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t22FkAHu003524
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2015 09:46:10 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t22Fk9lP025357
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2015 09:46:09 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Mar 2015 09:46:09 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t22Fk9pX027836;	Mon, 2 Mar 2015 09:46:09 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YSSXo-0000Bg-Rg;
	Mon, 02 Mar 2015 10:46:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Mar 2015 10:46:06 -0500
Message-ID: <1425311167-690-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] packagegroup-arago-tisdk-connectivity-sdk-host: Add ti-compat-wireless-wl18xx-src.
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
X-List-Received-Date: Mon, 02 Mar 2015 15:46:11 -0000
Content-Type: text/plain

From: Jake Stiffler <j-stiffler@ti.com>

* Add out of tree wl18xx driver sources to the SDK.

Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
---
 ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
index e367c28..3862816 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -8,6 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FIRMWARE_AND_DRIVERS_SRC = "\
     wl18xx-firmware-src \
+    ti-compat-wireless-wl18xx-src \
 "
 
 CONNECTIVITY_RDEPENDS = ""
-- 
1.7.9.5


