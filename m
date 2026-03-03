Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EE4EDA6B9
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 17:18:22 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23863.1772558298898912863
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 09:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gTpOYUC5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.7, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZUPpxTcqtTfLpOfm15thkcTcczZ14HvD+Fqd5WfJ65Ewer6Z1JoOG0onFxIlD2rl0RxKAsKP/bB6YPzrqDTi6rv4pl4aUdjp9jjIePKKykC7SELcm5178ujMiTj95TDyIMxiks63LlKa8YvCo8sqCLVXtGfV9amTxgzg4qjuJyZVtfEZSWV+ctZYjSYOdikZNnMLvjhkWzuD9yidi2X0N5DIt3MtkzhjraSTidwXVI6gNYbZWUdhSKJTg5RoeZSID7A8xXs0dlTANJDfAOASPLBlHvMRZfzzKIUMHMVevDPJXJ3D1VY+Nk2JiAHz3Ytho9o6dj+7QozNKb8i7Bz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeXrzNGevE0Pf/9L0NC514ONbyBLngz2l0DwpgwHeq8=;
 b=Al2rXyd1v3rcUjTImCel0c5ppXErZb7ueAMofrBKahwTJ6ljF7Dn4gJeWSyFgCbMV8FZw+ZrxQ7yMva/Vu/mEnU6UTwaEiF/BWKgiiTaW2GEmCj4sQzRLVDz5SSEBbUJEJqOWUC14pdSsOyrjRDwuM0hvtzCJWSY09qoBFWAaoIsKrPmAnkV82MeiSsJYKPwJpvGk4kqswAgJPYohLpNQ4n+DKpWAKqxFT35Laom40Qim8414SOwD4N1N1KFMkfTXwRK8pARMQdBBC/AV6zSVE1Y4hxweM9kc5QSFEHEfXBW3HEvbpTzA2A/NDjF6gucgmPg5Tvplb1kyhWB7fb0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeXrzNGevE0Pf/9L0NC514ONbyBLngz2l0DwpgwHeq8=;
 b=gTpOYUC51j3oFbmOj9dOwweevYhAGk5bZ7jn2EF4wR/x9xQg5bE6XhuHi937ML7p7kLmKbwq+m7C9sChlbJI0U1eKXzT25620GhBWk3bG4pVC9hP33Ptfu2bZUpWFbqrJNKXd4Ml+v82y1WWNMv8iQFD8zEvptcJZzt4RShuhx8=
Received: from SJ0PR13CA0107.namprd13.prod.outlook.com (2603:10b6:a03:2c5::22)
 by DM4PR10MB6208.namprd10.prod.outlook.com (2603:10b6:8:8d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 17:18:16 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::ff) by SJ0PR13CA0107.outlook.office365.com
 (2603:10b6:a03:2c5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 17:18:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 17:18:15 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:17:52 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:17:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 11:17:52 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623HHpxq2511986;
	Tue, 3 Mar 2026 11:17:51 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vxTNX-00000001eIZ-3tQW;
	Tue, 03 Mar 2026 11:17:51 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 1/2] ti-test: Break into multiple packagegroups
Date: Tue, 3 Mar 2026 11:17:50 -0600
Message-ID: <20260303171751.393226-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|DM4PR10MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba84255-8a14-46fa-7e60-08de7948db18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	wOvGq5D7SRJ/kv/pTuvErTDhQN+fh74uUYcfUomKL8mdqsuNt4ckyvf57KaT5IcqXAHQtWxJ1r/MdiXIgEYdMAuX6oeM9kcDzAPfLVUbwwMxEvRH4F41KukwKqj4dOyhR7vLY8BbJbimEP2donYPaBJbt1D0fNIHZahU2bzd7PUWMEXNsdZaG8ASw5BR3BEF8wBJrAIGjfeLAkMYYx3V2yhfrWGEDqYKusx4r0miVN8VckK9EINwMNGMmCk34mFr2+ef8DkgET2e7bGhwDK6pcLjiXUapx0/Lgtid0oqJJY0Dr7HiEZ6zuS/TQ2qw4yLKE2oLIabbsNAMkQot7KplpGniLm69Hw+9FOOtsNvRinwtPVdowMDIWJ+mhzPPhBgwbqzMD4BLBVwV11P7HfhwcHlVZWwMATtfDySziPgw5RUNBHZUcf4NMtuYqmFZoUXDOzuKh7MnW9w+UVm8cOxvOD0ZiURjE5tMxAVPAb/RHmdcwiYN4E5koDgXYKVZu40+ci4kbaxnJnIm1KZIcI8AFXUWi/MeHIswoojBp0iF/DNRjphdGtNQBiZBM4cP4nz7hH9kLDBx6xhFICFxLnCq1ncM40NVqnnEurOV1nGaRhjDShfa5BjEoveqksgsUooBCgQsKnV8uSxBLazO6HNZkVbBnuBdr3lqOgjQ2241LObBHdqwm2enR/9xZ2gOzyvKDQIKJix1sHVgTiHsaSHrhnfyC8lE5komJFr/f8xldHHI+AXkO1ibvZGEQ45e0SU2RspRF1DUhUzDX+38ftx2NOP7LHKUt+2PMcY680FQWJWjl0lli1f5w+dyPfTQ2xr
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pHA0Dv6HwBNfUn2qjL7Ljtdj/bkVj8aUrH+NF9wvBzRXPc222xAiqUBlHzSpnt8OiT15VIdBkUl8mM+8EA5StV+7LC64aORrm2vLyBRdLg9EAABeMfcldrt2esQYAiC7Nht89BmibANnscPlXmr7aHbRw0XCnBLKRYGmQMn+WnyvBJFwTwfVezfC48R7e37tCuGAewA1itRZS42WLEJeXcGqJVklEJSV4fwXRoXKWwjTvDalwy0gHTMwdCFR97+PDYkaF8B8xeu6hvvbCO0l73dujzZtCEPtATWnlhNWKoZy10Iu03Ljvrcr9DkG8nrsKHy7Vh0M/1+8aZfhAHjLXcBpeIbwt2q6vw8dJatTijSHMjsAGf6Dqs289AV0zwVpnOGE+h10TX9zglYGUe+PWiiXTlwm2O2hYi3QdcEbKFr9+mzLH7xaCzwU4dQABsxA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 17:18:15.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba84255-8a14-46fa-7e60-08de7948db18
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6208
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 17:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17205

To allow for tests to just pull in a smaller set of programs, break the
big ti-test package into multiple smaller ones based on functionality:

ti-test-audio
ti-test-graphics
ti-test-multimedia
ti-test-networking
ti-test-storage
ti-test-ti-tools

Installing ti-test will pull in ti-test-networking, ti-test-storage,
and ti-test-ti-tools.

Installing ti-test-extra will pull in ti-test-audio, ti-test-graphics,
and ti-test-multimedia.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No change.

 .../recipes-core/packagegroups/ti-test.bb     | 111 ++++++++++++------
 1 file changed, 73 insertions(+), 38 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index f2ae1aef..d3458b9d 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -5,27 +5,25 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
+PACKAGES +=3D " \
+    ${PN}-audio \
+    ${PN}-extras \
+    ${PN}-graphics \
+    ${PN}-multimedia \
+    ${PN}-networking \
+    ${PN}-storage \
+    ${PN}-ti-tools \
+"
+
 TI_TEST_BASE =3D "\
-    alsa-utils \
     bc \
     bonnie++ \
-    bridge-utils \
     cryptodev-tests \
     devmem2 \
     dma-heap-tests \
-    dosfstools \
-    ethtool \
     evtest \
-    fio \
     git \
-    gst-devtools \
-    hwspinlocktest \
-    hdparm \
     i2c-tools \
-    iozone3 \
-    iproute2-tc \
-    iproute2-devlink \
-    iperf3 \
     kernel-modules \
     kernel-selftest \
     kmsxx \
@@ -36,11 +34,7 @@ TI_TEST_BASE =3D "\
     lsof \
     media-ctl \
     memtester \
-    mstpd \
-    mtd-utils \
-    mtd-utils-ubifs \
     nbench-byte \
-    netperf \
     openntpd \
     ${@"optee-test" if d.getVar('OPTEEMACHINE') else ""} \
     pcitest \
@@ -48,7 +42,6 @@ TI_TEST_BASE =3D "\
     perf \
     powertop \
     procps \
-    pulseaudio-misc \
     rng-tools \
     rt-tests \
     rwmem \
@@ -56,20 +49,19 @@ TI_TEST_BASE =3D "\
     stream \
     stress \
     stress-ng \
-    strongswan \
-    tcpdump \
-    v4l-utils \
-    xdp-tools-arago \
-    yavta \
 "
=20
-TI_TEST_BASE:append:ti-soc =3D " \
-    mtd-utils-ubifs-tests \
+TI_TEST_BASE:append:armv7a =3D " \
+    cpuburn-neon \
 "
=20
-TI_TEST_EXTRAS_OPENGL =3D " \
-    piglit \
-    offscreendemo \
+TI_TEST_BASE:append:armv7ve =3D " \
+    cpuburn-neon \
+"
+
+TI_TEST_AUDIO =3D "\
+    alsa-utils \
+    pulseaudio-misc \
 "
=20
 TI_TEST_EXTRAS_OPENCL =3D " \
@@ -80,23 +72,56 @@ TI_TEST_EXTRAS =3D " \
     python3-pillow \
     pytesseract \
     python3-numpy \
-    wayland-utils \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_EXTRAS_OP=
ENGL}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OP=
ENCL}', '', d)} \
 "
=20
-TI_TEST_BASE:append:armv7a =3D " \
-    cpuburn-neon \
+TI_TEST_GRAPHICS_OPENGL =3D " \
+    piglit \
+    offscreendemo \
 "
=20
-TI_TEST_BASE:append:armv7ve =3D " \
-    cpuburn-neon \
+TI_TEST_GRAPHICS =3D " \
+    wayland-utils \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_GRAPHICS_=
OPENGL}', '', d)} \
+"
+
+TI_TEST_MULTIMEDIA =3D "\
+    gst-devtools \
+    v4l-utils \
+    yavta \
+"
+
+TI_TEST_NETWORKING =3D "\
+    bridge-utils \
+    ethtool \
+    iperf3 \
+    iproute2-tc \
+    iproute2-devlink \
+    mstpd \
+    netperf \
+    strongswan \
+    tcpdump \
+    xdp-tools-arago \
+"
+
+TI_TEST_STORAGE =3D "\
+    dosfstools \
+    fio \
+    hdparm \
+    iozone3 \
+    mtd-utils \
+    mtd-utils-ubifs \
+"
+
+TI_TEST_STORAGE:append:ti-soc =3D " \
+    mtd-utils-ubifs-tests \
 "
=20
 TI_TEST_TI_TOOLS =3D " \
     arm-benchmarks \
     arm-ddr-bandwidth \
     coremark \
+    hwspinlocktest \
     input-utils \
     ltp-ddt \
     openssl-perf \
@@ -164,13 +189,23 @@ TI_TEST_TI_TOOLS:append:omapl138 =3D " \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti-ipc-test', =
d)} \
 "
=20
+RDEPENDS:${PN}-audio =3D "${TI_TEST_AUDIO}"
+RDEPENDS:${PN}-extras =3D "${TI_TEST_EXTRAS}"
+RDEPENDS:${PN}-graphics =3D "${TI_TEST_GRAPHICS}"
+RDEPENDS:${PN}-multimedia =3D "${TI_TEST_MULTIMEDIA}"
+RDEPENDS:${PN}-networking =3D "${TI_TEST_NETWORKING}"
+RDEPENDS:${PN}-storage =3D "${TI_TEST_STORAGE}"
+RDEPENDS:${PN}-ti-tools =3D "${TI_TEST_TI_TOOLS}"
+
 RDEPENDS:${PN} =3D "\
     ${TI_TEST_BASE} \
-    ${TI_TEST_TI_TOOLS} \
+    ${PN}-networking \
+    ${PN}-storage \
+    ${PN}-ti-tools \
 "
=20
-# Package group for things that should only be present in arago-default-im=
age
-PACKAGES +=3D " ${PN}-extras"
-RDEPENDS:${PN}-extras =3D "\
-    ${TI_TEST_EXTRAS} \
+RDEPENDS:${PN}-extras +=3D "\
+    ${PN}-audio \
+    ${PN}-graphics \
+    ${PN}-multimedia \
 "
--=20
2.43.0


