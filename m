Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 491C052974
	for <meta-arago@arago-project.org>;
	Wed, 14 Oct 2015 13:39:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9EDdill019051
	for <meta-arago@arago-project.org>; Wed, 14 Oct 2015 08:39:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9EDdigu024199
	for <meta-arago@arago-project.org>; Wed, 14 Oct 2015 08:39:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 14 Oct 2015 08:39:44 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9EDdhs9026382;
	Wed, 14 Oct 2015 08:39:44 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZmMHP-0001tg-8g; Wed, 14 Oct 2015 09:39:43 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Oct 2015 09:39:35 -0400
Message-ID: <1444829975-7258-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 2/2] opencl-monitor: Use update-alternatives to handle firmware
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
X-List-Received-Date: Wed, 14 Oct 2015 13:39:50 -0000
Content-Type: text/plain

* Use update-alternatives to handle the firmware incase multiple
  packages provide DSP firmware

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
The is v2 of http://patchwork.dal.design.ti.com/patch/16967/

v2 changes:
* Use update-alternatives instead of manually adding symlinks
* Update commit message to reflect the method used.

 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 336d068..fbc4949 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -5,9 +5,9 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-inherit cmake
+inherit cmake update-alternatives
 
 DEPENDS = " ti-llvm3.3-native \
             common-csl-ip-rtos \
@@ -47,6 +47,11 @@ export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
 export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
 export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
 
+ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
+ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "/lib/firmware/dra7-dsp1-fw.xe66"
+ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "/lib/firmware/dra7-dsp2-fw.xe66"
+ALTERNATIVE_PRIORITY = "100"
+
 MONITOR_FIRMWARE = ""
 MONITOR_FIRMWARE_dra7xx = "${base_libdir}/firmware/*"
 
-- 
1.9.1


