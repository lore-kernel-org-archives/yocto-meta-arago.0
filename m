Return-Path: <dmurphy@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 08EFD52094
	for <meta-arago@arago-project.org>;
	Mon,  6 Mar 2017 18:53:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v26IrdlJ023938
	for <meta-arago@arago-project.org>; Mon, 6 Mar 2017 12:53:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488826419;
	bh=+XXFjz9kPrEUY+u063SRpvELnYDH4cgYL+Sm5ivyusM=;
	h=From:To:CC:Subject:Date;
	b=o9gemarpWUvDzhHtAsGYG92Nv2DpvZVl4EakjjhLSR4MAfAmJlGZPXsum3WLJfrfZ
	sfuZcuv7F5Pptb7iaFl+5OADnZoczjTSMMrYaEszUncOCwwkP3EDqK23GCOZu+Z3kp
	9oVWLzekbRAfNoKKSXl1gM7c+Ut6rrXENdpHOsk8=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v26IrY5g031128
	for <meta-arago@arago-project.org>; Mon, 6 Mar 2017 12:53:34 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 6 Mar 2017 12:53:34 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v26IrYT7020507;	Mon, 6 Mar 2017 12:53:34 -0600
Received: from localhost (a0272616local.dhcp.ti.com [172.22.187.105])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v26IrY323160; Mon, 6 Mar 2017 12:53:34 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 Mar 2017 12:53:38 -0600
Message-ID: <1488826418-9440-1-git-send-email-dmurphy@ti.com>
X-Mailer: git-send-email 2.7.2.333.g70bd996
MIME-Version: 1.0
Subject: [PATCH] optee: Update SRCREV for client, os and test
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
X-List-Received-Date: Mon, 06 Mar 2017 18:53:50 -0000
Content-Type: text/plain

Updating the SRCREV for the optee-client,
optee-os and optee-test to align with Linaro's
code base and kernel driver.  For the 2017.00 rc3

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 2 +-
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 2 +-
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index 3a24c60..d58aa16 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
 
 BRANCH = "ti_optee_client"
-SRCREV = "5477e9ebf093ba3ac5296409a690944db6c0014c"
+SRCREV = "d507b84f82db4c8a85429e1fe255bfbe7b239856"
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index c50c47d..77e6e94 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -8,7 +8,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti_optee_os"
-SRCREV = "f4543643876f50b5c454955763c243b8625b0294"
+SRCREV = "7f49fe14fc26b6c7d1da3a5f90beb9a5fdbb7098"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index a94cd42..115ebbe 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -3,4 +3,4 @@ PR_append = ".arago1"
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
 BRANCH = "ti_optee_test"
-SRCREV = "ba271a6e3eb2bbb6996b5de73918216f64a9e077"
+SRCREV = "d99fe97eab50044bb0a03e0646d019ec0525fa8c"
-- 
2.7.3


