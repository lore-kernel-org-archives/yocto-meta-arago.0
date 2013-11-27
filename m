Return-Path: <a0850405@a0850405-off1>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6473E52A98
	for <meta-arago@arago-project.org>;
	Wed, 27 Nov 2013 14:55:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAREtUfa010007
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2013 08:55:30 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAREtUtX015556
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2013 08:55:30 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 27 Nov 2013 08:55:29 -0600
Received: from a0850405-off1 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAREtTFu030359;
	Wed, 27 Nov 2013 08:55:29 -0600
Received: from a0850405 by a0850405-off1 with local (Exim 4.76)	(envelope-from
	<a0850405@a0850405-off1>)	id 1VlgWX-0002E6-6Z;
	Wed, 27 Nov 2013 09:55:29 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Nov 2013 09:55:02 -0500
Message-ID: <1385564102-8521-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] linaro-pm-qa-utils: Remove hardcoded relative paths
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
X-List-Received-Date: Wed, 27 Nov 2013 14:55:31 -0000
Content-Type: text/plain

Some scripts contained hardcoded relative paths to not existing
files. This patch removes the relative paths and instead let BASH
resolve the path to the executable.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
V2:
  * PR bump
---
 .../linaro-pm-qa/linaro-pm-qa-utils_git.bb         |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
index dcf599f..a836a8d 100644
--- a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
+++ b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "0.4.4"
-PR = "r1"
+PR = "r2"
 
 BRANCH ?= "master"
 SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
@@ -41,6 +41,9 @@ do_install () {
     # Install the helper scripts in the include directory
     for script in `find . -name "*.sh" | grep include`
     do
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
+
         script_basename=`basename ${script}`
         install -m 0755 $script ${D}${bindir}/linaro-pm-qa-include/${script_basename}
     done
@@ -53,6 +56,8 @@ do_install () {
         # directory then change the include path to the absolute path
         # and to reflect the install location of the helper scripts.
         sed -i -e "s#source ../include#source ${bindir}/linaro-pm-qa-include#g" ${script}
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
 
         script_basename=`basename ${script}`
         install -m 0755 $script ${D}${bindir}/${script_basename}
-- 
1.7.9.5


