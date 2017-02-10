Return-Path: <dmurphy@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id BA73D52AA0
	for <meta-arago@arago-project.org>;
	Fri, 10 Feb 2017 17:07:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1AH7bHa028996
	for <meta-arago@arago-project.org>; Fri, 10 Feb 2017 11:07:37 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1AH7bAl025664
	for <meta-arago@arago-project.org>; Fri, 10 Feb 2017 11:07:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Feb 2017 11:07:36 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v1AH7bLB008107;	Fri, 10 Feb 2017 11:07:37 -0600
Received: from localhost (a0272616local.dhcp.ti.com [172.22.177.229])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v1AH7a301251; Fri, 10 Feb 2017 11:07:36 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Feb 2017 11:07:30 -0600
Message-ID: <1486746451-23634-1-git-send-email-dmurphy@ti.com>
X-Mailer: git-send-email 2.7.2.333.g70bd996
MIME-Version: 1.0
Cc: afd@ti.com
Subject: [PATCH 1/2] optee: Update SRCREV for client, os and test
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

Updating the SRCREV for the optee-client,
optee-os and optee-test to align with Linaro's
code base and kernel driver.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 2 +-
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 2 +-
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index cdbfaab..3a24c60 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
 
 BRANCH = "ti_optee_client"
-SRCREV = "ce5fefe6cba5df9b4f31399b1155ba768eee0b78"
+SRCREV = "5477e9ebf093ba3ac5296409a690944db6c0014c"
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 7ae2a4a..c50c47d 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -8,7 +8,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti_optee_os"
-SRCREV = "4556015010dbf648d236a72857e927317b0f6438"
+SRCREV = "f4543643876f50b5c454955763c243b8625b0294"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index 2fa4182..ad70773 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 SRC_URI += "file://fix-build-failure-with-GCC6.patch"
 
 BRANCH = "ti_optee_test"
-SRCREV = "6203b8769beff4eccf7104a6474991114691bf90"
+SRCREV = "ba271a6e3eb2bbb6996b5de73918216f64a9e077"
-- 
2.11.0.rc0.7.gbe5a750


