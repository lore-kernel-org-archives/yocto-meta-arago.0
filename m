Return-Path: <a0869574local@uda0869574b>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 12FB352A63
	for <meta-arago@arago-project.org>;
	Thu,  2 Mar 2017 20:51:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v22KpdHc024595
	for <meta-arago@arago-project.org>; Thu, 2 Mar 2017 14:51:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488487899;
	bh=Hv9P79QAZRosf+oJ/l5Ox5+Ww0HeXwoaIlt3GvfufTo=;
	h=From:To:CC:Subject:Date;
	b=IypXutLy74mk11AqLE09gXy8nKk5RRSZrfGGVCvkowccuR/mrSvRkXlUe4HkQrm+x
	RDToL0btCFVUuvwQPOnaFjthcBaXkdOb5oxm+jk+TfN+ZLFvEf3AdzjVILMQ/Qgpzn
	5lEltFBJO6VdCykGohjMFosYcoA6rxZO81FCspkY=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22KpY7k029152
	for <meta-arago@arago-project.org>; Thu, 2 Mar 2017 14:51:34 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 14:51:34 -0600
Received: from uda0869574b (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22KpYhG029689;
	Thu, 2 Mar 2017 14:51:34 -0600
Received: from a0869574local by uda0869574b with local (Exim 4.82)
	(envelope-from <a0869574local@uda0869574b>)	id 1cjXhD-0001dc-Bg;
	Thu, 02 Mar 2017 15:51:31 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Mar 2017 15:51:24 -0500
Message-ID: <1488487884-6257-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] LibArch: added K2G support for PSDK-RTOS.
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
X-List-Received-Date: Thu, 02 Mar 2017 20:51:50 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/libarch-rtos/libarch-rtos_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/libarch-rtos/libarch-rtos_git.bb b/recipes-ti/libarch-rtos/libarch-rtos_git.bb
index ce9cd49..e959f29 100644
--- a/recipes-ti/libarch-rtos/libarch-rtos_git.bb
+++ b/recipes-ti/libarch-rtos/libarch-rtos_git.bb
@@ -4,7 +4,7 @@ include recipes-ti/libarch/libarch.inc
 
 PR = "${INC_PR}.tisdk-int3"
 
-COMPATIBLE_MACHINE_append = "|c667x-evm"
+COMPATIBLE_MACHINE_append = "|c667x-evm|k2g-evm"
 
 DEPENDS_remove = "opencl \
                   opencl-monitor \
@@ -18,19 +18,17 @@ DEPENDS_append = " ti-ipc-rtos \
 "
 
 TARGET_c667x-evm = "SOC_C6678"
+TARGET_k2g-evm   = "SOC_K2G"
 
 # Variables required to compile libarch examples
 export IPC_DIR       = "${IPC_INSTALL_DIR}"
 export OMP_DIR       = "${OMP_INSTALL_DIR}"
-export C6678_PDK_DIR = "${PDK_INSTALL_DIR}"
+export PDK_DIR       = "${PDK_INSTALL_DIR}"
 export EDMA3_DIR     = "${EDMA3_LLD_INSTALL_DIR}"
 export LIBARCH_DIR   = "${S}/exports/libarch_${PV}"
 
 do_compile() {
     make -f build/Makefile TARGET=${TARGET} LIBOS=LIB_RTOS
-
-    cd ${LIBARCH_DIR}/examples
-    make TARGET=${TARGET} LIBOS=LIB_RTOS
 }
 
 deltask do_create_srcipk
-- 
1.9.1


