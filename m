Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 46E0A52A32
	for <meta-arago@arago-project.org>;
	Thu, 30 Oct 2014 13:24:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9UDOrC4027152
	for <meta-arago@arago-project.org>; Thu, 30 Oct 2014 08:24:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9UDOrnQ008463
	for <meta-arago@arago-project.org>; Thu, 30 Oct 2014 08:24:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 30 Oct 2014 08:24:53 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9UDOqKs014211;
	Thu, 30 Oct 2014 08:24:53 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Xjpie-00017y-Pa;
	Thu, 30 Oct 2014 09:24:52 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Oct 2014 09:24:50 -0400
Message-ID: <1414675490-4304-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-tisdk-multimedia: Correct 'MACHINE_FEATURE' typo.
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
X-List-Received-Date: Thu, 30 Oct 2014 13:24:54 -0000
Content-Type: text/plain

* Replaced "MACHINE_FEATURE" with "MACHINE_FEATURES".

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia.bb         |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 7016ec0..3cd6293 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -39,15 +39,15 @@ MULTIMEDIA_append_am3517-evm = " \
 
 ACCEL_FW = ""
 ACCEL_FW_append_am57xx-evm = " \
-    ${@base_contains('MACHINE_FEATURE', 'mmip', 'ipumm-fw', '', d)} \
+    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
     "
 
 ACCEL_FW_append_omap5-evm = " \
-    ${@base_contains('MACHINE_FEATURE', 'mmip', 'ipumm-fw', '', d)} \
+    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
     "
 
 ACCEL_FW_append_dra7xx-evm = " \
-    ${@base_contains('MACHINE_FEATURE', 'mmip', 'ipumm-fw', '', d)} \
+    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
     dspdce-fw \
     vis \
     "
-- 
1.7.9.5


