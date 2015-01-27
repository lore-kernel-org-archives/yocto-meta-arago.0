Return-Path: <a0850405@a0850405-off1>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4294252090
	for <meta-arago@arago-project.org>;
	Tue, 27 Jan 2015 21:07:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0RL77gZ010545
	for <meta-arago@arago-project.org>; Tue, 27 Jan 2015 15:07:07 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0RL758U022963
	for <meta-arago@arago-project.org>; Tue, 27 Jan 2015 15:07:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Jan 2015 15:07:06 -0600
Received: from a0850405-off1 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0RL75mD024407;
	Tue, 27 Jan 2015 15:07:05 -0600
Received: from a0850405 by a0850405-off1 with local (Exim 4.82)	(envelope-from
	<a0850405@a0850405-off1>)	id 1YGDLl-0004Kn-Fv;
	Tue, 27 Jan 2015 16:07:05 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Jan 2015 16:06:52 -0500
Message-ID: <1422392812-16627-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Update linaro-pm-qa-utils package version
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
X-List-Received-Date: Tue, 27 Jan 2015 21:07:08 -0000
Content-Type: text/plain

The old version contains bugs, such as false negatives on cpuidle
tests, so update to latest version that contains this on other
fixes.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
index a836a8d..9768a46 100644
--- a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
+++ b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
@@ -5,10 +5,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "0.4.4"
-PR = "r2"
+PR = "r3"
 
 BRANCH ?= "master"
-SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
+SRCREV = "bdd94ec9204151ba845e9c057de92360c63bbffb"
 
 SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


