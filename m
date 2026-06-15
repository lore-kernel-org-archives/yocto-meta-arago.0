Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C90CD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 18:53:54 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137045.1781549633551588710
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 11:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=OHGbXKS/;
 spf=pass (domain: list.ti.com, ip: 52.101.53.56, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNA6TwyXKdbAwQre4xj/MjEcpZ38A/BzvA9i08Gx6mp4bW0tlsCdAVuQp63HmOv29WD9yLulzaaK4c9/OeUxlpq623zg3YZ9C4E/Qj9oqr0yMpAXBiH7OaZ6IRTKUe/3TkCA8ktmlKqug0jwCTVpgTBx9PTtxRGtSQniuBRNMMOspHD2BPvvk3bnLXzJ7CQ4eXiv/5K1hGObuhkj/uqZ75NxfOxznBkYlMeqd0enlERZvtnfqFqSf5vqu+TS2i/PHrUKpavSG0ixu6iJj0rDMv/WGVnmRXoPhLkq1+wJdP1kQYBWawJL2rv5CW6Zb5ARsFEdNw1ic0a+1DTqCpJ0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYDOpo63Dr6gtQwEl2HBJ6O3ktGR3CXrR36yeHTNk0M=;
 b=EXLYKx6OvPrd3rWIE+Zek8Ay2z+jyGS9rYAVj5znWN3cBbRW63B52uhw9MofMYnuGx29NTwOSEVSpQvL69IQFh92+dd6J3GVOHEEXl7bRu2LmJirydRRFXR9WSl5Eiop/1kBsK3Uulz5TRWFPb9NeqcMOKyDm3NI/DZpo+aAWO4YM1TAx05qICxenZSOxKsKBaoFuJGDfG3/hKMY/706l4S4VR0da9ZieiEQnJICisldRCc0Bb9il+k6Ek7KBRNo47+zwr7DtJb8L5XfrRql5DFB8TNkNQ8wZZqGUnm1ZTDKVczhNNkoWbhdwzbQfSbHWd/jerTBg88R6Rk+rEC/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYDOpo63Dr6gtQwEl2HBJ6O3ktGR3CXrR36yeHTNk0M=;
 b=OHGbXKS/8gtB//auSDM7DZO6x2u+Hm8jYDm4rauOjcQFvyPqtFxXqHzPHEEE82Ht78m9FmAQesaQAIh8UxkJBHzYbBBIB1+TDu1A2SCudo3hz85HhzgCz9Jn10OmUrBLa157cioS8+UhassjjXlM5P5p/IjyM+X64PJDbRKfGfStp7UsznMScCfNm5V6drHX+JjA56irouY+ZJ/pWgBMs4n+9/ijeNatEnw75TK0d+VPAeR+vYTBRqf2oFR64IGPURay4Ul2e7AmKC4KC9X91eP3Tq8l9JyEw1a5BPE+ODBBtmZkF7VhyoNZNI9omzkNVCAHxW900Z30xaKHQPkEVw==
Received: from SA0PR11CA0036.namprd11.prod.outlook.com (2603:10b6:806:d0::11)
 by IA6PR10MB997586.namprd10.prod.outlook.com (2603:10b6:208:5db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 18:53:50 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::33) by SA0PR11CA0036.outlook.office365.com
 (2603:10b6:806:d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 18:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 18:53:48 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 13:53:47 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 13:53:47 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 15 Jun 2026 13:53:47 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65FIrlsb1568012;
	Mon, 15 Jun 2026 13:53:47 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 0D8652A6A; Mon, 15 Jun 2026 13:53:47 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202606151035
Date: Mon, 15 Jun 2026 13:53:47 -0500
Message-ID: <20260615185347.3206632-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|IA6PR10MB997586:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c315638-1e04-45eb-c31d-08decb0f6f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|3023799007|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	POi6RkBnTSMtxWRyiBMMRv7OsL5nuJxqzIh9k+8qQG2a2V7MTX2mlAdx1/X7jpraaL5qY0HBG/mcsu3Uy0/svK3FSz768rNQ8pOiE6qFD8MHpuxTo77QOQaUzvdZUA6AEhiEO+ZbNu8U6PPtVpoAGzKKk6K1VSSDaUAHGUn0ux0sSoHwUseKwkmOcvOU1WxsKIffoPkhELtz/plBr9mB/A7AlMBTuMzTEH5j1pYvJjf5kWhYiiBNJr9bCzSHuFCp7PS7qqcvB6am8IlUYHHH+b6rrIp5wbzPwvEcxomZHdwrXYFOjfkzDe5zu0aqZCY241AjpIi0IZ7jV9zp9hTKoYRQOm8tVGIl/myCwwoz+GQ0RvRuH2iNVBSNaicR5ClHUR5I+0En79PX2nLnsskgk9G8ZSLIuTfA4y3YZ6NASddm8ztlfyXtp6/8wRenXbWUJMcdDJN/rju5cKJY1ed4PTbSs+2l1QMCbeTht4BC2/OzMDI4VbiwMSAgNjAhBMxU+I1Og+iLJew4FQMYO6x5Wi9Wqjko6fqGUNDgjR1WAGDkpvvPXM8k8v6j3uk1LcREJo5SI0ouFO3RXuJS79RowflULsMFDwiC5lfq+K22FLwC6QqFLpbqqhdANb/BhO/UfYya5TZ+3scR7MeO0qYUFOSamFBW1+rsHCDPDUCK7nt35fJ3L4d6+VnlBdV7j3TLIFDOD4vMHdXwwwVZCMrIz8zE4ZanaZSi47W2WufKDD4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(3023799007)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CxXLkhLzMy+Lw9fddJ8r0N8+aJCPN0bjC8PFfCEuH8CQuF7OyGJeKZH4MVsnDmpBnZ4uvEge6kFFDwcSaVwt4dckvS5nyycL2uBIBA1chxBFYOzUxu1pAoCO1KdclOfWSvjncEV0ezvkDMmUyFsqdHZGQc+Y4eUiF9L33Tu5c5/qCgTjdaGJ8th51Oonzjy1c3N+9xJXSK3Uw5T5ewBBI+3jLf2o107HdxRmVRdZaS9QJN1Giya3fqp7MNaU0RqXw5JrGk99l3tXKqM9jloy3Md+S2MBHCyHn8Guu6b+nKtn3CxRPp4sc5zC7Xd5Z3NAZKULz7EXkDL6oK3WMfpypOcaVn4LfjvWfhjcpGhIRbhJCIxIQ05luE9pA0U0BZ1Y+6qaVu/FTiJlPsWlp+7WIBAoEAl8WARDgzHragetm/rAcPpjbP3ZwTYCgYLSKJuT
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 18:53:48.3133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c315638-1e04-45eb-c31d-08decb0f6f34
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997586
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Jun 2026 18:53:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17568

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D009ab8e98152dcc4ee070e066882eda6b42f720c..f12145cf7e98d8abd7a5f8fb06d6d=
6cf5ca9d948

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
index ef54e55d..06dc3728 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
@@ -14,7 +14,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "009ab8e98152dcc4ee070e066882eda6b42f720c"
+SRCREV =3D "f12145cf7e98d8abd7a5f8fb06d6d6cf5ca9d948"
 BRANCH ?=3D "ti-ltp-ddt_20260212"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


