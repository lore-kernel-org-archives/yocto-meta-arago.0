Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 72FE352ABC
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 15:26:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61FQEiG031427
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 10:26:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61FQE2B005534
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 10:26:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 10:26:14 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s61FQ1Rw006118;	Tue, 1 Jul 2014 10:26:13 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Jul 2014 10:26:00 -0500
Message-ID: <1404228360-7510-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404228360-7510-1-git-send-email-Chase.Maupin@ti.com>
References: <1404228360-7510-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] packagegroup-arago-tisdk-multimedia: don't inlcude ipumm fw without mmip
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
X-List-Received-Date: Tue, 01 Jul 2014 15:26:15 -0000
Content-Type: text/plain

* Including the ipumm-fw package without mmip accelerators doesn't
  make sense.  So don't package this when MACHINE_FEATURES doesn't
  include mmip.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia.bb         |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index b044f58..417b0a8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -40,15 +40,15 @@ MULTIMEDIA_append_am3517-evm = " \
 
 ACCEL_FW = ""
 ACCEL_FW_append_am57xx-evm = " \
-    ipumm-fw \
+    ${@base_contains('MACHINE_FEATURE', 'mmip', 'ipumm-fw', '', d)} \
     "
 
 ACCEL_FW_append_omap5-evm = " \
-    ipumm-fw \
+    ${@base_contains('MACHINE_FEATURE', 'mmip', 'ipumm-fw', '', d)} \
     "
 
 ACCEL_FW_append_dra7xx-evm = " \
-    ipumm-fw \
+    ${@base_contains('MACHINE_FEATURE', 'mmip', 'ipumm-fw', '', d)} \
     dspdce-fw \
     vis \
     "
-- 
1.7.9.5


