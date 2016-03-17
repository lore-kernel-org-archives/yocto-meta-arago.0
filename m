Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 266AD529E3
	for <meta-arago@arago-project.org>;
	Thu, 17 Mar 2016 13:20:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2HDKSCf019976
	for <meta-arago@arago-project.org>; Thu, 17 Mar 2016 08:20:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2HDKS3I010694
	for <meta-arago@arago-project.org>; Thu, 17 Mar 2016 08:20:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 17 Mar 2016 08:20:28 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2HDKSNV019164;
	Thu, 17 Mar 2016 08:20:28 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1agXqm-0004ul-3Q; Thu, 17 Mar 2016 09:20:28 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 17 Mar 2016 09:20:24 -0400
Message-ID: <1458220824-18857-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] parse-ip: Fix license checksum
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
X-List-Received-Date: Thu, 17 Mar 2016 13:20:29 -0000
Content-Type: text/plain

* Update the date in the license and adjust the checksum

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb            | 4 ++--
 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init          | 2 +-
 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g-evm/init  | 2 +-
 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
index c83bb19..047e7df 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "Script to parse ip address during boot and make it available to the host system using shared partitions"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://init;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
+LIC_FILES_CHKSUM = "file://init;beginline=3;endline=31;md5=f82ddb19a87f97193d08feacfd0e4903"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "file://init"
 
-PR = "r4"
+PR = "r5"
 
 S = "${WORKDIR}"
 
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
index 4050efb..eb6c758 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
@@ -3,7 +3,7 @@
 # This distribution contains contributions or derivatives under copyright
 # as follows:
 #
-# Copyright (c) 2010, Texas Instruments Incorporated
+# Copyright (c) 2010-2016, Texas Instruments Incorporated
 # All rights reserved.
 #
 # Redistribution and use in source and binary forms, with or without
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g-evm/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g-evm/init
index a2efc71..eaeec15 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g-evm/init
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g-evm/init
@@ -3,7 +3,7 @@
 # This distribution contains contributions or derivatives under copyright
 # as follows:
 #
-# Copyright (c) 2016, Texas Instruments Incorporated
+# Copyright (c) 2010-2016, Texas Instruments Incorporated
 # All rights reserved.
 #
 # Redistribution and use in source and binary forms, with or without
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
index de4ed8e..a693156 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
@@ -3,7 +3,7 @@
 # This distribution contains contributions or derivatives under copyright
 # as follows:
 #
-# Copyright (c) 2010, Texas Instruments Incorporated
+# Copyright (c) 2010-2016, Texas Instruments Incorporated
 # All rights reserved.
 #
 # Redistribution and use in source and binary forms, with or without
-- 
1.9.1


