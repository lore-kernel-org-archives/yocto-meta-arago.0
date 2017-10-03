Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 1755052A58
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsGl7005794
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046056;
	bh=jS1tLNMy4zZncZ2uwtEBDnRdxEk5U4WOkZiurGJFxEE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lFeVx/rKKQrFnkzweZtfLGSeV4eDgN8ggPVOz8NoR6EhK4yEC1R0wdCoW7PhAzTqW
	ktCp6VdM6QHaEWSlMFUFC7SunxLhrTcYa5fMnlcwIJPYsuxnQ8A0fAXmz275UP6kuE
	h0t9ab+mDwgr5aMnE1pYw4iJ45IvjPdI2c6S8kSw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsGq7013447
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:16 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:15 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFRw013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:15 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:53:49 -0400
Message-ID: <1507046051-57949-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 01/23] ti-xsgx-ddk-km: sgx ddk km recipe for X11 support
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:16 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb

diff --git a/recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb b/recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb
new file mode 100644
index 0000000..5be6fd6
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb
@@ -0,0 +1,43 @@
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
-- 
1.9.1


