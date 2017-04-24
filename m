Return-Path: <dmurphy@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6A07552A1F
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 19:38:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OJcodQ021005
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 14:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493062730;
	bh=lkpj1BT6NGgp/JMwordfkrxkFuAsZBNA89Hw4/fk+x8=;
	h=From:To:CC:Subject:Date;
	b=QImTc36gaWxbTH7SkILT+hEDE4rfgiefdEP7lFiU5GafX3/ruL4WsiCzgP9xpvYDh
	E99vHi8S5t6vFMsyWruQBgwxL+D8i5VGpOTSSeDP1DuPdCqFUKWToL4/Ek4ljECoyA
	x8QO6Awr6Q7uPF53FNJMicz9OuDirmaGsrc+T0ts=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OJcoh5006921
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 14:38:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 14:38:49 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3OJcn1t021614;	Mon, 24 Apr 2017 14:38:49 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.92.18])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v3OJcn318177; Mon, 24 Apr 2017 14:38:49 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Apr 2017 14:38:43 -0500
Message-ID: <20170424193843.1759-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.13.0.rc0.45.ge2cb6ab
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
X-List-Received-Date: Mon, 24 Apr 2017 19:38:50 -0000
Content-Type: text/plain

Updating the SRCREV for the optee-client,
optee-os and optee-test to align with Linaro's
code base and kernel driver.  For the 2017.01-rc1

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 2 +-
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 2 +-
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index 3a24c60..df7587d 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
 
 BRANCH = "ti_optee_client"
-SRCREV = "5477e9ebf093ba3ac5296409a690944db6c0014c"
+SRCREV = "1df4046bd729e866743454a18a71e72228e585fd"
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index c50c47d..4fa39de 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -8,7 +8,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti_optee_os"
-SRCREV = "f4543643876f50b5c454955763c243b8625b0294"
+SRCREV = "a92d4a6698b0acc8147fba21b10c7e4473da3b9e"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index a94cd42..3ab6177 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -3,4 +3,4 @@ PR_append = ".arago1"
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
 BRANCH = "ti_optee_test"
-SRCREV = "ba271a6e3eb2bbb6996b5de73918216f64a9e077"
+SRCREV = "170a1ee60a98b407790d97dc682568981d344ca3"
-- 
1.9.1


