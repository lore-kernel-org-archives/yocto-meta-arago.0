Return-Path: <dmurphy@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 13A8C52A60
	for <meta-arago@arago-project.org>;
	Wed, 12 Jul 2017 18:03:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6CI3eto011218
	for <meta-arago@arago-project.org>; Wed, 12 Jul 2017 13:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499882620;
	bh=TNEisIdx5rSGhMvuD3dwa+DurymQvRtDsnNcrkYSQyw=;
	h=From:To:CC:Subject:Date;
	b=dcDEjkksU1jCCi6Idz9XCfwDT9GSZ8QnBrC8Q5SO9q+oq69O39B5LvaY2I+elRx6O
	VdpD479E/neSFpdUu+7CHuyclW3fBJAJEyHAFw9CmOAbg5Dl/9MDtByibqd86mWThQ
	lGQkJ88WXHNTKiPeKncwd3+lDFQP10bBhXkhqsOA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6CI3eXo010361
	for <meta-arago@arago-project.org>; Wed, 12 Jul 2017 13:03:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 13:03:40 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6CI3ej7006694;	Wed, 12 Jul 2017 13:03:40 -0500
Received: from localhost ([172.22.131.55])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v6CI3e316321;
	Wed, 12 Jul 2017 13:03:40 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Jul 2017 13:03:39 -0500
Message-ID: <20170712180339.12675-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
Subject: [PATCH v3] optee: Update SRCREV for client, os and test
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
X-List-Received-Date: Wed, 12 Jul 2017 18:03:41 -0000
Content-Type: text/plain

Updating the SRCREV for the optee-client,
optee-os and optee-test to Linaro's tagged
version of 2.5.0 release.

Adding LIC_FILES_CHKSUM to optee_client due to change in the
LICENSE file from optee_client commit d6a329167a13a124b5cf7a4f0e6f9911099e484a

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - optee_client added new LICENSE check sum
v2 - Fixed optee_os commit sha

 meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 6 +++++-
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 4 +++-
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 4 +++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index cdf68545..16437019 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -3,5 +3,9 @@ PR_append = ".arago0"
 SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
 
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
+
+PV = "2.5.0+git${SRCPV}"
+
 BRANCH = "ti_optee_client"
-SRCREV = "0b7aa7d6ff08b20ba20c425eed8b2023a179ed85"
+SRCREV = "0efaf6bae1066d06a075d1f4fe1011b8b3576f75"
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index c6e5be4a..d5116fb8 100644
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
+SRCREV = "a73053f395996f649da278cbec361aa01c02befa"
 
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


