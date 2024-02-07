Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08283C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 19:30:10 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.7333.1707334200785076821
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 11:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C4tSKGt2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 417JU0A9095448
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Feb 2024 13:30:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707334200;
	bh=vdrdqX1LrJVWAc7P+bkfluKRKeyA3+TQm9lFPgLR/74=;
	h=From:To:CC:Subject:Date;
	b=C4tSKGt22kEOmEFHnnGzyPKCqHUNJn3m0THYd3hnavLycJELW3jcyAbdTGvyuFoB1
	 puDUjOnNP/UkB4MT3pcb7gA7ObIvmvwgTMpeX+Iilk1jUZ7k5mXqb2bAKVeZzCaBDU
	 oeWqmvGcbacUp6p4EygdKk8AlMIo9vaVIbKdF664=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 417JU0Fs119467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Feb 2024 13:30:00 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Feb 2024 13:29:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Feb 2024 13:29:59 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 417JTvEZ001447;
	Wed, 7 Feb 2024 13:29:58 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>,
        Bhavya Kapoor
	<b-kapoor@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH v3] systemd: Add udev rules for persistent naming of the can devices
Date: Thu, 8 Feb 2024 00:59:50 +0530
Message-ID: <20240207192950.1761572-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 19:30:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15125

When multiple CAN's are present, then names that are getting assigned
change after every boot even after providing alias in the device
tree.
So add udev rules to specify the interface name to use for
each mcan device, to make it persistent across reboots.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
v3: Fix typos in the filename being installed in v2
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
index f38606f2..248ad5e4 100644
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
+    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:am62pxx() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:am62axx() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:am64xx() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+do_install:append:j722s() {
+    install -d ${D}/${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/37-can.rules
+}
+
+FILES:udev += "${libdir}/udev/rules.d/37-can.rules"
+
-- 
2.34.1


