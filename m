Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 596CD52961
	for <meta-arago@arago-project.org>;
	Mon, 26 Jun 2017 17:43:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5QHhOA3010727
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 12:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498499004;
	bh=98tfVWSdihMgkjsSXJ5kNQrha1A77FbREd0emOVumYo=;
	h=From:To:CC:Subject:Date;
	b=Hq/5qIpJTOq5lGdLghUVO1kdx+v/csDYQ3zGCrL99sPT7iDmtJtnhZCSrR8Pu4lIO
	tj9q+B7jXCSVowb6GEvUnwrEOnOGCxfYcnmn4mOQRQ/IbO1MyDSKrjsL6Gv+mMz1Zv
	D//HclRvEI8PHVpzfo99e3S1aN4LwBu1KkiFRBtY=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QHhJfs009969
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 12:43:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Jun 2017 12:43:18 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5QHhIYE027938;	Mon, 26 Jun 2017 12:43:18 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 26 Jun 2017 13:43:16 -0400
Message-ID: <1498498997-30316-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v3 1/2] big-data-ipc-demo: Add ipc examples for big data buffer exchange
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
X-List-Received-Date: Mon, 26 Jun 2017 17:43:34 -0000
Content-Type: text/plain

Adds example with host running linux
Demonstrates transfer of Big data buffers between A15 host and DSP core

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
- Expand to am57xx-evm to omap-a15
- Remove ti-staging.inc
---
---
 .../big-data-ipc-demo-linux_git.bb                 | 41 ++++++++++++++++++++++
 .../big-data-ipc-demo/big-data-ipc-demo.inc        | 39 ++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
 create mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc

diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
new file mode 100644
index 0000000..0734177
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
@@ -0,0 +1,41 @@
+SUMMARY = "TI Big data IPC: Host linux examples"
+
+require recipes-ti/includes/ti-paths.inc
+require big-data-ipc-demo.inc
+
+DEPENDS = "ti-ipc \
+           ti-xdctools \
+           ti-sysbios \
+           ti-ipc-rtos \
+           cmem \
+"
+
+EXTRA_OEMAKE = "\
+    PLATFORM=${PLATFORM} \
+    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
+    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
+    IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+    LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+    ${IPC_TARGETS} \
+    JOBS="${PARALLEL_MAKE}" \
+"
+
+do_create_srcipk_prepend() {
+  rm -rf host_bios
+}
+
+do_compile() {
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+      oe_runmake host_linux
+  fi
+}
+
+do_install() {
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake EXEC_DIR="${D}${bindir}" install_linux_bin
+  fi
+}
+
+PACKAGES =+ "${PN}-firmware"
+FILES_${PN}-firmware += "${bindir}/simple_buffer_example/release/server_dsp.xe66"
+INSANE_SKIP_${PN}-firmware += "arch"
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
new file mode 100644
index 0000000..c3f8f38
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
@@ -0,0 +1,39 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc7807ece7adcc2c43a"
+
+COMPATIBLE_MACHINE = "omap-a15|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git"
+BIG_DATA_IPC_GIT_PROTOCOL = "git"
+BIG_DATA_IPC_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.01.00.00"
+BIG_DATA_IPC_SRCREV = "5907bff5a29fe2ba8719ae8c3c5d62b20b7b6bc9"
+
+BRANCH = "${BIG_DATA_IPC_GIT_BRANCH}"
+SRC_URI = "${BIG_DATA_IPC_GIT_URI};protocol=${BIG_DATA_IPC_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${BIG_DATA_IPC_SRCREV}"
+PV = "01.01.00.00"
+
+S = "${WORKDIR}/git"
+
+PLATFORM = "UNKNOWN"
+PLATFORM_omap-a15 = "DRA7XX"
+PLATFORM_k2hk-evm = "TCI6636"
+PLATFORM_k2l-evm = "TCI6630"
+PLATFORM_k2e = "66AK2E"
+PLATFORM_k2g = "66AK2G"
+
+IPC_TARGETS = ""
+IPC_TARGETS_omap-a15 = "\
+    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
+"
+
+IPC_TARGETS_keystone = " \
+    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+"
-- 
1.9.1


