Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id DC7C652A44
	for <meta-arago@arago-project.org>;
	Mon, 10 Apr 2017 12:27:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3ACRJCZ026814
	for <meta-arago@arago-project.org>; Mon, 10 Apr 2017 07:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1491827239;
	bh=14qIIhTpplDUo0spaewxtdMfKHFjzbAPh5F7+XbrMKA=;
	h=From:To:CC:Subject:Date;
	b=G7dJzHV4hKDVhQrdOe2VBunE0NP7pdDn1/sTTbHNp6gufVROXwNIpceA2nPgR4ECC
	lAU34nm434RRFjd/kh8okLl1mhpQZGnco5Jf6QpHgWt9k4aUyQ2GifZIpTSYUCG+hg
	lC/rB6emdfp5mY6Upsdfb/3D1A0OV97h26p/u7Jc=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3ACRJXN014759
	for <meta-arago@arago-project.org>; Mon, 10 Apr 2017 07:27:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 07:27:19 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3ACRIeB028891;	Mon, 10 Apr 2017 07:27:19 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Apr 2017 08:25:09 -0400
Message-ID: <1491827109-1896-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [morty/master][PATCH] external-linaro-toolchain: fix against upstream changes
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
X-List-Received-Date: Mon, 10 Apr 2017 12:27:21 -0000
Content-Type: text/plain

* Recent upstream changes cause bindir and sbindir to be removed if
  they are empty.
* The bbappend in this layer assumes these directories exist.
* This change removes that assumption.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 7648e36..e261259 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -133,6 +133,7 @@ do_install_append() {
 	sed -i -e "s# /lib/# ../../lib/#g" -e "s# /usr/lib/# ./#g" ${D}${libdir}/libpthread.so
 
 	if [ -d ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${bindir} ]; then
+		install -d ${D}${bindir}
 		cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${bindir}/* ${D}${bindir}
 	fi
 
@@ -161,5 +162,4 @@ do_install_append() {
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/uapi/.install; rm -rf ${D}${includedir}/misc/.install; rm -rf ${D}${includedir}/misc/cxl.h; rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/scsi/cxlflash_ioctl.h; rm -rf ${D}${includedir}/scsi/fc; rm -rf ${D}${includedir}/xen', d)}
 
 	rm ${D}${base_libdir}/*.spec
-	rmdir ${D}${sbindir}
 }
-- 
2.7.4


