Return-Path: <aravindbr@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 50252529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 18:14:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15IElp8005641
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:14:47 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IElGm000495
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:14:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 12:14:47 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp33.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s15IEkfe025861;
	Wed, 5 Feb 2014 12:14:47 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Feb 2014 13:14:42 -0500
Message-ID: <1391624082-26580-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH v2] ti-csl: new recipe providing CSL for TI-KeyStone2 devices
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 18:14:48 -0000
Content-Type: text/plain

-This package provides chip support library interface files

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
* grouped SRC_URI and SRCREV together
* Modified do_install to copy the needed files only instead of copy everything
  delete unwanted files.
---
---
 meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
new file mode 100644
index 0000000..37f7937
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "TI CSL"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
+
+COMPATIBLE_MACHINE = "keystone-evm"
+ALLOW_EMPTY_${PN} = "1"
+
+PR = "r0"
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
+SRCREV = "f6f90144c14e1ee783c4b893b52e54830be8166e" 
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    cd ${S}
+    install -d ${D}${includedir}/ti/csl
+    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl 
+    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl/src/ip/serdes_sb/V0
+}
+
-- 
1.7.9.5


