Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6FBD352A65
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 14:43:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99Eh7d2010138
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:43:07 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Eh7vP027718
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:43:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 09:43:07 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Eh7DY028990;
	Fri, 9 Oct 2015 09:43:07 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZkYt1-0006RL-2t; Fri, 09 Oct 2015 10:43:07 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 10:43:03 -0400
Message-ID: <1444401783-24716-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444401783-24716-1-git-send-email-j-stiffler@ti.com>
References: <1444401783-24716-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] opencl-monitor: Move firmware to allow for other firmwares
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
X-List-Received-Date: Fri, 09 Oct 2015 14:43:09 -0000
Content-Type: text/plain

* Add symlink to make opencl-monitor firmware the default.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 336d068..9ff4b5b 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit cmake
 
@@ -47,6 +47,20 @@ export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
 export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
 export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
 
+do_install_append() {
+    mv ${D}/lib/firmware/dra7-dsp1-fw.xe66 \
+       ${D}/lib/firmware/dra7-dsp1-fw.xe66.ocl
+
+    mv ${D}/lib/firmware/dra7-dsp2-fw.xe66 \
+       ${D}/lib/firmware/dra7-dsp2-fw.xe66.ocl
+
+    ln -s dra7-dsp1-fw.xe66.ocl \
+          ${D}/lib/firmware/dra7-dsp1-fw.xe66
+
+    ln -s dra7-dsp2-fw.xe66.ocl \
+          ${D}/lib/firmware/dra7-dsp2-fw.xe66
+}
+
 MONITOR_FIRMWARE = ""
 MONITOR_FIRMWARE_dra7xx = "${base_libdir}/firmware/*"
 
-- 
1.9.1


