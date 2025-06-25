Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63B8C7EE31
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:06:21 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.22864.1750874773353586380
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZeLF0RRZ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6Ckh1523980;
	Wed, 25 Jun 2025 13:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874772;
	bh=7HEuaXopn7NjtFSycpXfOt0G7E/v7yHDcqAT1qWi/6U=;
	h=From:To:Subject:Date;
	b=ZeLF0RRZiBsB2BjY6FdUXXSq0x4sdQqdOTPRsK2Q6ICgOOVmBNFC9mRrmzOAjLvzX
	 aEgMg7OhlzPnR8hYn+BttW8OQAd8y3SsZIiENWoBXkCp8Xa7+PKKAR6KByxZot76No
	 IZ+vaFFDqZpm6xBRzbQMDqp02OPPAjpjNAlV4A6Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6CxN1487171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:12 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:11 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6BT93810814;
	Wed, 25 Jun 2025 13:06:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUVe-0004bJ-Tf; Wed, 25 Jun 2025 13:06:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/5] meta-arago/all: set S from UNPACKDIR in recipes that use only local files
Date: Wed, 25 Jun 2025 13:06:06 -0500
Message-ID: <20250625180610.17641-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:06:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16268

There is no need to have two assignments; also setting S from
UNPACKDIR (and not vice versa) is more logical as unpack
task comes first, and tasks that come after unpack use S to access
unpack results.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb     | 3 ---
 .../recipes-connectivity/bt-enable/bt-enable.bb              | 3 +--
 .../initscript-telnetd/initscript-telnetd.bb                 | 3 +--
 .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb  | 3 +--
 .../recipes-core/arago-gpl-notice/arago-gpl-notice.bb        | 3 +--
 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb     | 3 +--
 .../recipes-devtools/opkg/opkg-bash-completion.bb            | 3 +--
 .../recipes-extended/sysrepo/nw-configurator.bb              | 5 +++--
 .../recipes-graphics/tslib/ts-calibrate-init_1.0.bb          | 5 ++---
 .../recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb | 5 ++---
 .../recipes-benchmark/openssl-perf/openssl-perf.bb           | 3 +--
 11 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
index 0753a6aa..57070459 100644
--- a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
@@ -8,9 +8,6 @@ CLEANBROKEN = "1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
-
 BOOSTRAP_IMAGE = "tisdk-bootstrap-base-image"
 
 TARGET = "bootstrap-rootfs-${MACHINE}.cpio"
diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
index 0e7b446d..f0a574cf 100644
--- a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
@@ -9,8 +9,7 @@ SRC_URI = " \
 
 PR = "r1"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 INITSCRIPT_NAME = "bt-enable.sh"
 INITSCRIPT_PARAMS = "defaults 99"
diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
index 973dc8e7..8398e7f3 100644
--- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
@@ -5,8 +5,7 @@ PR  = "r1"
 
 SRC_URI = "file://telnetd"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 INITSCRIPT_NAME = "telnetd"
 INITSCRIPT_PARAMS = "defaults 10"
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
index 4d84bed4..ff52213e 100644
--- a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://telnetd.service;beginline=1;endline=17;md5=d134d0d385
 
 SRC_URI = "file://telnetd.service"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit systemd
 
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index 79fcd7ae..ace82fb0 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://print-gplv3-packages.sh;beginline=2;endline=18;md5=d1
 
 PR = "r3"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 INITSCRIPT_NAME = "gplv3-notice"
 INITSCRIPT_PARAMS = "defaults 99"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index 7942b52c..804641a9 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -9,8 +9,7 @@ SRC_URI = "\
 PR = "r3"
 PV = "1.0"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install () {
     install -d ${D}/board-support/prebuilt-images
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
index 51f0dd3e..f92556d1 100644
--- a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://opkg-bash-completion"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     install -d ${D}${datadir}/bash-completion/completions
diff --git a/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
index 5f9d53e7..9bbca2bf 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
@@ -5,13 +5,14 @@ LIC_FILES_CHKSUM = "file://nw-configurator.c;beginline=1;endline=33;md5=3538caaf
 
 SRC_URI = "file://nw-configurator.c"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 DEPENDS = "sysrepo"
 
 inherit pkgconfig
 
+CFLAGS:remove = "-g"
+
 do_compile() {
 	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR} ${S}/nw-configurator.c -o nw-configurator -lsysrepo
 }
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index 7b69e89b..3f3aeaad 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -8,9 +8,6 @@ LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb79
 
 PR = "r4"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
-
 INITSCRIPT_NAME = "ts-calibrate"
 
 # Start this init script early enough for other processes to be started later
@@ -23,6 +20,8 @@ inherit update-rc.d
 
 SRC_URI = "file://init"
 
+S = "${UNPACKDIR}"
+
 do_install(){
 	# Install the init script
 	# TODO: replace init script with systemd files
diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
index bf08c320..29db78c3 100644
--- a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
+++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Benchmark for checking DDR bandwidth"
 HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh"
 LICENSE = "CC-BY-SA-3.0"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
 PV = "1.0"
 
@@ -12,8 +12,7 @@ SRC_URI = " \
 SRC_URI[runLmDDRBandwidth.sha256sum] = "67997d721b351344d8788200a15bb3640093045bc25f2b5307dd331ebd1556a3"
 SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     install -d ${D}${datadir}/matrix-gui-2.0/apps
diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
index 1939b2cf..04a3fb79 100644
--- a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
+++ b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
@@ -24,8 +24,7 @@ SRC_URI[openssl_gen_sha1hash.sha256sum] = "f338f8c3067ebb1c5710b16b91e8b9e38685b
 SRC_URI[openssl_start_server.sha256sum] = "e23499210f701ef831d39a8c732f34f4b06fb3ba2d069c4a95ef25ae59f3c93e"
 SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.17.1


