Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8377FFF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:45 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13785.1777475375698624635
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SjUkfHGM;
 spf=pass (domain: ti.com, ip: 52.101.85.48, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3TrDCU+FTl/EuYevXnbKoCjx0c18Ngk2PezCI0V2RVqk/2BeW+0ui3xIORCcVCtJJ/t1UOMS0VOLST9lGGYM28PklOlB09FJ+QpZQ5CDV8x8J/51kB6ISjcbmHRLAqiPUK0FI8RrZ2ExMmxKvG82vjI6RT/ad20Yaj1g3DyHpeg47LpyQDD6/x0+h6ffvyLW6SkRrH7fjobnMnhr05y0MiWqClHDmlspXsNlBz91GQfY/+uhFzj6fXgNaQIUiDQDQXwvBXTqNtvlAox0je64pXRBqggiKOJei2dcRUA9cXvMhrlw8bus/TOBg0FKb0GUdyoOorTBHCeTtsE1CmyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TfqstQeyJWP6kkTd561lTgElliZTQf4I8FD0JlQXl4=;
 b=Oq+s+ovuez7fb2Fm0GAFXRoxsJeUhqvW10UUX+CbV/AiSw1+i1mvU5zPN08IopHFd3cMqnd73eL3qgEQz/iguDlcUKZ7H+7GZhq9ycRpflk9NyCHBDqw99nkGMegCgbbpEbfte3PSLrcZUfHbEc01g2uCPTuUFRRr9tpEqNE17t8TyLkngGi1bP8JFCTue/LokVM4xvNCKdh1sZusIPdJnECzqolyb9vcCYK29djQLYqyFC976yFJ2VIlZ2Kh/L+37FC1Rf0ME5cXTOHQJLxcchgMqPSwbQVR9EYG661PwXnSDcChDy3sUCyFHlZkOsArzuq5kERdqTwPirUPo5+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TfqstQeyJWP6kkTd561lTgElliZTQf4I8FD0JlQXl4=;
 b=SjUkfHGM5ynOnRZbbSC7/Or9HhI1ks4yyGqlVcc2vHhBw/R5zuZoPr+WSL6713lbnBuInf48hwNkVUqbsysnRZTKxPmU9LhMf6sDawJ+NNMgLyz5TmxHvOLZpciMyf5+huctJ4ZeS9ake7RpS44lds+KlRri4YLVD1lj8Qbxwlw=
Received: from SJ0PR03CA0119.namprd03.prod.outlook.com (2603:10b6:a03:333::34)
 by SA1PR10MB5888.namprd10.prod.outlook.com (2603:10b6:806:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.29; Wed, 29 Apr
 2026 15:09:28 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::88) by SJ0PR03CA0119.outlook.office365.com
 (2603:10b6:a03:333::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 15:09:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:09:26 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:19 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:18 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9IQ33333869;
	Wed, 29 Apr 2026 10:09:18 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XO-000000046U5-3ZyO;
	Wed, 29 Apr 2026 10:09:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] meta-arago-test: Moved to meta-ti/meta-ti-test
Date: Wed, 29 Apr 2026 10:09:18 -0500
Message-ID: <20260429150918.978225-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429150918.978225-1-reatmon@ti.com>
References: <20260429150918.978225-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|SA1PR10MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: b0212ff2-2e90-4e99-d681-08dea6014e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|20052099010|13003099007|56012099003|12006099003|25016099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rq1yRN52fHLbxKZRwhLsS2HTq93CiMPFAiUQxlJOElwyDh7KQdgkpT7FEw1MEILXBzW1l4tNJiHNLknpXDr/B+rohFK/kZZwVPrDydzH4gbj0srClU2jy+pd66eD9TSOGbZc5VOCWqq+oOMjcFRqZyoU5Q6xesvxGb2REt+IL2BEabxmN72TcTo6tF7AuldeMqVitPnsZkHUQ93A/ENQabugaMZ7bTEZ6ab5Sq3Kg/Sv7L73czxtehSYZEJjCVgE2HjiJ8sW4zFrEageIyl2JhbSWIKsVszeo0ttvEmwEr8HMNw5KduIZmjFDwdalJ9AdhaotsRXW9hNFaiV8tyQeRiAYPo7i2fvpq6YVfXC4g4vefRFFyW8JsX/L877jJH5WDo0ycdvY/RX/AcvPQ+77evBUizBW243sQk6OAhZK4TKuJ3h0aV35OFEbVM3pzPaFSupdIQKnsZM/45SwDzqS4alijZC8SEm1Upq8CT4cwCba3AHz/19nUne2ffEA6ATomOOf6dmOTqR/e222K28I1Y7wT/ymve9K6GEnld8xpsV4/7Cjt1JhrOONGAJulzTIcRQwbwTaPTnDf1WS4nZdXe/tNhflCCGbefOG+T1b9maczM/eaNAqM8WFFlEM2Cr/fF1espVQ4dhBjsjojzebY7RjAmHuIAYGY8hOBYTpcM8h0C/EkN7sMTnN7p/6aZyuN6nRDcdFln8LswnqPWUmg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(20052099010)(13003099007)(56012099003)(12006099003)(25016099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1nD7sqZEOWFJquCHxgp2vmuba4380JuYo/4qAe2rClin4D94sZuvmaUr+SfaBQ/rsxp3dkVvRSaLaSlzJRs9SdBltjn6aEjJxms6+w1ZV/TASmZreeOW65Q5VyStMhcaOKGFutOnxH9uCZkKThsMVXUsU1kVQw23UwNb04A2aRPrvN3LPRwtuzOGS13i7uGg4VL52J71iPJJhQfQFD2cg0kSvtwWG/w5MncL9jTALsSVlhrogWGbmuGtsHJRDVhpsdXdJW2gw+WceWcTpZCsunox/03aQlu/VTfg1taeyVhXW8NGQbti/+bwYy3JIRcFalOGs5iaeUr0Cd1HxuIPfmG/EOnQ3hqCwmN4Kf/SjeDQdw2TX/a1CbUNuy8WMRIkGaZSuO7CeyJOnBM/RAN6ZNEp2D9Vf7if61UwOTQtlLLvtXAfPJCYGs5QNmhjBF9G
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:26.9984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0212ff2-2e90-4e99-d681-08dea6014e41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5888
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17509

To facilitate using this packagegroup with other distros we are moving
the ti-test packagegroup (and thus all of meta-arago-test) to the
meta-ti repository and renaming it to meta-ti-test.

All changes going forwad need to be made in that repo and on that
mailing list.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json                        |   7 +-
 meta-arago-test/COPYING.MIT                   |  17 --
 meta-arago-test/README                        |  34 ---
 meta-arago-test/SECURITY                      |  20 --
 meta-arago-test/conf/layer.conf               |  34 ---
 .../flutter-samples-material-3-demo-arago.inc |   1 -
 ...flutter-samples-material-3-demo_%.bbappend |   4 -
 .../flutter/flutter-wayland-client-arago.inc  |   3 -
 .../flutter/flutter-wayland-client_%.bbappend |   4 -
 ...-message_codec.h-Include-cstdint-lib.patch |  93 -------
 .../packagegroups/ti-test.bbappend            |   7 -
 .../licenses/Stream_Benchmark_License         |  34 ---
 .../arm-benchmarks/arm-benchmarks_1.3.bb      |  23 --
 .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb    |  28 ---
 .../coremark/coremark-ti.inc                  |   3 -
 ..._main-Remove-printing-compiler-flags.patch |  41 ----
 .../coremark/coremark_%.bbappend              |   4 -
 .../nbench-byte/nbench-byte-ti.inc            |   1 -
 .../nbench-byte/nbench-byte_%.bbappend        |   4 -
 .../openssl-perf/openssl-perf.bb              |  49 ----
 .../stream/stream_%.bbappend                  |  13 -
 .../recipes-benchmark/stream/stream_5.10.bb   |  26 --
 ...se-proper-definition-of-boolean-type.patch |  33 ---
 .../switch-config/switch-config_git.bb        |  27 ---
 .../openntpd/openntpd_6.8p1.bb                |  24 --
 .../recipes-core/packagegroups/ti-test.bb     | 226 ------------------
 .../bpftool/bpftool-native-ti.inc             |   1 -
 .../bpftool/bpftool-native_%.bbappend         |   4 -
 .../dma-heap/dma-heap-tests.bb                |  14 --
 ...nf-fix-for-cross-compilation-for-ARM.patch |  69 ------
 .../input-utils/fix-ftbfs-echo.patch          |  21 --
 .../input-utils/input-utils_1.0.bb            |  31 ---
 ...-__clear_cache-declaration-for-clang.patch |  32 ---
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  32 ---
 ...01-include-mk-Fix-installing-subdirs.patch |  49 ----
 ...tp-fix-build-failure-with-glibc-2.43.patch |  33 ---
 ...8-Skip-semctl08-when-__USE_TIME64_RE.patch |  45 ----
 .../ltp-ddt/ltp-ddt_20260130.bb               |  45 ----
 .../recipes-devtools/ltp-ddt/ltp_20260130.inc | 157 ------------
 .../recipes-devtools/mtd/mtd-utils-ti.inc     |  45 ----
 .../recipes-devtools/mtd/mtd-utils_%.bbappend |   4 -
 ...se-proper-definition-of-boolean-type.patch |  40 ----
 .../recipes-devtools/omapconf/omapconf_git.bb |  24 --
 .../recipes-devtools/pm-qa/pm-qa-arago.inc    |  13 -
 ...eturn-non-zero-value-on-test-failure.patch |  28 ---
 .../0002-cpuidle-Avoid-relative-paths.patch   |  58 -----
 .../recipes-devtools/pm-qa/pm-qa_%.bbappend   |   6 -
 .../uvc-gadget/uvc-gadget_git.bb              |  19 --
 .../recipes-extended/bc/bc_%.bbappend         |   3 -
 .../recipes-graphics/libsdl2/libsdl2-ti.inc   |   5 -
 .../libsdl2/libsdl2_%.bbappend                |   4 -
 .../offscreen-demo/offscreendemo_0.0.1.bb     |  16 --
 .../recipes-graphics/piglit/piglit-ti.inc     |  32 ---
 ...-add-and-use-TestPlaceholder-objects.patch | 128 ----------
 .../recipes-graphics/piglit/piglit_%.bbappend |   4 -
 ...Fix-Makefile-for-to-build-with-yocto.patch |  46 ----
 .../hwspinlocktest/hwspinlocktest_0.1.bb      |  18 --
 .../kernel-selftest/kernel-selftest-ti.inc    |  53 ----
 .../kernel-selftest/kernel-selftest.bbappend  |   4 -
 .../recipes-kernel/pcitest/pcitest_5.10.bb    |  18 --
 ...0001-configure-skip-toolchain-checks.patch |  44 ----
 ...issing-prefix-map-settings-for-OE-bu.patch |  40 ----
 ...0001-xdpsock-Fix-32bit-compile-error.patch |  42 ----
 ...-not-detect-libbpf-header-from-sysro.patch |  44 ----
 .../0003-Makefile-fix-KeyError-failure.patch  |  31 ---
 .../0004-Makefile-fix-libxdp.pc-error.patch   |  34 ---
 .../xdp-tools/xdp-tools-arago_1.6.1.bb        |  51 ----
 67 files changed, 1 insertion(+), 2146 deletions(-)
 delete mode 100644 meta-arago-test/COPYING.MIT
 delete mode 100644 meta-arago-test/README
 delete mode 100644 meta-arago-test/SECURITY
 delete mode 100644 meta-arago-test/conf/layer.conf
 delete mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter-samples-material-3-demo-arago.inc
 delete mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter-samples-material-3-demo_%.bbappend
 delete mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter-wayland-client-arago.inc
 delete mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter-wayland-client_%.bbappend
 delete mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
 delete mode 100644 meta-arago-test/dynamic-layers/qt6-layer/recipes-core/p=
ackagegroups/ti-test.bbappend
 delete mode 100644 meta-arago-test/licenses/Stream_Benchmark_License
 delete mode 100644 meta-arago-test/recipes-benchmark/arm-benchmarks/arm-be=
nchmarks_1.3.bb
 delete mode 100644 meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm=
-ddr-bandwidth.bb
 delete mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark-ti.=
inc
 delete mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark/000=
1-core_main-Remove-printing-compiler-flags.patch
 delete mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark_%.b=
bappend
 delete mode 100644 meta-arago-test/recipes-benchmark/nbench-byte/nbench-by=
te-ti.inc
 delete mode 100644 meta-arago-test/recipes-benchmark/nbench-byte/nbench-by=
te_%.bbappend
 delete mode 100644 meta-arago-test/recipes-benchmark/openssl-perf/openssl-=
perf.bb
 delete mode 100644 meta-arago-test/recipes-benchmark/stream/stream_%.bbapp=
end
 delete mode 100644 meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
 delete mode 100644 meta-arago-test/recipes-bsp/switch-config/files/0001-Us=
e-proper-definition-of-boolean-type.patch
 delete mode 100644 meta-arago-test/recipes-bsp/switch-config/switch-config=
_git.bb
 delete mode 100644 meta-arago-test/recipes-connectivity/openntpd/openntpd_=
6.8p1.bb
 delete mode 100644 meta-arago-test/recipes-core/packagegroups/ti-test.bb
 delete mode 100644 meta-arago-test/recipes-devtools/bpftool/bpftool-native=
-ti.inc
 delete mode 100644 meta-arago-test/recipes-devtools/bpftool/bpftool-native=
_%.bbappend
 delete mode 100644 meta-arago-test/recipes-devtools/dma-heap/dma-heap-test=
s.bb
 delete mode 100644 meta-arago-test/recipes-devtools/input-utils/input-util=
s/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
 delete mode 100644 meta-arago-test/recipes-devtools/input-utils/input-util=
s/fix-ftbfs-echo.patch
 delete mode 100644 meta-arago-test/recipes-devtools/input-utils/input-util=
s_1.0.bb
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-A=
dd-__clear_cache-declaration-for-clang.patch
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-R=
emove-OOM-tests-from-runtest-mm.patch
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-i=
nclude-mk-Fix-installing-subdirs.patch
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-l=
tp-fix-build-failure-with-glibc-2.43.patch
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-s=
yscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_202601=
30.bb
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.i=
nc
 delete mode 100644 meta-arago-test/recipes-devtools/mtd/mtd-utils-ti.inc
 delete mode 100644 meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappe=
nd
 delete mode 100644 meta-arago-test/recipes-devtools/omapconf/files/0001-Us=
e-proper-definition-of-boolean-type.patch
 delete mode 100644 meta-arago-test/recipes-devtools/omapconf/omapconf_git.=
bb
 delete mode 100644 meta-arago-test/recipes-devtools/pm-qa/pm-qa-arago.inc
 delete mode 100644 meta-arago-test/recipes-devtools/pm-qa/pm-qa/0001-Retur=
n-non-zero-value-on-test-failure.patch
 delete mode 100644 meta-arago-test/recipes-devtools/pm-qa/pm-qa/0002-cpuid=
le-Avoid-relative-paths.patch
 delete mode 100644 meta-arago-test/recipes-devtools/pm-qa/pm-qa_%.bbappend
 delete mode 100644 meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_=
git.bb
 delete mode 100644 meta-arago-test/recipes-extended/bc/bc_%.bbappend
 delete mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 delete mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbap=
pend
 delete mode 100644 meta-arago-test/recipes-graphics/offscreen-demo/offscre=
endemo_0.0.1.bb
 delete mode 100644 meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
 delete mode 100644 meta-arago-test/recipes-graphics/piglit/piglit/0001-fra=
mework-add-and-use-TestPlaceholder-objects.patch
 delete mode 100644 meta-arago-test/recipes-graphics/piglit/piglit_%.bbappe=
nd
 delete mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/000=
1-Fix-Makefile-for-to-build-with-yocto.patch
 delete mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/hwspinloc=
ktest_0.1.bb
 delete mode 100644 meta-arago-test/recipes-kernel/kernel-selftest/kernel-s=
elftest-ti.inc
 delete mode 100644 meta-arago-test/recipes-kernel/kernel-selftest/kernel-s=
elftest.bbappend
 delete mode 100644 meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
 delete mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-ara=
go/0001-configure-skip-toolchain-checks.patch
 delete mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-ara=
go/0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch
 delete mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-ara=
go/0001-xdpsock-Fix-32bit-compile-error.patch
 delete mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-ara=
go/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
 delete mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-ara=
go/0003-Makefile-fix-KeyError-failure.patch
 delete mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-ara=
go/0004-Makefile-fix-libxdp.pc-error.patch
 delete mode 100644 meta-arago-test/recipes-support/xdp-tools/xdp-tools-ara=
go_1.6.1.bb

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 70bbe734..61cbc3cd 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -20,12 +20,7 @@
             "meta-arago-distro/dynamic-layers/chromium-browser-layer/recip=
es-core/images/arago-default-image.bbappend",
             "meta-arago-distro/dynamic-layers/selinux/recipes-core/images/=
arago-default-image.bbappend",
             "meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux=
/linux-ti-staging_%.bbappend",
-            "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend=
",
-            "meta-arago-test/dynamic-layers/qt6-layer/recipes-core/package=
groups/ti-test.bbappend",
-            "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics=
/flutter/flutter-wayland-client_%.bbappend",
-            "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics=
/flutter/flutter-samples-material-3-demo_%.bbappend",
-            "meta-arago-test/recipes-benchmark/stream/stream_%.bbappend",
-            "meta-arago-test/recipes-extended/bc/bc_%.bbappend"
+            "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend=
"
         ]
     },
     "GUARD-2" : {
diff --git a/meta-arago-test/COPYING.MIT b/meta-arago-test/COPYING.MIT
deleted file mode 100644
index 89de3547..00000000
--- a/meta-arago-test/COPYING.MIT
+++ /dev/null
@@ -1,17 +0,0 @@
-Permission is hereby granted, free of charge, to any person obtaining a co=
py
-of this software and associated documentation files (the "Software"), to d=
eal
-in the Software without restriction, including without limitation the righ=
ts
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-copies of the Software, and to permit persons to whom the Software is
-furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included in
-all copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL TH=
E
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FR=
OM,
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-THE SOFTWARE.
diff --git a/meta-arago-test/README b/meta-arago-test/README
deleted file mode 100644
index 16a36d62..00000000
--- a/meta-arago-test/README
+++ /dev/null
@@ -1,34 +0,0 @@
-meta-arago-test provides an additional packagegroup ti-test and some of th=
e recipes that go into that group
-
-This layer works with the latest Yocto Project release (currently 2.2+) an=
d tracks
-the stable/maintenance branches (currently "master") of the corresponding =
layers:
-
-URI: git://git.openembedded.org/openembedded-core
-branch: master
-revision: HEAD
-layers: meta
-
-URI: git://git.yoctoproject.org/meta-ti
-branch: master
-revision: HEAD
-layers: meta-ti-bsp, meta-ti-extras
-
-URI: git://git.yoctoproject.org/meta-arm
-branch: master
-revision: HEAD
-layers: meta-arm, meta-arm-toolchain
-
-URI: git://git.openembedded.org/meta-openembedded
-branch: master
-revision: HEAD
-layers: meta-oe, meta-networking, meta-python
-
-Send pull requests, patches, comments or questions to:
-meta-arago@lists.yoctoproject.org
-
-Please note - meta-arago mailing list requires subscription for posting:
-https://lists.yoctoproject.org/g/meta-arago
-
-Layer maintainers:
-Ryan Eatmon <reatmon@ti.com>
-Denys Dmytriyenko <denys@konsulko.com>
diff --git a/meta-arago-test/SECURITY b/meta-arago-test/SECURITY
deleted file mode 100644
index 2e38d80e..00000000
--- a/meta-arago-test/SECURITY
+++ /dev/null
@@ -1,20 +0,0 @@
-How to Report a Potential Vulnerability?
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-If you would like to report a public issue (for example, one with a releas=
ed
-CVE number), please report it to the mailing list:
-
-  https://lists.yoctoproject.org/g/meta-arago
-
-If you are dealing with a not-yet released or urgent issue, please send a
-message to one of the maintainers listed in the README.  Include as many
-details as possible:
-  - the layer or software module affected
-  - the recipe and its version
-  - any example code, if available
-
-Branches maintained with security fixes
----------------------------------------
-
-See https://wiki.yoctoproject.org/wiki/Releases for the list of current
-releases.  We only accept patches for the LTS releases and the master bran=
ch.
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.c=
onf
deleted file mode 100644
index 3084974b..00000000
--- a/meta-arago-test/conf/layer.conf
+++ /dev/null
@@ -1,34 +0,0 @@
-# We have a conf and classes directory, append to BBPATH
-BBPATH .=3D ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappen=
d"
-
-BBFILE_COLLECTIONS +=3D "meta-arago-test"
-BBFILE_PATTERN_meta-arago-test :=3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-arago-test =3D "10"
-
-LAYERSERIES_COMPAT_meta-arago-test =3D "whinlatter wrynose"
-
-# Set a variable to get to the top of the metadata location
-TITESTBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
-
-LICENSE_PATH +=3D "${LAYERDIR}/licenses"
-
-LAYERDEPENDS_meta-arago-test =3D " \
-    core \
-    openembedded-layer \
-    networking-layer \
-    filesystems-layer \
-    meta-python \
-"
-
-BBFILES_DYNAMIC +=3D " \
-    qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
-    flutter-layer:${LAYERDIR}/dynamic-layers/flutter-layer/recipes*/*/*.bb=
append \
-"
-
-# Codecs in ffmpeg with questionable patent status are not included by
-# default.  As this entire layer is purely optional for testing purposes o=
nly
-# and not meant to be shipped, add support for the ffmpeg commercial licen=
se.
-LICENSE_FLAGS_ACCEPTED:append:ti-soc =3D " commercial_ffmpeg"
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter-samples-material-3-demo-arago.inc b/meta-arago-test/dynamic=
-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-d=
emo-arago.inc
deleted file mode 100644
index b2c9e13d..00000000
--- a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-samples-material-3-demo-arago.inc
+++ /dev/null
@@ -1 +0,0 @@
-FLUTTER_BUILD_ARGS:append =3D " --no-pub"
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter-samples-material-3-demo_%.bbappend b/meta-arago-test/dynami=
c-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-=
demo_%.bbappend
deleted file mode 100644
index f0ae3799..00000000
--- a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-samples-material-3-demo_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-FLUTTER_ARAGO =3D ""
-FLUTTER_ARAGO:arago =3D "flutter-samples-material-3-demo-arago.inc"
-
-require ${FLUTTER_ARAGO}
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter-wayland-client-arago.inc b/meta-arago-test/dynamic-layers/f=
lutter-layer/recipes-graphics/flutter/flutter-wayland-client-arago.inc
deleted file mode 100644
index 4d211568..00000000
--- a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-wayland-client-arago.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/flutter:"
-
-SRC_URI +=3D "file://0001-message_codec.h-Include-cstdint-lib.patch"
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter-wayland-client_%.bbappend b/meta-arago-test/dynamic-layers/=
flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
deleted file mode 100644
index ebcadafc..00000000
--- a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-wayland-client_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-FLUTTER_ARAGO =3D ""
-FLUTTER_ARAGO:arago =3D "flutter-wayland-client-arago.inc"
-
-require ${FLUTTER_ARAGO}
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch b/meta-arago=
-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-me=
ssage_codec.h-Include-cstdint-lib.patch
deleted file mode 100644
index 7a9bff41..00000000
--- a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter/0001-message_codec.h-Include-cstdint-lib.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From dcfcb92c7f42cd6bd92b1048b5e4ea6f01d40e21 Mon Sep 17 00:00:00 2001
-From: Antonios Christidis <a-christidis@ti.com>
-Date: Tue, 10 Mar 2026 11:01:28 -0500
-Subject: [PATCH] message_codec.h: Include cstdint lib
-
-Include cstdint lib within message_codec.h.
-
-Upstream-Status: Inactive-Upstream
-
-Signed-off-by: Antonios Christidis <a-christidis@ti.com>
----
- .../client_wrapper/include/flutter/basic_message_channel.h       | 1 +
- .../common/client_wrapper/include/flutter/binary_messenger.h     | 1 +
- .../common/client_wrapper/include/flutter/engine_method_result.h | 1 +
- .../common/client_wrapper/include/flutter/message_codec.h        | 1 +
- .../common/client_wrapper/include/flutter/method_channel.h       | 1 +
- .../common/client_wrapper/include/flutter/method_codec.h         | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/basic_message_channel.h b/src/flutter/shell/platform/common/client_wrap=
per/include/flutter/basic_message_channel.h
-index c081946..fcc6b23 100644
---- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/bas=
ic_message_channel.h
-+++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/bas=
ic_message_channel.h
-@@ -7,6 +7,7 @@
-
- #include <iostream>
- #include <string>
-+#include <cstdint>
-
- #include "binary_messenger.h"
- #include "message_codec.h"
-diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/binary_messenger.h b/src/flutter/shell/platform/common/client_wrapper/i=
nclude/flutter/binary_messenger.h
-index d552b49..82e47da 100644
---- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/bin=
ary_messenger.h
-+++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/bin=
ary_messenger.h
-@@ -7,6 +7,7 @@
-
- #include <functional>
- #include <string>
-+#include <cstdint>
-
- namespace flutter {
-
-diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/engine_method_result.h b/src/flutter/shell/platform/common/client_wrapp=
er/include/flutter/engine_method_result.h
-index 3cc8b6a..9634ead 100644
---- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/eng=
ine_method_result.h
-+++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/eng=
ine_method_result.h
-@@ -8,6 +8,7 @@
- #include <memory>
- #include <string>
- #include <vector>
-+#include <cstdint>
-
- #include "binary_messenger.h"
- #include "method_codec.h"
-diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/message_codec.h b/src/flutter/shell/platform/common/client_wrapper/incl=
ude/flutter/message_codec.h
-index c84d25f..c007b1e 100644
---- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/mes=
sage_codec.h
-+++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/mes=
sage_codec.h
-@@ -8,6 +8,7 @@
- #include <memory>
- #include <string>
- #include <vector>
-+#include <cstdint>
-
- namespace flutter {
-
-diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/method_channel.h b/src/flutter/shell/platform/common/client_wrapper/inc=
lude/flutter/method_channel.h
-index 6e39a64..34687a6 100644
---- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_channel.h
-+++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_channel.h
-@@ -7,6 +7,7 @@
-
- #include <iostream>
- #include <string>
-+#include <cstdint>
-
- #include "binary_messenger.h"
- #include "engine_method_result.h"
-diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flut=
ter/method_codec.h b/src/flutter/shell/platform/common/client_wrapper/inclu=
de/flutter/method_codec.h
-index b40fa64..edd14d6 100644
---- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_codec.h
-+++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/met=
hod_codec.h
-@@ -8,6 +8,7 @@
- #include <memory>
- #include <string>
- #include <vector>
-+#include <cstdint>
-
- #include "method_call.h"
- #include "method_result.h"
---
-2.34.1
diff --git a/meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packageg=
roups/ti-test.bbappend b/meta-arago-test/dynamic-layers/qt6-layer/recipes-c=
ore/packagegroups/ti-test.bbappend
deleted file mode 100644
index 8d1f95f7..00000000
--- a/meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/t=
i-test.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-# Include the examples for Qt6 related tests
-# Include qtwayland for wayland support if the distro enables it
-
-TI_TEST_EXTRAS:append =3D " \
-    qtbase-examples \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland', '', d)=
} \
-"
diff --git a/meta-arago-test/licenses/Stream_Benchmark_License b/meta-arago=
-test/licenses/Stream_Benchmark_License
deleted file mode 100644
index cf1c8e00..00000000
--- a/meta-arago-test/licenses/Stream_Benchmark_License
+++ /dev/null
@@ -1,34 +0,0 @@
-*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-*-----------------------------------------------------------------------
-* Copyright 1991-2003: John D. McCalpin
-*-----------------------------------------------------------------------
-* License:
-*  1. You are free to use this program and/or to redistribute
-*     this program.
-*  2. You are free to modify this program for your own use,
-*     including commercial use, subject to the publication
-*     restrictions in item 3.
-*  3. You are free to publish results obtained from running this
-*     program, or from works that you derive from this program,
-*     with the following limitations:
-*     3a. In order to be referred to as "STREAM benchmark results",
-*         published results must be in conformance to the STREAM
-*         Run Rules, (briefly reviewed below) published at
-*         http://www.cs.virginia.edu/stream/ref.html
-*         and incorporated herein by reference.
-*         As the copyright holder, John McCalpin retains the
-*         right to determine conformity with the Run Rules.
-*     3b. Results based on modified source code or on runs not in
-*         accordance with the STREAM Run Rules must be clearly
-*         labelled whenever they are published.  Examples of
-*         proper labelling include:
-*         "tuned STREAM benchmark results"=20
-*         "based on a variant of the STREAM benchmark code"
-*         Other comparable, clear and reasonable labelling is
-*         acceptable.
-*     3c. Submission of results to the STREAM benchmark web site
-*         is encouraged, but not required.
-*  4. Use of this program or creation of derived works based on this
-*     program constitutes acceptance of these licensing restrictions.
-*  5. Absolutely no warranty is expressed or implied.
-*-----------------------------------------------------------------------
diff --git a/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmark=
s_1.3.bb b/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_=
1.3.bb
deleted file mode 100644
index 8cdd1a6f..00000000
--- a/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.b=
b
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "ARM Benchmarks"
-HOMEPAGE =3D "https://gforge.ti.com/gf/project/am_benchmarks/"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7aefb5e1cffc7b6a3ef18b803f95792=
2"
-SECTION =3D "system"
-
-PR =3D "r13"
-
-BRANCH ?=3D "master"
-SRCREV =3D "fefaf9bdd6f36ab0cebaab8dbf34e5beb50f471c"
-
-SRC_URI =3D "git://git.ti.com/git/apps/arm_benchmarks.git;protocol=3Dhttps=
;branch=3D${BRANCH}"
-
-do_compile() {
-	export CROSS_COMPILE=3D${TARGET_PREFIX}
-	export CFLAGS=3D'${TARGET_CC_ARCH} -std=3Dgnu11'
-	# build the release version
-	oe_runmake release CC=3D"${CC}"
-}
-do_install() {
-
-	oe_runmake DESTDIR=3D${D} install
-}
diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-ba=
ndwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-ba=
ndwidth.bb
deleted file mode 100644
index 29db78c3..00000000
--- a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth=
.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY =3D "Benchmark for checking DDR bandwidth"
-HOMEPAGE =3D "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tre=
e/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh"
-LICENSE =3D "CC-BY-SA-3.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa=
9"
-
-PV =3D "1.0"
-
-SRC_URI =3D " \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/arm_app=
s/arm_ddr_bandwidth/runLmDDRBandwidth.sh;name=3DrunLmDDRBandwidth \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE=
;name=3Dlicense \
-"
-SRC_URI[runLmDDRBandwidth.sha256sum] =3D "67997d721b351344d8788200a15bb364=
0093045bc25f2b5307dd331ebd1556a3"
-SRC_URI[license.sha256sum] =3D "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326=
695a0cc7074bd6c8d263e3"
-
-S =3D "${UNPACKDIR}"
-
-do_install() {
-    install -d ${D}${datadir}/matrix-gui-2.0/apps
-
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/runLmDDRBandwidth.sh ${D}${bindir}/runLmDDRBandwi=
dth.sh
-}
-
-FILES:${PN} =3D " \
-    ${datadir}/matrix-gui-2.0/apps \
-    ${bindir}/runLmDDRBandwidth.sh \
-"
-
diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark-ti.inc b/m=
eta-arago-test/recipes-benchmark/coremark/coremark-ti.inc
deleted file mode 100644
index 9a1d9b89..00000000
--- a/meta-arago-test/recipes-benchmark/coremark/coremark-ti.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/coremark:"
-
-SRC_URI +=3D "file://0001-core_main-Remove-printing-compiler-flags.patch"
diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_=
main-Remove-printing-compiler-flags.patch b/meta-arago-test/recipes-benchma=
rk/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch
deleted file mode 100644
index ef7c78b2..00000000
--- a/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Re=
move-printing-compiler-flags.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0af4e2298ccacc8afc0294b7a731f0e866155427 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Mon, 1 Dec 2025 12:21:23 -0600
-Subject: [PATCH] core_main: Remove printing compiler flags
-
-Reproducible builds do not like including anything that references the
-build environment on the host machine.  This would include printing out
-the COMPILER_FLAGS macro.  Substitute it with "".
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- core_main.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/core_main.c b/core_main.c
-index a4beeb6..f0ab87f 100644
---- a/core_main.c
-+++ b/core_main.c
-@@ -380,7 +380,7 @@ for (i =3D 0; i < MULTITHREAD; i++)
-     ee_printf("Iterations       : %lu\n",
-               (long unsigned)default_num_contexts * results[0].iterations=
);
-     ee_printf("Compiler version : %s\n", COMPILER_VERSION);
--    ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
-+    ee_printf("Compiler flags   : %s\n", ""); //Reproducible build fix: C=
OMPILER_FLAGS);
- #if (MULTITHREAD > 1)
-     ee_printf("Parallel %s : %d\n", PARALLEL_METHOD, default_num_contexts=
);
- #endif
-@@ -410,7 +410,7 @@ for (i =3D 0; i < MULTITHREAD; i++)
-                       default_num_contexts * results[0].iterations
-                           / time_in_secs(total_time),
-                       COMPILER_VERSION,
--                      COMPILER_FLAGS);
-+                      ""); //Reproducible build fix: COMPILER_FLAGS);
- #if defined(MEM_LOCATION) && !defined(MEM_LOCATION_UNSPEC)
-             ee_printf(" / %s", MEM_LOCATION);
- #else
---=20
-2.43.0
-
diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark_%.bbappend=
 b/meta-arago-test/recipes-benchmark/coremark/coremark_%.bbappend
deleted file mode 100644
index 952d6e99..00000000
--- a/meta-arago-test/recipes-benchmark/coremark/coremark_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-COREMARK_TI =3D ""
-COREMARK_TI:ti-soc =3D "coremark-ti.inc"
-
-require ${COREMARK_TI}
diff --git a/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte-ti.i=
nc b/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte-ti.inc
deleted file mode 100644
index f571f368..00000000
--- a/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte-ti.inc
+++ /dev/null
@@ -1 +0,0 @@
-ARM_INSTRUCTION_SET =3D "arm"
diff --git a/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bb=
append b/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappe=
nd
deleted file mode 100644
index dfe5ea96..00000000
--- a/meta-arago-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-NBENCH_BYTE_TI =3D ""
-NBENCH_BYTE_TI:ti-soc =3D "nbench-byte-ti.inc"
-
-require ${NBENCH_BYTE_TI}
diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb=
 b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
deleted file mode 100644
index 04a3fb79..00000000
--- a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY =3D "Benchmarks for checking various OpenSSL performance functions=
"
-HOMEPAGE =3D "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tre=
e/cryptos_apps_scripts/"
-LICENSE =3D "CC-BY-SA-3.0"
-LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/LICENSE;md5=3D6e0ae7214f6c74c149=
cb25f373057fa9"
-
-PV =3D "1.0"
-
-SRC_URI =3D " \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_perf_scripts/openssl_perf.sh;name=3Dopenssl_perf \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_aes256_encdec_scripts/openssl_aes256_encdec.sh;name=
=3Dopenssl_aes256_encdec \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_display_cert_scripts/openssl_display_cert.sh;name=3Do=
penssl_display_cert \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_gen_cert_scripts/openssl_gen_cert.sh;name=3Dopenssl_g=
en_cert \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_gen_pubkey_scripts/openssl_gen_pubkey.sh;name=3Dopens=
sl_gen_pubkey \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_gen_sha1hash_scripts/openssl_gen_sha1hash.sh;name=3Do=
penssl_gen_sha1hash \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_start_server_scripts/openssl_start_server.sh;name=3Do=
penssl_start_server \
-    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE=
;name=3Dlicense \
-"
-SRC_URI[openssl_perf.sha256sum] =3D "5769e841b977d6a858da38826c2cf47c288ed=
642614c5b6f802409cb3601ab29"
-SRC_URI[openssl_aes256_encdec.sha256sum] =3D "1a488e3ba98f6f2e5f73c14681b0=
452ba902aecbb174e4e74b524dda4c5eda7a"
-SRC_URI[openssl_display_cert.sha256sum] =3D "fbe80fe1afe29f777e346ecd86d89=
e1f27cedc1bb745a9a9bc5cd38f2d566a3e"
-SRC_URI[openssl_gen_cert.sha256sum] =3D "47bfc80b88edebcc4d82ee3816bc05b95=
ca0d42c42e7f3b83e74fa6f9c6c01ef"
-SRC_URI[openssl_gen_pubkey.sha256sum] =3D "4581e2329afeb814602c4874ffa038d=
95a4bcc8b23df24d7be25822d0dd6c433"
-SRC_URI[openssl_gen_sha1hash.sha256sum] =3D "f338f8c3067ebb1c5710b16b91e8b=
9e38685b05fcc072060ec0c62bd10cefd97"
-SRC_URI[openssl_start_server.sha256sum] =3D "e23499210f701ef831d39a8c732f3=
4f4b06fb3ba2d069c4a95ef25ae59f3c93e"
-SRC_URI[license.sha256sum] =3D "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326=
695a0cc7074bd6c8d263e3"
-
-S =3D "${UNPACKDIR}"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
-    install -m 0755 ${S}/openssl_aes256_encdec.sh ${D}${bindir}/openssl_ae=
s256_encdec.sh
-    install -m 0755 ${S}/openssl_display_cert.sh ${D}${bindir}/openssl_dis=
play_cert.sh
-    install -m 0755 ${S}/openssl_gen_cert.sh ${D}${bindir}/openssl_gen_cer=
t.sh
-    install -m 0755 ${S}/openssl_gen_pubkey.sh ${D}${bindir}/openssl_gen_p=
ubkey.sh
-    install -m 0755 ${S}/openssl_gen_sha1hash.sh ${D}${bindir}/openssl_gen=
_sha1hash.sh
-    install -m 0755 ${S}/openssl_start_server.sh ${D}${bindir}/openssl_sta=
rt_server.sh
-}
-
-FILES:${PN} =3D "\
-    ${bindir}/openssl_perf.sh \
-    ${bindir}/openssl_aes256_encdec.sh \
-    ${bindir}/openssl_display_cert.sh \
-    ${bindir}/openssl_gen_cert.sh \
-    ${bindir}/openssl_gen_pubkey.sh \
-    ${bindir}/openssl_gen_sha1hash.sh \
-    ${bindir}/openssl_start_server.sh \
-"
-
diff --git a/meta-arago-test/recipes-benchmark/stream/stream_%.bbappend b/m=
eta-arago-test/recipes-benchmark/stream/stream_%.bbappend
deleted file mode 100644
index ac18074a..00000000
--- a/meta-arago-test/recipes-benchmark/stream/stream_%.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-INSANE_SKIP:${PN} +=3D "ldflags"
-INSANE_SKIP:${PN}-openmp +=3D "ldflags"
-
-PR:append =3D ".arago1"
-
-BRANCH =3D "sdk"
-SRCREV =3D "96156d407d9a4e5fac4513f3d3f60a414b3355cd"
-
-do_compile:prepend() {
-    #Explicitly clear some variables to insure no unexpected optimizations=
 are being passed in.
-    unset CFLAGS
-    unset LDFLAGS
-}
diff --git a/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb b/meta=
-arago-test/recipes-benchmark/stream/stream_5.10.bb
deleted file mode 100644
index 484be34d..00000000
--- a/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY =3D "Stream Benchmark"
-HOMEPAGE =3D "http://www.cs.virginia.edu/stream/"
-LICENSE =3D "Stream_Benchmark_License"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbca8cbe07976fe64c8946378d08=
314b0"
-SECTION =3D "system"
-
-PR =3D "r0"
-
-BRANCH ?=3D "master"
-SRCREV =3D "b66f2bab5d6d0b35732ef8406ae03873725a3306"
-
-SRC_URI =3D "git://git.ti.com/git/arago-project-org/stream.git;protocol=3D=
https;branch=3D${BRANCH}"
-
-PACKAGES =3D+ "${PN}-openmp"
-
-do_compile() {
-	oe_runmake CC=3D"${CC}"
-}
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/stream_c ${D}/${bindir}/
-	install -m 0755 ${S}/stream_c_openmp ${D}/${bindir}/
-}
-
-FILES:${PN}-openmp =3D "${bindir}/stream_c_openmp"
diff --git a/meta-arago-test/recipes-bsp/switch-config/files/0001-Use-prope=
r-definition-of-boolean-type.patch b/meta-arago-test/recipes-bsp/switch-con=
fig/files/0001-Use-proper-definition-of-boolean-type.patch
deleted file mode 100644
index fe18b3b0..00000000
--- a/meta-arago-test/recipes-bsp/switch-config/files/0001-Use-proper-defin=
ition-of-boolean-type.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5190913c7a86cd36b91dc3a6ff4c1eb22ea6375e Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@konsulko.com>
-Date: Tue, 6 May 2025 12:52:14 -0400
-Subject: [PATCH] Use proper definition of boolean type
-
-Newer versions of GCC and C standard have bool as a built-in
-keyword - use a standard stdbool.h header to properly handle it.
-
-Upstream-Status: Inactive-Upstream
-
-Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
----
- switch-config.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/switch-config.c b/switch-config.c
-index d31a237..5b5db3a 100644
---- a/switch-config.c
-+++ b/switch-config.c
-@@ -13,10 +13,7 @@
-  * GNU General Public License for more details.
-  */
-
--#define true 1
--#define false 0
--typedef int bool;
--
-+#include <stdbool.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
---
-2.25.1
diff --git a/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb=
 b/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
deleted file mode 100644
index 90834edb..00000000
--- a/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY =3D "Ethernet Switch configuration management"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://switch-config.c;beginline=3D1;endline=3D14;md=
5=3D659ff9658cbaba3110b81804af60de75"
-
-PV =3D "2.0"
-PR =3D "r5"
-
-BRANCH ?=3D "v4.1"
-BRANCH:aarch64 ?=3D "am65x-v1.0"
-
-SRCREV =3D "412dce4e65cfe5af729be38fd1b4c1d59e9a8828"
-SRCREV:aarch64 =3D "0f52dcb3c4e3678e96427d546d6c2e1fabc2ad91"
-
-SRC_URI =3D "git://git.ti.com/git/switch-config/switch-config.git;protocol=
=3Dhttps;branch=3D${BRANCH}"
-
-SRC_URI +=3D "file://0001-Use-proper-definition-of-boolean-type.patch"
-
-EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${CC}""
-
-do_configure() {
-	sed 's|-I$(KBUILD_OUTPUT)/usr/include|${TOOLCHAIN_OPTIONS} -I.|' -i ${S}/=
Makefile
-}
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/switch-config ${D}${bindir}/switch-config
-}
diff --git a/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.b=
b b/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
deleted file mode 100644
index 6a3c64d1..00000000
--- a/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY =3D "OpenNTPD is an implementation of the Network Time Protocol."
-DESCRIPTION =3D "OpenNTPD is a FREE, easy to use implementation of the Net=
work Time Protocol."
-HOMEPAGE =3D "http://www.openntpd.org/"
-SECTION =3D "console/network"
-LICENSE =3D "BSD-3-Clause & ISC"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfe922aad2b6ad1c359cf2adfdaaab1b=
6"
-
-PR =3D "r0"
-
-SRC_URI =3D "https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
-SRC_URI[md5sum] =3D "7c68ce2627b2ea13f2b95db1ef4fcfc5"
-SRC_URI[sha256sum] =3D "8582db838a399153d4a17f2a76518b638cc3020f58028575bf=
54127518f55a46"
-
-inherit autotools
-
-LDFLAGS +=3D "-lrt"
-EXTRA_OECONF +=3D "LDFLAGS=3D"${LDFLAGS}" CFLAGS=3D"${CFLAGS}"\
-                 --with-privsep-user=3Droot"
-
-do_install:append() {
-    # don't install empty /var/run and /run to avoid conflict with base-fi=
les
-    rm -rf ${D}${localstatedir}/run
-    rm -rf ${D}/run
-}
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
deleted file mode 100644
index b76db623..00000000
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ /dev/null
@@ -1,226 +0,0 @@
-SUMMARY =3D "TI Testing packagegroup"
-LICENSE =3D "MIT"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-PACKAGES +=3D " \
-    ${PN}-audio \
-    ${PN}-extras \
-    ${PN}-graphics \
-    ${PN}-multimedia \
-    ${PN}-networking \
-    ${PN}-storage \
-    ${PN}-ti-tools \
-"
-
-TI_TEST_BASE =3D "\
-    bc \
-    bonnie++ \
-    cryptodev-tests \
-    devmem2 \
-    dma-heap-tests \
-    evtest \
-    git \
-    i2c-tools \
-    kernel-modules \
-    kernel-selftest \
-    kmsxx \
-    kmsxx-python \
-    libdrm-tests \
-    linuxptp \
-    lmbench \
-    lsof \
-    media-ctl \
-    memtester \
-    nbench-byte \
-    openntpd \
-    ${@"optee-test" if d.getVar('OPTEEMACHINE') else ""} \
-    pcitest \
-    pciutils \
-    perf \
-    powertop \
-    procps \
-    rng-tools \
-    rt-tests \
-    rwmem \
-    smcroute \
-    stream \
-    stress \
-    stress-ng \
-"
-
-TI_TEST_BASE:remove:bsp-ti-6_18 =3D "pcitest"
-
-TI_TEST_BASE:append:armv7a =3D " \
-    cpuburn-neon \
-"
-
-TI_TEST_BASE:append:armv7ve =3D " \
-    cpuburn-neon \
-"
-
-TI_TEST_AUDIO =3D "\
-    alsa-utils \
-    pulseaudio-misc \
-"
-
-TI_TEST_EXTRAS_OPENCL =3D " \
-    opencl-cts \
-"
-
-TI_TEST_EXTRAS =3D " \
-    python3-pillow \
-    pytesseract \
-    python3-numpy \
-    python3-requests \
-    python3-websocket-client \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OP=
ENCL}', '', d)} \
-"
-
-TI_TEST_EXTRAS:append:ti-soc =3D " \
-    libsdl2-tests \
-"
-
-TI_TEST_GRAPHICS_OPENGL =3D " \
-    piglit \
-    offscreendemo \
-"
-
-TI_TEST_GRAPHICS =3D " \
-    wayland-utils \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_GRAPHICS_=
OPENGL}', '', d)} \
-"
-
-TI_TEST_MULTIMEDIA =3D "\
-    gst-devtools \
-    v4l-utils \
-    yavta \
-"
-
-TI_TEST_MULTIMEDIA:append:ti-soc =3D " \
-    mpv \
-    ffmpeg \
-"
-
-TI_TEST_NETWORKING =3D "\
-    bridge-utils \
-    ethtool \
-    iperf3 \
-    iproute2-bridge \
-    iproute2-devlink \
-    iproute2-tc \
-    lldpd \
-    mstpd \
-    netperf \
-    strongswan \
-    tcpdump \
-    xdp-tools-arago \
-"
-
-TI_TEST_STORAGE =3D "\
-    dosfstools \
-    fio \
-    hdparm \
-    iozone3 \
-    mtd-utils \
-    mtd-utils-ubifs \
-"
-
-TI_TEST_STORAGE:append:ti-soc =3D " \
-    mtd-utils-ubifs-tests \
-"
-
-TI_TEST_TI_TOOLS =3D " \
-    arm-benchmarks \
-    arm-ddr-bandwidth \
-    coremark \
-    hwspinlocktest \
-    input-utils \
-    ltp-ddt \
-    openssl-perf \
-    uvc-gadget \
-"
-
-TI_TEST_TI_TOOLS:append:ti33x =3D " \
-    omapconf \
-    pru-icss \
-    switch-config \
-"
-
-TI_TEST_TI_TOOLS:append:ti43x =3D " \
-    omapconf \
-    pru-icss \
-    switch-config \
-"
-
-TI_TEST_TI_TOOLS:append:am57xx =3D " \
-    omapconf \
-    pru-icss \
-    switch-config \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
-        ti-ipc-test \
-    ", d)} \
-"
-
-TI_TEST_TI_TOOLS:append:k3 =3D " \
-    k3conf \
-    switch-config \
-    ti-rtos-echo-test-fw \
-    ti-rpmsg-char \
-    ti-rpmsg-char-examples \
-"
-
-TI_TEST_TI_TOOLS:append:am62xx   =3D " \
-    pru-icss \
-"
-
-TI_TEST_TI_TOOLS:append:am64xx   =3D " \
-    pru-icss \
-"
-
-TI_TEST_TI_TOOLS:append:am65xx   =3D " \
-    pru-icss \
-"
-
-# Disable due to breakage
-#    viddec-test-app=20
-TI_TEST_TI_TOOLS:append:j721e =3D " \
-    pru-icss \
-    ufs-utils \
-    videnc-test-app \
-"
-
-TI_TEST_TI_TOOLS:append:j784s4 =3D " \
-    ufs-utils \
-"
-
-TI_TEST_TI_TOOLS:append:j742s2 =3D " \
-    ufs-utils \
-"
-
-TI_TEST_TI_TOOLS:append:omapl138 =3D " \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti-ipc-test', =
d)} \
-"
-
-RDEPENDS:${PN}-audio =3D "${TI_TEST_AUDIO}"
-RDEPENDS:${PN}-extras =3D "${TI_TEST_EXTRAS}"
-RDEPENDS:${PN}-graphics =3D "${TI_TEST_GRAPHICS}"
-RDEPENDS:${PN}-multimedia =3D "${TI_TEST_MULTIMEDIA}"
-RDEPENDS:${PN}-networking =3D "${TI_TEST_NETWORKING}"
-RDEPENDS:${PN}-storage =3D "${TI_TEST_STORAGE}"
-RDEPENDS:${PN}-ti-tools =3D "${TI_TEST_TI_TOOLS}"
-
-RDEPENDS:${PN} =3D "\
-    ${TI_TEST_BASE} \
-    ${PN}-networking \
-    ${PN}-storage \
-    ${PN}-ti-tools \
-"
-
-RDEPENDS:${PN}-extras +=3D "\
-    ${PN}-audio \
-    ${PN}-graphics \
-    ${PN}-multimedia \
-"
diff --git a/meta-arago-test/recipes-devtools/bpftool/bpftool-native-ti.inc=
 b/meta-arago-test/recipes-devtools/bpftool/bpftool-native-ti.inc
deleted file mode 100644
index 213a0f4e..00000000
--- a/meta-arago-test/recipes-devtools/bpftool/bpftool-native-ti.inc
+++ /dev/null
@@ -1 +0,0 @@
-DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
diff --git a/meta-arago-test/recipes-devtools/bpftool/bpftool-native_%.bbap=
pend b/meta-arago-test/recipes-devtools/bpftool/bpftool-native_%.bbappend
deleted file mode 100644
index 3d084dcc..00000000
--- a/meta-arago-test/recipes-devtools/bpftool/bpftool-native_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-BPFTOOL_NATIVE_TI =3D ""
-BPFTOOL_NATIVE_TI:ti-soc =3D "bpftool-native-ti.inc"
-
-require ${BPFTOOL_NATIVE_TI}
diff --git a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb b/=
meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
deleted file mode 100644
index 3c0eaa5a..00000000
--- a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "Test cases for DMA-Heap framework"
-HOMEPAGE =3D "https://github.com/glneo/dma-heap-tests"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4c3b4cb87cfc8ccba69d579fbd7b0fb=
3"
-
-PV =3D "1.0"
-
-BRANCH =3D "master"
-SRC_URI =3D "git://github.com/glneo/dma-heap-tests.git;protocol=3Dhttps;br=
anch=3D${BRANCH}"
-SRCREV =3D "230b406e97c12be5f930125a432d0dfa0316aa39"
-
-DEPENDS =3D "googletest"
-
-inherit cmake pkgconfig
diff --git a/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-=
autoconf-fix-for-cross-compilation-for-ARM.patch b/meta-arago-test/recipes-=
devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-fo=
r-ARM.patch
deleted file mode 100644
index 075920b4..00000000
--- a/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autocon=
f-fix-for-cross-compilation-for-ARM.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From fb1bbf8342c4a87380964465443bbb4b61dc0259 Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Tue, 5 Nov 2013 05:22:10 -0600
-Subject: [PATCH] autoconf: fix for cross compilation for ARM
-
-* Based on changes from Yebio Mesfin fixup the input-utils to
-  cross compile for ARM.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- mk/Autoconf.mk  |    8 ++++++--
- mk/Variables.mk |    4 ++--
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/mk/Autoconf.mk b/mk/Autoconf.mk
-index 7608ea5..95999cc 100644
---- a/mk/Autoconf.mk
-+++ b/mk/Autoconf.mk
-@@ -47,11 +47,13 @@ ac_uname =3D $(shell \
- 	$(call ac_s_cmd,uname -s | tr 'A-Z' 'a-z');\
- 	$(call ac_fini))
-=20
--ac_uname_arch =3D $(shell \
-+#ac_uname_arch =3D $(shell \
- 	$(call ac_init,for arch);\
- 	$(call ac_s_cmd,uname -m | tr 'A-Z' 'a-z');\
- 	$(call ac_fini))
-=20
-+ac_uname_arch =3D arm
-+
- # check for some header file
- # args: header file
- ac_header =3D $(shell \
-@@ -108,12 +110,14 @@ ac_binary =3D $(shell \
- #	$(call ac_s_cmd,$(CC) -print-search-dirs | grep -q lib64 &&\
- #		echo "lib64" || echo "lib");\
- #	$(call ac_fini))
--ac_lib64 =3D $(shell \
-+#ac_lib64 =3D $(shell \
- 	$(call ac_init,for libdir name);\
- 	$(call ac_s_cmd,/sbin/ldconfig -p | grep -q lib64 &&\
- 		echo "lib64" || echo "lib");\
- 	$(call ac_fini))
-=20
-+ac_lib64 =3D gcc
-+
- # check for x11 ressource dir prefix
- ac_resdir =3D $(shell \
- 	$(call ac_init,for X11 app-defaults prefix);\
-diff --git a/mk/Variables.mk b/mk/Variables.mk
-index 99f787c..fd47f73 100644
---- a/mk/Variables.mk
-+++ b/mk/Variables.mk
-@@ -24,8 +24,8 @@ endif
- RELTAG	:=3D v$(subst .,_,$(VERSION))
-=20
- # programs
--CC		?=3D gcc
--CXX		?=3D g++
-+CC		?=3D $(CROSS_COMPILE)gcc
-+CXX		?=3D $(CROSS_COMPILE)g++
- MOC             ?=3D $(if $(QTDIR),$(QTDIR)/bin/moc,moc)
-=20
- STRIP		?=3D -s
---=20
-1.7.0.4
-
diff --git a/meta-arago-test/recipes-devtools/input-utils/input-utils/fix-f=
tbfs-echo.patch b/meta-arago-test/recipes-devtools/input-utils/input-utils/=
fix-ftbfs-echo.patch
deleted file mode 100644
index e6631003..00000000
--- a/meta-arago-test/recipes-devtools/input-utils/input-utils/fix-ftbfs-ec=
ho.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Description: Fix FTBFS due to -e leaking into Make.config
- If /bin/sh is configured to point to dash, echo does not support -e switc=
h
- which is used by mk/Autoconf.mk file to generate Make.config. Use 'env ec=
ho'
- instead.
-Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Bug-Debian: http://bugs.debian.org/750265
-Forwarded: no
-Last-Update: 2014-07-09
-Upstream-Status: Inactive-Upstream [lastrelease: 2008-2012]
-
---- input-utils-1.0.orig/mk/Autoconf.mk
-+++ input-utils-1.0/mk/Autoconf.mk
-@@ -162,7 +162,7 @@ config: Make.config
-	@true
-
- Make.config: $(srcdir)/GNUmakefile
--	@echo -e "$(make-config-q)" > $@
-+	@env echo -e "$(make-config-q)" > $@
-	@echo
-	@echo "Make.config written, edit if needed"
-	@echo
diff --git a/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.b=
b b/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
deleted file mode 100644
index 11062713..00000000
--- a/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY =3D "Utilities for the Linux input drivers"
-HOMEPAGE =3D "http://packages.tanglu.org/source/aequorea/input-utils"
-
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28=
b"
-
-PV =3D "1.0"
-PR =3D "r0"
-
-SRC_URI =3D "http://ftp.de.debian.org/debian/pool/main/i/input-utils/input=
-utils_1.0.orig.tar.gz \
-	file://fix-ftbfs-echo.patch"
-SRC_URI:append:arm =3D " file://0001-autoconf-fix-for-cross-compilation-fo=
r-ARM.patch"
-
-SRC_URI[md5sum] =3D "3e58772e8647093b1de2f2c90bfb9ee8"
-SRC_URI[sha256sum] =3D "ab6f550f01bb5fcede492ab88711d82bacee4229cf2f5dc55a=
349b3bff4e3b13"
-
-S =3D "${UNPACKDIR}/input-1.0"
-
-do_compile () {
-    oe_runmake
-}
-
-# set the DESTDIR and the STRIP variables used by the GNUmakefile.
-# The STRIP variable is set to blank or else the variable setting from OE
-# is picked up as <TC>-strip and the install step sees that as another
-# file to install.
-EXTRA_OEMAKE =3D "DESTDIR=3D${D} STRIP=3D''"
-
-do_install () {
-    oe_runmake install
-}
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-__cl=
ear_cache-declaration-for-clang.patch b/meta-arago-test/recipes-devtools/lt=
p-ddt/ltp-ddt/0001-Add-__clear_cache-declaration-for-clang.patch
deleted file mode 100644
index 24e8762f..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-__clear_cac=
he-declaration-for-clang.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a2ce04cb82d545f3dbab71de7fa55eaad3df3063 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Jun 2024 22:52:56 -0700
-Subject: [PATCH] Add __clear_cache declaration for clang
-
-__clear_cache was enabled on RISCV recently with 7352ba02390116f1cd6a9b583=
860ba28aa0a1b7a
-however it fails to compile with clang19 on RISCV
-With this error
-
-  hugemmap15.c:51:2: error: call to undeclared function '__clear_cache'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
-      51 |         __clear_cache(p, p + COPY_SIZE);
-         |         ^
-
-Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-June=
/038762.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Hui Min Mina Chou <minachou@andestech.com>
----
- testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcase=
s/kernel/mem/hugetlb/hugemmap/hugemmap15.c
-index 1dde9e87b..6a6f5fe5e 100644
---- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
-+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
-@@ -19,6 +19,7 @@
-=20
- #if defined(__clang__)
- 	#pragma clang optimize off
-+	void __clear_cache(void *start, void *end);
- #endif
-=20
- #define _GNU_SOURCE
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-O=
OM-tests-from-runtest-mm.patch b/meta-arago-test/recipes-devtools/ltp-ddt/l=
tp-ddt/0001-Remove-OOM-tests-from-runtest-mm.patch
deleted file mode 100644
index 860b2f12..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-OOM-test=
s-from-runtest-mm.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bb9146dd322af98a7bb96ad0d84ec376589c6cde Mon Sep 17 00:00:00 2001
-From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
-Date: Wed, 29 Jul 2020 08:47:09 -0400
-Subject: [PATCH] Remove OOM tests from runtest/mm
-
-Disable OOM tests, as they might cause oeqa ssh connection lost
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
-[ pvorel: rebased for 20210927 ]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- runtest/mm | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/runtest/mm b/runtest/mm
-index 41d624ad8..1e8c22638 100644
---- a/runtest/mm
-+++ b/runtest/mm
-@@ -69,12 +69,6 @@ ksm07 ksm07
- cpuset01 cpuset01
- cpuset02 cpuset02
-=20
--oom01 oom01
--oom02 oom02
--oom03 oom03
--oom04 oom04
--oom05 oom05
--
- swapping01 swapping01 -i 5
-=20
- thp01 thp01 -I 120
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-=
mk-Fix-installing-subdirs.patch b/meta-arago-test/recipes-devtools/ltp-ddt/=
ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch
deleted file mode 100644
index 5f970a12..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-=
installing-subdirs.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5907227ad86a93b084a52a7ff8dd8cb791c228a5 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Mon, 27 Apr 2026 11:02:32 -0500
-Subject: [PATCH] include/mk: Fix installing subdirs
-
-When installing sub directories, the INSTALL_MODE was being used for the
-dirs as well.  But in runtest/Makefile the INSTALL_MODE is being set to
-00644.  This causes the ddt dir to lose the execute bits and stop acting
-like a directory.
-
-Simple fix is create INSTALL_MODE_DIR and use it when installing
-directories.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- include/mk/env_post.mk  | 1 +
- include/mk/functions.mk | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
-index ab31da73a..c2e85439a 100644
---- a/include/mk/env_post.mk
-+++ b/include/mk/env_post.mk
-@@ -58,6 +58,7 @@ INSTALL_TARGETS			:=3D $(patsubst $(abs_srcdir)/%,%,$(IN=
STALL_TARGETS))
- # The large majority of the files that we install are going to be apps an=
d
- # scripts, so let's chmod them like that.
- INSTALL_MODE			?=3D 00775
-+INSTALL_MODE_DIR		?=3D 00775
-=20
- $(abspath $(addprefix $(DESTDIR)/$(INSTALL_DIR)/,$(sort $(dir $(INSTALL_T=
ARGETS) $(MAKE_TARGETS))))):
- 	mkdir -p "$@"
-diff --git a/include/mk/functions.mk b/include/mk/functions.mk
-index 60dbed395..8e4bc973c 100644
---- a/include/mk/functions.mk
-+++ b/include/mk/functions.mk
-@@ -18,7 +18,7 @@ INSTALL_FILES		+=3D $$(abspath $$(DESTDIR)/$(3)/$(1))
-=20
- $$(abspath $$(DESTDIR)/$(3)/$(1)): \
-     $$(abspath $$(dir $$(DESTDIR)/$(3)/$(1)))
--	install -m $$(INSTALL_MODE) $(shell test -d "$(2)/$(1)" && echo "-d") $(=
PARAM) "$(2)/$(1)" $$@
-+	install $(shell test -d "$(2)/$(1)" || echo "-m $(INSTALL_MODE)") $(shel=
l test -d "$(2)/$(1)" && echo "-m $(INSTALL_MODE_DIR) -d") $(PARAM) "$(2)/$=
(1)" $$@
- 	$(shell test -d "$(2)/$(1)" && echo "install -m "'$$(INSTALL_MODE) $(PAR=
AM)' "$(2)/$(1)/*" -t '$$@')
- endef
-=20
---=20
-2.43.0
-
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-ltp-fix-=
build-failure-with-glibc-2.43.patch b/meta-arago-test/recipes-devtools/ltp-=
ddt/ltp-ddt/0001-ltp-fix-build-failure-with-glibc-2.43.patch
deleted file mode 100644
index 7c78660e..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-ltp-fix-build-f=
ailure-with-glibc-2.43.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-ltp: fix build failure with glibc 2.43
-
-glibc 2.43 added native openat2() support for the first time. This
-caused compatibility issues with LTP's internal openat2 definitions
-in lapi/openat2.h. LTP's configure detects glibc's openat2() and
-sets HAVE_OPENAT2=3D1, causing lapi/openat2.h to skip its own
-definitions of struct open_how, RESOLVE_* constants and the openat2()
-wrapper, resulting in a build failure.
-
-Undef HAVE_OPENAT2 in lapi/openat2.h to force LTP to always use its
-own internal definitions.this is a workaround until the fix is found.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-
-diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
-index 03327bdb7..bd44573c9 100644
---- a/include/lapi/openat2.h
-+++ b/include/lapi/openat2.h
-@@ -14,6 +14,11 @@
-
- #include "config.h"
-
-+/* glibc 2.43 provides openat2 but LTP uses its own syscall wrapper */
-+#ifdef HAVE_OPENAT2
-+#undef HAVE_OPENAT2
-+#endif
-+
- #ifndef HAVE_OPENAT2
- /*
-  * Arguments for how openat2(2) should open the target path. If only @fla=
gs and
-
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-syscalls=
-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta-arago-test/recipe=
s-devtools/ltp-ddt/ltp-ddt/0001-syscalls-semctl08-Skip-semctl08-when-__USE_=
TIME64_RE.patch
deleted file mode 100644
index 364e203e..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-syscalls-semctl=
08-Skip-semctl08-when-__USE_TIME64_RE.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 09364a758df9d89a0968894376f82f636441addb Mon Sep 17 00:00:00 2001
-From: Jiaying Song <jiaying.song.cn@windriver.com>
-Date: Fri, 23 May 2025 15:17:49 +0800
-Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRE=
CTS
- is defined
-
-When __USE_TIME64_REDIRECTS is defined, glibc redirects struct semid_ds to=
 a
-64-bit time-safe version that omits the sem_otime_high and sem_ctime_high
-fields. As a result, the case becomes invalid and leads to incorrect behav=
ior.
-
-This patch adds a check to skip the test when __USE_TIME64_REDIRECTS is
-defined, ensuring the test only runs when semid_ds structurally matches
-semid64_ds and the *_high fields are accessible.
-
-Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2025-May/=
043647.html]
-
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- testcases/kernel/syscalls/ipc/semctl/semctl08.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/k=
ernel/syscalls/ipc/semctl/semctl08.c
-index f4549adf4..28776f266 100644
---- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-+++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-@@ -12,7 +12,11 @@
- #include "tst_test.h"
- #include "libnewipc.h"
-=20
--#ifdef HAVE_SEMID64_DS_TIME_HIGH
-+#if !defined(HAVE_SEMID64_DS_TIME_HIGH)
-+TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fie=
lds");
-+#elif defined(__USE_TIME64_REDIRECTS)
-+TST_TEST_TCONF("test requires __USE_TIME64_REDIRECTS to be undefined");
-+#else
-=20
- static void run(void)
- {
-@@ -49,6 +53,4 @@ static struct tst_test test =3D {
- 	.test_all =3D run,
- 	.needs_tmpdir =3D 1,
- };
--#else
--TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fie=
lds");
- #endif
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
deleted file mode 100644
index c36a1625..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${TITESTBASE}/recipes-devtools/ltp-ddt/ltp-d=
dt:"
-
-require ltp_${PV}.inc
-
-SUMMARY =3D "Embedded Linux Device Driver Tests based on Linux Test Projec=
t"
-HOMEPAGE =3D "https://git.ti.com/cgit/test-automation/ltp-ddt/"
-
-DEPENDS +=3D "alsa-lib"
-
-PE =3D "1"
-PR =3D "r1"
-PV:append =3D "+git"
-
-SRCREV =3D "6a1c144a4bde8cd26c6cb4ce76e12ac1ca1ce079"
-BRANCH ?=3D "master"
-
-SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
-SRC_URI:prepend =3D "git://git.ti.com/git/test-automation/ltp-ddt.git;prot=
ocol=3Dhttps;branch=3D${BRANCH} "
-
-SRC_URI:append =3D " file://0001-include-mk-Fix-installing-subdirs.patch"
-
-export prefix =3D "/opt/ltp"
-export exec_prefix =3D "/opt/ltp"
-
-EXTRA_OEMAKE:append =3D " \
-    KERNEL_USR_INC=3D${WORKDIR} \
-    ALSA_INCPATH=3D${STAGING_INCDIR} \
-    ALSA_LIBPATH=3D${STAGING_LIBDIR} \
-"
-
-RDEPENDS:${PN} +=3D "\
-    acl \
-    at \
-    pm-qa \
-    serialcheck \
-    memtester \
-    libgpiod-tools \
-    iproute2-bridge \
-"
-
-do_install:append() {
-	# Upstream ltp recipe wants to remove this test case in do_install
-	install -d ${D}${prefix}/runtest/
-	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
-}
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/me=
ta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
deleted file mode 100644
index 4183b5d4..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
+++ /dev/null
@@ -1,157 +0,0 @@
-SUMMARY =3D "Linux Test Project"
-DESCRIPTION =3D "The Linux Test Project is a joint project with SGI, IBM, =
OSDL, and Bull with a goal to deliver test suites to the open source commun=
ity that validate the reliability, robustness, and stability of Linux. The =
Linux Test Project is a collection of tools for testing the Linux kernel an=
d related features."
-HOMEPAGE =3D "https://linux-test-project.github.io/"
-SECTION =3D "console/utils"
-LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.=
1-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "\
-    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
-    file://testcases/open_posix_testsuite/COPYING;md5=3D48b1c5ec633e3e30ec=
2cf884ae699947 \
-    file://testcases/network/can/filter-tests/COPYING;md5=3D5b155ea7d7f86e=
ae8e8832955d8b70bc \
-"
-
-DEPENDS =3D "attr libaio libcap acl openssl zip-native"
-DEPENDS:append:libc-musl =3D " fts "
-EXTRA_OEMAKE:append:libc-musl =3D " LIBC=3Dmusl "
-EXTRA_OECONF:append:libc-musl =3D " LIBS=3D-lfts "
-
-# since ltp contains x86-64 assembler which uses the frame-pointer registe=
r,
-# set -fomit-frame-pointer x86-64 to handle cases where optimisation
-# is set to -O0 or frame pointers have been enabled by -fno-omit-frame-poi=
nter
-# earlier in CFLAGS, etc.
-CFLAGS:append:x86-64 =3D " -fomit-frame-pointer"
-TUNE_CCARGS:remove:x86 =3D "-mfpmath=3Dsse"
-TUNE_CCARGS:remove:x86-64 =3D "-mfpmath=3Dsse"
-
-CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
-CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
-SRCREV =3D "6a60ae592cd375f004df0694efc7d50ddae9aa5e"
-
-SRC_URI =3D "git://github.com/linux-test-project/ltp.git;branch=3Dmaster;p=
rotocol=3Dhttps \
-           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-Add-__clear_cache-declaration-for-clang.patch \
-           file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_R=
E.patch \
-           file://0001-ltp-fix-build-failure-with-glibc-2.43.patch \
-          "
-
-inherit autotools-brokensep pkgconfig
-
-# Version 20220527 added KVM test infrastructure which currently fails to =
build with lld due to
-# SORT_NONE in linker script which isn't supported by gold:
-# https://sourceware.org/bugzilla/show_bug.cgi?id=3D18097
-# https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aa=
e326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0=
f5a8785c0dd6R36
-LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fuse-=
ld=3Dbfd', '', d)}"
-
-# After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
-# https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703=
ef9019aaf2f2dfebb
-# it fails with lld also a bit later when trying to use *-payload.bin
-# http://errors.yoctoproject.org/Errors/Details/663094/
-# work around this by forcing .bfd linked in LD when ld-is-lld is in DISTR=
O_FEATURES
-KVM_LD =3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-lld', '${HO=
ST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
-
-TARGET_CC_ARCH +=3D "${LDFLAGS}"
-
-export prefix =3D "/opt/${PN}"
-export exec_prefix =3D "/opt/${PN}"
-
-PACKAGECONFIG[numa] =3D "--with-numa, --without-numa, numactl,"
-EXTRA_AUTORECONF +=3D "-I ${S}/testcases/realtime/m4"
-EXTRA_OECONF =3D " --with-realtime-testsuite --with-open-posix-testsuite "
-# ltp network/rpc test cases ftbfs when libtirpc is found
-EXTRA_OECONF +=3D " --without-tirpc "
-
-do_compile() {
-    oe_runmake HOSTCC=3D"${CC_FOR_BUILD}" HOST_CFLAGS=3D"${CFLAGS_FOR_BUIL=
D}" HOST_LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" KVM_LD=3D"${KVM_LD}"
-}
-
-do_install(){
-    install -d ${D}${prefix}/
-    oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install include-install
-
-    # fixup not deploy STPfailure_report.pl to avoid confusing about it fa=
ils to run
-    # as it lacks dependency on some perl moudle such as LWP::Simple
-    # And this script previously works as a tool for analyzing failures fr=
om LTP
-    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly acces=
ses
-    # http://khack.osdl.org to retrieve ltp test results run on
-    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unacce=
ssible
-    rm -rf ${D}${prefix}/bin/STPfailure_report.pl
-
-    # The controllers memcg_stree test seems to cause us hangs and takes 9=
00s
-    # (maybe we expect more regular output?), anyhow, skip it
-    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
-
-    # min_free_kbytes can be disruptive on constrained targets
-    sed -e '/^min_free_kbytes/d' -i ${D}${prefix}/runtest/mm
-
-    # cve-2018-13405 triggers memory deadlock kernel panic on constrained =
targets
-    sed -e '/^cve-2018-13405/d' -i ${D}${prefix}/runtest/cve
-
-    # cve-2020-36557 triggers memory deadlock kernel panic on constrained =
targets
-    sed -e '/^cve-2020-36557/d' -i ${D}${prefix}/runtest/cve
-}
-
-RDEPENDS:${PN} =3D "\
-    attr \
-    bash \
-    bc \
-    coreutils \
-    cpio \
-    cronie \
-    curl \
-    e2fsprogs \
-    e2fsprogs-mke2fs \
-    expect \
-    file \
-    findutils \
-    gawk \
-    gdb \
-    gzip \
-    iproute2 \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d=
)} \
-    ldd \
-    libaio \
-    logrotate \
-    net-tools \
-    perl \
-    python3-core \
-    python3-kirk \
-    procps \
-    quota \
-    unzip \
-    util-linux \
-    which \
-    tar \
-"
-
-RRECOMMENDS:${PN} +=3D "kernel-module-loop"
-
-FILES:${PN} +=3D "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_group=
s/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/tes=
tscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/o=
pen_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/=
Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${pre=
fix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posi=
x_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${p=
refix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01=
/lib.a ${prefix}/lib/libmem.a"
-
-# Avoid stripping some generated binaries otherwise some of the ltp tests =
such as ldd01 & nm01 fail
-INHIBIT_PACKAGE_STRIP_FILES =3D "${prefix}/testcases/bin/nm01 ${prefix}/te=
stcases/bin/ldd01"
-INSANE_SKIP:${PN} +=3D "already-stripped staticdev"
-
-CACHED_CONFIGUREVARS:libc-musl =3D "ac_cv_type_struct_mnt_id_req=3Dno ac_c=
v_type_struct_statmount=3Dno"
-
-remove_broken_musl_sources() {
-	[ "${TCLIBC}" =3D "musl" ] || return 0
-
-	cd ${S}
-	bbverbnote "remove unsupported tests (until they're fixed)"
-
-	# sync with upstream
-	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L33
-	rm -rfv \
-		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
-		testcases/kernel/syscalls/getcontext/getcontext01.c \
-		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
-		testcases/kernel/syscalls/timer_create/timer_create01.c \
-		testcases/kernel/syscalls/timer_create/timer_create03.c \
-		testcases/kernel/syscalls/statmount/statmount02.c
-}
-do_patch[postfuncs] +=3D "remove_broken_musl_sources"
-
-# Avoid file dependency scans, as LTP checks for things that may or may no=
t
-# exist on the running system.  For instance it has specific checks for
-# csh and ksh which are not typically part of OpenEmbedded systems (but
-# can be added via additional layers.)
-SKIP_FILEDEPS:${PN} =3D '1'
diff --git a/meta-arago-test/recipes-devtools/mtd/mtd-utils-ti.inc b/meta-a=
rago-test/recipes-devtools/mtd/mtd-utils-ti.inc
deleted file mode 100644
index 1120e87a..00000000
--- a/meta-arago-test/recipes-devtools/mtd/mtd-utils-ti.inc
+++ /dev/null
@@ -1,45 +0,0 @@
-PR:append =3D ".arago2"
-
-SRC_URI:remove =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster =
\
-"
-
-SRC_URI:prepend =3D "git://git.infraroot.at/mtd-utils.git;branch=3Dmaster;=
protocol=3Dhttps \
-"
-
-EXTRA_OEMAKE =3D "'CC=3D${CC} ${CFLAGS} ${@bb.utils.contains('PACKAGECONFI=
G', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'RANLIB=3D${RANLIB}=
' 'AR=3D${AR}' 'BUILDDIR=3D${S}'"
-
-do_compile:append() {
-	oe_runmake tests
-}
-
-do_install:append() {
-	install -m 0755 io_update ${D}${sbindir}/
-	install -m 0755 volrefcnt ${D}${sbindir}/
-	install -m 0755 integ ${D}${sbindir}/
-	install -m 0755 io_paral ${D}${sbindir}/
-	install -m 0755 io_read ${D}${sbindir}/
-	install -m 0755 io_basic ${D}${sbindir}/
-	install -m 0755 mkvol_basic ${D}${sbindir}/
-	install -m 0755 mkvol_bad ${D}${sbindir}/
-	install -m 0755 mkvol_paral ${D}${sbindir}/
-	install -m 0755 rsvol ${D}${sbindir}/
-	install -m 0755 tests/ubi-tests/runubitests.sh ${D}${sbindir}/
-	install -m 0755 tests/ubi-tests/ubi-stress-test.sh ${D}${sbindir}/
-}
-
-PACKAGES =3D+ "mtd-utils-ubifs-tests"
-
-FILES:mtd-utils-ubifs-tests =3D " \
-${sbindir}/io_update \
-${sbindir}/volrefcnt \
-${sbindir}/integ \
-${sbindir}/io_paral \
-${sbindir}/io_read \
-${sbindir}/io_basic \
-${sbindir}/mkvol_basic \
-${sbindir}/mkvol_bad \
-${sbindir}/mkvol_paral \
-${sbindir}/rsvol \
-${sbindir}/runubitests.sh \
-${sbindir}/ubi-stress-test.sh \
-"
diff --git a/meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend b/me=
ta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend
deleted file mode 100644
index bdf28247..00000000
--- a/meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-MTD_UTILS_TI =3D ""
-MTD_UTILS_TI:ti-soc =3D "mtd-utils-ti.inc"
-
-require ${MTD_UTILS_TI}
diff --git a/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-prope=
r-definition-of-boolean-type.patch b/meta-arago-test/recipes-devtools/omapc=
onf/files/0001-Use-proper-definition-of-boolean-type.patch
deleted file mode 100644
index 782f10ed..00000000
--- a/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-defin=
ition-of-boolean-type.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c52280d923c167032a84f1c67574eb340e38572c Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@konsulko.com>
-Date: Wed, 7 May 2025 17:03:20 -0400
-Subject: [PATCH] Use proper definition of boolean type
-
-Newer versions of GCC and C standard have bool as a built-in
-keyword - use a standard stdbool.h header to properly handle it.
-
-Upstream-Status: Inactive-Upstream
-
-Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
----
- arch/arm/mach-omap/common/statcoll/sci.h | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/arch/arm/mach-omap/common/statcoll/sci.h b/arch/arm/mach-omap=
/common/statcoll/sci.h
-index 4134c00..1a393b4 100644
---- a/arch/arm/mach-omap/common/statcoll/sci.h
-+++ b/arch/arm/mach-omap/common/statcoll/sci.h
-@@ -48,17 +48,11 @@
- #ifndef SCI_H
- #define SCI_H
-
-+#include <stdbool.h>
- #include <stdlib.h>
- #include <stdint.h>		// The library uses C99 exact-width integer types
- #include "sci_dev.h"
-
--#if !defined(__bool_true_false_are_defined) && !defined(_STM_Logging)
--typedef enum {
--	false =3D 0,
--	true =3D 1
--} bool;
--#endif
--
- #ifdef _STM_Logging
- #include "StmLibrary.h"
- #endif
---
-2.25.1
diff --git a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb b/me=
ta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
deleted file mode 100644
index 84226dd8..00000000
--- a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY =3D "Diagnostic tool for TI OMAP processors"
-HOMEPAGE =3D "https://github.com/omapconf/omapconf"
-
-LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D205c83c4e2242a765acb923fc766e91=
4"
-
-PV =3D "1.75+git"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx"
-
-BRANCH ?=3D "master"
-SRCREV =3D "ff07b6992bacb1e1586c72b7d2be469caee4a347"
-
-SRC_URI =3D "git://github.com/omapconf/omapconf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
-
-SRC_URI +=3D "file://0001-Use-proper-definition-of-boolean-type.patch"
-
-do_compile () {
-    oe_runmake CC=3D"${CC}" all
-}
-
-do_install () {
-    oe_runmake DESTDIR=3D${D}${bindir} install
-}
diff --git a/meta-arago-test/recipes-devtools/pm-qa/pm-qa-arago.inc b/meta-=
arago-test/recipes-devtools/pm-qa/pm-qa-arago.inc
deleted file mode 100644
index 1119162f..00000000
--- a/meta-arago-test/recipes-devtools/pm-qa/pm-qa-arago.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/pm-qa:"
-
-# Bump to 0.5.0+
-SRCREV =3D "e66966ef6a08cd3b491ee1df5c6c5d33baaf1f1c"
-
-SRC_URI +=3D " \
-	file://0001-Return-non-zero-value-on-test-failure.patch \
-	file://0002-cpuidle-Avoid-relative-paths.patch \
-"
-
-PATCHTOOL =3D "git"
-
-PR:append =3D ".arago0"
diff --git a/meta-arago-test/recipes-devtools/pm-qa/pm-qa/0001-Return-non-z=
ero-value-on-test-failure.patch b/meta-arago-test/recipes-devtools/pm-qa/pm=
-qa/0001-Return-non-zero-value-on-test-failure.patch
deleted file mode 100644
index 35dbe7f5..00000000
--- a/meta-arago-test/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-val=
ue-on-test-failure.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From: Carlos Hernandez <ceh@ti.com>
-Subject: [meta-arago][linaro pm-qa PATCH 1/2] Return non-zero value on tes=
t failure
-Date: Thu, 13 Aug 2015 15:03:00 -0400
-
-By convention Linux tools return non-zero value on error/failure.
-
-Upstream-Status: Inactive-Upstream
-
-Signed-off-by: Carlos Hernandez <ceh@ti.com>
----
- include/functions.sh | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/functions.sh b/include/functions.sh
-index 518f555bbe3d..0b054776b763 100644
---- a/include/functions.sh
-+++ b/include/functions.sh
-@@ -54,6 +54,7 @@ test_status_show() {
-     echo " "
-     if [ "$test_script_status" =3D "fail" ]; then
-         echo "$TEST_NAME: fail"
-+        exit 1
-     elif [ "$test_script_status" =3D "skip" ]; then
-         echo "$TEST_NAME: skip"
-     else
---=20
-2.4.4
-
diff --git a/meta-arago-test/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoi=
d-relative-paths.patch b/meta-arago-test/recipes-devtools/pm-qa/pm-qa/0002-=
cpuidle-Avoid-relative-paths.patch
deleted file mode 100644
index 0c39d6f4..00000000
--- a/meta-arago-test/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relat=
ive-paths.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From: Carlos Hernandez <ceh@ti.com>
-Subject: [meta-arago][linaro pm-qa PATCH 2/2] cpuidle: Avoid relative path=
s
-Date: Thu, 13 Aug 2015 15:03:01 -0400
-
-Instead of assuming location of files in the filesystem by using
-relative paths, call binary and let $PATH find binary location.
-
-Upstream-Status: Inactive-Upstream
-
-Signed-off-by: Carlos Hernandez <ceh@ti.com>
----
- cpuidle/cpuidle_02.sh | 2 +-
- cpuidle/cpuidle_03.sh | 2 +-
- include/functions.sh  | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cpuidle/cpuidle_02.sh b/cpuidle/cpuidle_02.sh
-index 4242e241926e..111fa67ff110 100755
---- a/cpuidle/cpuidle_02.sh
-+++ b/cpuidle/cpuidle_02.sh
-@@ -27,7 +27,7 @@
-=20
- . ../include/functions.sh
-=20
--CPUIDLE_KILLER=3D./cpuidle_killer
-+CPUIDLE_KILLER=3Dcpuidle_killer
-=20
- check "cpuidle program runs successfully (120 secs)" "$CPUIDLE_KILLER"
- test_status_show
-diff --git a/cpuidle/cpuidle_03.sh b/cpuidle/cpuidle_03.sh
-index d82e5e348c90..f79cf894eade 100755
---- a/cpuidle/cpuidle_03.sh
-+++ b/cpuidle/cpuidle_03.sh
-@@ -27,7 +27,7 @@
-=20
- . ../include/functions.sh
-=20
--CPUIDLE_KILLER=3D./cpuidle_killer
-+CPUIDLE_KILLER=3Dcpuidle_killer
-=20
- is_root
- if [ $? -ne 0 ]; then
-diff --git a/include/functions.sh b/include/functions.sh
-index 0b054776b763..62747481fe5c 100644
---- a/include/functions.sh
-+++ b/include/functions.sh
-@@ -23,7 +23,7 @@
- #       - initial API and implementation
- #
-=20
--. ../Switches/Switches.sh
-+#. ../Switches/Switches.sh
-=20
- CPU_PATH=3D"/sys/devices/system/cpu"
- TEST_NAME=3D$(basename ${0%.sh})
---=20
-2.4.4
-
diff --git a/meta-arago-test/recipes-devtools/pm-qa/pm-qa_%.bbappend b/meta=
-arago-test/recipes-devtools/pm-qa/pm-qa_%.bbappend
deleted file mode 100644
index 89d37b2a..00000000
--- a/meta-arago-test/recipes-devtools/pm-qa/pm-qa_%.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-
-PM_QA_ARAGO =3D ""
-PM_QA_ARAGO:arago =3D "pm-qa-arago.inc"
-
-require ${PM_QA_ARAGO}
-
diff --git a/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb =
b/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
deleted file mode 100644
index 572576a7..00000000
--- a/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY =3D "UVC gadget userspace sample application"
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://uvc-gadget.c;beginline=3D1;endline=3D18;md5=
=3D414860c3c534dc95d81da9564cfb8d2a"
-
-SRC_URI =3D "git://git.ideasonboard.org/uvc-gadget.git;branch=3Dmaster"
-
-PV =3D "1.1+git"
-SRCREV =3D "aa82df887ab995473cd83c89777cdf4bc4685dd0"
-
-EXTRA_OEMAKE =3D 'CC=3D"${CC}" CFLAGS=3D"${CFLAGS}" LDFLAGS=3D"${LDFLAGS}"=
 KERNEL_INCLUDE=3D""'
-
-do_compile () {
-	oe_runmake
-}
-
-do_install () {
-	install -d ${D}${bindir}
-	install -m755 uvc-gadget ${D}${bindir}
-}
diff --git a/meta-arago-test/recipes-extended/bc/bc_%.bbappend b/meta-arago=
-test/recipes-extended/bc/bc_%.bbappend
deleted file mode 100644
index 29d90a9d..00000000
--- a/meta-arago-test/recipes-extended/bc/bc_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-
-RM_WORK_EXCLUDE +=3D "${PN}"
-
diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta=
-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
deleted file mode 100644
index 33ff0632..00000000
--- a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-EXTRA_OECMAKE +=3D "-DSDL_TESTS=3DON \
-                  -DSDL_INSTALL_TESTS=3DON \
-                 "
-PACKAGE_BEFORE_PN =3D "${PN}-tests"
-FILES:${PN}-tests +=3D "${libexecdir} ${datadir}/installed-tests/SDL2"
diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend b/=
meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
deleted file mode 100644
index 385aa801..00000000
--- a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-LIBSDL2_TI =3D ""
-LIBSDL2_TI:ti-soc =3D "libsdl2-ti.inc"
-
-require ${LIBSDL2_TI}
diff --git a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_=
0.0.1.bb b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.=
0.1.bb
deleted file mode 100644
index 6dc0e526..00000000
--- a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.b=
b
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY =3D "Lightweight Render Example"
-DESCRIPTION =3D "Lightweight Render Example. Heavily inspired by Eduardo L=
ima's gpu-playground, this attempts to act as the smallest demo of offscree=
n rendering."
-
-HOMEPAGE =3D "https://github.com/TexasInstruments/graphics-tests.git"
-
-SRC_URI =3D "git://github.com/TexasInstruments/graphics-tests.git;protocol=
=3Dhttps;branch=3Dmaster"
-SRCREV =3D "eac40e0073cb5f81688aee890e0a67f99678a290"
-
-LICENSE =3D "CC0-1.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65d3616852dbf7b1a6d4b53b0062603=
2"
-
-DEPENDS +=3D "virtual/egl virtual/libgles2"
-
-inherit pkgconfig meson features_check
-
-REQUIRED_DISTRO_FEATURES =3D "opengl"
diff --git a/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc b/meta-a=
rago-test/recipes-graphics/piglit/piglit-ti.inc
deleted file mode 100644
index 707ef6a4..00000000
--- a/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-# add a config to point piglit at the default install location for deqp te=
sts
-# if they are selected
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/piglit:"
-
-SRC_URI +=3D "file://0001-framework-add-and-use-TestPlaceholder-objects.pa=
tch"
-
-PACKAGECONFIG[deqp-gles] =3D ",,,opengl-es-cts"
-PACKAGECONFIG[deqp-vk] =3D ",,,vulkan-cts"
-
-do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-gles', 'true', 'false',=
 d)}; then
-        printf "%s\n" \
-            "[deqp-egl]" \
-            "bin=3D/usr/lib/opengl-es-cts/deqp-egl" \
-            "[deqp-gles2]" \
-            "bin=3D/usr/lib/opengl-es-cts/deqp-gles2" \
-            "[deqp-gles3]" \
-            "bin=3D/usr/lib/opengl-es-cts/deqp-gles3" \
-            "[deqp-gles31]" \
-            "bin=3D/usr/lib/opengl-es-cts/deqp-gles31" \
-            >> ${D}/${libdir}/piglit/piglit.conf
-    fi
-    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-vk', 'true', 'false', d=
)}; then
-        printf "%s\n" \
-            "[deqp-vk]" \
-            "bin=3D/usr/lib/vulkan-cts/deqp-vk" \
-            "[deqp-vksc]" \
-            "bin=3D/usr/lib/vulkan-cts/deqp-vksc" \
-            >> ${D}/${libdir}/piglit/piglit.conf
-    fi
-}
diff --git a/meta-arago-test/recipes-graphics/piglit/piglit/0001-framework-=
add-and-use-TestPlaceholder-objects.patch b/meta-arago-test/recipes-graphic=
s/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch
deleted file mode 100644
index 26e0b21e..00000000
--- a/meta-arago-test/recipes-graphics/piglit/piglit/0001-framework-add-and=
-use-TestPlaceholder-objects.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 2803263ccf460ced705fd4da589e2f09e3ec89d7 Mon Sep 17 00:00:00 2001
-From: Randolph Sapp <rs@ti.com>
-Date: Wed, 13 Aug 2025 17:52:42 -0500
-Subject: [PATCH] framework: add and use TestPlaceholder objects
-
-The actual Test classes are not that big, but with deqp-vk creating
-around 2800 instances currently, we quickly consume around 3GB of ram
-before beginning any tests. Given that a lot of these objects may not
-even be used, we can reduce memory overhead by using a placeholder
-namedtuple that is expanded to a full Test instance when requested from
-the TestDict class. This cuts the initial memory usage back to 1.6 GB.
-
-This does add a small lookup penalty, but given the lookup penalty is
-still smaller that the time it takes to create an instance of a Test, it
-results in a net improvement for most subsets of deqp tests. Not to
-mention this penalty can be split between threads, unlike previously
-when it was occurring in the single-threadded profile creation step.
-
-The following data was collected using a subset of 3151 deqp-vk tests:
-
-Threads   Test Execution Time (s)   TestPlaceholder Execution Time (s)
--------   -----------------------   ----------------------------------
-1         2613.93                   2599.95
-8          413.31                    400.01
-32         299.75                    286.73
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/m=
erge_requests/1032]
-Signed-off-by: Randolph Sapp <rs@ti.com>
----
- framework/profile.py   | 23 ++++++++++++++++++-----
- framework/test/base.py |  3 +++
- framework/test/deqp.py |  4 ++--
- 3 files changed, 23 insertions(+), 7 deletions(-)
-
-diff --git a/framework/profile.py b/framework/profile.py
-index 678e9d87c..969e0032e 100644
---- a/framework/profile.py
-+++ b/framework/profile.py
-@@ -45,7 +45,7 @@ from framework import grouptools, exceptions, status
- from framework.dmesg import get_dmesg
- from framework.log import LogManager
- from framework.monitoring import Monitoring
--from framework.test.base import Test, DummyTest
-+from framework.test.base import Test, DummyTest, TestPlaceholder
- from framework.test.piglit_test import (
-     PiglitCLTest, PiglitGLTest, ASMParserTest, BuiltInConstantsTest,
-     CLProgramTester, VkRunnerTest, ROOT_DIR,
-@@ -135,9 +135,9 @@ class TestDict(collections.abc.MutableMapping):
-                 "TestDict keys must be strings, but was {}".format(type(k=
ey)))
-
-         # Values should either be more Tests
--        if not isinstance(value, Test):
-+        if not (isinstance(value, Test) or isinstance(value, TestPlacehol=
der)):
-             raise exceptions.PiglitFatalError(
--                "TestDict values must be a Test, but was a {}".format(
-+                "TestDict values must be a Test or TestPlaceholder, but w=
as a {}".format(
-                     type(value)))
-
-         # This must be lowered before the following test, or the test can=
 pass
-@@ -164,8 +164,21 @@ class TestDict(collections.abc.MutableMapping):
-         self.__container[key] =3D value
-
-     def __getitem__(self, key):
--        """Lower the value before returning."""
--        return self.__container[key.lower()]
-+        """Lower the value before returning. Remove placeholders as neede=
d."""
-+        item =3D self.__container[key.lower()]
-+        if isinstance(item, TestPlaceholder):
-+            try:
-+                real_item =3D item.test_class(item.test_name)
-+            except TypeError:
-+                raise exceptions.PiglitFatalError(
-+                    "Unable to expand the TestPlaceholder for the class: =
{}\n"
-+                    "This was associated with the following key: {}".form=
at(
-+                        type(item), key
-+                    )
-+                )
-+            self.__container[key.lower()] =3D real_item
-+            return real_item
-+        return item
-
-     def __delitem__(self, key):
-         """Lower the value before returning."""
-diff --git a/framework/test/base.py b/framework/test/base.py
-index 430064b9b..0efa38336 100644
---- a/framework/test/base.py
-+++ b/framework/test/base.py
-@@ -24,6 +24,7 @@
- """ Module provides a base class for Tests """
-
- import abc
-+import collections
- import copy
- import errno
- import itertools
-@@ -97,6 +98,8 @@ def is_crash_returncode(returncode):
-         return returncode < 0
-
-
-+TestPlaceholder =3D collections.namedtuple('TestPlaceholder', ['test_clas=
s', 'test_name'])
-+
- class Test(metaclass=3Dabc.ABCMeta):
-     """ Abstract base class for Test classes
-
-diff --git a/framework/test/deqp.py b/framework/test/deqp.py
-index 849ffbd96..ccfeaeff2 100644
---- a/framework/test/deqp.py
-+++ b/framework/test/deqp.py
-@@ -26,7 +26,7 @@ import subprocess
- from framework import core, grouptools, exceptions
- from framework import options
- from framework.profile import TestProfile
--from framework.test.base import Test, is_crash_returncode, TestRunError
-+from framework.test.base import Test, is_crash_returncode, TestRunError, =
TestPlaceholder
-
- __all__ =3D [
-     'DEQPBaseTest',
-@@ -56,7 +56,7 @@ def make_profile(test_list, test_class):
-     for testname in test_list:
-         # deqp uses '.' as the testgroup separator.
-         piglit_name =3D testname.replace('.', grouptools.SEPARATOR)
--        profile.test_list[piglit_name] =3D test_class(testname)
-+        profile.test_list[piglit_name] =3D TestPlaceholder(test_class, te=
stname)
-
-     return profile
-
---
-2.50.1
diff --git a/meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend b/me=
ta-arago-test/recipes-graphics/piglit/piglit_%.bbappend
deleted file mode 100644
index d93e5d48..00000000
--- a/meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-PIGLIT_TI =3D ""
-PIGLIT_TI:ti-soc =3D "piglit-ti.inc"
-
-require ${PIGLIT_TI}
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-M=
akefile-for-to-build-with-yocto.patch b/meta-arago-test/recipes-kernel/hwsp=
inlocktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch
deleted file mode 100644
index 3386337f..00000000
--- a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile=
-for-to-build-with-yocto.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0a085bff54c3f02c20412c5f5a4060c2acb20d4c Mon Sep 17 00:00:00 2001
-From: Judith Mendez <jm@ti.com>
-Date: Mon, 18 Nov 2024 10:26:55 -0600
-Subject: [PATCH 1/2] Fix Makefile for to build with yocto
-
-Fix Makefile that builds hwspinlocktest out-of-tree-module
-for yocto recipie to be able to build the module.
-
-Upstream-Status: Inactive-Upstream [private repo]
-Signed-off-by: Judith Mendez <jm@ti.com>
----
- Makefile | 18 ++++++++++--------
- 1 file changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 23ee629..d8fe76d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -3,15 +3,17 @@
- # TI OMAP HwSpinlock Unit Test
- #
-
--obj-m =3D omap_hwspinlock_test.o
-+obj-m :=3D omap_hwspinlock_test.o
-+
-+SRC :=3D $(shell pwd)
-
- all:
--ifeq ($(KERNELDIR),)
--	@echo "Error: KERNELDIR not set, exiting..."
--	@echo "Eg: make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- KERNELDI=
R=3D<linux-kernel rootdir>"
--	@exit 1
--endif
--	make ${MAKE_OPTS} -C $(KERNELDIR) M=3D$(PWD) modules
-+	$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC)
-+
-+modules_install:
-+	$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC) modules_install
-
- clean:
--	$(RM) -r *.o *.ko *.mod* *.dwo .*.dwo .*.cmd *.symvers modules.order
-+	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
-+	rm -f Module.markers Module.symvers modules.order
-+	rm -rf .tmp_versions Modules.symvers
---
-2.47.0
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0=
.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
deleted file mode 100644
index cc566b37..00000000
--- a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "Build hwspinlock test as an external Linux kernel module"
-DESCRIPTION =3D "${SUMMARY}"
-LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbfa02c83df161e37647ee23a2c7eacd=
4"
-
-inherit module
-
-SRC_URI =3D "\
-    git://github.com/TexasInstruments/omap-hwspinlock-test;protocol=3Dhttp=
s;branch=3Dmaster \
-    file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
-"
-
-SRCREV =3D "1d154fbe5b56ef81045763f574c2098a35d6a8b8"
-
-# The inherit of module.bbclass will automatically name module packages wi=
th
-# "kernel-module-" prefix as required by the oe-core build environment.
-
-RPROVIDES:${PN} +=3D "kernel-module-hwspinlocktest"
diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest=
-ti.inc b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti=
.inc
deleted file mode 100644
index bae5b7ab..00000000
--- a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
+++ /dev/null
@@ -1,53 +0,0 @@
-# Tests not enabled:
-#   openat2 has buildpath errors
-
-TEST_LIST +=3D "\
-    arm64 \
-    breakpoints \
-    capabilities \
-    cgroup \
-    clone3 \
-    core \
-    cpu-hotplug \
-    cpufreq \
-    efivarfs \
-    exec \
-    filesystems \
-    filesystems/binderfs \
-    filesystems/epoll \
-    firmware \
-    fpu \
-    ftrace \
-    futex \
-    gpio \
-    intel_pstate \
-    ipc \
-    kcmp \
-    kvm \
-    livepatch \
-    membarrier \
-    memfd \
-    mqueue \
-    mincore \
-    net \
-    net/mptcp \
-    ptrace \
-    resq \
-    rtc \
-    seccomp \
-    sigaltstack \
-    size \
-    tc-testing \
-    timers \
-    tmpfs \
-    tpm2 \
-    user_events \
-    vDSO \
-    watchdog \
-"
-
-TEST_LIST:append:bsp-ti-6_18 =3D " \
-    pci_endpoint \
-"
-
-INSANE_SKIP:${PN} +=3D "staticdev textrel"
diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest=
.bbappend b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.=
bbappend
deleted file mode 100644
index 163a074d..00000000
--- a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappe=
nd
+++ /dev/null
@@ -1,4 +0,0 @@
-KERNEL_SELFTEST_TI =3D ""
-KERNEL_SELFTEST_TI:ti-soc =3D "kernel-selftest-ti.inc"
-
-require ${KERNEL_SELFTEST_TI}
diff --git a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb b/meta-=
arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
deleted file mode 100644
index 9ab0dbed..00000000
--- a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "Linux Kernel PCI test"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e4=
6"
-
-BRANCH =3D "ti-linux-5.10.y"
-SRCREV =3D "73aa709ca10103b61fba3a07471dbb4dcb56db45"
-SRC_URI =3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;prot=
ocol=3Dhttps;branch=3D${BRANCH}"
-
-do_compile () {
-	cd ${S}/tools/pci
-	${CC} ${CFLAGS} ${LDFLAGS} -o pcitest pcitest.c
-}
-
-do_install () {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/tools/pci/pcitest ${D}${bindir}
-	install -m 0755 ${S}/tools/pci/pcitest.sh ${D}${bindir}
-}
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001=
-configure-skip-toolchain-checks.patch b/meta-arago-test/recipes-support/xd=
p-tools/xdp-tools-arago/0001-configure-skip-toolchain-checks.patch
deleted file mode 100644
index b5f2780e..00000000
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-config=
ure-skip-toolchain-checks.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9c9dce2e5f04de65b7b00321f96fff6071546ea1 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 15:44:16 +0800
-Subject: [PATCH] configure: skip toolchain checks
-
-Current logic fetch full command line along with the tool. i.e
-gcc -m64 -march=3Dskylake -mtune=3Dgeneric ...
-
-Which throws ERROR: Cannot find tool -m64
-
-So need to re-write for loop, so it can work in cross-compilation
-environment too.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
-
----
- configure | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure b/configure
-index b4e824f..10618fc 100755
---- a/configure
-+++ b/configure
-@@ -70,12 +70,12 @@ check_toolchain()
-
-     CLANG=3D$(find_tool clang "$CLANG")
-=20
--    for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
--        if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
--            echo "*** ERROR: Cannot find tool ${TOOL}" ;
--            exit 1;
--        fi;
--    done
-+    #for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
-+    #    if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
-+    #        echo "*** ERROR: Cannot find tool ${TOOL}" ;
-+    #        exit 1;
-+    #    fi;
-+    #done
-=20
-     ARCH_NAME=3D$($CC -print-multiarch 2>/dev/null)
-=20
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001=
-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch b/meta-arago-te=
st/recipes-support/xdp-tools/xdp-tools-arago/0001-defines.mk-Add-missing-pr=
efix-map-settings-for-OE-bu.patch
deleted file mode 100644
index faaf6bc2..00000000
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-define=
s.mk-Add-missing-prefix-map-settings-for-OE-bu.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a7698c7172a8a178efd73bdc0ce31d4aa3646f6e Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Mon, 5 May 2025 14:30:10 -0500
-Subject: [PATCH] defines.mk: Add missing prefix-map settings for OE builds
-
-The defines was only pulling in one of the four *-prefix-map options
-from CFLAGS.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- lib/defines.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/defines.mk b/lib/defines.mk
-index 411a97e..6061e81 100644
---- a/lib/defines.mk
-+++ b/lib/defines.mk
-@@ -26,7 +26,7 @@ TEST_DIR =3D $(LIB_DIR)/testing
- LIBXDP_DIR :=3D $(LIB_DIR)/libxdp
- LIBBPF_DIR :=3D $(LIB_DIR)/libbpf
-=20
--DEFINES :=3D -DBPF_DIR_MNT=3D\"$(BPF_DIR_MNT)\" -DBPF_OBJECT_PATH=3D\"$(B=
PF_OBJECT_DIR)\" \
-+DEFINES :=3D -DBPF_DIR_MNT=3D\"$(BPF_DIR_MNT)\" -DBPF_OBJECT_PATH=3D\"$(O=
E_BPF_OBJECT_DIR)\" \
- 	-DMAX_DISPATCHER_ACTIONS=3D$(MAX_DISPATCHER_ACTIONS) -DTOOLS_VERSION=3D\=
"$(TOOLS_VERSION)\" \
- 	-DLIBBPF_VERSION=3D\"$(LIBBPF_VERSION)\" -DRUNDIR=3D\"$(RUNDIR)\"
-=20
-@@ -43,7 +43,7 @@ endif
- DEFINES +=3D -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
-=20
- CFLAGS +=3D -std=3Dgnu11 -Wextra -Werror $(DEFINES) $(ARCH_INCLUDES)
--BPF_CFLAGS +=3D $(DEFINES) $(filter -ffile-prefix-map=3D%,$(CFLAGS)) $(fi=
lter -I%,$(CFLAGS)) $(ARCH_INCLUDES)
-+BPF_CFLAGS +=3D $(DEFINES) $(filter -fcoverage-prefix-map=3D%,$(CFLAGS)) =
$(filter -fdebug-prefix-map=3D%,$(CFLAGS)) $(filter -ffile-prefix-map=3D%,$=
(CFLAGS)) $(filter -fmacro-prefix-map=3D%,$(CFLAGS)) $(filter -I%,$(CFLAGS)=
) $(ARCH_INCLUDES)
-=20
- CONFIGMK :=3D $(LIB_DIR)/../config.mk
- LIBMK :=3D Makefile $(CONFIGMK) $(LIB_DIR)/defines.mk $(LIB_DIR)/common.m=
k $(LIB_DIR)/../version.mk
---=20
-2.17.1
-
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001=
-xdpsock-Fix-32bit-compile-error.patch b/meta-arago-test/recipes-support/xd=
p-tools/xdp-tools-arago/0001-xdpsock-Fix-32bit-compile-error.patch
deleted file mode 100644
index da439bf1..00000000
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0001-xdpsoc=
k-Fix-32bit-compile-error.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9b649be4876a3e42c44e57013840904006530e52 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Tue, 17 Feb 2026 15:11:18 -0600
-Subject: [PATCH] xdpsock: Fix 32bit compile error
-
-Using UINT64_MAX on a 32bit machine results in a compile error where
-unsigned long cannot be cast to an unsigned long long.  Since this is
-trying to handle an error case and return a big number, switch to
-ULONG_MAX to match the type being returned regardless of the compiler
-bits (32/64).
-
-Upstream-Status: Submitted [https://github.com/xdp-project/xdp-tools/pull/=
553]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- lib/util/xdpsock.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/util/xdpsock.c b/lib/util/xdpsock.c
-index 5d71e6a..899c3a3 100644
---- a/lib/util/xdpsock.c
-+++ b/lib/util/xdpsock.c
-@@ -35,6 +35,7 @@
- #include <time.h>
- #include <unistd.h>
- #include <sched.h>
-+#include <limits.h>
-=20
- #include <xdp/xsk.h>
- #include <xdp/libxdp.h>
-@@ -171,7 +172,7 @@ static unsigned long get_nsecs(clockid_t clock)
- 	res =3D clock_gettime(clock, &ts);
- 	if (res < 0) {
- 		pr_warn("Error with gettimeofday! (%i)\n", res);
--		return UINT64_MAX;
-+		return ULONG_MAX;
- 	}
- 	return ts.tv_sec * 1000000000UL + ts.tv_nsec;
- }
---=20
-2.43.0
-
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0002=
-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch b/meta-arago-te=
st/recipes-support/xdp-tools/xdp-tools-arago/0002-Makefile-It-does-not-dete=
ct-libbpf-header-from-sysro.patch
deleted file mode 100644
index df1543c7..00000000
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0002-Makefi=
le-It-does-not-detect-libbpf-header-from-sysro.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 2840cf0b89497f545fae2eed7ece3f3c5fc558e3 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 15:50:34 +0800
-Subject: [PATCH 2/4] Makefile: It does not detect libbpf header from sysro=
ot
-
-So adding sysroot headers path.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- lib/common.mk       | 2 +-
- lib/libxdp/Makefile | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/common.mk b/lib/common.mk
-index 56c0406..ab0bad8 100644
---- a/lib/common.mk
-+++ b/lib/common.mk
-@@ -55,7 +55,7 @@ LIBXDP_SOURCES :=3D $(wildcard $(LIBXDP_DIR)/*.[ch] $(LI=
BXDP_DIR)/*.in)
- KERN_USER_H ?=3D $(wildcard common_kern_user.h)
-=20
- CFLAGS +=3D -I$(HEADER_DIR) -I$(LIB_DIR)/util $(ARCH_INCLUDES)
--BPF_CFLAGS +=3D -I$(HEADER_DIR) $(ARCH_INCLUDES)
-+BPF_CFLAGS +=3D -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
-=20
- BPF_HEADERS :=3D $(wildcard $(HEADER_DIR)/bpf/*.h) $(wildcard $(HEADER_DI=
R)/xdp/*.h)
-=20
-diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
-index 358b751..8f459d8 100644
---- a/lib/libxdp/Makefile
-+++ b/lib/libxdp/Makefile
-@@ -28,7 +28,7 @@ PC_FILE :=3D $(OBJDIR)/libxdp.pc
- TEMPLATED_SOURCES :=3D xdp-dispatcher.c
-=20
- CFLAGS +=3D -I$(HEADER_DIR)
--BPF_CFLAGS +=3D -I$(HEADER_DIR) $(ARCH_INCLUDES)
-+BPF_CFLAGS +=3D -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
-=20
-=20
- ifndef BUILD_STATIC_ONLY
---=20
-2.25.1
-
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0003=
-Makefile-fix-KeyError-failure.patch b/meta-arago-test/recipes-support/xdp-=
tools/xdp-tools-arago/0003-Makefile-fix-KeyError-failure.patch
deleted file mode 100644
index d0133bcb..00000000
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0003-Makefi=
le-fix-KeyError-failure.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 157546fbc4f18751c52b3c8788879c05cf253331 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 16:02:46 +0800
-Subject: [PATCH 3/4] Makefile: fix KeyError failure
-
-Error:
-Exception: KeyError: 'getpwuid(): uid not found: 11857215'
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- lib/libxdp/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
-index 8f459d8..9a340a3 100644
---- a/lib/libxdp/Makefile
-+++ b/lib/libxdp/Makefile
-@@ -54,7 +54,7 @@ install: all
- 	$(Q)install -d -m 0755 $(DESTDIR)$(BPF_OBJECT_DIR)
- 	$(Q)install -m 0644 $(LIB_HEADERS) $(DESTDIR)$(HDRDIR)/
- 	$(Q)install -m 0644 $(PC_FILE) $(DESTDIR)$(LIBDIR)/pkgconfig/
--	$(Q)cp -fpR $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
-+	$(Q)cp -fpR --no-preserve=3Downership $(SHARED_LIBS) $(STATIC_LIBS) $(DE=
STDIR)$(LIBDIR)
- 	$(Q)install -m 0644 $(XDP_OBJS) $(DESTDIR)$(BPF_OBJECT_DIR)
- 	$(if $(MAN_FILES),$(Q)install -m 0755 -d $(DESTDIR)$(MANDIR)/man3)
- 	$(if $(MAN_FILES),$(Q)install -m 0644 $(MAN_FILES) $(DESTDIR)$(MANDIR)/m=
an3)
---=20
-2.25.1
-
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0004=
-Makefile-fix-libxdp.pc-error.patch b/meta-arago-test/recipes-support/xdp-t=
ools/xdp-tools-arago/0004-Makefile-fix-libxdp.pc-error.patch
deleted file mode 100644
index b1e15e52..00000000
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago/0004-Makefi=
le-fix-libxdp.pc-error.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 46b3ff797135574aa0ee42f633a281d44f48da95 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 16:05:15 +0800
-Subject: [PATCH 4/4] Makefile: fix libxdp.pc error
-
-Error:
-do_populate_sysroot: QA Issue: libxdp.pc failed sanity test (tmpdir) in
-path ... xdp-tools/1.2.8-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- lib/libxdp/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
-index 9a340a3..bc39177 100644
---- a/lib/libxdp/Makefile
-+++ b/lib/libxdp/Makefile
-@@ -76,8 +76,8 @@ $(OBJDIR)/libxdp.so.$(LIBXDP_VERSION): $(SHARED_OBJS)
- 		      $^ $(LDFLAGS) $(LDLIBS) -o $@
-=20
- $(OBJDIR)/libxdp.pc:
--	$(Q)sed -e "s|@PREFIX@|$(PREFIX)|" \
--			-e "s|@LIBDIR@|$(LIBDIR)|" \
-+	$(Q)sed -e "s|@PREFIX@|$(prefix)|" \
-+			-e "s|@LIBDIR@|$(libdir)|" \
- 			-e "s|@VERSION@|$(TOOLS_VERSION)|" \
- 			< libxdp.pc.template > $@
-=20
---=20
-2.25.1
-
diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.6.=
1.bb b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.6.1.bb
deleted file mode 100644
index e25ae146..00000000
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.6.1.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY =3D "Utilities and example programs for use with XDP"
-HOMEPAGE =3D "https://github.com/xdp-project/xdp-tools"
-LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9ee53f8d06bbdb4c11b1557ecc4f8cd=
5 \
-                    file://LICENSES/GPL-2.0;md5=3D994331978b428511800bfbd1=
7eea3001 \
-                    file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50=
909238dbd \
-                    file://LICENSES/BSD-2-Clause;md5=3D5d6306d1b08f8df6231=
78dfd81880927"
-
-DEPENDS +=3D " libbpf zlib elfutils libpcap"
-DEPENDS +=3D " clang-cross-${TARGET_ARCH} bpftool-native"
-
-SRC_URI =3D "git://github.com/xdp-project/xdp-tools.git;protocol=3Dhttps;b=
ranch=3Dmain \
-            file://0001-configure-skip-toolchain-checks.patch \
-            file://0002-Makefile-It-does-not-detect-libbpf-header-from-sys=
ro.patch \
-            file://0003-Makefile-fix-KeyError-failure.patch \
-            file://0004-Makefile-fix-libxdp.pc-error.patch \
-            file://0001-defines.mk-Add-missing-prefix-map-settings-for-OE-=
bu.patch \
-            file://0001-xdpsock-Fix-32bit-compile-error.patch \
-          "
-
-SRCREV =3D "84906a0fe98cbb5e5eaa2c888c50a1ab32d5d0b7"
-
-inherit pkgconfig
-
-EXTRA_OEMAKE +=3D " PREFIX=3D${D}${prefix} LIBDIR=3D${D}${libdir} BUILD_ST=
ATIC_ONLY=3D1 PRODUCTION=3D1 V=3D1"
-EXTRA_OEMAKE +=3D " OE_BPF_OBJECT_DIR=3D${libdir}/bpf"
-EXTRA_OEMAKE +=3D " CLANG=3D"${TARGET_PREFIX}clang --sysroot=3D${RECIPE_SY=
SROOT}""
-
-CFLAGS +=3D "-fPIC"
-
-export STAGING_INCDIR
-
-do_compile:prepend:aarch64 () {
-    mkdir -p ${S}/headers/asm
-    cp ${RECIPE_SYSROOT}/usr/include/asm/bitsperlong-64.h ${S}/headers/asm=
/bitsperlong-32.h
-    cp ${RECIPE_SYSROOT}/usr/include/asm/byteorder-64.h ${S}/headers/asm/b=
yteorder-32.h
-    cp ${RECIPE_SYSROOT}/usr/include/asm/posix_types-64.h ${S}/headers/asm=
/posix_types-32.h
-    cp ${RECIPE_SYSROOT}/usr/include/asm/swab-64.h ${S}/headers/asm/swab-3=
2.h
-    cp ${RECIPE_SYSROOT}/usr/include/asm/types-64.h ${S}/headers/asm/types=
-32.h
-}
-
-do_install() {
-    oe_runmake install
-}
-
-FILES:${PN} +=3D "${datadir}/xdp-tools/* \
-                ${nonarch_base_libdir}/bpf/* \
-               "
-
-RDEPENDS:${PN} +=3D "bash"
-
--=20
2.43.0


