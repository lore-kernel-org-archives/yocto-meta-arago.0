Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 324A7520E2
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2019 14:30:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PESvbq007241
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 09:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569421737;
	bh=c2dFw/UfDLT3gawxHvOBYKaeFuWxq9MVXxt6Cm8vBvo=;
	h=From:To:CC:Subject:Date;
	b=wqe9nsBARot+68X+86qVtpMIzdENMHYUd1VkMNq1E4KMcjL0v9+JpjfUto4Sf0sm5
	pAb04CwRzYaE8TiePW/q85bFjXfdiXfUNI9UCrjOGmFUjyebyNz1tPWGYBAHsp9zNf
	r5k5Jzo8yRTfAorCv6yOAI2paRCicHhN73Jr9pOw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PESvb1037138
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 09:28:57 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 25 Sep 2019 09:28:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 25 Sep 2019 09:28:57 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PEStXn115659; 
	Wed, 25 Sep 2019 09:28:55 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <j-stiffler@ti.com>
Date: Wed, 25 Sep 2019 19:58:49 +0530
Message-ID: <1569421729-57631-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master PATCH v1] recipes-kernel: Add recipe for ivshmem-uio driver
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
X-List-Received-Date: Wed, 25 Sep 2019 14:30:07 -0000
Content-Type: text/plain

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc       |  4 ++++
 .../recipes-kernel/uio/ivshmem-uio-driver_git.bb   | 27 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 9e105b8..970e3e2 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -374,6 +374,10 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/extra-drivers/${PN}-${PV}"
 CREATE_SRCIPK_pn-uio-module-drv = "1"
 SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/extra-drivers/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-ivshmem-uio-driver = "1"
+SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver = "true"
+
 CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
 SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb b/meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb
new file mode 100644
index 0000000..f41842b
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION =  "Kernel drivers IVSHMEM UIO driver"
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
+PACKAGE_ARCH = "${MACHINE_ARCH}"
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


