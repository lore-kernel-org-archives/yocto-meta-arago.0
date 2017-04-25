Return-Path: <dmurphy@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C5E30529EC
	for <meta-arago@arago-project.org>;
	Tue, 25 Apr 2017 11:58:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3PBwleG006762
	for <meta-arago@arago-project.org>; Tue, 25 Apr 2017 06:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493121527;
	bh=rzCtyoc6zqDJBlU2e7x+OHy+ftNqQaqymUDJWuZ6Zrc=;
	h=From:To:CC:Subject:Date;
	b=CTsAlQZSXjlGfS2x9ZhIPaA2xXXpNcwXDETHaxry52clehjg6ahsH6jgcMGuufHQk
	dWSMnTy+KEhFw8IZJgi4TBKhwGQCWf7ti/knGr/ieiws1VDwbiDGNPEuPhYBeB3p9q
	ZHGJ59pxzhxkpwNfMlEi7xqPahV6yhv5sxzMIyQI=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBwlrW005576
	for <meta-arago@arago-project.org>; Tue, 25 Apr 2017 06:58:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Apr 2017 06:58:46 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3PBwlXm007556;	Tue, 25 Apr 2017 06:58:47 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.92.18])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v3PBwl311778; Tue, 25 Apr 2017 06:58:47 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 25 Apr 2017 06:58:40 -0500
Message-ID: <20170425115840.27376-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
Subject: [PATCH] optee: Fix optee os build failure with upstream fix
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
X-List-Received-Date: Tue, 25 Apr 2017 11:58:48 -0000
Content-Type: text/plain

Fix build error on am57 by updating the optee os repo
which contains the fix.

This will need the optee client and test to be updated as well

Reported-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 2 +-
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 2 +-
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index df7587d2..cdf68545 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
 
 BRANCH = "ti_optee_client"
-SRCREV = "1df4046bd729e866743454a18a71e72228e585fd"
+SRCREV = "0b7aa7d6ff08b20ba20c425eed8b2023a179ed85"
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 399bac2f..c6e5be4a 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -8,7 +8,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti_optee_os"
-SRCREV = "79a8c877a637113b47f3e9fca417d33c5eacf9c9"
+SRCREV = "941cd2d94db90bde2c6986cb55cd5b5c7bef8457"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index 3ab61775..62dc6c72 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -3,4 +3,4 @@ PR_append = ".arago1"
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
 BRANCH = "ti_optee_test"
-SRCREV = "170a1ee60a98b407790d97dc682568981d344ca3"
+SRCREV = "d232f17ac35d17da3b2446651facf587ee4696f2"
-- 
2.12.2


