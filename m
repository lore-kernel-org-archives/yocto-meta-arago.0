Return-Path: <a0850405@a0850405-off1>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F2C835298D
	for <meta-arago@arago-project.org>;
	Fri,  5 Jul 2013 16:09:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r65G9jlU007037
	for <meta-arago@arago-project.org>; Fri, 5 Jul 2013 11:09:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r65G9j7V020538
	for <meta-arago@arago-project.org>; Fri, 5 Jul 2013 11:09:45 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 5 Jul 2013 11:09:45 -0500
Received: from a0850405-off1 (a0850405-off1.am.dhcp.ti.com [158.218.103.10])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r65G9j1u001234;
	Fri, 5 Jul 2013 11:09:45 -0500
Received: from a0850405 by a0850405-off1 with local (Exim 4.76)	(envelope-from
	<a0850405@a0850405-off1>)	id 1Uv8Zt-00008M-9N;
	Fri, 05 Jul 2013 12:09:45 -0400
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Jul 2013 12:09:43 -0400
Message-ID: <1373040583-483-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-test: Add memtester
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
X-List-Received-Date: Fri, 05 Jul 2013 16:09:47 -0000
Content-Type: text/plain

memtester is a userspace utility for testing the memory subsystem.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index a52b84a..230b9af 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -15,6 +15,7 @@ ARAGO_TEST = "\
     rt-tests \
     evtest \
     bc \
+    memtester \
     "
 
 ARAGO_TI_TEST = "\
-- 
1.7.9.5


