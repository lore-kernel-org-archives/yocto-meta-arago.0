Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 230C252A85
	for <meta-arago@arago-project.org>;
	Mon, 16 Jan 2017 21:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B5C4620AFB;
	Mon, 16 Jan 2017 21:50:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GicsOQAZEr-E; Mon, 16 Jan 2017 21:50:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8DD84208D7;
	Mon, 16 Jan 2017 21:49:58 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id A1D3C16231E;
	Mon, 16 Jan 2017 16:49:57 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 16 Jan 2017 16:49:57 -0500
Message-Id: <1484603397-24408-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH] optee-os: switch to ti_optee_os branch as it's meant for production
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
X-List-Received-Date: Mon, 16 Jan 2017 21:50:01 -0000

Increase core log level.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Andrew F. Davis <afd@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 7bccbfa..7ae2a4a 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,20 +1,21 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago6"
+PR_append = ".arago7"
 
 is_armv7 = "1"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
-BRANCH = "ti_optee_os-next"
-SRCREV = "8573c0500487bd341aa5b37870ac92fc54292914"
+BRANCH = "ti_optee_os"
+SRCREV = "4556015010dbf648d236a72857e927317b0f6438"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
                 ta-targets=ta_arm32 \
                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                 CFG_TEE_TA_LOG_LEVEL=0 \
+                CFG_TEE_CORE_LOG_LEVEL=2 \
 "
 
 do_compile() {
-- 
2.7.4


