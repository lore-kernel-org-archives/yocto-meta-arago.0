Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2BFEC8754
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 18:53:15 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.21624.1694112794890424344
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 11:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IFHEUlFf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 387IrDRt006787;
	Thu, 7 Sep 2023 13:53:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694112793;
	bh=AtG6myvDMc7pIKrlu8RUBMYKxKjAM9cSoF8ykv1PEmM=;
	h=From:To:Subject:Date;
	b=IFHEUlFfjaAZns8IRhsBcpG+4TDnEjTW0GKupSr6XB9Z8cBhaEIvqepFW5uOlU+Bl
	 P0jSxkXjJFQeHttOxvBaDiXRlGwQa9YY2o6pzU2o2YPs+nUxjwopoDASczr9AVKLJR
	 W5cmBBrRjdl8XmKJeM0UhUffEAfxvW+KO3rbkvfc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 387IrDG5024129
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Sep 2023 13:53:13 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Sep 2023 13:53:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Sep 2023 13:53:13 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 387IrDvY127089;
	Thu, 7 Sep 2023 13:53:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qeK7s-0004MQ-V6; Thu, 07 Sep 2023 13:53:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v4 0/4] ti-test changes
Date: Thu, 7 Sep 2023 13:53:08 -0500
Message-ID: <20230907185312.16718-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Sep 2023 18:53:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14890

There are some more changes to the ti-test package that go beyond just
moving everything into a new layer.  So to keep them togehter until we
accpet them, I have grouped them in a series to better keep track of
them.

Ryan Eatmon (4):
  meta-arago-test: Collect all of the ti-test recipes into a new layer
  ti-test: Rename variables to remove ARAGO
  ti-test: Various cleanups
  ti-test: Add lsof and dosfstools

 meta-arago-test/COPYING.MIT                   | 17 ++++
 meta-arago-test/README                        | 34 +++++++
 meta-arago-test/conf/layer.conf               | 24 +++++
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
 .../recipes-core/packagegroups/ti-test.bb     | 88 ++++++++++---------
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
 34 files changed, 121 insertions(+), 44 deletions(-)
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
 rename {meta-arago-extras => meta-arago-test}/recipes-core/packagegroups/ti-test.bb (72%)
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

-- 
2.17.1


