Return-Path: <a0323918@sdocg001>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 691A852A25
	for <meta-arago@arago-project.org>;
	Thu,  7 Sep 2017 15:19:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v87FJDSg001819
	for <meta-arago@arago-project.org>; Thu, 7 Sep 2017 10:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504797553;
	bh=gJbHeoqveWwjaBxYbqOUla3bHghBGFU93Vfik6DYF2A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kkhdryqhoW/MsMQ0GSRuyUGKlkhyHUzAdJQwMPm5qMhWOtzSzirvthgNtQ6ob7/ap
	SZiypoNt0eZKmygpLyDATgqvlcnV9b31YpZL+1uPYH7qTrtvoWF7IZZFo68JE7Pj73
	Xls7K9pJt6ONNTdAX0s478vvxThBRYG8wElV6SzE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v87FJ8KF007603
	for <meta-arago@arago-project.org>; Thu, 7 Sep 2017 10:19:08 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 7 Sep 2017 10:19:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 7 Sep 2017 10:19:08 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v87FJ83t017671;
	Thu, 7 Sep 2017 10:19:08 -0500
Received: from a0323918 by sdomc-build0.hou.asp.ti.com with local (Exim 4.82)
	(envelope-from <a0323918@sdocg001>)
	id 1dpyaB-000Zy8-Vt; Thu, 07 Sep 2017 10:19:08 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 7 Sep 2017 10:19:04 -0500
Message-ID: <20170907151904.138219-2-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170907151904.138219-1-yuanzhao@ti.com>
References: <20170907151904.138219-1-yuanzhao@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] ocl: update to version 1.1.14.0
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
X-List-Received-Date: Thu, 07 Sep 2017 15:19:23 -0000
Content-Type: text/plain

- opencl : externd OpenCL kernel profiling capability based on libaet
- monitor : use libaet for profiling hardware events

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc               | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 8bd8f9e9..444e310b 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.13.0"
+PV = "1.1.14.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "c2493c7190c7e5b4135f64d2aacc2de3ff57e0bb"
+OCL_SRCREV = "3bd90be6d3bb0b0f74c0a33f28ce8a08ec554ca5"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 35bd993d..b69aa950 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -20,6 +20,7 @@ DEPENDS = " ti-llvm3.6-native \
             ti-framework-components \
             libulm \
             gdbserver-c6x \
+            libaet \
             openmp-rtos \
 "
 
@@ -72,6 +73,7 @@ export MPM_DIR = "${MPM_INSTALL_DIR}"
 export OMP_DIR = "${OMP_INSTALL_DIR}"
 export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
 export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
+export AET_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ctoolslib/aet"
 export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
 export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
 
-- 
2.14.1


