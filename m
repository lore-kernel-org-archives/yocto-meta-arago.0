Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 5163C52A4A
	for <meta-arago@arago-project.org>;
	Wed, 15 Mar 2017 18:03:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2FI3bN7007103
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 13:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489601017;
	bh=bPUAN9o8qgLsW6slwFWaQtKmTc8s3pgV8O1UZUnX4cQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gn6CAc9c8fGyUfJ1JaMIBrV8T5NFlP5q9OQAsqZ7PRpCkLG7UpHqqk6bywh22KZFm
	ZH2Yvq3E2HkNOKDcr5sQFQYcyJDl/B1urebPw4OEYKny3L9oiPd70oar3XMa38h34Y
	4Pb9D5Jx3j7o3ziEVmv9CEDdqwxeCxbfpM4O/8+s=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2FI3bgc032649
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 13:03:37 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Mar 2017 13:03:36 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2FI3Zku004972;	Wed, 15 Mar 2017 13:03:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Mar 2017 14:01:24 -0400
Message-ID: <1489600884-27644-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489600884-27644-1-git-send-email-j-stiffler@ti.com>
References: <1489600884-27644-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH 2/2] opencl-examples: add persistent examples for dra7xx
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
X-List-Received-Date: Wed, 15 Mar 2017 18:03:37 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/ocl/opencl-examples_git.bb            | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index cc1db80..fbecbc1 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
 LICENSE = "BSD"
 
 include ocl.inc
+require recipes-ti/includes/ti-paths.inc
 
 PR = "${INC_PR}.1"
 
@@ -11,6 +12,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "opencl ti-cgt6x-native clocl-native"
 
+OCL_PERSISTENT_DEPENDS = "ti-xdctools ti-ipc-rtos ti-sysbios"
+
+DEPENDS_append_dra7xx = " ${OCL_PERSISTENT_DEPENDS}"
+
 RDEPENDS_${PN} += " opencl-runtime"
 RDEPENDS_${PN}-dev += " libgomp-dev"
 
@@ -39,6 +44,17 @@ OCL_EXAMPLE_LIST = " buffer \
                      timeout \
 "
 
+OCL_PERSISTENT_EXAMPLE_LIST = " persistent_clock_concurrent \
+                                persistent_clock_spanning \
+                                persistent_common \
+                                persistent_kernel_timeout \
+                                persistent_messageq_concurrent \
+                                persistent_task_concurrent \
+                                persistent_task_spanning \
+"
+
+OCL_EXAMPLE_LIST_append_dra7xx = " ${OCL_PERSISTENT_EXAMPLE_LIST}"
+
 python do_unpack_append() {
     import shutil
 
@@ -61,6 +77,10 @@ do_configure() {
     sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc
 }
 
+export XDC_DIR = "${XDC_INSTALL_DIR}/packages"
+export IPC_DIR = "${IPC_INSTALL_DIR}/packages"
+export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}/packages"
+
 do_compile() {
     oe_runmake CC="${CC}" CPP="${CPP}" CXX="${CXX}"
 }
-- 
2.7.4


