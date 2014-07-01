Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9B59B52A78
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 15:26:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61FQ9XC010896
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 10:26:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61FQ90q025720
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 10:26:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 10:26:09 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s61FQ1Ru006118;	Tue, 1 Jul 2014 10:26:08 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Jul 2014 10:25:58 -0500
Message-ID: <1404228360-7510-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404228360-7510-1-git-send-email-Chase.Maupin@ti.com>
References: <1404228360-7510-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] packagegroup-arago-test: make omapdrmtest depend on mmip
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
X-List-Received-Date: Tue, 01 Jul 2014 15:26:10 -0000
Content-Type: text/plain

* The omapdrmtest package has dependencies on libdce which are
  only valid when the MACHINE_FEATURES include mmip.  So don't
  include this when that feature doesn't exist.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 54d44e1..429858b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -33,7 +33,7 @@ ARAGO_TI_TEST = "\
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
     ipc-test-fw \
-    omapdrmtest \
+    ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
     bvtest \
     "
 
-- 
1.7.9.5


