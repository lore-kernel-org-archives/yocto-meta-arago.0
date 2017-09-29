Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5A61552ACA
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINdhI018710
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709419;
	bh=3hCdnTTw+tEvsQMOW482KbgE1MG9onxfm2ja0DgV7vk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xAJ99HhUrV+bU60q6gGiselWEXhAkxnxIj6TPJ7UOb5XXUh4DH+8SNubG6Nc1Wdbl
	ko7mg5kqy4NnOCHgRdgGJDefhaE7mrTYcT5pjEZQixqqlqNo/V8kT6+sCP8JlSR9l1
	BhyiGX0/vIacagF30htHkCE/AbUeMcXsuVb1riTg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINY1S010206
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:33 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8U006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:33 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:09 -0400
Message-ID: <1506709407-16448-6-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 05/ti-xsgx-ddk-km: sgx ddk km recipe for X11 support
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:50 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb

diff --git a/recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb b/recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb
new file mode 100644
index 0000000..d51d9df
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb
@@ -0,0 +1,46 @@
+DESCRIPTION =  "X11 Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
+HOMEPAGE = "https://git.ti.com/processor-sdk/omap5-sgx-ddk-linux-x11-experimental"
+LICENSE = "MIT | GPLv2"
+LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
+
+inherit module
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+
+MACHINE_KERNEL_PR_append = "m"
+PR = "${MACHINE_KERNEL_PR}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "virtual/kernel"
+
+PROVIDES = "omapdrm-pvr"
+
+RPROVIDES_${PN} = "omapdrm-pvr"
+RREPLACES_${PN} = "omapdrm-pvr"
+RCONFLICTS_${PN} = "omapdrm-pvr"
+
+BRANCH = "ti-img-sgx/${PV}/k4.9"
+
+SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "24ae481718cc24dc2da55c89b53c39558e32061e"
+
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
+
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
+
+do_compile_prepend() {
+    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
+}
+
+do_install() {
+    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+}
+
+
+
-- 
1.9.1


