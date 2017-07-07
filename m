Return-Path: <dmurphy@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 71E1F52A51
	for <meta-arago@arago-project.org>;
	Fri,  7 Jul 2017 15:18:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v67FI6ha028954
	for <meta-arago@arago-project.org>; Fri, 7 Jul 2017 10:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499440686;
	bh=05EOouQA5sd8mQgpbrHP5Yo/E6ent8+MuxX5f/tri50=;
	h=From:To:CC:Subject:Date;
	b=uVDfGrdgp9Wd7bXADFou5pOPHPUZ+r5f7EnBP3trRlF/HE7ED420m7b3HnUQ3H1sf
	Psm4s7wtMMkNZ5WAIPRATmyBFtSN0jeZUHrmxo/jykF3b2qYTZuXOxJjR/+vqM2tVE
	Zmzf9uzj7Vs0AQP9PGTrH427a8kgUwP/ZSMv8gQA=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v67FI1dV032432
	for <meta-arago@arago-project.org>; Fri, 7 Jul 2017 10:18:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Jul 2017 10:18:01 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v67FI1If005002;	Fri, 7 Jul 2017 10:18:01 -0500
Received: from localhost ([172.22.149.61])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v67FI0327232;
	Fri, 7 Jul 2017 10:18:00 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Jul 2017 10:17:51 -0500
Message-ID: <20170707151751.11446-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
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
X-List-Received-Date: Fri, 07 Jul 2017 15:18:16 -0000
Content-Type: text/plain

Updating the SRCREV for the optee-client,
optee-os and optee-test to Linaro's tagged
version of 2.5.0 release.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 4 +++-
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 4 +++-
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index cdf68545..d18ab3ba 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -3,5 +3,7 @@ PR_append = ".arago0"
 SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
 
+PV = "2.5.0+git${SRCPV}"
+
 BRANCH = "ti_optee_client"
-SRCREV = "0b7aa7d6ff08b20ba20c425eed8b2023a179ed85"
+SRCREV = "0efaf6bae1066d06a075d1f4fe1011b8b3576f75"
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index c6e5be4a..afd72284 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -2,13 +2,15 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PR_append = ".arago7"
 
+PV="2.5.0+git${SRCPV}"
+
 is_armv7 = "1"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti_optee_os"
-SRCREV = "941cd2d94db90bde2c6986cb55cd5b5c7bef8457"
+SRCREV = "f54c7f1f0a8942338b84a6a9319ebf6e946039f0"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index 62dc6c72..17228b13 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -2,5 +2,7 @@ PR_append = ".arago1"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
+PV = "2.5.0+git${SRCPV}"
+
 BRANCH = "ti_optee_test"
-SRCREV = "d232f17ac35d17da3b2446651facf587ee4696f2"
+SRCREV = "e0ab180a643b67e865b35f869a2ed3b3dee9112d"
-- 
2.13.2.516.ge629a7d28


