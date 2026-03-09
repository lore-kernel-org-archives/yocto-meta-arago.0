Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D488CFCA178
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 19:20:09 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23042.1773084003314167179
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 12:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JTFiFyO3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.2, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRbO0xXE3QgAdheodU3fjEi4uyq3zlJ3BZRHTdqS/YVHmCNsxKXGN30GnNA4kf0DnTI/DkEWRrGNW3mv64S/2dhQlRONeL1FdaQRZY75WFLFbkonVpo76gqF34dih455Ytw6kfuMwQccfVTFy6wWm8TF0Cm+3hHZzH/MzMuFGhg7Uz74HEBJQNziFtsNBrRNMFzlGOykQFNldIK1jmQW8J/sbKIirOTlg4hSYqZ0wmWaFiRdv3Zv6D8/vwhVdX3OTnWA9aNgTFcnxIdqsQ+NMLWkZKucwj/UxKLMCgJIjamFfQu2wykPDoJTB5wEd3M1b1lkgUMmQMQmd332STNNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=no4zukMw/L1w/1UzH35c66IiMl2qiLaP7yN//5jov/I=;
 b=A1e6rSyJ2YqVbvh4pU/jOoxZtlnrwWEs3O+8a4L7n61mijpW5iIstiC6JS5gCp8aAIXvDnFaP34SVvhNP7mCUG03NxoCbehjoIrt8iRE3oP8lrgwdH0AA7weXat+9SUyg+9R/6GbFoISbl+rfOI2DZrmY7uWME9jGQ16+iog74+doDLJDeoPHYRWFMsxdebUO//AB1K81Xd2azqKvV5gKh5d482L44KjcBJoRqSaydIv37tSnyK0dQZ+Z+QShGDQgtw1475avy3sKnNFS7s/16O2gewo+JoNA/jE2xdwzyMhcgefyy8Td6JmamQyr1mbq7vWcs12lyGfReuYc5/oPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no4zukMw/L1w/1UzH35c66IiMl2qiLaP7yN//5jov/I=;
 b=JTFiFyO3e1PzkDpFRI9AgC+/QwUnijbE6yZ/jL8/NmcLntK2nlG55QJFPScNiaCv2YCtc7J8asZaUZXDL7z6iaWQEk/Q31lxeZaJ5/Iui14vH8E4lizf+j48nNHEPYJ4gMvWyyucUSp2x08lPfN0oefWLhnsdwFGWxjLUckuc5A=
Received: from SJ0PR05CA0135.namprd05.prod.outlook.com (2603:10b6:a03:33d::20)
 by DS4PR10MB997551.namprd10.prod.outlook.com (2603:10b6:8:31a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 19:20:01 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::f0) by SJ0PR05CA0135.outlook.office365.com
 (2603:10b6:a03:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.20 via Frontend Transport; Mon,
 9 Mar 2026 19:19:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 19:20:00 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 14:19:59 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 14:19:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 14:19:59 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629JJxXl1163282;
	Mon, 9 Mar 2026 14:19:59 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vzg91-00000006xpv-0UlC;
	Mon, 09 Mar 2026 14:19:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ltp-ddt: Add missing iproute2-bridge dependency
Date: Mon, 9 Mar 2026 14:19:59 -0500
Message-ID: <20260309191959.1659898-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DS4PR10MB997551:EE_
X-MS-Office365-Filtering-Correlation-Id: 742b4360-9f3e-4ec6-6011-08de7e10dc16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	bACtex4oLmoxLr890AElXNY7sbcz/wEgOdvD9bPHFmCliIjSmmMpM3KioFdh1biQRjCxGuJrpuqSFNmH4A/JHu3cV75uD8x4fNAdN41wzovI7Qc3yX4RTfwkRVB7Nanczs9F4zVZZ6pZ+xP5fHuyqChkXVaTjh1wIFnjVBhDWdr0V66swY+3QDNtwItHomBA52Dug9LT+vC9GG4xRwxkH+Wt6r54lRw242kSNiTi8aDEha13epxxtI6eKWwFLoumA5jTqZQlmhGMooG+aroMcT7mWMv2lTEdXcoMYUYbEp06QZ6QC5immlQYurLf+XcAMvKK9YRq7Z6K49lUfEcDrcNgkGaAojFwq3cODvrMBm5B1HPPKMJ8Y9j0HZCGStYDkn1EbdGJAWzFB0sFBK5y7DY+nnbnAxuRUhtu5Fn4tl9Pm6ryGChMNhhKOFaYED5DaeH+OdLuzcbucm861ST49XTE9ziqZF4O1cOuF7yV1iC35De9bLlFh02VspW5eN2BiRDXtioPj5reJSgaCpmZbiDVEmnbdlwnHVW0tozzzf3A+VxEU1qQrG1EmRieC0OA+DJMbXTLuECIsbQ9EW+wQNjKLjdNN20045z6F1ERDLRUK/1E6iq2rbkAlpOtn1KfUjcWn0c+J83Fic8HsP9BncglRbR54ck8FDVThMu+tXpZGYlvd8VNUdCt1ylddLCiGWnKucZL0ljhVbX0AHCTOg1MZ3F8ax3b83MXcs3zn4+ZYrQ1u/AUqP2McWkCqu9b2bOEecwdiTDMdk5X3HeQZg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Zge2vLA6pLJz73kOhr1rKo/hcw7cVch193v4Xzr/8x+9acwjuPhLBB5zLoiEuBaC/nqR13oGLFEKgSDDndefuwl/eA8SdptWID3B2+WSc5JLy3REMu9UfnH/xAvqK8VnFULMsjg9K9l3dG72buoNSxT42JyEO45TcS/xaz11uOCX3HdxSTDIPiv3JXg9R8qKfpusBiUHfnzHi3p1jxRq2ID0yb3DKyndNX7HN6O6SgbdkKJZ0JPSPadht4eYfCmyFHzlnHP6xfrpeQWd1JxWfZ/IxuU2whnM844XRqSXcSmQ0SkBBkx/MpFxiWHox0D6sWZqABURZGOpCPnrx1LSFC9JOrS5wJP/iuxp2VVMCbvCi4VHhMuXeZDlVYY/LAP+NYvk81rutWINNhItAo1wS635l7P7Fld4p7kmQxnA/dJF48J26xDjrVO2+7Iv6Nmn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:20:00.8916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 742b4360-9f3e-4ec6-6011-08de7e10dc16
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997551
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 19:20:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17297

A change in oe-core [1] broke the bridge command out into its own package.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D21689b8984f=
d426f4e21d729d82444d3a8e230b7

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/me=
ta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
index bb3b7e9c..602f75ca 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
@@ -96,6 +96,7 @@ RDEPENDS:${PN} =3D "\
     gdb \
     gzip \
     iproute2 \
+    iproute2-bridge \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d=
)} \
     ldd \
     libaio \
--=20
2.43.0


