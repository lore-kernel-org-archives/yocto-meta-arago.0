Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B310CCCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 21:41:45 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10716.1762551699191111610
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 13:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KOj1Kx2t;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.40, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWJcSl6e+W+95PEjb67jlwlsA6SE7J1ZXj6umbtoR+UOOFWAsHmK+g9pk/THuBLIa9Af2WsEybW5EteTri5n4Rj0+IEF3rLc5sp5GqME4SNhPUfNdyozOIqstrDNzyERqhALJpIg2ixwyqnP1We3sBTH98NVIl5vs4EsUPTKUJqxRq9HBHn0q1la6KXQHKJL52FL8I9VI2qpx4+IilEio/6xvwvw/D9RuElCgwVldRblxmqmngwo7mADnxIfECBH1ACf0nIP6dXpa6zhru1ppwoPsbBZXZW8AOb8yGP1MAgeysRJHcpSxNUWitOMCQfFbbes4fJZDiOpDJq2lQh44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUQm5HOldlmfybxawDPA/AQQmhjqROnawb1NR1DN9Zk=;
 b=w7DmyUBY0kaeMUn1F9KKCQfHH8oo65gWYZ4iuNI702qorFKQ1QpmEXxvMT+4eJausTGmuR6UGiy3HNUVIh3b3DqKeAPk2R0HtRppnjblgYilqIZtcqvTN5fP16FIoDam/syCQ3M1FxaH79U7ok3OJ8MHOrJ/Y9ig/0zU3mf3hiPSYxWQA0Wa1u/psWUogf4icBsahFmcsF+wSseHqmBSxKV6mWBgTFDhq5hslsGRs8X86DLPBffXBnexP8Yv2i9J+G8km3bPtg99eq4PffrraJhWYeSz6jEPpq9ayphVWeK3IOPFO8UiVvL6X+QiYANI7HC84AZvnIuNJBbH1I2bMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUQm5HOldlmfybxawDPA/AQQmhjqROnawb1NR1DN9Zk=;
 b=KOj1Kx2t25NfQSIc7K1jvkCw6M3+kO21hkdlScu/2TvmzgHEzJMB8tnJYy/GHgUR/iZqoPtgR3+yJlREh6Foq5Kbd3mTw/ue8rY6X8P5CWC1mVwwKorwf7vH5a9TXgsPxqLXiZJa3afuetu1i/ktJq59NZ4KNLej2ayEy26bF9s=
Received: from MW4PR04CA0040.namprd04.prod.outlook.com (2603:10b6:303:6a::15)
 by BLAPR10MB4897.namprd10.prod.outlook.com (2603:10b6:208:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 21:41:35 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::6a) by MW4PR04CA0040.outlook.office365.com
 (2603:10b6:303:6a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 21:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 21:41:34 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:31 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 15:41:31 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7LfUT43713651;
	Fri, 7 Nov 2025 15:41:31 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 3/5] omapconf: Drop OMAP4 as a COMPATIBLE_MACHINE
Date: Fri, 7 Nov 2025 15:41:26 -0600
Message-ID: <20251107214128.1491466-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251107214128.1491466-1-afd@ti.com>
References: <20251107214128.1491466-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|BLAPR10MB4897:EE_
X-MS-Office365-Filtering-Correlation-Id: 940c176f-b49b-40fb-b4a0-08de1e466c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vobTa5RbJfD2uYgmziaRJkEEO6gPrcK3sAw4QpgaO6C51y5dah78NODWmwBH?=
 =?us-ascii?Q?BfgJcemJx1/gX35F12kq2nzqyKUEPoL2OiciOT/e9lbUeT+6U/F/2g2K5tH9?=
 =?us-ascii?Q?Drq4p+7hYwXTpxiSQSJ0TiP4PTckrHBjibKejqZ9jdXcVFnB/wYfM2ryhfwW?=
 =?us-ascii?Q?lTHYEuyX0TnVBm5wzSsTQAJOvyjwE0QK2zNGLW1Z9rRSoUO6lb9vsKoAxRTJ?=
 =?us-ascii?Q?7IVJHiaaEGWBM5eRIEKk2wOwcEYWemUbyXv8C0T6B+38px5pF6IcMM7BS0dr?=
 =?us-ascii?Q?WCEKef8TZE6uDqxr+wkwFDZIZMCmRALmUVbc1FIbhsIlBX8OXxegVpdFoUGZ?=
 =?us-ascii?Q?71J1ODyU4BOoI9XkE+sPNMYuzI9/cZYKWQbMmdvnW+kBUWxYAKj1Wsb+WKYp?=
 =?us-ascii?Q?cGnVERUG+o8jII1TG3BpO5QuY5HxceZSypuYXgdfi6xP0HbksO24Udq07uPH?=
 =?us-ascii?Q?Gx0gCx4OLnXn+jo9y9mu9gk4/SAj6Qg0p/fkJP7ru6hA4c4tKfG+P3TRjyrF?=
 =?us-ascii?Q?QbY3qKl5avJaQrYq69cz6Xh68tFkm70egKZbiKwWVbLAOpNdb6VSVuiLhfj7?=
 =?us-ascii?Q?f4wjNl709cf+SoXUlr53xg7sboIN2F897ybiARQ3dn2wKPaRmTRN+zz1eOCO?=
 =?us-ascii?Q?iI6wYiZCE7N/FihNZg3JJy/UWoHL31zp1HMY0Behar5ymTwbU09mkSYergra?=
 =?us-ascii?Q?QJ1cDruBVcsMnE4Dlxq/Qd1j+BhIriYq25kw4dxIFE2JYaCO/c5FaBBs5n8b?=
 =?us-ascii?Q?sIc2gAnEzMjqgFfXLdfO9QKBPyq0RnBOryqeeFPiyn27vUHfUeJwm1nJNrqp?=
 =?us-ascii?Q?ug31Rs7C5ZV3dCYarReDOGkVMqDIt4yjBe/TMEANTawXAUGAF0C3U/NRnTGn?=
 =?us-ascii?Q?b3kqNBSpWkhwksjqWBshQ9T8NIAIZwIwlUPxoEW+Fod7feMXBwTd0jcgFlXi?=
 =?us-ascii?Q?j+r+KOXJFZyDJPCE4HKICGZ/TjgyYGJTRcw13pAe95DYby2onBhT6TkmoFwn?=
 =?us-ascii?Q?wsTDZqaifA5NW8B3IJLJz3z1FpG7V87VivegVo88SiwktzxD0yq8K0hOSngx?=
 =?us-ascii?Q?Ha3O17CndKNIc8S9Wc1HE8ElqfVcEITECAih4dzdHVZz7D2J7gzSNSAz48Ev?=
 =?us-ascii?Q?rAP+GdcTvSTvxJZxz+hUNack4yxIGLvihRLoOhIZnnCgfR7aMDSMH00zJnUU?=
 =?us-ascii?Q?xWzqWlw71xZOPyrNK9yn7rewn8ya8M9+8xWcNKlE0JdDU1pa6gPOao7jbOYU?=
 =?us-ascii?Q?0jBaNzkH3vgkL6pdz72IsFX8NmbUKz7t3Ui7nXCaRPSl7ebZ/lHI8lz37pre?=
 =?us-ascii?Q?Rz6+s3xGSVKqqhiHi2Daiz2eSn6KjrNkT8C6sv4Yr4Ov0sY7DwEop4yRQmpM?=
 =?us-ascii?Q?iqXxMcF/8Wdm7Y9c5lfbNa6Hx7lFPpZgb7fHggUm0LIjqsLjpYogORBhVikt?=
 =?us-ascii?Q?EtJ8fvghuKF/JFS0OEWyd8gDu9ug2uWwHsyUnF02/ZIjjDtrQCrHry6MUujZ?=
 =?us-ascii?Q?0y7mBqD4hA5Wa/vtHCzvjnOX+Vf4FlA2fgycORq/fhWRLcufpftS+8FBAof6?=
 =?us-ascii?Q?SGjl6CdJH6b0hqkjHyA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:41:34.6386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 940c176f-b49b-40fb-b4a0-08de1e466c59
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4897
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 21:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16734

OMAP4 is not supported by this layer, drop this leftover compatible.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb b/me=
ta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
index edba8e12..53fd3e12 100644
--- a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D205c83c4e2242a76=
5acb923fc766e914"
=20
 PV =3D "1.75+git"
=20
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|omap4"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
=20
 BRANCH ?=3D "master"
 SRCREV =3D "ff07b6992bacb1e1586c72b7d2be469caee4a347"
--=20
2.39.2


