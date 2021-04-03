Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1726152A4E
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9F68940BE8;
	Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rQeNxFFu5uYy; Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 890A140C82;
	Sat,  3 Apr 2021 00:11:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 533E917457C;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:19 -0400
Message-Id: <1617408644-2675-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 04/29] recipes: fix trailing slash in path warning
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:45 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

The warning was introduced to curb potential issues with duplicate slash in path:
https://git.openembedded.org/openembedded-core/commit/?id=8a4c473c07cba159cf88ed775b9f073c6adf31d4

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb          | 2 +-
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb        | 2 +-
 meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb       | 2 +-
 meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb          | 2 +-
 .../recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb           | 2 +-
 meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb              | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
index bb1ae13..cfed017 100644
--- a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
+++ b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
@@ -10,4 +10,4 @@ BRANCH ?= "master"
 SRCREV = "e58f941784fb45fd826779a45b33973e6342700f"
 SRC_URI = "git://arago-project.org/git/projects/oe-layersetup.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 886a8b5..d6f3dc2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -8,7 +8,7 @@ BRANCH ?= "master"
 SRCREV = "42a8379fda829f34c374ddfca0242a479a84d454"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
index 7bbfa32..26a567b 100644
--- a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
@@ -15,7 +15,7 @@ SRCREV = "d9a2f2e27f59f3bbcde91efc6afba8cd04f3b4be"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/image-gallery.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 do_install() {
 	install -d ${D}/${bindir}
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index 22c0023..ba96fa6 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -21,7 +21,7 @@ SRCREV = "665bff9a7bc0dbf82f9d6a58ff2778c03fe04fd1"
 
 SRC_URI = "git://git.ti.com/apps/thermostat-demo.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 DESKTOP_FILE = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'thermostat_demo_qt5.desktop', 'thermostat_demo.desktop', d)}"
 
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index 3cfa332..97ed022 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -12,7 +12,7 @@ SRCREV = "6f4b09fffe970bb6b448369875874e798ef282f6"
 
 SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 do_compile() {
     export CROSS_COMPILE=${TARGET_PREFIX}
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
index 72ef877..c4c6604 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -7,7 +7,7 @@ require ./tidl-utils.inc
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
 
-S = "${WORKDIR}/git/src/importTool/"
+S = "${WORKDIR}/git/src/importTool"
 
 DEPENDS = "protobuf zlib protobuf-native flatbuffers tensorflow-lite flatbuffers-native tensorflow-lite-native"
 
-- 
2.7.4


