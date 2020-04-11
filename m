Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 17F7C5298B
	for <meta-arago@arago-project.org>;
	Sat, 11 Apr 2020 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E622140C31;
	Sat, 11 Apr 2020 22:32:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 7xrDNuMbPeWL; Sat, 11 Apr 2020 22:32:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D1675409DE;
	Sat, 11 Apr 2020 22:32:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9FAC91723CF;
	Sat, 11 Apr 2020 18:32:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 11 Apr 2020 18:32:46 -0400
Message-Id: <1586644369-16268-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586644369-16268-1-git-send-email-denis@denix.org>
References: <1586644369-16268-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 07/10] meta-toolchain-arago: use SDK_XZ_OPTIONS and SDKDEPLOYDIR
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
X-List-Received-Date: Sat, 11 Apr 2020 22:35:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

1. SDK_XZ_OPTIONS is now standard set of xz options set by oe-core
2. SDKDEPLYDIR used to play nice with shared state

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb              | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 6f55cca..9ef84f0 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -14,10 +14,6 @@ require recipes-core/meta/meta-toolchain.bb
 
 PR = "r35"
 
-XZ_COMPRESSION_LEVEL ?= "-e -6"
-XZ_INTEGRITY_CHECK ?= "crc32"
-XZ_THREADS ?= "-T 0"
-
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script
@@ -145,13 +141,13 @@ cleanup_toolchain_packages() {
 
 fakeroot archive_sdk() {
 	# Package it up
-	mkdir -p ${SDK_DEPLOY}
+	mkdir -p ${SDKDEPLOYDIR}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar --owner=root --group=root -c . | xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} - > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	tar --owner=root --group=root -c . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}
 }
 
 fakeroot create_shar() {
-	cat << "EOF" > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cat << "EOF" > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 #!/bin/bash
 
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
@@ -340,8 +336,8 @@ exit 0
 MARKER:
 EOF
 	# append the SDK tarball
-	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cat ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} >> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# delete the old tarball, we don't need it anymore
-	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	rm ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}
 }
-- 
2.7.4


