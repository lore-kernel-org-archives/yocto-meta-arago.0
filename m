Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7FF8B52004
	for <meta-arago@arago-project.org>;
	Wed,  2 Mar 2016 04:25:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u224PpLo019041;
	Tue, 1 Mar 2016 22:25:51 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u224PpuV013081;
	Tue, 1 Mar 2016 22:25:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Mar 2016 22:25:50 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u224Pl8G021571;	Tue, 1 Mar 2016 22:25:48 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Mar 2016 23:25:42 -0500
Message-ID: <1456892743-7229-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Ross Burton <ross.burton@intel.com>
Subject: [PATCH 1/2] doxygen: add API documentation generation tool
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
X-List-Received-Date: Wed, 02 Mar 2016 04:26:01 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

Based on doxygen-native by Zongchun Yu <Zongchun.Yu@freescale.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Bringing this from
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/patch/?id=eae880e4aa5426d73f8695a3748db5a55915909c
and the folder moved to meta-arago-extras
---
---
 .../recipes-devtools/doxygen/doxygen_1.8.6.bb      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.6.bb

diff --git a/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.6.bb b/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.6.bb
new file mode 100644
index 0000000..bef665e
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.6.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Utilities for generating documentation from source code"
+HOMEPAGE = "http://www.doxygen.org/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b380c86cea229fa42b9e543fc491f5eb"
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "http://ftp.stack.nl/pub/users/dimitri/${BP}.src.tar.gz"
+SRC_URI[md5sum] = "9385dc52f0627875f8fa758e754ec674"
+SRC_URI[sha256sum] = "6a718625f0c0c1eb3dee78ec1f83409b49e790f4c6c47fd44cd51cb92695535f"
+
+EXTRA_OECONF = "--prefix ${prefix}"
+
+do_configure () {
+	./configure ${EXTRA_OECONF}
+
+	# TODO on rebuilds will repeatedly append.  Change logic to include a
+	# separate file and overwrite that file?
+        echo "TMAKE_CC=${CC}" >> tmake/lib/linux-g++/tmake.conf
+        echo "TMAKE_CXX=${CXX}" >> tmake/lib/linux-g++/tmake.conf
+        echo "TMAKE_CFLAGS=${CFLAGS}" >> tmake/lib/linux-g++/tmake.conf
+        echo "TMAKE_CXXFLAGS=${CXXFLAGS}" >> tmake/lib/linux-g++/tmake.conf
+        echo "TMAKE_LINK=${CXX}" >> tmake/lib/linux-g++/tmake.conf
+        echo "TMAKE_LFLAGS=${LDFLAGS}" >> tmake/lib/linux-g++/tmake.conf
+}
+
+do_install() {
+	oe_runmake install DESTDIR=${D} MAN1DIR=share/man/man1
+}
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


