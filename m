Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2195.1643826395772768744
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Z3tgFqHV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IQXNr089103;
	Wed, 2 Feb 2022 12:26:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826393;
	bh=IsFq+HMf2mvJptJhhWGkGfhin27ldpXdbfXTmXFYogU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Z3tgFqHVWxvms9wqzL0+T1wqPYA8422eWF9/9gnm5OuivmDjKn9yjN3Sqq/PHN1w9
	 mSseLjfXi907j19qBhngXqsx4/4U6xHrF+6TvpNotvbrTQ26G/OQLMN6/3FcJlFMtl
	 EVUNfoFRj+uKfZaO9+7Hhqx5ir0/fqYuHBFJvuak=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IQXBA055739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:26:33 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:26:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:26:31 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IQVcO078986;
	Wed, 2 Feb 2022 12:26:31 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKKt-0007YP-GQ; Wed, 02 Feb 2022 12:26:31 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 08/12] recipes-bsp: Add cnm-wave-fw firmware recipe
Date: Wed, 2 Feb 2022 12:26:26 -0600
Message-ID: <20220202182630.28943-9-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202182630.28943-1-reatmon@ti.com>
References: <20220202182630.28943-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nishanth Menon <nm@ti.com>

Add firmware recipe to add the Wave521cl firmware pieces in for j7
platform.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 41 ++++++++++++++++++++++
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc    |  1 +
 recipes-kernel/linux/kernel-rdepends.inc   |  3 ++
 3 files changed, 45 insertions(+)
 create mode 100644 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb

diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
new file mode 100644
index 00000000..6a36d733
--- /dev/null
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Chips&Media codec firmware files"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+inherit deploy
+inherit update-alternatives
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
+
+PV = "${CNM_WAVE521_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "j7"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+TARGET_WAVE215C = "wave521c_codec_fw.bin"
+
+ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE215C}"
+ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE215C}"
+ALTERNATIVE_PRIORITY = "10"
+
+# Set up names for the firmwares
+ALTERNATIVE_${PN}_j7 = "\
+                    wave521c_codec_fw.bin"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware/cnm
+	install -m 0644 ${S}/cnm/${TARGET_WAVE215C} ${D}${base_libdir}/firmware/cnm/${TARGET_WAVE215C}
+}
+
+# make sure that lib/firmware, and all its contents are part of the package
+FILES_${PN} = "${base_libdir}/firmware"
+
+# we don't want to configure and build the source code
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f1607686..9bd2d0a8 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,6 +17,7 @@ PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.07"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
 IMG_DEC_FW_VERSION = "1.0"
+CNM_WAVE521_FW_VERSION = "1.0.00"
 
 TI_LINUX_FW_SRCREV ?= "c96a734a059889e571dcf30c0638157c690a6e6e"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 76b7a508..2a6302af 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -42,3 +42,6 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
 
 # Add run-time dependency for Video Decoding firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
+
+# Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cnm-wave-fw"
-- 
2.17.1

