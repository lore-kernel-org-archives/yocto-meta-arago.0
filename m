Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id CE666529EA
	for <meta-arago@arago-project.org>;
	Mon, 21 Mar 2016 17:07:01 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4E003V3FJAX0A0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 21 Mar 2016 12:06:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=s6hyFwtd_71cRIpGMS4A:9
Received: by 100.15.86.14 with SMTP id 126197ac; Mon, 21 Mar 2016 17:06:46 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D5079161F43;	Mon,
	21 Mar 2016 13:06:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 21 Mar 2016 13:06:45 -0400
Message-id: <1458580005-7816-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-arago-test: add ti-ipc-test package
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
X-List-Received-Date: Mon, 21 Mar 2016 17:07:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 2aa3885..2fe32fa 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r40"
+PR = "r41"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -50,12 +50,17 @@ ARAGO_TI_TEST_append_ti43x = " \
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
     ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
+    ti-ipc-test \
     "
 
 ARAGO_TI_TEST_append_dra7xx = " \
     vpe-tests \
     "
 
+ARAGO_TI_TEST_append_keystone = " \
+    ti-ipc-test \
+    "
+
 RDEPENDS_${PN} = "\
     ${ARAGO_TEST} \
     ${ARAGO_TI_TEST} \
-- 
2.2.0


