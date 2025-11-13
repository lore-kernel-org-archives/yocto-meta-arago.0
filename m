Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DD4CD98FC
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:44 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5645.1763074239156158375
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TFzDlhXv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.33, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiWb5hgK3WGUYhYIkiI6Rz1L7nuZdv6zQq5skIUXl6VPWQJeVo+B+di7MJDdFd5K2ivi6lQ3uZBL0MN3Dpe+j0J7M0C21Nttv71Fr3GietN5+RfDiJkqp3hBHyK7IiKEwpxyLFT4JqQbpNKU+1p+bSL5i6UEX1tq8UfNiqh+rd8uRaJpqEUCvtx2lO/z5ZzyCUYy4u1BKYFs1OoFP5PkBxm1HiX11A9FNeekZnpQtCodugHvXXHhmf19YphJVGa1NdlpoVyEBotQkSrTCX6TtQjikQCMwTvw/kwclG89DhlKZm481gQ4jImYu9Y75jJv0YwRn92eJH45/Ct2eLppQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnifejQ30gYi7GJHEiGOso+J05jhvSplxLEUOvAZz28=;
 b=hTPt24Jxl5+jsg4Hq7QpdnC4Iddo1n13/Sgvk7OCKPg1Nx7mbxI3P5c/q0wYZVT2EwwjH0EwWhRzPMEvsp8+jji4ThoNveR0e18WPgL+mMqKHD/aOVPI6G89bFRpvhPsmagB4RoSZM2pXDAxx1vt0zt5Ki30A2R9QMFRf0EEU9ve7OmFQeu8QrGH+Kgtz238xFgsqyNaB+b0QyWIU8kGqMFnHZjcn5XXxiJGomFxlqpCP1qpDAnLo6kDNGfelRby3jXq97eXbTTdCFkfYIpsA1Wfk9Lfqy3qno5WJQ1TayDYBF4HwQ5t2rAIuOoE1benwaF9S43svDZPvGBK/jJ5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnifejQ30gYi7GJHEiGOso+J05jhvSplxLEUOvAZz28=;
 b=TFzDlhXvO09ifUHyzX/CQaSZzYOOWWzMydZgEZdojYH1542fvynLDidi57x/1fowsQr92RD6dmYIlIxXahO3yA7rg9pYueLXCJ4l89lFA7TQctI5WT6fFBCGj55XtPjdZArrhQrx0joAH+4QiHV2WYL6JN90vWMaqFzqUbgBGzM=
Received: from BYAPR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:40::40)
 by SN7PR10MB6977.namprd10.prod.outlook.com (2603:10b6:806:344::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 22:50:23 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:40:cafe::ca) by BYAPR04CA0027.outlook.office365.com
 (2603:10b6:a03:40::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 22:50:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:21 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:17 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:17 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoHYm976581;
	Thu, 13 Nov 2025 16:50:17 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8v-0005zi-Es; Thu, 13 Nov 2025 16:50:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 01/10] offscreendemo: Add REQUIRED_DISTRO_FEATURES
Date: Thu, 13 Nov 2025 16:50:08 -0600
Message-ID: <20251113225017.22994-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|SN7PR10MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: 316eb13b-8c18-48d1-e965-08de23070664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9Mh3ikPjmBmjGTEfc619zLu6nJ0AsFDvsHSKhCpYTwxtaHC0PsOnji1khOyi?=
 =?us-ascii?Q?qjMuaV9/9RY94KbJkEO9TOXq8O7dgYfrWfv7KVI8UwEMPBq3VmVsEEYtxDcX?=
 =?us-ascii?Q?MoItYvVBkO3gOFjoq5pwTFNr0QLeipF3rtxLghHqvFmvC2sIZNHQcAOUfozN?=
 =?us-ascii?Q?qbHFS009WEBEnkDW17E1LgSJp6QFTjwVHSFloYhe7741KcLgzzws0ciZHbmc?=
 =?us-ascii?Q?iCCeqGa+D6CVlY+AElpg2WplxPV3T5J65/pwXOxYkfv2AbRR6ZNGG17D2hr2?=
 =?us-ascii?Q?bjOOqUZYuVILHJcw7XBTsSN4oI1ufKkRWMRr46wUnasGBLjLEiWPPpKjnwdK?=
 =?us-ascii?Q?d71XRLDhD5mmGnWNkV/n5Zz+tgkRVa8hHn5M6fIFhzORfIB9eVbn2OQ+Fb0i?=
 =?us-ascii?Q?ps9Jd5tTu0B5Hm3vgjAaQQe9R9cJZaseTSAYyGZMOQIKbdnWGizORyPy8Nsn?=
 =?us-ascii?Q?g7wPLTpd8Yv5dvKHiJ4ZA37yMV8RlTfsfCxe696VLyHFKgZsXkiXjgE4R/bP?=
 =?us-ascii?Q?cLIxibVYKPZUmDyOgj4XmTB1/2tIpTFPztjS+ZczHg83S22pI5f2vwcilwl8?=
 =?us-ascii?Q?EAD4sSTlAAgtEbDsLAATyGkKjdct2WZVYGXwnf9MpnVQZ0Tz7FS8YZ3b5G/E?=
 =?us-ascii?Q?ksjBB0JN/vBEi7dAgu2JEbfmx9nW/KsBWEqNUaqTSkZ+Tq1QxbZuzZcKWQ6a?=
 =?us-ascii?Q?tmUj17qY039t3PvtYtMMj8xIXO6Td1jcY3WsYXeVFYDotLJlmC2zT4ns6zNX?=
 =?us-ascii?Q?eGOlxouBIC0FQXOaV7bVfIYTZuR5y1Z42wJ2+70FarSG1fNIa3dDF8ehVzq6?=
 =?us-ascii?Q?MLF+7IT/JsTTHoF4X3/LkagiRvpdXgmcL14x0De/3DADEyBfjnSdXKMWv4VO?=
 =?us-ascii?Q?bcwus6dD59wGrs2beD9YFjMWFwJTq/2fI3bqqZuJ1isGqBhaROjplL+p+G0t?=
 =?us-ascii?Q?6wiijxESoVphfF8Jiv4d6ThRVkxmUzJ33SriYPEGi1Ww/STc5NPs46k2EQyX?=
 =?us-ascii?Q?qsjtSspyF/wmFKNZZCvzAwjNGBqE6M6oDKXjABjMLEDdc7SG74FjL2yhE5QZ?=
 =?us-ascii?Q?9k3KJx+v5qUrVvk/ANG0eR2+JMStZhF600kq4VObq1kZRudi7hFEc97lXiK7?=
 =?us-ascii?Q?1BWhhBc1kl+XoktZhLYtTCt38dII4ISh+DBZiO/MWEZUTF7qS8xVG5N0JRDH?=
 =?us-ascii?Q?5gxuZGEXisJgJnld/Q7jLI33fSXWLAZGAce5hsFOCyDnzQuK2NU2Nuouhccv?=
 =?us-ascii?Q?7JT8vpOkWqlqY9j9hBGK5yCM28b2b3G1Pr++/A0l71KY0dstQSIz6yMF8wHX?=
 =?us-ascii?Q?YL21XABx6ziHKJsG6zes00aXVEzNA0XSz+BJJ+WXZCRScKjNuCtpaA4+1oej?=
 =?us-ascii?Q?IZD0fQtlBP4DtXyEQJDAfdZbdWkEhrjWDlVttvaxdLkc1QifHku0BHD/A3U1?=
 =?us-ascii?Q?7gXKarprknJkLbJjrzXpus/fh4anQ5OS8Cqqu9UZAP7NC1SXG9p4OCRbGAj+?=
 =?us-ascii?Q?x1tfsWwjCZWH1K5J24dmANo1hSYT2xUbYB75xhlN3aqUcdt9XgSAE36KZwQe?=
 =?us-ascii?Q?zwNy+Wb4R3NONi5BStY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:21.1613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 316eb13b-8c18-48d1-e965-08de23070664
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6977
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16764

Since this recipe depends on virtual/egl and virtual/libgles2 it
should be gated by a check for the "opengl" DISTRO_FEATURE.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
index c2ad5012..a341c872 100644
--- a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
+++ b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
@@ -13,4 +13,6 @@ S = "${WORKDIR}/git"
 
 DEPENDS += "virtual/egl virtual/libgles2"
 
-inherit pkgconfig meson
+inherit pkgconfig meson features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.17.1


