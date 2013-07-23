Return-Path: <a0850405@a0850405-off1>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id EEA59529B0
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 19:13:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NJDO5P013017
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 14:13:24 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NJDO5f029069
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 14:13:24 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 14:13:24 -0500
Received: from a0850405-off1 (a0850405-off1.am.dhcp.ti.com [158.218.103.10])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NJDO56020027;
	Tue, 23 Jul 2013 14:13:24 -0500
Received: from a0850405 by a0850405-off1 with local (Exim 4.76)	(envelope-from
	<a0850405@a0850405-off1>)	id 1V1i1U-0001P5-D2;
	Tue, 23 Jul 2013 15:13:24 -0400
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Jul 2013 15:13:22 -0400
Message-ID: <1374606802-5364-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] packagegroup-arago-test: Add memtester
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
X-List-Received-Date: Tue, 23 Jul 2013 19:13:27 -0000
Content-Type: text/plain

memtester is a userspace utility for testing the memory subsystem.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index a52b84a..41f6ba9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -15,6 +15,7 @@ ARAGO_TEST = "\
     rt-tests \
     evtest \
     bc \
+    memtester \
     "
 
 ARAGO_TI_TEST = "\
-- 
1.7.9.5


