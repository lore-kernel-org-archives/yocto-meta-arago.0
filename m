Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 635A252980
	for <meta-arago@arago-project.org>;
	Wed, 15 Feb 2017 23:33:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1FNXYUM005395
	for <meta-arago@arago-project.org>; Wed, 15 Feb 2017 17:33:34 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FNXYxP031018
	for <meta-arago@arago-project.org>; Wed, 15 Feb 2017 17:33:34 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 17:33:33 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v1FNXXl4012074;	Wed, 15 Feb 2017 17:33:33 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Feb 2017 18:33:27 -0500
Message-ID: <1487201607-9571-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1487027238-101793-1-git-send-email-denys@ti.com>
References: <1487027238-101793-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 1/5] packagegroup-arago-test: cpuburn-neon only works on ARMv7, mark accordingly
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
X-List-Received-Date: Wed, 15 Feb 2017 23:33:35 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
Rebased

 .../packagegroups/packagegroup-arago-test.bb       |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 49697a6..d98dcde 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r45"
+PR = "r46"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -25,7 +25,6 @@ ARAGO_TEST = "\
     v4l-utils \
     smcroute \
     rwmem \
-    cpuburn-neon \
     pulseaudio-misc \
     kselftests \
     cpuset \
@@ -34,7 +33,15 @@ ARAGO_TEST = "\
     pcitest \
     "
 
-ARAGO_TI_TEST = "\
+ARAGO_TEST_append_armv7a = " \
+    cpuburn-neon \
+"
+
+ARAGO_TEST_append_armv7ve = " \
+    cpuburn-neon \
+"
+
+ARAGO_TI_TEST = " \
     ltp-ddt \
     input-utils \
     cpuloadgen \
-- 
1.7.9.5


