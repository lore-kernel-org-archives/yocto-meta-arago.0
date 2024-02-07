Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022EDC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 19:23:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7295.1707333813966997628
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 11:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qtdNXp4S;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 417JNXxu001164
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Feb 2024 13:23:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707333813;
	bh=YSTEGBMOOv+vsnenehypjdp51zB4QmmKKGP5FCS8zYg=;
	h=From:To:CC:Subject:Date;
	b=qtdNXp4S3rpoA8s1ucktri6XPyvj2tzHgoFamFw26l3nwSn/3EZ60jq+/g3ug1Lci
	 wxyIt2SCmBa07oZk5IPdph4KKx2J2F3DDh2NkN7PUWVge4nVOTY4pEBQ+mRkmLrPuT
	 L2BajGWhGTc58ODH5OzJbTG10Ljc/+RkOBVdlRD8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 417JNX2o123563
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Feb 2024 13:23:33 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Feb 2024 13:23:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Feb 2024 13:23:32 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 417JNVh4124055;
	Wed, 7 Feb 2024 13:23:31 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>,
        Bhavya Kapoor
	<b-kapoor@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH v2] systemd: Add udev rules for persistent naming of the can devices
Date: Thu, 8 Feb 2024 00:52:54 +0530
Message-ID: <20240207192254.1758336-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 19:23:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15124

When multiple CAN's are present, then names that are getting assigned
change after every boot even after providing alias in the device
tree.
So add udev rules to specify the interface name to use for
each mcan device, to make it persistent across reboots.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
v2:
    - Switch to udev rules instead of systemd network links, as per
      feedback from v1: https://lists.yoctoproject.org/g/meta-arago/message/15104
    - Also, extend to Sitara devices as well
---
 .../systemd/systemd/k3/37-can-am62.rules      |  4 ++
 .../systemd/systemd/k3/37-can-j7.rules        | 20 +++++++
 .../recipes-core/systemd/systemd_%.bbappend   | 58 +++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
new file mode 100644
index 00000000..59dc8075
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-am62.rules
@@ -0,0 +1,4 @@
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e08000.can", NAME="mcu_mcan0"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e18000.can", NAME="mcu_mcan1"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="20701000.can", NAME="main_mcan0"
+SUBSYSTEM=="net", ACTION=="add", KERNELS=="20711000.can", NAME="main_mcan1"
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
new file mode 100644
index 00000000..f2804ecd
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/k3/37-can-j7.rules
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
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index f38606f2..04460220 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -14,6 +14,11 @@ SRC_URI:append = " \
     file://timesyncd.conf \
 "
 
+SRC_URI:append:k3 = " \
+    file://37-can-j7.rules \
+    file://37-can-am62.rules \
+"
+
 do_install:append() {
     install -d ${D}${sysconfdir}/udev/rules.d/
     install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
@@ -43,3 +48,56 @@ do_install:append() {
     install -d ${D}${sysconfdir}/systemd/
     install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
 }
+
+do_install:append:j721e() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:j7200() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:j721s2() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:j784s4() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:am65xx() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:am62xx() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-am62xx.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:am62pxx() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-am62xx.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:am62axx() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-am62xx.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:am64xx() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-am62xx.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:j722s() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-am62xx.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+FILES:udev += "${libdir}/udev/rules.d/37-can.rules"
+
-- 
2.34.1


