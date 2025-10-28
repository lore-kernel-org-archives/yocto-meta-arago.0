Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C45ECCF9EE
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:42:37 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.47])
 by mx.groups.io with SMTP id smtpd.web10.7477.1761644556492120078
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 02:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=spWWDtch;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.47, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JK9aDqqPb0GmzTz+CgtUao6q69XXUnYHuQcNLfRECt+T9xz1G9qbQdARwrM6Raud4MIW9n5QHYQh9jVyyjIuLOF/yoY5WC4oXbwrRCrUOaUdtpYi5Ooy+S7UGli78oVZUXCfkbJPHpp4ig9xo0AtgoeuAtop+rVf5Hfza7V/ujgISkvOvVYD16IJAUedkFpu85Tyr1RSp+dmFlV1nYH7zJwRzhQ0qOjVf7DF/ISWw2Mh6cF3l9zbdCC8D3lvc6KSWrM2oC+jnbMe9CmoGs2f+0umtdb2/QdVmn12cqOEm8+XMjfx1lQbLiTa1Z68XUP+zLro+hh7BlUKNUE+EZJKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grb/1qXdgmE+mvZ0yVy6kV/M3lm7TjhVaiKbJrsLGkw=;
 b=o7IOilPYOt/v8a+ppkWtUAq+qk9heVSzdmBPvUvGCrh99Nb30gChjp0v5BYVRn7Fo1jcc38DCOMoqUuTIQ0hyLBg4V0eWUimjGVOWAUmRGwM1CG8BuXotMvl68l7nk28WUIPW0cJJA2k6t4Jnlz972cGelg1sTfEl9ZyTYizCDm2FRmPuLh4sfEN0KdjRwVGN7K7c4QD5mTs6uelmNB5aQs6MpzF6mcC54RVcK+Cr2j7dPuKilVoSp59+db6foU1iaL0vU3B0j7v+KwejTLaI72iw1x7SnZ6/e5QK6m04hnRTPaZ/7g0ryQdKBuLKHPppqVgtGI07/MOWqEb7fZy3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grb/1qXdgmE+mvZ0yVy6kV/M3lm7TjhVaiKbJrsLGkw=;
 b=spWWDtch5LWEOYS3OAK2qJHKV9eWtqnpZDXy6iUWlqLK+WvvMZPbgr+USW1F1b1VUwnYSvX979ESVkl54DPeBfsnPpHnz13jDaTgjmRtn/ry+ydeRUTCeYqt9iyZZbzg/6sE8LHUmZPKdttzC8iUXq2ViM1midax5Id6xpyvXXg=
Received: from DS7PR03CA0156.namprd03.prod.outlook.com (2603:10b6:5:3b2::11)
 by SA2PR10MB4665.namprd10.prod.outlook.com (2603:10b6:806:fb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Tue, 28 Oct
 2025 09:28:21 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::4b) by DS7PR03CA0156.outlook.office365.com
 (2603:10b6:5:3b2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Tue,
 28 Oct 2025 09:28:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 09:28:21 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 04:28:20 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 04:28:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 04:28:20 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59S9SIMR2122420;
	Tue, 28 Oct 2025 04:28:19 -0500
From: Sadik <s-sadik@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Veeramachaneni Prudhvi <prudhvi@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-test: Add CoreMark CPU benchmark
Date: Tue, 28 Oct 2025 14:58:06 +0530
Message-ID: <20251028092806.3840575-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|SA2PR10MB4665:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef4bee1-ec29-4d13-5bf3-08de16045618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|34070700014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j5WQc+l/AMLvMN6IzqGNTLUFV0dhXlkpDkY+vnRfQ92tXdAE7W1G12ss7IKC?=
 =?us-ascii?Q?XgEm5z5Z6+nzM31Z20SY1SkWp7TP53Jw/uWjUFsdJiQcl41CipckOML9Oexh?=
 =?us-ascii?Q?D5ARzak8S92bKgje49qrvvbtbyip/Xw6/2v/JPGjiIbPolcFfoGYcLWefst/?=
 =?us-ascii?Q?NM5J8QAAi4fuiwlB+BkDTP2tZ2l2jesjvPGXGQgWCDsnK1hVZx/bRbmEs2PO?=
 =?us-ascii?Q?OPpZQd9El7WNhSR3FRlKrdmErdcDr2MZfEmHYOih0m4iY8gCiGWPsKUgo+3Y?=
 =?us-ascii?Q?uGlH2zCUhHcYxgvVrjjPEx0HvFpt6X+8IYoWEuIsiJa91p5bmGqBl8IHYa8t?=
 =?us-ascii?Q?HYqmh8lW3XjO6oHAEvJNhZJ5Ex0z+ZJ5jFRHNom6zOpamooZJjFsaKDmmd4s?=
 =?us-ascii?Q?lbMqSuWokoriTZ0sbzhrFT8sPiM2Lfn4gmYwXMzdubg+UzWsEsCZg3QL6JlJ?=
 =?us-ascii?Q?/Taaq56pxJzuIPY34Qn2qO8tCtd1zDmmreJwtEkSRgvnwoJEJTPAI66dwsAk?=
 =?us-ascii?Q?QkGYNnFOISi7ep7/fTrZfHxXoHoubep+8ZsWiM0zTVmUjY/IaBDoKi+CIiky?=
 =?us-ascii?Q?waZlQZSqi8OjL5DNx2RhfFY8OT1ur3QoQziG87ajCOHr3yjvid+1SPTX8sh2?=
 =?us-ascii?Q?Dz+J3K+7oKVI50vpBx5iMVkMDnN7C3iYDoV4tbGdZJeso2xyx9KK83e0pASw?=
 =?us-ascii?Q?740hN3Wgnx+4AW7ZveNvjMpBXcjKTP8uPnX55+41XhJAUTIKPf4ZXL0lkRPX?=
 =?us-ascii?Q?c1ZuyrdFOtglRhI3nOfUoAMeT72aqt6EPnULDc9pQ5JOZM+XqPddZeI6rFvw?=
 =?us-ascii?Q?q2FtAICJFzSpeG3PJp66NVVKpQFWELVhtjrLWzyjMqDczBbM9w2WFRfwmLVT?=
 =?us-ascii?Q?om+r/0cW+zcr/axtLXGpKDQHH8vIAv0wlk0yYNczv6rm45EvYqqqQiUJ+LSB?=
 =?us-ascii?Q?GYdVfmu2ZQPmNwpL91mYVWtj3qzal8xhYQLeLACJxEAyj5zfmHE77LZklSie?=
 =?us-ascii?Q?A3TVF2xtaOkRQVuhOIN++y1Hol2B09Euf/y6360Ns7I46npYdclG6fbAuVwf?=
 =?us-ascii?Q?IR8/FILJogIdmmDPQYN3fpgR+3sCuODhNvvfezl/3Y7Ml4whQjzNhjYF+CkA?=
 =?us-ascii?Q?EP/4sbfOwzuygEuE92AJgGv434k3SfSiWXHI43gOwbvmg6k8nxtwOfzJioDm?=
 =?us-ascii?Q?nGrea+QWrxNS+q1kuIksAdCYCRWqCASxbTV3wcOQ/t0fwmYVjRi7RGldO5w5?=
 =?us-ascii?Q?EVldmayWI2hL1QAj5PF5+PtcMrfhwio88Getl/52yNGwIMiZyUrQ00CrZAnd?=
 =?us-ascii?Q?DNx6mDkxAGvoSaPK0ikX9DF2aCfGvTGNYH9wYvaOytsBsz/NFqPkbeGafydX?=
 =?us-ascii?Q?Q7l93X0ui466uhOdMXEZBf+DDRXN1Gi8DLwknVqg1I0cx5ZWqTbplxaChSvg?=
 =?us-ascii?Q?Ljbx4YA5ZNTzrZcD/cdUANvahu8MD2HPE+jICIjitfZaOa4Ksl9sioc4oncx?=
 =?us-ascii?Q?rDGcifzrIo1FlSnorkUEvps/C02wWuSRqv9JoSSg9sUY1i/JJLNBFccGtg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(34070700014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:28:21.2247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef4bee1-ec29-4d13-5bf3-08de16045618
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4665
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Oct 2025 09:42:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16707

From: sadik <s-sadik@ti.com>

Add CoreMark benchmark recipe to measure CPU
performance on TI platforms,Integrate CoreMark
into ti-test package group alongside arm-benchmarks.

CoreMark is an industry-standard CPU benchmark from EEMBC
(Embedded Microprocessor Benchmark Consortium) that provides=20
a standardized method to test the performance of processors.

Signed-off-by: sadik <s-sadik@ti.com>
---
 .../recipes-benchmark/coremark/coremark.bb    | 24 +++++++++++++++++++
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark.bb

diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark.bb b/meta-=
arago-test/recipes-benchmark/coremark/coremark.bb
new file mode 100644
index 00000000..330adeda
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/coremark/coremark.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "The benchmark utility to measure the performance of CPU"
+
+LICENSE =3D "CLOSED"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D0a18b17ae63deaa8a595035f668a=
ebe1"
+
+SRC_URI =3D "git://github.com/eembc/coremark.git;branch=3Dmain;protocol=3D=
https"
+SRCREV =3D "d5fad6bd094899101a4e5fd53af7298160ced6ab"
+
+S =3D "${WORKDIR}/git"
+TARGET_CC_ARCH +=3D "${LDFLAGS}"
+
+do_compile() {
+	make compile
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 coremark.exe ${D}${bindir}
+	mv ${D}${bindir}/coremark.exe ${D}${bindir}/coremark
+}
+
+COMPATIBLE_HOST =3D '(i.86|x86_64|arm|aarch64).*-linux'
+
+SRC_URI[sha256sum] =3D "d003ed54134a0d365c0d5d8dc828432d610d1d1f77b8f58457=
cf1e599ad13f17"
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index c1166bc2..2c4b097e 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -88,6 +88,7 @@ TI_TEST_BASE:append:armv7ve =3D " \
 #    timestamping
 TI_TEST_TI_TOOLS =3D " \
     arm-benchmarks \
+    coremark \
     arm-ddr-bandwidth \
     cpuloadgen \
     input-utils \
--=20
2.34.1


