Return-Path: <sam.nelson@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id ACC715299C
	for <meta-arago@arago-project.org>;
	Thu, 27 Apr 2017 02:27:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3R2RXOa006202
	for <meta-arago@arago-project.org>; Wed, 26 Apr 2017 21:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493260053;
	bh=WtVw9Iz/mAlYL0MW/p4LZbtpHxFjVXukeTOuRJFF3Gc=;
	h=From:To:CC:Subject:Date;
	b=zIspWtMn00VKfpsuxgGvkzTIVDBZS6jAEXMLneHHRX+j7s/CLzJPsJ4+I6npipfGl
	bsDAK12PHo6LLLWIks3r1LkbxVDQnu53dZZOgVfYc/cEzvo9Pvn3xY1wYn9XHIulfG
	icwW94Cf143gClXLe2vebKAnHnBNSKe7Yd36l4qQ=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3R2RXGJ011304
	for <meta-arago@arago-project.org>; Wed, 26 Apr 2017 21:27:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 26 Apr 2017 21:27:32 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3R2RWge025084;	Wed, 26 Apr 2017 21:27:33 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Apr 2017 22:27:29 -0400
Message-ID: <1493260049-39927-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] arago-tisdk-addons: Add ipc related packages
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
X-List-Received-Date: Thu, 27 Apr 2017 02:27:34 -0000
Content-Type: text/plain

Add ipc packages for omapl138
Add ti-ipc-examples-linux to Keystone and omap-a15

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5ad6655..c8b0f4a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -55,6 +55,11 @@ UTILS_append_omap-a15 = " mmc-utils \
                           ti-ipc-rtos-fw \
                           uio-test-pruss \
                           uio-module-drv-test \
+                          ti-ipc-examples-linux \
+"
+
+UTILS_append_omapl138 = " ti-ipc-rtos-fw \
+                          ti-ipc-examples-linux \
 "
 
 UTILS_append_dra7xx = " canutils \
@@ -66,6 +71,7 @@ UTILS_append_dra7xx = " canutils \
 UTILS_append_keystone = " \
     uio-module-drv-test \
     ti-ipc-rtos-fw \
+    ti-ipc-examples-linux \
 "
 
 UTILS_append_k2hk = " \
-- 
1.9.1


