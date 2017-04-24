Return-Path: <dmurphy@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id BD7845209B
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 16:18:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OGI4qO027927
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 11:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493050684;
	bh=c18AAzTUgIhtcIDwHDdbBFPpS5AidtW2g/sANIJUhqg=;
	h=From:To:CC:Subject:Date;
	b=hCs5+Vbqvczpmi0z+l0J8Jo+wvmoja87k9I8lhenYA/6XXWn9NUgz9bpTFOZ5qKad
	1EZtIAll5uR3KGxeywEbmoRJj5RXLm7WaZrl6ywx93T82hUP+q5s/ndsfXlajON6jb
	d22u5RZKAaRby6UvdgQCFN15Vaq/Wp+usJRNfBPY=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OGI255030296
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 11:18:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 11:18:03 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3OGI30e023161;	Mon, 24 Apr 2017 11:18:03 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.81.233])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v3OGI3302751; Mon, 24 Apr 2017 11:18:03 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Apr 2017 11:17:57 -0500
Message-ID: <20170424161757.9391-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.13.0.rc0.45.ge2cb6ab
MIME-Version: 1.0
Subject: [PATCH] linaro-optee: Update to v2.4.0 OPTEE release
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
X-List-Received-Date: Mon, 24 Apr 2017 16:18:05 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-optee/recipes-security/optee/optee-client.bb   | 4 ++--
 meta-optee/recipes-security/optee/optee-os_git.bb   | 4 ++--
 meta-optee/recipes-security/optee/optee-test_git.bb | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-optee/recipes-security/optee/optee-client.bb b/meta-optee/recipes-security/optee/optee-client.bb
index c31fb30..7b471f3 100644
--- a/meta-optee/recipes-security/optee/optee-client.bb
+++ b/meta-optee/recipes-security/optee/optee-client.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/OP-TEE/optee_client"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=a6d62e1b5fef18a1854bd538e3160d7c"
 
-PV = "2.3.0+git${SRCPV}"
+PV = "2.4.0+git${SRCPV}"
 
 inherit pythonnative systemd
 
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/OP-TEE/optee_client.git \
            file://tee-supplicant.service"
 S = "${WORKDIR}/git"
 
-SRCREV = "365657667f8968f40237480169fea44fa3fb9949"
+SRCREV = "1df4046bd729e866743454a18a71e72228e585fd"
 
 SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
 
diff --git a/meta-optee/recipes-security/optee/optee-os_git.bb b/meta-optee/recipes-security/optee/optee-os_git.bb
index a194c8c..5dcb0e3 100644
--- a/meta-optee/recipes-security/optee/optee-os_git.bb
+++ b/meta-optee/recipes-security/optee/optee-os_git.bb
@@ -4,13 +4,13 @@ DESCRIPTION = "OPTEE OS"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-PV="2.3.0+git${SRCPV}"
+PV="2.4.0+git${SRCPV}"
 
 DEPENDS = "python-wand-native python-pycrypto-native"
 
 inherit deploy pythonnative
 
-SRCREV = "28fcee179fc908ee2001a135179366d794af7878"
+SRCREV = "a92d4a6698b0acc8147fba21b10c7e4473da3b9e"
 SRC_URI = "git://github.com/OP-TEE/optee_os.git \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
           "
diff --git a/meta-optee/recipes-security/optee/optee-test_git.bb b/meta-optee/recipes-security/optee/optee-test_git.bb
index 3fd267c..cdc51ef 100644
--- a/meta-optee/recipes-security/optee/optee-test_git.bb
+++ b/meta-optee/recipes-security/optee/optee-test_git.bb
@@ -8,14 +8,14 @@ DEPENDS = "optee-client optee-os python-pycrypto-native"
 
 inherit pythonnative
 
-PV = "2.3.0+git${SRCPV}"
+PV = "2.4.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://fix-build-failure-with-GCC6.patch \
           "
 S = "${WORKDIR}/git"
 
-SRCREV = "a4653559d989d5006f67f4498be4cb090be12f79"
+SRCREV = "170a1ee60a98b407790d97dc682568981d344ca3"
 
 OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
-- 
1.9.1


