Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 9718F529F8
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 17:42:34 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NL200I6Y6IN1440@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Mar 2015 12:42:24 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpCc6mbq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8 a=KKAkSRfTAAAA:8	a=xcGojbsH63Q5R1bLALAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 313F0200EB;	Wed,
	11 Mar 2015 13:42:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Mar 2015 13:42:22 -0400
Message-id: <1426095742-19182-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linaro-pm-qa-utils: remove, this was upstreamed to meta-oe as pm-qa
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
X-List-Received-Date: Wed, 11 Mar 2015 17:42:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linaro-pm-qa/linaro-pm-qa-utils_git.bb         | 65 ----------------------
 1 file changed, 65 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb

diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
deleted file mode 100644
index 9768a46..0000000
--- a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-DESCRIPTION = "Utilities from Linaro for testing Power Management"
-HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite/PmQa"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-PV = "0.4.4"
-PR = "r3"
-
-BRANCH ?= "master"
-SRCREV = "bdd94ec9204151ba845e9c057de92360c63bbffb"
-
-SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-CFLAGS += "-pthread"
-
-do_compile () {
-    # Find all the .c files in this project and build them.  Save the names
-    # of these files so we know which to install in the installation step.
-    for x in `find . -name "*.c"`
-    do
-        util=`echo ${x} | sed s/.c$//`
-        oe_runmake ${util}
-    done
-}
-
-do_install () {
-    install -d ${D}${bindir}
-    install -d ${D}${bindir}/linaro-pm-qa-include
-
-    # Install the compiled binaries
-    for x in `find . -name "*.c"`
-    do
-        util=`echo ${x} | sed s/.c$//`
-        util_basename=`basename ${util}`
-        install -m 0755 ${util} ${D}${bindir}/${util_basename}
-    done
-
-    # Install the helper scripts in the include directory
-    for script in `find . -name "*.sh" | grep include`
-    do
-        # Remove hardcoded relative paths
-        sed -i -e 's#..\/utils\/##' ${script}
-
-        script_basename=`basename ${script}`
-        install -m 0755 $script ${D}${bindir}/linaro-pm-qa-include/${script_basename}
-    done
-
-    # Install the shell scripts NOT in the include directory since those
-    # will be installed elsewhere
-    for script in `find . -name "*.sh" | grep -v include`
-    do
-        # if the script includes any helper scripts from the include
-        # directory then change the include path to the absolute path
-        # and to reflect the install location of the helper scripts.
-        sed -i -e "s#source ../include#source ${bindir}/linaro-pm-qa-include#g" ${script}
-        # Remove hardcoded relative paths
-        sed -i -e 's#..\/utils\/##' ${script}
-
-        script_basename=`basename ${script}`
-        install -m 0755 $script ${D}${bindir}/${script_basename}
-    done
-}
-- 
2.2.0


