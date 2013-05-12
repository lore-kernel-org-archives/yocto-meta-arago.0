Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D439752A38
	for <meta-arago@arago-project.org>;
	Sun, 12 May 2013 23:13:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4CNDFgx030005
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:13:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4CNDFYA015859
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:13:15 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 12 May 2013 18:13:14 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4CNDBaf016294;
	Sun, 12 May 2013 18:13:13 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 12 May 2013 18:13:06 -0500
Message-ID: <1368400388-28708-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3 v2] ltp-ddt-legacy-1.0: Add ltp-ddt recipe that supports 3.2 or older kernels
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
X-List-Received-Date: Sun, 12 May 2013 23:13:17 -0000
Content-Type: text/plain

* Ltp-ddt master is now targeting 3.8+ kernels.
* This recipe points to the v3.2 branch meant for legacy kernels.
---
Changes since v2:
Split patch into small patches
Add package to R_* variables
 
.../conf/distro/include/arago-prefs.inc            |    3 +++
 .../recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb |   14 ++++++++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 6f60a5e..611ae6e 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,3 +1,6 @@
+# Use the latest version of ltp-ddt for kernel versions 3.8+
+PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
+
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
 ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
new file mode 100644
index 0000000..af5aa1b
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
@@ -0,0 +1,14 @@
+# The master branch is now 3.2+ kernels.
+# This recipe is meant to use the v3.2 that supports 3.2 and older kernels.
+
+require recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
+
+PROVIDES += "ltp-ddt"
+RPROVIDES_${PN} += "ltp-ddt"
+RREPLACES_${PN} += "ltp-ddt"
+RCONFLICTS_${PN} += "ltp-ddt"
+
+PR := "${PR}.0"
+
+SRCREV = "1973c7e79f2ad1b595d5d1687db828f3f3998387"
+BRANCH = "v3.2"
-- 
1.7.0.4


