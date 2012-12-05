Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A2D68529E1
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2012 19:54:29 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB5JsTb1015203
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 13:54:29 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB5JsTiT026424
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 13:54:29 -0600
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 5 Dec 2012 13:54:28 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qB5JsSJp007119	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 13:54:28 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qB5JsSw03235	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 13:54:28 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id 255CD110604A	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 14:54:28 -0500 (EST)
Message-ID: <50BFA673.6040800@ti.com>
Date: Wed, 5 Dec 2012 14:54:27 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
Subject: [PATCH] Define arago-test-image
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
X-List-Received-Date: Wed, 05 Dec 2012 19:54:30 -0000
X-Groupsio-MsgNum: 646
Content-Type: multipart/mixed; boundary="------------050304040809050604040208"

--------------050304040809050604040208
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This filesystem image includes test appplications used by
Linux validation team.

Please consider it for meta-arago project. Thanks,
Carlos





--------------050304040809050604040208
Content-Type: text/x-patch; name="0001-Define-arago-test-image.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-Define-arago-test-image.patch"

From 3b2e5e76100574e64bfb6d90035e2fa88236fc67 Mon Sep 17 00:00:00 2001
From: Carlos Hernandez <ceh@ti.com>
Date: Tue, 4 Dec 2012 15:31:40 -0500
Subject: [PATCH 01/12] Define arago-test-image

This filesystem image includes test appplications used by
Linux validation team

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-core/images/arago-test-image.bb        |   21 ++++++++
 .../recipes-core/tasks/task-arago-test-addons.bb   |   49 ++++++++++++++++++++
 2 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-test-image.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-test-addons.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb b/meta-arago-distro/recipes-core/images/arago-test-image.bb
new file mode 100644
index 0000000..9cf07f9
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
@@ -0,0 +1,21 @@
+# Arago System Test image
+# gives you test applications
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+require arago-image.inc
+
+COMPATIBLE_MACHINE = "omap3|dm365|omapl138|ti813x|ti814x|ti816x|omap4|ti33x"
+
+IMAGE_INSTALL += "\
+    task-arago-base \
+    task-arago-console \
+    task-arago-base-tisdk \
+    task-arago-tisdk-connectivity \
+    task-arago-tisdk-crypto \
+    task-arago-tisdk-multimedia \
+    task-arago-test \
+    task-arago-test-addons \
+    "
+
+export IMAGE_BASENAME = "arago-test-image"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-test-addons.bb b/meta-arago-distro/recipes-core/tasks/task-arago-test-addons.bb
new file mode 100644
index 0000000..08d80f1
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-test-addons.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "Task to install additional utilities/demos for test image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+ALLOW_EMPTY = "1"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+
+TEST_ADDONS = " \
+    dt \
+    gdbserver \
+    oprofile \
+    nbench-byte \
+    trace-cmd \
+    bridge-utils \
+    "
+
+TEST_ADDONS_TI = " \
+    "
+
+# Add am-benchmarks for supported devices.
+TEST_ADDONS_TI_append_omapl138 = " arm-benchmarks"
+TEST_ADDONS_TI_append_omap3 = " arm-benchmarks"
+TEST_ADDONS_TI_append_ti33x = " arm-benchmarks"
+TEST_ADDONS_TI_append_ti811x = " arm-benchmarks"
+TEST_ADDONS_TI_append_ti813x = " arm-benchmarks"
+TEST_ADDONS_TI_append_ti814x = " arm-benchmarks"
+TEST_ADDONS_TI_append_ti816x = " arm-benchmarks"
+TEST_ADDONS_TI_append_dm365 = " arm-benchmarks"
+
+# Add PRU examples for am180x-evm devices
+TEST_ADDONS_TI_append_am180x-evm = " ti-pru-sw-examples"
+
+CRYPTO_SUPPORT_TSU = "\
+    openssl \
+    wpa-supplicant \
+    dropbear \
+    openssh-sftp-server \
+    openssl-misc \
+    "
+
+RDEPENDS_${PN} = "\
+    ${TEST_ADDONS} \
+    ${TEST_ADDONS_TI} \
+    ${CRYPTO_SUPPORT_TSU} \
+    "
-- 
1.7.0.4


--------------050304040809050604040208--
