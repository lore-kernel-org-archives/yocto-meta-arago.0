Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C991DC7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:06:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.22920.1750874773476377236
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=u+OWxctB;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6CtD2245812;
	Wed, 25 Jun 2025 13:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874772;
	bh=86ZT3ZwE6RKl0vXO3XdHIaaNyf1L1XKTmPNWrtMeqd4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=u+OWxctBhEn/bbGfNbiFj+RKJN5calMDDEmINcXeDDQjW9GBvSe1nkYTDNsiJwj7n
	 3zBgZvfGpTFcUPNljYx1xjbdj6Oe1eC8jW1PKnkp/WUavRTTWaSe4KhMNFxJoPcvZq
	 23H1wzm4FkIwyyzMbemeuP8LOMVl+cqXs6bJhDJs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6BV21487168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:11 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6Bd83810813;
	Wed, 25 Jun 2025 13:06:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUVf-0004bM-3L; Wed, 25 Jun 2025 13:06:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/5] meta-arago/all: remove S in recipes that fetch from git via setting BB_GIT_DEFAULT_DESTSUFFIX
Date: Wed, 25 Jun 2025 13:06:07 -0500
Message-ID: <20250625180610.17641-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250625180610.17641-1-reatmon@ti.com>
References: <20250625180610.17641-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:06:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16271

Removing all the S = ${WORKDIR}/git assignments works because BB_GIT_DEFAULT_DESTSUFFIX
is set to match S from bitbake.conf (which itself is set to match typical tarball
releases).

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb     | 1 -
 .../recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb   | 2 --
 .../recipes-core/oprofile-example/oprofile-example_git.bb     | 2 --
 .../arm-compute-library/arm-compute-library_24.12.bb          | 2 --
 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb       | 2 --
 .../recipes-devtools/cmake/extra-cmake-modules.bb             | 1 -
 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb | 2 --
 meta-arago-extras/recipes-devtools/statcol/statcol.bb         | 2 --
 meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb | 2 --
 meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb | 2 --
 .../recipes-extended/sysrepo/netopeer2-server_git.bb          | 2 --
 .../recipes-extended/sysrepo/sysrepo-plugins-common_git.bb    | 2 --
 meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb     | 2 --
 .../recipes-extended/sysrepo/tsn-yang-models_git.bb           | 2 --
 meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb       | 2 --
 .../recipes-framework/onnxruntime/onnxruntime_1.20.1.bb       | 2 --
 .../tensorflow-lite/tensorflow-lite_2.18.0.bb                 | 2 --
 meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb       | 1 -
 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb                | 2 --
 .../gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb           | 2 --
 .../gst-plugins-ti/gstreamer1.0-plugins-ti.inc                | 2 --
 .../hevc-arm-decoder/hevc-arm-decoder_git.bb                  | 2 --
 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb   | 2 --
 .../recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb         | 2 --
 meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb   | 2 --
 meta-arago-extras/recipes-support/stb/stb_git.bb              | 2 --
 .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb    | 2 --
 meta-arago-test/recipes-benchmark/stream/stream_5.10.bb       | 2 --
 .../recipes-bsp/switch-config/switch-config_git.bb            | 2 --
 meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb | 2 --
 meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb   | 2 --
 meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc     | 2 --
 meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb     | 2 --
 meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb | 2 --
 .../recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb       | 4 +---
 meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb        | 2 --
 .../recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb        | 2 --
 37 files changed, 1 insertion(+), 72 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
index a18d212e..2da3ceff 100644
--- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
 SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
-S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
 PV = "9.0.0+git"
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
index 4626345e..d4875f0b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
@@ -13,8 +13,6 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
            file://03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch \
     "
 
-S = "${WORKDIR}/git"
-
 DEPENDS = "weston virtual/libgles2 pixman wayland-native"
 
 inherit cmake
diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
index a75f3b96..8d423cb1 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -15,8 +15,6 @@ SRCREV = "066ecdab2bf0788eec253bf27fd44f7436f0cd04"
 
 SRC_URI = "git://git.ti.com/git/apps/oprofile-example.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 do_compile() {
 	install -d ${S}/Debug
 	install -d ${S}/Debug1
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
index f4129a75..f36e17d6 100644
--- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
@@ -16,8 +16,6 @@ SRC_URI = " \
 "
 SRCREV = "32bcced2af7feea6969dd1d22e58d0718dc488e3"
 
-S = "${WORKDIR}/git"
-
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE = "(^$)"
 COMPATIBLE_MACHINE:aarch64 = "(.*)"
diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
index ddfbe847..af55fa4d 100644
--- a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
+++ b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
@@ -10,8 +10,6 @@ SRC_URI += "file://0001-Fix-type-casting-for-32bit-builds.patch"
 # v24.11
 SRCREV = "3ed70c005559d409feff2c578a1a39cf8fec8804"
 
-S = "${WORKDIR}/git"
-
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE = "(^$)"
 COMPATIBLE_MACHINE:aarch64 = "(.*)"
diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
index c09f0d05..da5e5cc3 100644
--- a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
+++ b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
@@ -8,7 +8,6 @@ SRCREV = "8dc36cfa882f07a60b3ebdf16d9aac57871bd382"
 SRC_URI = " \
     git://anongit.kde.org/extra-cmake-modules;protocol=git;branch=master \
 "
-S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE += "-DBUILD_TESTING=off"
 
diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index f8864bae..2f3b3b51 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -10,8 +10,6 @@ SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
 SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=https;branch=master \
 	file://0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} DEST_DIR=${D} BIN_DIR=${bindir} CC="${CC}""
 
 do_install() {
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index 24ee3772..09937483 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -13,8 +13,6 @@ DEPENDS = "ti-rpmsg-char websocketd"
 
 RDEPENDS:${PN} = "bash"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${TARGET_PREFIX}"
 
 do_install() {
diff --git a/meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb b/meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
index 0d124890..67c0a543 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
@@ -10,8 +10,6 @@ SRC_URI = "git://github.com/CESNET/libnetconf2.git;protocol=https;branch=devel"
 PV = "3.5.5+git"
 SRCREV = "4c7858c9c41f1ac04d2b15c032291e335fc0f5f5"
 
-S = "${WORKDIR}/git"
-
 DEPENDS = "libssh openssl libyang libxcrypt mbedtls curl \
     ${@bb.utils.contains('DISTRO_FEATURES','pam','libpam','',d)} \
 "
diff --git a/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
index 80283c73..8f2aa653 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
@@ -8,8 +8,6 @@ SRC_URI = "git://github.com/sysrepo/libredblack.git;protocol=https;branch=master
 PV = "1.0+git"
 SRCREV = "a399310d99b61eec4d3c0677573ab5dddcf9395d"
 
-S = "${WORKDIR}/git"
-
 inherit python3native autotools
 
 EXTRA_OECONF = "--without-rbgen"
diff --git a/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
index 073aed5e..e43ef9f6 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
@@ -14,8 +14,6 @@ SRC_URI = " \
 PV = "2.2.35+git"
 SRCREV = "6d1cb61ef3ce2274a91dc9cbc51318bcd0b54697"
 
-S = "${WORKDIR}/git"
-
 DEPENDS = "libyang libnetconf2 sysrepo sysrepo-native"
 RDEPENDS:${PN} += "bash curl"
 
diff --git a/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb
index f398a3e2..58c28f3c 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb
@@ -8,8 +8,6 @@ SRC_URI += "file://0001-so-version.patch"
 PV = "0.1+git"
 SRCREV = "20885de0d3bb95a05610fdb3a0f83d8f7c370fad"
 
-S = "${WORKDIR}/git"
-
 DEPENDS = "libyang sysrepo"
 
 inherit cmake pkgconfig
diff --git a/meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb b/meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb
index 2dbfa55f..b1eccd32 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb
@@ -12,8 +12,6 @@ SRC_URI = " \
 PV = "3.3.10+git"
 SRCREV = "ef93a1253cc97f13671759f6e7790cbf729a5ae9"
 
-S = "${WORKDIR}/git"
-
 DEPENDS = "libyang protobuf protobuf-c protobuf-c-native libredblack libev libnetconf2"
 
 FILES:${PN} += "${datadir}/yang/* ${libdir}/sysrepo-plugind/* ${bindir}/*"
diff --git a/meta-arago-extras/recipes-extended/sysrepo/tsn-yang-models_git.bb b/meta-arago-extras/recipes-extended/sysrepo/tsn-yang-models_git.bb
index 8024a6ab..03052de2 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/tsn-yang-models_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/tsn-yang-models_git.bb
@@ -7,8 +7,6 @@ SRC_URI = "git://github.com/YangModels/yang.git;protocol=https;branch=main"
 PV = "1.0+git"
 SRCREV = "d3f6ca02ec9ce7c96b55066d209d08adbe851897"
 
-S = "${WORKDIR}/git"
-
 FILES:${PN} += "${datadir}/yang/*"
 
 do_install:append () {
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
index 84dd17c9..3cfb4097 100644
--- a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
+++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
@@ -11,8 +11,6 @@ SRC_URI += "\
 "
 SRCREV = "595228d99e3977ac27cb79d5963adda262af99ad"
 
-S = "${WORKDIR}/git"
-
 DEPENDS += "\
 	abseil-cpp \
 	protobuf \
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
index bee649cb..a5026484 100644
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
@@ -30,8 +30,6 @@ SRCREV_safeint = "4cafc9196c4da9c817992b20f5253ef967685bf8"
 SRCREV_eigen = "e7248b26a1ed53fa030c5c459f7ea095dfd276ac"
 SRCREV_nsync = "13de152c2a1cd73ff4df97bd2c406b6d15d34af3"
 
-S = "${WORKDIR}/git"
-
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE = "(^$)"
 COMPATIBLE_MACHINE:aarch64 = "(.*)"
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
index 78b971a5..c76939ac 100644
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
@@ -58,8 +58,6 @@ SRCREV_kleidiai = "cddf991af5de49fd34949fa39690e4e906e04074"
 SRCREV_psimd = "072586a71b55b7f8c584153d223e95687148a900"
 SRCREV_protobuf = "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
 
-S = "${WORKDIR}/git"
-
 inherit setuptools3 cmake
 
 DEPENDS = " \
diff --git a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
index b07ff724..684ca3a4 100644
--- a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
+++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/dentonw/devil.git;protocol=https;branch=master \
 SRCREV = "e34284a7e07763769f671a74b4fec718174ad862"
 
 PR = "r1"
-S = "${WORKDIR}/git"
 
 # Build only DevIL
 OECMAKE_SOURCEPATH = "${S}/DevIL"
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index f3639a8c..c2076099 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -15,8 +15,6 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-test.git;protocol=https;branch
 SRCREV = "3c334f2004c718c9bb4321213c362e65c491efe6"
 PR = "r2"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE += "AQROOT=${S}/tests/src -f makefile.linux TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH} CPU_TYPE=cortex-a15 VIVANTE_SDK_INC=${S}/sdk/include VIVANTE_SDK_LIB=${STAGING_DIR_TARGET}/usr/lib DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} LIBDIR=${libdir} SDK_DIR=${S}/build/tests/ EGL_API_FB=1"
 
 do_install() {
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
index d17cb4f2..7021e144 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
@@ -11,8 +11,6 @@ SRC_URI = "git://git.ti.com/git/processor-sdk/gst-plugin-hevc.git;protocol=https
 "
 SRCREV = "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
 
-S = "${WORKDIR}/git"
-
 DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base hevc-arm-decoder gettext-native"
 
 inherit autotools-brokensep pkgconfig gettext
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
index d29fb87e..7c6965a6 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
@@ -7,8 +7,6 @@ inherit autotools-brokensep pkgconfig gettext
 
 INC_PR = "r2"
 
-S = "${WORKDIR}/git"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_configure() {
diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
index 6420f693..995dd6c8 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
@@ -16,8 +16,6 @@ SRCREV = "4004c553e672538d0c3b5fa2ea0490ec095d0060"
 
 PV = "01.00.00.01"
 
-S = "${WORKDIR}/git"
-
 do_configure() {
     sed "s/-lpthread/-pthread/g" -i ${S}/Client/Build/ARM/makefile
 }
diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
index 505aaa4c..c3af5244 100644
--- a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
+++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
@@ -13,8 +13,6 @@ SRCREV_FORMAT = "default"
 SRCREV_nnshark = "bcee91b23a98c981b87051fe1b2ad545991c4aa2"
 SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
 
-S = "${WORKDIR}/git"
-
 DEPENDS = "\
     gtk-doc-native \
     gstreamer1.0 \
diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
index 6e142f4e..63995d83 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
@@ -7,8 +7,6 @@ SRC_URI = "git://github.com/nnstreamer/nnstreamer.git;branch=main;protocol=https
 PV = "2.4.0+git"
 SRCREV = "7c57c288250578cad598f065b6fda6c0ff720cf9"
 
-S = "${WORKDIR}/git"
-
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE = "(^$)"
 COMPATIBLE_MACHINE:aarch64 = "(.*)"
diff --git a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
index a39f8df8..464b6aeb 100644
--- a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
+++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
@@ -16,8 +16,6 @@ SRC_URI = "${CCIEF-BASIC_GIT_URI};protocol=${CCIEF-BASIC_GIT_PROTOCOL};branch=${
 
 SRCREV = "${CCIEF-BASIC_SRCREV}"
 
-S = "${WORKDIR}/git"
-
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 EXTRA_OEMAKE = "CC="${CC} -fpermissive""
diff --git a/meta-arago-extras/recipes-support/stb/stb_git.bb b/meta-arago-extras/recipes-support/stb/stb_git.bb
index 7b0b6452..01443f7a 100644
--- a/meta-arago-extras/recipes-support/stb/stb_git.bb
+++ b/meta-arago-extras/recipes-support/stb/stb_git.bb
@@ -11,8 +11,6 @@ SRC_URI = " \
     git://github.com/nothings/stb.git;protocol=https;branch=${BRANCH} \
 "
 
-S = "${WORKDIR}/git"
-
 do_install() {
     install -d ${D}${includedir}
     for hdr in ${S}/*.h
diff --git a/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 208f65dd..8cdd1a6f 100644
--- a/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -11,8 +11,6 @@ SRCREV = "fefaf9bdd6f36ab0cebaab8dbf34e5beb50f471c"
 
 SRC_URI = "git://git.ti.com/git/apps/arm_benchmarks.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 do_compile() {
 	export CROSS_COMPILE=${TARGET_PREFIX}
 	export CFLAGS='${TARGET_CC_ARCH} -std=gnu11'
diff --git a/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb b/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
index 76346038..484be34d 100644
--- a/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
+++ b/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
@@ -11,8 +11,6 @@ SRCREV = "b66f2bab5d6d0b35732ef8406ae03873725a3306"
 
 SRC_URI = "git://git.ti.com/git/arago-project-org/stream.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 PACKAGES =+ "${PN}-openmp"
 
 do_compile() {
diff --git a/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
index df6a96d3..90834edb 100644
--- a/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
@@ -15,8 +15,6 @@ SRC_URI = "git://git.ti.com/git/switch-config/switch-config.git;protocol=https;b
 
 SRC_URI += "file://0001-Use-proper-definition-of-boolean-type.patch"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
 
 do_configure() {
diff --git a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index bd5e04f3..6f46e9fb 100644
--- a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -12,8 +12,6 @@ SRCREV ?= "dd2052b581ae7c2e0e06344887885fd6cd66eebb"
 
 SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE = "DESTDIR=${D}${bindir} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
 CFLAGS += "-fpermissive -std=gnu11"
 
diff --git a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
index 1a230e8e..69f95391 100644
--- a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
+++ b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
@@ -11,6 +11,4 @@ SRCREV = "334fc8ec8056badc9c6667e6f1328705cb973ab4"
 
 DEPENDS = "googletest"
 
-S = "${WORKDIR}/git"
-
 inherit cmake pkgconfig
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
index 1a353a19..5e0163e0 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
@@ -30,8 +30,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            "
 
-S = "${WORKDIR}/git"
-
 inherit autotools-brokensep pkgconfig
 
 # Version 20220527 added KVM test infrastructure which currently fails to build with lld due to
diff --git a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
index dad8ece0..edba8e12 100644
--- a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
@@ -15,8 +15,6 @@ SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=https;branch=${BRANCH
 
 SRC_URI += "file://0001-Use-proper-definition-of-boolean-type.patch"
 
-S = "${WORKDIR}/git"
-
 do_compile () {
     oe_runmake CC="${CC}" all
 }
diff --git a/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb b/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
index 8c51a9e9..572576a7 100644
--- a/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
+++ b/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
@@ -7,8 +7,6 @@ SRC_URI = "git://git.ideasonboard.org/uvc-gadget.git;branch=master"
 PV = "1.1+git"
 SRCREV = "aa82df887ab995473cd83c89777cdf4bc4685dd0"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE = 'CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" KERNEL_INCLUDE=""'
 
 do_compile () {
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
index 104c2d15..454f0131 100644
--- a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Build hwspinlock test as an external Linux kernel module"
 DESCRIPTION = "${SUMMARY}"
 LICENSE = "GPL-2.0-only | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=bfa02c83df161e37647ee23a2c7eacd4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bfa02c83df161e37647ee23a2c7eacd4"
 
 inherit module
 
@@ -14,8 +14,6 @@ SRC_URI = "\
 
 SRCREV = "20f15e79a3a0197e06328c252d23aec225de21ed"
 
-S = "${WORKDIR}/git"
-
 # The inherit of module.bbclass will automatically name module packages with
 # "kernel-module-" prefix as required by the oe-core build environment.
 
diff --git a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb b/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
index 8f2d27ca..9ab0dbed 100644
--- a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
+++ b/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
@@ -6,8 +6,6 @@ BRANCH = "ti-linux-5.10.y"
 SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
 SRC_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 do_compile () {
 	cd ${S}/tools/pci
 	${CC} ${CFLAGS} ${LDFLAGS} -o pcitest pcitest.c
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb
index d2e07bea..12b42c90 100644
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb
@@ -19,8 +19,6 @@ SRC_URI = "git://github.com/xdp-project/xdp-tools.git;protocol=https;branch=main
 
 SRCREV = "e78d8d23bb80f221dd6b6970ff5a44aaf4717114"
 
-S = "${WORKDIR}/git"
-
 inherit pkgconfig
 
 EXTRA_OEMAKE += " PREFIX=${D}${prefix} LIBDIR=${D}${libdir} BUILD_STATIC_ONLY=1 PRODUCTION=1 V=1"
-- 
2.17.1


