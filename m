Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0727C52998
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2013 16:08:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rABG8lo7028306
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 10:08:47 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rABG8lLS005768
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 10:08:47 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 11 Nov 2013 10:08:47 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rABG8dvq031084;
	Mon, 11 Nov 2013 10:08:45 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Nov 2013 11:07:07 -0600
Message-ID: <1384189628-21944-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1384189628-21944-1-git-send-email-Chase.Maupin@ti.com>
References: <1384189628-21944-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] linaro-pm-qa-utils: Add utils used by Linaro PM scripts
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
X-List-Received-Date: Mon, 11 Nov 2013 16:08:48 -0000
Content-Type: text/plain

* The Linaro PM test scripts which have already been incorporated
  into the ltp-ddt project depend on some utilities from the
  Linaro pm-qa project.
* Build the utilities and install them into /usr/bin so they
  will be in the default PATH

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../linaro-pm-qa/linaro-pm-qa-utils_git.bb         |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb

diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
new file mode 100644
index 0000000..275b6e6
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Utilities from Linaro for testing Power Management"
+HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite/PmQa"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PV = "0.4.4"
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
+
+SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git/utils"
+
+UTILS = "cpuburn cpucycle heat_cpu nanosleep"
+
+CFLAGS += "-pthread"
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    install -d ${D}${bindir}
+
+    for util in ${UTILS}
+    do
+        install -m 0755 $util ${D}${bindir}/
+    done
+}
-- 
1.7.0.4


