Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2CAC71153
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 23:59:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2828.1693353581484518982
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 16:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rZk7+6Yq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37TNxdSc096613;
	Tue, 29 Aug 2023 18:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693353579;
	bh=SwjDh+oIHVs5yKKHZD3HE0lZ9tU7pVcPmX87DdX7tEw=;
	h=From:To:Subject:Date;
	b=rZk7+6Yq4vadAUGL13sRYbGfLfuRCF4VcyN2ih4jyLzc1LWeuIhOY6D8loaoS3ikg
	 XJmPI2JPiMikCfEGWq5FZgUvEqAZWYzyEVXK7EqjYCMAzpyfS2N24GrI+8uQCEUbQK
	 D8SLd5L65hq+DeBdNWnG8phxxmPlWSe9JRE16Dt4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37TNxdZB014609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Aug 2023 18:59:39 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Aug 2023 18:59:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Aug 2023 18:59:39 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37TNxddV008121;
	Tue, 29 Aug 2023 18:59:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qb8cV-0004Fm-A5; Tue, 29 Aug 2023 18:59:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v2] meta-arago-test: Collect all of the ti-test recipes into a new layer
Date: Tue, 29 Aug 2023 18:59:39 -0500
Message-ID: <20230829235939.16208-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Aug 2023 23:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14881

In preparation for moving all of the ti-test recipes over to meta-ti to
make it more available outside of Arago, we are collecting all of the
recipes that ti-test include into a new layer.  We will be tweaking this
a little more and testing thoroughly before we make the final move.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Missed some required updates in layer.conf and ltp-ddt.

 meta-arago-test/COPYING.MIT                   | 17 ++++++++++
 meta-arago-test/README                        | 34 +++++++++++++++++++
 meta-arago-test/conf/layer.conf               | 25 ++++++++++++++
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
 .../openntpd/openntpd_6.8p1.bb                |  0
 .../recipes-core/packagegroups/ti-test.bb     |  0
 .../cpuloadgen/cpuloadgen_git.bb              |  0
 .../dma-heap/dma-heap-tests.bb                |  0
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
 31 files changed, 77 insertions(+), 1 deletion(-)
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
 rename {meta-arago-extras => meta-arago-test}/recipes-connectivity/openntpd/openntpd_6.8p1.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-core/packagegroups/ti-test.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/cpuloadgen/cpuloadgen_git.bb (100%)
 rename {meta-arago-extras => meta-arago-test}/recipes-devtools/dma-heap/dma-heap-tests.bb (100%)
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
index 00000000..fb950dc6
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
index 00000000..daf6bf94
--- /dev/null
+++ b/meta-arago-test/conf/layer.conf
@@ -0,0 +1,25 @@
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
+LAYERSERIES_COMPAT_meta-arago-test = "kirkstone langdale mickledore"
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
+
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
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
similarity index 94%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
rename to meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index 0e716717..13612519 100644
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


