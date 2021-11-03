Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4072.1635979059255731619
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 15:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B7C940C50;
	Wed,  3 Nov 2021 22:37:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQ-RCZWF1cEc; Wed,  3 Nov 2021 22:37:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F0CA840A3D;
	Wed,  3 Nov 2021 22:37:36 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B66E4174694;
	Wed,  3 Nov 2021 18:37:36 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] recipes: update github SRC_URIs
Date: Wed,  3 Nov 2021 18:37:30 -0400
Message-Id: <1635979050-37317-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

https://github.blog/2021-09-01-improving-git-protocol-security-github/

GitHub is deprecating unauthenticated protocols, including git:// so update
SRC_URIs with protocol=https

Explicitly pass branch=master where omitted, as bitbake now requires it.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb             | 2 +-
 meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb         | 2 +-
 meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb           | 2 +-
 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb           | 2 +-
 meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb                 | 2 +-
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb          | 2 +-
 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb             | 2 +-
 meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb       | 2 +-
 meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb                  | 2 +-
 meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb                 | 2 +-
 meta-arago-extras/recipes-graphics/glfw/glfw_git.bb                     | 2 +-
 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb                   | 2 +-
 meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb                  | 2 +-
 meta-arago-extras/recipes-support/stb/stb_git.bb                        | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
index a172c1b..cd330f5 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
 
 SRCREV = "e9c2fe4c5034a06b159cfd45dbd485755cbaf4c8"
 
-SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
+SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
            file://01-ivi-input-controller-update-to-weston-7.patch \
            file://02-ivi-id-agent-update-to-weston-7-header.patch \
            file://03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch \
diff --git a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index a792060..9f61ee5 100644
--- a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -10,7 +10,7 @@ PR = "r1"
 BRANCH ?= "master"
 SRCREV ?= "301d69899d6f4d84f143e0ed86957eea416a27a6"
 
-SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
index 9693fe6..fab2b4a 100644
--- a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
+++ b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://src/heap_test_fixture.cpp;beginline=1;endline=15;md5=
 PV = "1.0"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
 SRCREV = "bccbfbf24baccefa09439a924f61f04e82b3910a"
 
 DEPENDS = "googletest"
diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index d01833b..3cd0b8e 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -7,7 +7,7 @@ PV = "1.0+git${SRCPV}"
 
 SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
 
-SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=git"
+SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb b/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb
index 52346f1..d30d069 100644
--- a/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb
+++ b/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://src/ion_test.c;beginline=1;endline=15;md5=b225db90086
 PV = "1.0"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/glneo/ion-tests.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://github.com/glneo/ion-tests.git;protocol=https;branch=${BRANCH} \
 	file://0001-CMakeLists.txt-disable-phys-addr-for-now.patch \
 	file://0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch \
 "
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 4a1f8d7..4a59df7 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -17,7 +17,7 @@ PV_append = "+git${SRCPV}"
 SRCREV = "b6c5b174837a9ba0a743addbe58735ce6cf56b4a"
 BRANCH ?= "master"
 
-SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
+SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
 SRC_URI_prepend = "git://git.ti.com/test-automation/ltp-ddt.git;branch=${BRANCH} "
 
 export prefix = "/opt/ltp"
diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index 7216f05..7f63db3 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap4"
 BRANCH ?= "master"
 SRCREV = "ff07b6992bacb1e1586c72b7d2be469caee4a347"
 
-SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
index f17f9d6..39e180d 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -7,7 +7,7 @@ inherit go-mod
 
 GO_IMPORT = "github.com/joewalnes/websocketd"
 
-SRC_URI = "git://${GO_IMPORT}"
+SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master"
 SRCREV = "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
 
 # bitbake only exports proxy variables during fetching, but go handles
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb b/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
index 3f6594f..4cc9742 100644
--- a/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
+++ b/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
@@ -29,7 +29,7 @@ CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git \
+SRC_URI = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            "
 
diff --git a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
index 6a7796c..923af61 100644
--- a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
+++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/DentonW/DevIL"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/dentonw/devil.git;protocol=git;branch=master \
+SRC_URI = "git://github.com/dentonw/devil.git;protocol=https;branch=master \
            file://Remove-ILUT-dependency.patch"
 
 SRCREV = "e34284a7e07763769f671a74b4fec718174ad862"
diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb b/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
index 6c1206c..c4ff59f 100644
--- a/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
+++ b/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
@@ -8,7 +8,7 @@ PV = "3.2.1+git${SRCPV}"
 PR = "r0"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/glfw/glfw.git;branch=${BRANCH}"
+SRC_URI = "git://github.com/glfw/glfw.git;protocol=https;branch=${BRANCH}"
 SRCREV = "0a3c4f5d80b041ee1a12c8da3503653d98bd1a15"
 
 SRC_URI += "file://0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch"
diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index 3d94632..f1c4b01 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -7,7 +7,7 @@ PV = "2.1"
 PR = "r0"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=https;branch=${BRANCH}"
 SRCREV = "626edbe2fc845803ffdd25936e21202e4f123b63"
 
 DEPENDS = "drm python3-pybind11"
diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
index 2bac72f..02d4931 100644
--- a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
+++ b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4 \
                     file://debian/copyright;md5=332234a99007d25da40f41ee96aa388f"
 
-SRC_URI = "git://github.com/mstpd/mstpd.git;protocol=https \
+SRC_URI = "git://github.com/mstpd/mstpd.git;protocol=https;branch=master \
            file://0001-gcc8-strncpy-werror-workaround.patch"
 
 PV = "0.0.7+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-support/stb/stb_git.bb b/meta-arago-extras/recipes-support/stb/stb_git.bb
index 4181007..7b0b645 100644
--- a/meta-arago-extras/recipes-support/stb/stb_git.bb
+++ b/meta-arago-extras/recipes-support/stb/stb_git.bb
@@ -8,7 +8,7 @@ BRANCH = "master"
 SRCREV = "e6afb9cbae4064da8c3e69af3ff5c4629579c1d2"
 
 SRC_URI = " \
-    git://github.com/nothings/stb.git;branch=${BRANCH} \
+    git://github.com/nothings/stb.git;protocol=https;branch=${BRANCH} \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4

