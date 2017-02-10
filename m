Return-Path: <dmurphy@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 0B82852AAF
	for <meta-arago@arago-project.org>;
	Fri, 10 Feb 2017 17:07:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1AH7bCG016653
	for <meta-arago@arago-project.org>; Fri, 10 Feb 2017 11:07:37 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1AH7b9g025667
	for <meta-arago@arago-project.org>; Fri, 10 Feb 2017 11:07:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Feb 2017 11:07:36 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v1AH7bDp008111;	Fri, 10 Feb 2017 11:07:37 -0600
Received: from localhost (a0272616local.dhcp.ti.com [172.22.177.229])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v1AH7b301255; Fri, 10 Feb 2017 11:07:37 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Feb 2017 11:07:31 -0600
Message-ID: <1486746451-23634-2-git-send-email-dmurphy@ti.com>
X-Mailer: git-send-email 2.7.2.333.g70bd996
In-Reply-To: <1486746451-23634-1-git-send-email-dmurphy@ti.com>
References: <1486746451-23634-1-git-send-email-dmurphy@ti.com>
MIME-Version: 1.0
Cc: afd@ti.com
Subject: [PATCH 2/2] optee: client: Remove unneeded patch for gcc6
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
X-List-Received-Date: Fri, 10 Feb 2017 17:07:38 -0000
Content-Type: text/plain

With the updated SRCREV to ba271a6e3eb2bbb6996b5de73918216f64a9e077
the patch fix-build-failure-with-GCC6.patch is no longer needed as
it has been fixed with the updated code.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index ad70773..a94cd42 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -1,7 +1,6 @@
 PR_append = ".arago1"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
-SRC_URI += "file://fix-build-failure-with-GCC6.patch"
 
 BRANCH = "ti_optee_test"
 SRCREV = "ba271a6e3eb2bbb6996b5de73918216f64a9e077"
-- 
2.11.0.rc0.7.gbe5a750


