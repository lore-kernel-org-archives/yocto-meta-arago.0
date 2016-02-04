Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5CC1952A08
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 14:04:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u14E4V9O022810
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 08:04:31 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14E4VjX012596
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 08:04:31 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Feb 2016 08:04:32 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14E4VJK029603;
	Thu, 4 Feb 2016 08:04:31 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aRKWN-0000lM-4h; Thu, 04 Feb 2016 09:04:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Feb 2016 09:04:27 -0500
Message-ID: <1454594668-2894-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454594668-2894-1-git-send-email-j-stiffler@ti.com>
References: <1454594668-2894-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] packagegroup-arago-tisdk-addons: Add ti-ipc-rtos-fw
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
X-List-Received-Date: Thu, 04 Feb 2016 14:04:32 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f4bc863..13ec23e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r37"
+PR = "r38"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -47,6 +47,7 @@ UTILS_append_omap-a15 = " mmc-utils \
                           stream-openmp \
                           pru-icss \
                           strongswan \
+                          ti-ipc-rtos-fw \
 "
 
 # Add PRU examples for am180x-evm devices
@@ -62,6 +63,10 @@ UTILS_append_dra7xx = " canutils \
                         opencl-examples-dev \
 "
 
+UTILS_append_keystone = " \
+    ti-ipc-rtos-fw \
+"
+
 UTILS_append_k2hk-evm = " \
     opencl-staticdev \
     opencl-examples-dev \
-- 
1.9.1


