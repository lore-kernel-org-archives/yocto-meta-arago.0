Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B24D74956
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 06:14:07 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11520.1766124837609214464
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 22:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=tpXh+3jN;
 spf=pass (domain: list.ti.com, ip: 40.93.201.53, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWm1k9ZwjYSEXF1rqOOr6Ng0LJKmtMX4GqdaaSTB5O6KXag+uQMa6ASkP4FCYcRw59x18Nukn6YzxDoSEW5cWLQ3DkGjJRU9eMfQOoOJjGQ7TrOeI5I/ZuQtfazUsY8FRlJz0iXVT/R9NT9LfnIU95ngVpnFUNVyIPWl/WehuGO5Y00uBSWdt55vACCBCHSSGpErWG82QUETBO7MMOXwhAA7sD/xqGw9G0fqK6FRAig+e2Yaxt2FKjALVx4PbYZ0i42wzN2bI76AVF7gGC+LlMoYW5gXcm0I9+1s7bLE6dCtrd+jh7OHbuOfL1V1r4vLejRXmPMN/3uO6KigQAOQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQd1pFZjOVEzLlDjV0JjKZof9r2HdaTnwiGWkCaE1LI=;
 b=pwbo5mUYpIvCBMDKcKZuPz+QardxscKGFuqUl7WvL14NAJidzoG7US1KuyTaFcbnyxby+diPxwlX9Kr4rnDv4jWHYPfV/q3bSDqcGsr+aE4WrZaUaf/5xx2b3WLUnpIp5n/HZgaxNctsNoJq25zn5BrPqqC1xGUxgpgqc0BE4hXBRG/9tDDVig4/ELgYWnaMe5uVFK3LLA8ouw+Im5/SJmGaccj9xS5EnAkyTuz0LPvDsA7x/dEG/hnuwhNzyLLFyMcJTCdDbEXdhh9YMpHOVFIL+pQM7JFrluW3FJ9cMPByvBt8Awe7cVUVM4nEQlRJSbeNJ1VOivwGL1TI4s8dbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQd1pFZjOVEzLlDjV0JjKZof9r2HdaTnwiGWkCaE1LI=;
 b=tpXh+3jN5hzDTDtK3IYJyhgiZ3Z70CRYA/tTPAtv+5wsmFJ6FUBasRFeqlUmmM4cBwfiMkwIlrqF0XpHxJxmEJVC6oWtRe347YG0EFBhPIYO7ZQnAq4Y3IuREMF8RTO8LGV/bCrmbgxqLkyuY/u7Bj1JyJbeQ+iG2+itsXvU9qiRFyYQ0h1DbKW3z13bFUNETpxjfXXUCh2FEudWOGVo11KfIfULnJqHUfk9Zq2fOqSJNG7M0N8GhmJ2dLHisYSt7u3WYl5O5Vg4Cs7r8WI86ECUxqM67Pvc/y2XVuqXmjjLHLY1vn9vqfAYFBlRfDrT2lgHqBEYgxBw/y4ML5ervQ==
Received: from SN7PR04CA0009.namprd04.prod.outlook.com (2603:10b6:806:f2::14)
 by MN6PR10MB7423.namprd10.prod.outlook.com (2603:10b6:208:46c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 06:13:54 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:f2:cafe::c0) by SN7PR04CA0009.outlook.office365.com
 (2603:10b6:806:f2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Fri,
 19 Dec 2025 06:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 06:13:54 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 00:13:50 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 00:13:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 00:13:49 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJ6Dnrg447974;
	Fri, 19 Dec 2025 00:13:49 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id C4E652A69; Fri, 19 Dec 2025 00:13:49 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512181848
Date: Fri, 19 Dec 2025 00:13:49 -0600
Message-ID: <20251219061349.1872555-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|MN6PR10MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 8105072a-896e-4623-dcfb-08de3ec5c97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?33yHEYIIfbSQMHAXJmksmCT1+aTjiRFP20OSl8gCx9zKQXG8K4o/3FLUB3yo?=
 =?us-ascii?Q?JYEHr9kSHqInHzXZm0uuzv4M13rDXdV8pcUZU6Dip0FhoHwd+qZOSVAVy6AC?=
 =?us-ascii?Q?QaXn77N8hjVxDi2SfarBddklUs7O16AS9D7f9/oPvOVhG6odESvUPGvF4s0E?=
 =?us-ascii?Q?TNSpP5nM1jq3a9ewD8IQaI5of78yimPesht1ib4GgVf4J5cdCnxVxNq20Ch8?=
 =?us-ascii?Q?G/6ix52TRuX0qqrPxycUViO6QnrLJqrrgsCombstXH//idlUX8ZWzG5FgJxq?=
 =?us-ascii?Q?vwK83bE0qehghMYAArk/OAFOMLpfsr/en4BtW8BK2rsc3cL+iIQvt1Pk8HAL?=
 =?us-ascii?Q?q9M+sQ44pcQQumbQRif8QimTAjWKXrxU4tpSFKKj7lnrtw5hLMppPbPVHiGJ?=
 =?us-ascii?Q?O8QNTlwJJ2Ji6xYPN7Gco/LGTKGP4SG3SPEe6Bw7UtD5a1dbyhHOfUbQIUWP?=
 =?us-ascii?Q?I3eQ4DFfVSfIMSjCqgC2dpyjWSCHCHgCrZF+6iLosVBpVdvHphsW1aCKRKRH?=
 =?us-ascii?Q?4f4Qd/CcRKyK1f1yCUCVCROqoETORXRHJw7X+5p0D/sFiDJ7zqQSb2OvCr9E?=
 =?us-ascii?Q?qTumjzHV92gnmQFs8XIPOj9hFYnWkzpiM1vQfz0wYdU69lF3JHVL9IJZAjtn?=
 =?us-ascii?Q?qjVocPT9O8AxclwrbGb3TJETbH2uxYTZaAm7ZaufwSmNN9LeLLvc893vJIgk?=
 =?us-ascii?Q?f9OhGPOZkgNvMPysNrL6M6GFimPNUZoV1jPmQkhPHdohHJbV4TR6q9bGiWvb?=
 =?us-ascii?Q?xQF86ia3EzVzUl/xBVmr3qY/MvwR36TAY/KcfbK/YHkaS9M5Hanfc1WXHKpS?=
 =?us-ascii?Q?LctC/NKN3STY951PuuIGk7Rel80z0g3waaw/zIHzx/S326MZ+rq7cofzdBHV?=
 =?us-ascii?Q?S2mBE9EpiV7FcYIsXQGoo+/ZaBb3CvMLbMJ440Z6WI4B7GAgYcD95JYb3eph?=
 =?us-ascii?Q?Qs7Bo6FTfRpywFj1MVfI+uN947OLeSetNPEkpg1C1IS80HKmeGS88TCd30Tt?=
 =?us-ascii?Q?ySjl+CpQKPbRqrSOlnEtMzpd4U7KAJHzy8/zFcUXWCD0U6peMkQvSqpe96Wy?=
 =?us-ascii?Q?8HiXx7SkvyV1R90Fa0CqOwgFT0SCep92/KWwS45qLsn80NsTfoUW0cM/8rpP?=
 =?us-ascii?Q?Fpjz0dJX5FzQjyqZRd9UJg9lQYJ4WS6Vkow6TN6OK09Did0PHfBsuALss5Au?=
 =?us-ascii?Q?RqX5kyRlVbrSEjuMpX2A5CKbl20rZ0EXk0rayn5Q4dmVziR2/zKlpMjwPzEp?=
 =?us-ascii?Q?IYzSOVkG+hF1LDZGVuL7NmHfh1xfWuPcnsretFPuQ8U22qN42W8PAEDdhESa?=
 =?us-ascii?Q?6EXfSIjMP/Lu/gqPPqi+H5I4z+vetQvfkqIheJ0GQfSI1At9pNLUxCA1aCkJ?=
 =?us-ascii?Q?aqE+nuNm9gmQbQKTIn8R1DI+g2R5XaqY/bU3POJWpITcAEMGKQD8N45lwre9?=
 =?us-ascii?Q?hK/bwFKEzOzc+8iFTD8ad/kbIMHYtWKnMGR0CI40cW49v27qxqV6LRoxpCbt?=
 =?us-ascii?Q?rx6KAy+AoQGr8qHMhuplysZEiu3x53FgO+4nVMO+Pi0AXbwJYfU5NOvLw4q/?=
 =?us-ascii?Q?gAYMtnVm2xNiT7ImALk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:13:54.2672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8105072a-896e-4623-dcfb-08de3ec5c97a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7423
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Dec 2025 06:14:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16895

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D5c3f50a492aa9133a89ff3d67833674cc1018180..d23395da4e67855a7d7ce476e44f7=
9b8e604998e

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 67a8e3e2..ae01783e 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "5c3f50a492aa9133a89ff3d67833674cc1018180"
+SRCREV =3D "d23395da4e67855a7d7ce476e44f79b8e604998e"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


