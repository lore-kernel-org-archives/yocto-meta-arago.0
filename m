Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8EF03520DE
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2019 08:37:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8U8aRu5060411
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 03:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569832587;
	bh=j7zwwOtqRLMnHHIa1vSiznnyz2DIKPCiOtEQyYoCtYA=;
	h=From:To:CC:Subject:Date;
	b=ryNzAWNR9ysR3BxT7Aw/OjvZn6iwJmMlKEEMu8ZUb4PE6w2kxzFNaFMbEFxWBPcMW
	vdWWsHsqVNWdLcgW2N/BljBtulB07CIUw1OZJ/ycJ8FYPsWqX9ekxEK1HPaz7tZpkw
	SF9ZBR3y5GaeNf3G0Sb/P2lo9T84E4cbknmB4d/E=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8U8aRJ6011908
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 03:36:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 30 Sep 2019 03:36:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 30 Sep 2019 03:36:17 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U8aOLc115164; 
	Mon, 30 Sep 2019 03:36:25 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 30 Sep 2019 14:06:19 +0530
Message-ID: <1569832579-42422-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master PATCH v3] recipes-bsp: ivshmem-uio: Add new recipe for ivshmem-uio driver
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
X-List-Received-Date: Mon, 30 Sep 2019 08:37:38 -0000
Content-Type: text/plain

This is external kernel module which enables userspace io over the
Jailhouse ivhsmem (inter VM shared memory)
This driver is useful to test the inter VM communication.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
Changes from v2:
* Fix SUMMARY v/s DESCRIPTION

Changes from v1:
* Split the ivshmem recipe separately
* Add summary and remove PACKAGE_ARCH define

 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb

diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
new file mode 100644
index 0000000..a9f1455
--- /dev/null
+++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
@@ -0,0 +1,27 @@
+SUMMARY =  "Kernel driver for IVSHMEM based UIO driver"
+DESCRIPTION = "Kernel module which registers a UIO (userspace io) device for inter VM shared memory"
+HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
+
+inherit module
+
+RDEPENDS_${PN} = "jailhouse"
+
+PROTOCOL = "git"
+BRANCH = "jailhouse"
+SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
+SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
+
+do_compile_prepend() {
+    cd ${S}/kernel_module/uio
+}
+
+do_install() {
+    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+}
-- 
1.9.1


