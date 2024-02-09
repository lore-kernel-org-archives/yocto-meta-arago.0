Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8FBC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 05:34:04 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5510.1707456836947249819
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 21:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DIn9vS8n;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4195XuHX118699
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Feb 2024 23:33:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707456836;
	bh=+JzzAkqkrphbyHMG+SXtX2VRT8vXzfaoGdXsFD5VAa0=;
	h=From:To:CC:Subject:Date;
	b=DIn9vS8nu10fnNusAeHPg5/9nvkgeiwQe/04lAC9VcKSoOf26ZooLmJnIPmQ8y49E
	 JoWL/ttZ30Tk+f0LR7Wi1D3hFV8Y2y55Yg3aI5wiGJtUktEKwSKa/cZzEDXebryRtl
	 3uz/tWVGm0xw51WicmLz+QnZDxxJOwQPdmxRp1MI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4195Xuh1050733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Feb 2024 23:33:56 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 23:33:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 23:33:55 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4195Xsqr035322;
	Thu, 8 Feb 2024 23:33:54 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>,
        Bhavya Kapoor
	<b-kapoor@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH v5] systemd: Add udev rules for persistent naming of the can devices
Date: Fri, 9 Feb 2024 11:03:51 +0530
Message-ID: <20240209053351.2100025-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 05:34:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15145

When multiple CAN's are present, then names that are getting assigned
change after every boot even after providing alias in the device
tree.
So add udev rules to specify the interface name to use for
each mcan device, to make it persistent across reboots.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
v5: Just simply package all udev rules for all platforms
v4: 
    - Reformat patch to avoid repeated code for k3 devices
    - Add udev rules for dra7xx and ti33x too, as suggested
    - Still keeping separate files per platform to avoid potential
      confusion created by merging all the rules into one file
v3: Fix typos in the filename being installed in v2
v2:
    - Switch to udev rules instead of systemd network links, as per
      feedback from v1: https://lists.yoctoproject.org/g/meta-arago/message/15104
    - Also, extend to Sitara devices as well
---
 .../systemd/systemd/37-can-am62.rules         |  4 ++++
 .../systemd/systemd/37-can-dra7.rules         |  2 ++
 .../systemd/systemd/37-can-j7.rules           | 20 +++++++++++++++++++
 .../systemd/systemd/37-can-ti33x.rules        |  2 ++
 .../recipes-core/systemd/systemd_%.bbappend   | 18 +++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
new file mode 100644
index 00000000..59dc8075
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
@@ -0,0 +1,4 @@
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e08000.can", NAME="mcu_mcan0"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e18000.can", NAME="mcu_mcan1"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="20701000.can", NAME="main_mcan0"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="20711000.can", NAME="main_mcan1"
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
new file mode 100644
index 00000000..3b14150d
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
@@ -0,0 +1,2 @@
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="4ae3c000.can", NAME="main_dcan1"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="48480000.can", NAME="main_dcan2"
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
new file mode 100644
index 00000000..f2804ecd
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
@@ -0,0 +1,20 @@
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="40528000.can", NAME="mcu_mcan0"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="40568000.can", NAME="mcu_mcan1"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2701000.can", NAME="main_mcan0"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2711000.can", NAME="main_mcan1"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2721000.can", NAME="main_mcan2"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2731000.can", NAME="main_mcan3"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2741000.can", NAME="main_mcan4"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2751000.can", NAME="main_mcan5"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2761000.can", NAME="main_mcan6"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2771000.can", NAME="main_mcan7"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2781000.can", NAME="main_mcan8"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2791000.can", NAME="main_mcan9"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="27a1000.can", NAME="main_mcan10"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="27b1000.can", NAME="main_mcan11"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="27c1000.can", NAME="main_mcan12"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="27d1000.can", NAME="main_mcan13"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2681000.can", NAME="main_mcan14"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="2691000.can", NAME="main_mcan15"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="26a1000.can", NAME="main_mcan16"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="26b1000.can", NAME="main_mcan17"
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
new file mode 100644
index 00000000..62d650fe
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
@@ -0,0 +1,2 @@
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="481cc000.can", NAME="main_dcan0"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="481d0000.can", NAME="main_dcan1"
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index f38606f2..40aa393b 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -12,6 +12,10 @@ SRC_URI:append = " \
     file://60-usb.network \
     file://sync-clocks.service \
     file://timesyncd.conf \
+    file://37-can-j7.rules \
+    file://37-can-am62.rules \
+    file://37-can-dra7.rules \
+    file://37-can-ti33x.rules \
 "
 
 do_install:append() {
@@ -42,4 +46,18 @@ do_install:append() {
 
     install -d ${D}${sysconfdir}/systemd/
     install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
+
+    install -d ${D}${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules.d/
 }
+
+FILES:udev += " \
+    ${libdir}/udev/rules.d/37-can-j7.rules \
+    ${libdir}/udev/rules.d/37-can-am62.rules \
+    ${libdir}/udev/rules.d/37-can-dra7.rules \
+    ${libdir}/udev/rules.d/37-can-ti33x.rules \
+"
+
-- 
2.34.1


