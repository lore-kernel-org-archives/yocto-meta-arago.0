Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 9F43C52A88
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINY1i024517
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709414;
	bh=rI61hqo0L1Y+Wp4a3j6K8Y4FR3Z6x6lnrAqF1EsUv44=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zEwx2u8figQlF2Vlej/jUKD6yRA3QQw8R1ynalKubCiW2VS/bt3fKzP628zKGJqFA
	BUaElseNdsAsBLzoc+c1cCpmqH4rr8nLJDTCw9+GjR3T7lXsEMHSqZEpXd5Sv4W+0p
	NCYzGT7bn8c7jTmYx+za2nZD8OaNvcNDhhchjX98=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINYCA010216
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:34 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8V006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:10 -0400
Message-ID: <1506709407-16448-7-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 06/ti-xsgx-ddk-um: sgx ddk um recipe for X11 support
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:38 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../libgles/ti-xsgx-ddk-um_1.15.4564147.bb         | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb

diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
new file mode 100644
index 0000000..c959e14
--- /dev/null
+++ b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
@@ -0,0 +1,86 @@
+SUMMARY = "X11 Userspace libraries for PowerVR SGX chipset on TI SoCs"
+HOMEPAGE = "https://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH = "ti-img-sgx/${PV}"
+
+SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"
+SRCREV = "c00eb002f624cddac4956c901314c07d83a13260"
+
+# There's only hardfp version available
+python __anonymous() {
+    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+    if not tunes:
+        return
+    pkgn = bb.data.getVar("PN", d, 1)
+    pkgv = bb.data.getVar("PV", d, 1)
+    if "callconvention-hard" not in tunes:
+        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+}
+
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
+
+INITSCRIPT_NAME = "rc.pvr"
+INITSCRIPT_PARAMS = "defaults 8"
+
+inherit update-rc.d
+
+PR = "r0"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-xsgx-ddk-um-linux"
+
+DEPENDS += "udev"
+RDEPENDS_${PN} += "libudev"
+
+
+RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-xsgx-ddk-um-linux"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-xsgx-ddk-um-linux-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-xsgx-ddk-um-linux-dbg"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2 omap5-xsgx-ddk-um-linux"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-xsgx-ddk-um-linux-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-xsgx-ddk-um-linux-dbg"
+
+RCONFLICTS_${PN} = "libegl libgles1 libgles2 omap5-xsgx-ddk-um-linux"
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-xsgx-ddk-um-linux-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-xsgx-ddk-um-linux-dbg"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
+}
+
+SYSROOT_DIRS_append = "/usr/local"
+
+FILES_${PN} +=  "/usr/local/*"
+
+FILES_${PN}-staticdev +=  "/usr/local/*"
+
+PACKAGES =+ "${PN}-plugins"
+FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
+FILES_${PN}-plugins += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/modules/*.so /usr/local/XSGX/lib/xorg/modules/drivers/*.so /usr/local/XSGX/lib/xorg/modules/extensions/*.so /usr/local/XSGX/lib/xorg/modules/input/*.so"
+FILES_${PN}-staticdev += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/modules/*.so /usr/local/XSGX/lib/xorg/modules/drivers/*.so /usr/local/XSGX/lib/xorg/modules/extensions/*.so /usr/local/XSGX/lib/xorg/modules/input/*.so"
+RDEPENDS_${PN} += "${PN}-plugins"
+
+SYSROOT_DIRS_BLACKLIST_append = " /usr/local/XSGX/lib/libpng12.a /usr/local/XSGX/lib/libpng12.so /usr/local/XSGX/lib/libpng12.so.0  /usr/local/XSGX/lib/libpng12.so.0.56.0"
+
+
+ALLOW_EMPTY_${PN}-plugins = "1"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+
+INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
+INSANE_SKIP_${PN}-plugins = "dev-so"
+INSANE_SKIP_${PN}-dev = "dev-so"
+INSANE_SKIP_${PN}-staticdev = "dev-so"
+INSANE_SKIP_${PN} += "already-stripped"
+
+CLEANBROKEN = "1"
+
-- 
1.9.1


