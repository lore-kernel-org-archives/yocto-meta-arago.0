Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511BCCD612A
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 18:53:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.71245.1696877618286152988
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 11:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BFd0+pUY;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 399Iragc048315;
	Mon, 9 Oct 2023 13:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696877616;
	bh=C/4cZyZCVh+M5JnZcMFy6nTZo7b/xtrY6LCDdfwLjMk=;
	h=From:To:Subject:Date;
	b=BFd0+pUYoqlZLNLLURQyS5Xw3QAGBfY2geaPcmhi8x9cVvVkBQQNrdYjk2nNDGtkh
	 hbXAUrYRDIh40yQAatgv8Y/I9GdfVA/9uTZ/Ye5R1w4+2LGiOn+WRCmJErQu87XXZs
	 d0rQdYGcrygPOSI+GywLxCW4pYr1ZSsGkTkzCutA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 399IraDh102513
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Oct 2023 13:53:36 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 13:53:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 13:53:36 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 399Iraa9074944;
	Mon, 9 Oct 2023 13:53:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qpvNo-0002Zy-5n; Mon, 09 Oct 2023 13:53:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v5 1/4] meta-arago-test: Collect all of the ti-test recipes into a new layer
Date: Mon, 9 Oct 2023 13:53:33 -0500
Message-ID: <20231009185336.9871-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Oct 2023 18:53:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14926

In preparation for moving all of the ti-test recipes over to meta-ti to
make it more available outside of Arago, we are collecting all of the
recipes that ti-test include into a new layer.  We will be tweaking this
a little more and testing thoroughly before we make the final move.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Testing showed that input-utils needed to be moved as well.
v2: Missed some required updates in layer.conf and ltp-ddt.

 meta-arago-test/COPYING.MIT                   | 17 ++++++++++
 meta-arago-test/README                        | 34 +++++++++++++++++++
 meta-arago-test/conf/layer.conf               | 24 +++++++++++++
 .../licenses/Stream_Benchmark_License         |  0
 .../arm-benchmarks/arm-benchmarks_1.3.bb      |  0
 .../0001-fix-out-of-tree-config.patch         |  0
 ...e-math.h-include-that-breaks-aarch64.patch |  0
 .../iperf-2.0.5/0002-fix-bool-size-m4.patch   |  0
 .../iperf-2.0.5/iperf-2.0.5_ManPage.patch     |  0
 .../recipes-benchmark/iperf/iperf_2.0.5.bb    |  0
 .../nbench-byte/nbench-byte_%.bbappend        |  0
 .../stream/stream_%.bbappend                  |  0
 .../recipes-benchmark/stream/stream_5.10.bb   |  0
 .../switch-config/switch-config_git.bb        |  0
 .../openntpd/openntpd_6.8p1.bb                |  0
 .../recipes-core/packagegroups/ti-test.bb     |  0
 .../cpuloadgen/cpuloadgen_git.bb              |  0
 .../dma-heap/dma-heap-tests.bb                |  0
 ...nf-fix-for-cross-compilation-for-ARM.patch |  0
 .../input-utils/fix-ftbfs-echo.patch          |  0
 .../input-utils/input-utils_1.0.bb            |  0
 .../ltp-ddt/ltp-ddt_20230127.bb               |  2 +-
 .../mtd/mtd-utils_git.bbappend                |  0
 .../recipes-devtools/omapconf/omapconf_git.bb |  0
 .../uvc-gadget/uvc-gadget_git.bb              |  0
 .../recipes-extended/bc/bc_%.bbappend         |  0
 ...002-Remove-OOM-tests-from-runtest-mm.patch |  0
 .../ltp/ltp/disable_hanging_tests.patch       |  0
 .../recipes-extended/ltp/ltp_20230127.bb      |  0
 ...ah-flags-belong-to-LDADD-not-LDFLAGS.patch |  0
 .../omapdrmtest/omapdrmtest_1.0.0.bb          |  0
 .../recipes-graphics/piglit/piglit_%.bbappend |  0
 .../recipes-kernel/pcitest/pcitest_5.10.bb    |  0
 .../0001-gcc8-strncpy-werror-workaround.patch |  0
 .../recipes-support/mstpctl/mstpd_git.bb      |  0
 35 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-test/COPYING.MIT
 create mode 100644 meta-arago-test/README
 create mode 100644 meta-arago-test/conf/layer.conf
 rename {meta-arago-extras => meta-arago-test}/licenses/Stream_Benchmark_License (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-benchmark/iperf/iperf_2.0.5.bb (100%)
 rename {meta-arago-distro => meta-arago-test}/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend (100%)
 rename {meta-arago-distro => meta-arago-test}/recipes-benchmark/stream/stream_%.bbappend (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-benchmark/stream/stream_5.10.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-bsp/switch-config/switch-config_git.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-connectivity/openntpd/openntpd_6.8p1.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-core/packagegroups/ti-test.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/cpuloadgen/cpuloadgen_git.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/dma-heap/dma-heap-tests.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/input-utils/input-utils/fix-ftbfs-echo.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/input-utils/input-utils_1.0.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb (94%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/mtd/mtd-utils_git.bbappend (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/omapconf/omapconf_git.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/uvc-gadget/uvc-gadget_git.bb (100%)
 rename {meta-arago-distro => meta-arago-test}/recipes-extended/bc/bc_%.bbappend (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-extended/ltp/ltp/disable_hanging_tests.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-extended/ltp/ltp_20230127.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb (100%)
 rename {meta-arago-distro => meta-arago-test}/recipes-graphics/piglit/piglit_%.bbappend (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-kernel/pcitest/pcitest_5.10.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-support/mstpctl/mstpd_git.bb (100%)

diff --git a/meta-arago-test/COPYING.MIT b/meta-arago-test/COPYING.MIT
new file mode 100644
index 00000000..89de3547
--- /dev/null
+++ b/meta-arago-test/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+THE SOFTWARE.
diff --git a/meta-arago-test/README b/meta-arago-test/README
new file mode 100644
index 00000000..6f912472
--- /dev/null
+++ b/meta-arago-test/README
@@ -0,0 +1,34 @@
+meta-arago-test provides an additional packagegroup ti-test and some of the recipes that go into that group
+
+This layer works with the latest Yocto Project release (currently 2.2+) and tracks
+the stable/maintenance branches (currently "master") of the corresponding layers:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: master
+revision: HEAD
+layers: meta
+
+URI: git://git.yoctoproject.org/meta-ti
+branch: master
+revision: HEAD
+layers: meta-ti-bsp, meta-ti-extras
+
+URI: git://git.yoctoproject.org/meta-arm
+branch: master
+revision: HEAD
+layers: meta-arm, meta-arm-toolchain
+
+URI: git://git.openembedded.org/meta-openembedded
+branch: master
+revision: HEAD
+layers: meta-oe, meta-networking, meta-python
+
+URI: https://github.com/meta-qt5/meta-qt5
+branch: master
+revision: HEAD
+
+Send pull requests to meta-arago@lists.yoctoproject.org
+
+Layer maintainers:
+Ryan Eatmon <reatmon@ti.com>
+Denys Dmytriyenko <denys@konsulko.com>
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
new file mode 100644
index 00000000..f31d69c4
--- /dev/null
+++ b/meta-arago-test/conf/layer.conf
@@ -0,0 +1,24 @@
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "meta-arago-test"
+BBFILE_PATTERN_meta-arago-test := "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-arago-test = "10"
+
+LAYERSERIES_COMPAT_meta-arago-test = "kirkstone langdale mickledore nanbield"
+
+# Set a variable to get to the top of the metadata location
+TITESTBASE := '${@os.path.normpath("${LAYERDIR}/")}'
+
+LICENSE_PATH += "${LAYERDIR}/licenses"
+
+LAYERDEPENDS_meta-arago-test = " \
+    core \
+    openembedded-layer \
+    networking-layer \
+    filesystems-layer \
+    meta-python \
+"
diff --git a/meta-arago-extras/licenses/Stream_Benchmark_License b/meta-arago-test/licenses/Stream_Benchmark_License
similarity index 100%
rename from meta-arago-extras/licenses/Stream_Benchmark_License
rename to meta-arago-test/licenses/Stream_Benchmark_License
diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
similarity index 100%
rename from meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
rename to meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
similarity index 100%
rename from meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
rename to meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch
similarity index 100%
rename from meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch
rename to meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
similarity index 100%
rename from meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
rename to meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
similarity index 100%
rename from meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
rename to meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
similarity index 100%
rename from meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
rename to meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
diff --git a/meta-arago-distro/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend b/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
rename to meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
diff --git a/meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend b/meta-arago-test/recipes-benchmark/stream/stream_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend
rename to meta-arago-test/recipes-benchmark/stream/stream_%.bbappend
diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb b/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
similarity index 100%
rename from meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
rename to meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
rename to meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb b/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
similarity index 100%
rename from meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
rename to meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
diff --git a/meta-arago-extras/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/packagegroups/ti-test.bb
rename to meta-arago-test/recipes-core/packagegroups/ti-test.bb
diff --git a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
rename to meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
similarity index 100%
rename from meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
rename to meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch b/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
similarity index 100%
rename from meta-arago-extras/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
rename to meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-utils/fix-ftbfs-echo.patch b/meta-arago-test/recipes-devtools/input-utils/input-utils/fix-ftbfs-echo.patch
similarity index 100%
rename from meta-arago-extras/recipes-devtools/input-utils/input-utils/fix-ftbfs-echo.patch
rename to meta-arago-test/recipes-devtools/input-utils/input-utils/fix-ftbfs-echo.patch
diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb b/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
rename to meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
similarity index 94%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
rename to meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index 315a4a80..16c5418f 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
-FILESEXTRAPATHS:prepend := "${ARAGOBASE}/meta-arago-extras/recipes-extended/ltp/ltp:"
+FILESEXTRAPATHS:prepend := "${TITESTBASE}/recipes-extended/ltp/ltp:"
 
 require recipes-extended/ltp/ltp_${PV}.bb
 
diff --git a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend b/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
rename to meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
rename to meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
diff --git a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb b/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
rename to meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
diff --git a/meta-arago-distro/recipes-extended/bc/bc_%.bbappend b/meta-arago-test/recipes-extended/bc/bc_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-extended/bc/bc_%.bbappend
rename to meta-arago-test/recipes-extended/bc/bc_%.bbappend
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch b/meta-arago-test/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
similarity index 100%
rename from meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
rename to meta-arago-test/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch b/meta-arago-test/recipes-extended/ltp/ltp/disable_hanging_tests.patch
similarity index 100%
rename from meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
rename to meta-arago-test/recipes-extended/ltp/ltp/disable_hanging_tests.patch
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb b/meta-arago-test/recipes-extended/ltp/ltp_20230127.bb
similarity index 100%
rename from meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb
rename to meta-arago-test/recipes-extended/ltp/ltp_20230127.bb
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch b/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
similarity index 100%
rename from meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
rename to meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
rename to meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
diff --git a/meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend b/meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend
rename to meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend
diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb b/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
similarity index 100%
rename from meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
rename to meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch b/meta-arago-test/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch
similarity index 100%
rename from meta-arago-extras/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch
rename to meta-arago-test/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch
diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-test/recipes-support/mstpctl/mstpd_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
rename to meta-arago-test/recipes-support/mstpctl/mstpd_git.bb
-- 
2.17.1


