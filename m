Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 53F3D52A36
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 13:04:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06D4oWH011166
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 07:04:50 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06D4opk018448
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 07:04:50 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 07:04:50 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06D4mka008134;
	Tue, 6 Jan 2015 07:04:49 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Jan 2015 18:34:45 +0530
Message-ID: <1420549486-9379-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [WILINK R8.5 1/2] packagegroup-*-connectivity: Include iptables package
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
X-List-Received-Date: Tue, 06 Jan 2015 13:04:51 -0000
Content-Type: text/plain

This is needed by the wilink test scripts that are included

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index f469fdd..08d2a4a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r30"
+PR = "r31"
 
 inherit packagegroup
 
@@ -25,6 +25,7 @@ WLAN_COMMON = "\
     hostap-daemon-wl18xx \
     ti-wifi-utils-wl18xx \
     wl18xx-target-scripts \
+    iptables \
 "
 
 # netperf has non-standard license, needs verifying
-- 
1.7.9.5


