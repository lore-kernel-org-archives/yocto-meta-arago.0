Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E2C78529D8
	for <meta-arago@arago-project.org>;
	Thu,  9 May 2019 06:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E43A240BAA;
	Thu,  9 May 2019 06:28:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id w_xxu6e9EN2s; Thu,  9 May 2019 06:28:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CBB0A40024;
	Thu,  9 May 2019 06:28:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0B45716E9CB;
	Thu,  9 May 2019 02:28:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  9 May 2019 02:27:59 -0400
Message-Id: <1557383279-18214-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH v2 8/9] kernel-fitimage, arago.conf: introduce FITIMAGE_PACK_TEE
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
X-List-Received-Date: Thu, 09 May 2019 06:28:31 -0000

Instead of relying on OPTEEMACHINE and OPTEEFLAVOR, use FITIMAGE_PACK_TEE
to specify if packing OPTEE into FIT is required.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - revert setting only am4/am5/dra7 HS devices

 meta-arago-distro/classes/kernel-fitimage.bbclass | 7 ++++---
 meta-arago-distro/conf/distro/arago.conf          | 4 ++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 9aa7640..34b61d0 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -1,6 +1,7 @@
 inherit kernel-uboot uboot-sign
 
 FITIMAGE_HASH_ALGO ?= "sha1"
+FITIMAGE_PACK_TEE ?= "0"
 FITIMAGE_DTB_BY_NAME ?= "0"
 FITIMAGE_TEE_BY_NAME ?= "0"
 FITIMAGE_CONF_BY_NAME ?= "0"
@@ -46,7 +47,7 @@ python __anonymous () {
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
 
-        if d.getVar('OPTEEMACHINE'):
+        if d.getVar('FITIMAGE_PACK_TEE') == "1":
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' optee-os:do_deploy')
 }
 
@@ -323,7 +324,7 @@ fitimage_emit_section_config() {
 		setup_line="setup = \"setup@${5}\";"
 	fi
 
-	if [ -n "${6}" -a -n "${OPTEEFLAVOR}" ]; then
+	if [ -n "${6}" -a "x${FITIMAGE_PACK_TEE}" = "x1" ]; then
 		if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ]; then
 			loadables_line="loadables = \"${6}.optee\";"
 			loadables_pager_line="loadables = \"${6}-pager.optee\";"
@@ -530,7 +531,7 @@ fitimage_assemble() {
 	#
 	# Step 2a: Prepare OP/TEE image section
 	#
-	if test -n "${OPTEEFLAVOR}"; then
+	if [ "x${FITIMAGE_PACK_TEE}" = "x1" ] ; then
 		mkdir -p ${B}/usr
 		rm -f ${B}/usr/${OPTEEFLAVOR}.optee
 		if [ -e "${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR}.optee" ]; then
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 7129202..5913d5b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -38,6 +38,10 @@ IMAGE_FSTYPES += "tar.xz.md5"
 # FIT image for secure devices
 KERNEL_CLASSES += "kernel-fitimage"
 FITIMAGE_HASH_ALGO = ""
+FITIMAGE_PACK_TEE = "0"
+FITIMAGE_PACK_TEE_am437x-hs-evm = "1"
+FITIMAGE_PACK_TEE_am57xx-hs-evm = "1"
+FITIMAGE_PACK_TEE_dra7xx-hs-evm = "1"
 FITIMAGE_DTB_BY_NAME = "1"
 FITIMAGE_TEE_BY_NAME = "1"
 FITIMAGE_CONF_BY_NAME = "1"
-- 
2.7.4


