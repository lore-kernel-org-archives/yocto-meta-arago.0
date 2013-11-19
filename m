Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 749DF5299D
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 22:12:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJMCKj1017362
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 16:12:20 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJMCK2w010214
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 16:12:20 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Nov 2013 16:12:19 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJMCGHX003040;
	Tue, 19 Nov 2013 16:12:18 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Nov 2013 17:13:30 -0600
Message-ID: <1384902810-23952-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] linaro-pm-qa-utils: include scripts and cpuidle binaries
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
X-List-Received-Date: Tue, 19 Nov 2013 22:12:22 -0000
Content-Type: text/plain

* Added support to build cpuidle binaries and install all of the
  test scripts along with the binaries so that the scripts can
  be removed from ltp-ddt

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../linaro-pm-qa/linaro-pm-qa-utils_git.bb         |   44 ++++++++++++++++----
 1 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
index 275b6e6..dcf599f 100644
--- a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
+++ b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
@@ -2,31 +2,59 @@ DESCRIPTION = "Utilities from Linaro for testing Power Management"
 HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite/PmQa"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "0.4.4"
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
 SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
 
 SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git/utils"
-
-UTILS = "cpuburn cpucycle heat_cpu nanosleep"
+S = "${WORKDIR}/git"
 
 CFLAGS += "-pthread"
 
 do_compile () {
-    oe_runmake
+    # Find all the .c files in this project and build them.  Save the names
+    # of these files so we know which to install in the installation step.
+    for x in `find . -name "*.c"`
+    do
+        util=`echo ${x} | sed s/.c$//`
+        oe_runmake ${util}
+    done
 }
 
 do_install () {
     install -d ${D}${bindir}
+    install -d ${D}${bindir}/linaro-pm-qa-include
+
+    # Install the compiled binaries
+    for x in `find . -name "*.c"`
+    do
+        util=`echo ${x} | sed s/.c$//`
+        util_basename=`basename ${util}`
+        install -m 0755 ${util} ${D}${bindir}/${util_basename}
+    done
 
-    for util in ${UTILS}
+    # Install the helper scripts in the include directory
+    for script in `find . -name "*.sh" | grep include`
     do
-        install -m 0755 $util ${D}${bindir}/
+        script_basename=`basename ${script}`
+        install -m 0755 $script ${D}${bindir}/linaro-pm-qa-include/${script_basename}
+    done
+
+    # Install the shell scripts NOT in the include directory since those
+    # will be installed elsewhere
+    for script in `find . -name "*.sh" | grep -v include`
+    do
+        # if the script includes any helper scripts from the include
+        # directory then change the include path to the absolute path
+        # and to reflect the install location of the helper scripts.
+        sed -i -e "s#source ../include#source ${bindir}/linaro-pm-qa-include#g" ${script}
+
+        script_basename=`basename ${script}`
+        install -m 0755 $script ${D}${bindir}/${script_basename}
     done
 }
-- 
1.7.0.4


