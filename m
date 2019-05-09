Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 084A8529C2
	for <meta-arago@arago-project.org>;
	Thu,  9 May 2019 04:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4B9B340024;
	Thu,  9 May 2019 04:15:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rnx23jTLku5O; Thu,  9 May 2019 04:15:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 23C4640BB2;
	Thu,  9 May 2019 04:15:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D932916EAF8;
	Thu,  9 May 2019 00:15:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  9 May 2019 00:15:29 -0400
Message-Id: <1557375331-41998-7-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557375331-41998-1-git-send-email-denys@ti.com>
References: <1557375331-41998-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 7/9] kernel-fitimage: sync up with upstream
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
X-List-Received-Date: Thu, 09 May 2019 04:16:06 -0000

Pull in fixes for sanitizing dtb section names and fixing image type
replacement for aarch64 from oe-core.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index a3b85ad..9aa7640 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -16,8 +16,15 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "x86":
+        uarch = d.getVar("UBOOT_ARCH")
+        if uarch == "arm64":
+            replacementtype = "Image"
+        elif uarch == "mips":
+            replacementtype = "vmlinuz.bin"
+        elif uarch == "x86":
             replacementtype = "bzImage"
+        elif uarch == "microblaze":
+            replacementtype = "linux.bin"
         else:
             replacementtype = "zImage"
 
@@ -334,7 +341,7 @@ fitimage_emit_section_config() {
 
 	dtbcount=1
 	for DTB in ${KERNEL_DEVICETREE}; do
-
+		DTB=$(echo "${DTB}" | tr '/' '_')
 		if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
 			conf_name="${DTB}"
 		else
@@ -506,6 +513,7 @@ fitimage_assemble() {
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
+			DTB=$(echo "${DTB}" | tr '/' '_')
 			fitimage_ti_secure ${DTB_PATH} ${DTB_PATH}.sec
 			if [ "x${FITIMAGE_DTB_BY_NAME}" = "x1" ] ; then
 				fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}.sec
-- 
2.7.4


