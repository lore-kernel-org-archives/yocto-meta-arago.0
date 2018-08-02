Return-Path: <dmurphy@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EEFE152985
	for <meta-arago@arago-project.org>;
	Thu,  2 Aug 2018 19:00:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w72J04YY082073
	for <meta-arago@arago-project.org>; Thu, 2 Aug 2018 14:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533236404;
	bh=VvyxVwZTCqbHlvq1Z552nzG57wykmubp8QIp4cDhlNw=;
	h=From:To:CC:Subject:Date;
	b=MBCKVJLVHkuDRRd4ASbO5QdPOsqbRjjEatUWWXvmYoEwUBrQ9tu4pOriTjH/7a2pU
	WiymtgEZAloWzKpql64tpM+MCA0Q1hQEKbe5ge0cXLfLuW0pIX2dLBDACbGoS+GU+9
	bfxARnLkKQD/qTlNQ5oIcxmS/O5Dm5/LgWZttI/4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w72J01m5013848
	for <meta-arago@arago-project.org>; Thu, 2 Aug 2018 14:00:04 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 2 Aug 2018 14:00:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 2 Aug 2018 14:00:02 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w72J02Jh007138;
	Thu, 2 Aug 2018 14:00:02 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.163.74])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w72J02x14772; Thu, 2 Aug 2018 14:00:02 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Aug 2018 13:59:59 -0500
Message-ID: <20180802185959.24811-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018.03-rc1 tag
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
X-List-Received-Date: Thu, 02 Aug 2018 19:00:12 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../recipes-security/optee/optee-client.bbappend              | 4 ++--
 .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
 .../recipes-security/optee/optee-test_git.bbappend            | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index bb1f631d..52a6f588 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -5,7 +5,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
 
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-PV = "3.0.0+git${SRCPV}"
+PV = "3.2.0+git${SRCPV}"
 
 BRANCH = "ti_optee_client"
-SRCREV = "09b69afa5e9e74aac39e383d74f14b4d61c90476"
+SRCREV = "2d542f2074223fde918e68efa4a9ff37f927e604"
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 655bd02e..ffbf0aeb 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PR_append = ".arago0"
 
-PV = "3.1.0+git${SRCPV}"
+PV = "3.2.0+git${SRCPV}"
 
 is_armv7 = "1"
 is_armv7_aarch64 = "0"
@@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "master"
-SRCREV = "940a24375ba5357d34fea7196dba48eadaee9abd"
+SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
 
 ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
 ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index e6d10735..f85c719b 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -6,7 +6,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
 SRC_URI += "file://0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch"
 
-PV = "3.1.0+git${SRCPV}"
+PV = "3.2.0+git${SRCPV}"
 
 BRANCH = "ti_optee_test"
 SRCREV = "b284eedf4fa20c21403ececfe0a47af55fbaa5d8"
-- 
2.17.0.582.gccdcbd54c


