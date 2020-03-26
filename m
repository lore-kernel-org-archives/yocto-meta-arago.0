Return-Path: <g-tammana@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D9D22529C9
	for <meta-arago@arago-project.org>;
	Thu, 26 Mar 2020 20:19:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02QKHXH3041390
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2020 15:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1585253853;
	bh=oLr9zQ4ccNgubvOBwvDo5FShSN+D9nQs1AjCPpf8HAU=;
	h=From:To:CC:Subject:Date;
	b=eQ3F531rKN/PM5I59Wx+ac0F1jiwVp6ivlIiF02EDrPkof+Ga1tIA01Y9oyJhNPo2
	/MNW0g+GgFZmCxuLULdMN7Si5CR+BH3vli/XOGUM4dZxXy8M4HnliOp+hODnS9d3Wz
	4Bc0lX1RIf685/3nv0/yocDQ68BZmVoaxhewkadI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02QKHXK3021867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2020 15:17:33 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 26 Mar 2020 15:17:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 26 Mar 2020 15:17:33 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02QKHX42086597;
	Thu, 26 Mar 2020 15:17:33 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 02QKHX5c068241;
	Thu, 26 Mar 2020 15:17:33 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Thu, 26 Mar 2020 15:17:32 -0500
Message-ID: <20200326201732.10236-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH v3] wayland-ivi-extension: Update to 2.2.0 version
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
X-List-Received-Date: Thu, 26 Mar 2020 20:19:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update wayland-ivi-extension to 2.2.0 version.

The version 2.2.0 supports only upto weston-6.0, for supporting
weston-7.0 the following patches were needed

[weston-7.0 support PR#110] -- https://github.com/GENIVI/wayland-ivi-extension/pull/110

  - 01-ivi-input-controller-update-to-weston-7.patch
  - 02-ivi-id-agent-update-to-weston-7-header.patch
  - 03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v3:
  - Added Upstream-Status to the individual patches

 ...-input-controller-update-to-weston-7.patch | 28 +++++++++++++++++
 ...i-id-agent-update-to-weston-7-header.patch | 30 +++++++++++++++++++
 ...te-dependencies-to-build-on-weston-7.patch | 28 +++++++++++++++++
 ....1.0.bb => wayland-ivi-extension_2.2.0.bb} |  8 +++--
 4 files changed, 91 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/01-ivi-input-controller-update-to-weston-7.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/02-ivi-id-agent-update-to-weston-7-header.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
 rename meta-arago-distro/recipes-graphics/wayland/{wayland-ivi-extension_2.1.0.bb => wayland-ivi-extension_2.2.0.bb} (77%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/01-ivi-input-controller-update-to-weston-7.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/01-ivi-input-controller-update-to-weston-7.patch
new file mode 100644
index 00000000..70756e53
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/01-ivi-input-controller-update-to-weston-7.patch
@@ -0,0 +1,28 @@
+From efdd2a85519d4990596194af5bf50636d2610f09 Mon Sep 17 00:00:00 2001
+From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
+Date: Mon, 6 Jan 2020 06:41:57 -0500
+Subject: [PATCH] ivi-input-controller: update to weston 7 header files
+
+update the header file path.
+
+Upstream-Status: Submitted [https://github.com/GENIVI/wayland-ivi-extension/pull/110]
+
+Signed-off-by: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
+Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+---
+ .../ivi-input-controller/src/ivi-input-controller.c             | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c b/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c
+index a0bfc48..257a1dc 100644
+--- a/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c
++++ b/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c
+@@ -31,7 +31,7 @@
+ #include <fcntl.h>
+ #include <unistd.h>
+ 
+-#include "plugin-registry.h"
++#include <libweston/plugin-registry.h>
+ #include "ilm_types.h"
+ 
+ #include "ivi-input-server-protocol.h"
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/02-ivi-id-agent-update-to-weston-7-header.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/02-ivi-id-agent-update-to-weston-7-header.patch
new file mode 100644
index 00000000..8c7189e2
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/02-ivi-id-agent-update-to-weston-7-header.patch
@@ -0,0 +1,30 @@
+From 5abb2b497e0153210d41ec3685dc0152587625fa Mon Sep 17 00:00:00 2001
+From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
+Date: Mon, 6 Jan 2020 06:45:11 -0500
+Subject: [PATCH] ivi-id-agent: update to weston 7 header files
+
+update the header file path.
+
+Upstream-Status: Submitted [https://github.com/GENIVI/wayland-ivi-extension/pull/110]
+
+Signed-off-by: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
+Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+---
+ ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c b/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c
+index 8f0c199..b80e2a4 100644
+--- a/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c
++++ b/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c
+@@ -26,8 +26,8 @@
+ #include <limits.h>
+ 
+ #include <weston.h>
+-#include <libweston-6/libweston-desktop.h>
+-#include "config-parser.h"
++#include <libweston-desktop/libweston-desktop.h>
++#include <libweston/config-parser.h>
+ #include <weston/ivi-layout-export.h>
+ 
+ #ifndef INVALID_ID
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
new file mode 100644
index 00000000..1b5f64e4
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
@@ -0,0 +1,28 @@
+From b99082adfaf250b15f03345cdf1b433fb1575581 Mon Sep 17 00:00:00 2001
+From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
+Date: Mon, 6 Jan 2020 06:45:54 -0500
+Subject: [PATCH] ivi-id-agent: update dependencies to build on weston 7
+
+upgrade libweston-desktop version.
+
+Upstream-Status: Submitted [https://github.com/GENIVI/wayland-ivi-extension/pull/110]
+
+Signed-off-by: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
+Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+---
+ ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt b/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt
+index 3e604a5..ff47808 100644
+--- a/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt
++++ b/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt
+@@ -25,7 +25,7 @@ find_package(PkgConfig REQUIRED)
+ pkg_check_modules(WAYLAND_SERVER wayland-server REQUIRED)
+ pkg_check_modules(WESTON weston>=6.0.0 REQUIRED)
+ pkg_check_modules(PIXMAN pixman-1 REQUIRED)
+-pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-6 REQUIRED)
++pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-7 REQUIRED)
+ 
+ find_package(Threads REQUIRED)
+ 
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
similarity index 77%
rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
index 7d9faee4..0b20b91b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
@@ -5,10 +5,12 @@ BUGTRACKER = "http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Exten
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
 
-SRCREV = "d2c2e262f3bdc9db33b3014293fcdbcfdc90ab27"
+SRCREV = "e9c2fe4c5034a06b159cfd45dbd485755cbaf4c8"
 
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
-           file://force-type-conversion.patch \
+           file://01-ivi-input-controller-update-to-weston-7.patch \
+           file://02-ivi-id-agent-update-to-weston-7-header.patch \
+           file://03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch \
     "
 
 S = "${WORKDIR}/git"
@@ -25,7 +27,7 @@ FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
 
 EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
-PR = "r1"
+PR = "r0"
 
 # Need these temporarily to prevent a non-fatal do_package_qa issue
 INSANE_SKIP_${PN} += "dev-deps"
-- 
2.17.1


