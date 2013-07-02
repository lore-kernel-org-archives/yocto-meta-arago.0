Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 81B8A5298D
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 17:01:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62H169E016818
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:01:06 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62H16WU024331
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:01:06 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Jul 2013 12:01:06 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r62H0ooF021236;
	Tue, 2 Jul 2013 12:01:05 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jul 2013 12:15:54 -0500
Message-ID: <1372785354-1920-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372785354-1920-1-git-send-email-fcooper@ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 6/6] packagegroup-arago-tisdk-addons: Only include parted utility for omap-a15
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
X-List-Received-Date: Tue, 02 Jul 2013 17:01:07 -0000
Content-Type: text/plain

* As of right now only omap-a15 can utilize a tool like parted.
* Only pull in parted for omap-a15.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 9efcb73..4537de1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -16,7 +16,6 @@ UTILS = " \
     arm-benchmarks \
     dropbear \
     openssh-sftp-server \
-    parted \
 "
 
 # Add PRU examples for am180x-evm devices
@@ -24,6 +23,7 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
 
 UTILS_append_omap3 = " canutils"
 UTILS_append_ti33x = " canutils"
+UTILS_append_omap-a15 = "parted"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
-- 
1.7.0.4


