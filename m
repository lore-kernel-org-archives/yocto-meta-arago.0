Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E0310AB837
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 00:49:28 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63354.1774572558825460545
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 17:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=soAlAEVH;
 spf=pass (domain: list.ti.com, ip: 40.107.200.33, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOzmO8L84nksm0p+suC7jMwCx+8bhFdP/BxPLhaWYJQ7XTczIxAwLLFJhj2iKjT9mMfb78QfmtvVTOr4FNR7Bqt3tv+kInm0F5uOzCzm6J7GHlyc+ptwL6xu49MA5hbLdy5NQuw3JW62k/TcqeYsXRpiroGoYrxyG8AorSE9m53oqM97wXcK9emQq8C0JC5NVrPo+KDGAM9PM8R933cHdPGFPmLsACG0M/ZYENVPsKOC120mpYHrlEV09V6kbSyLCHrwKKNvb8l4JcFP9qR0MO0R5vZNg3dE5BJLE9XV9sKsDNpFdPeo6gXhMEPeZVrVUuveKP4t/NyyiCNnopC+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1viat3YNMS+oti6mvLbtb2IXfJ1XI6MHZKsGK7VzRI=;
 b=Ke5UsAOhOPatIoDppfpBJN9Dodfnn3Ubp+FM5AL0C3Ic3hMfoYi64gOq8h2TmDWodZBajSWeyRFhfFnBrN3pm+r8P+l9/DMLZPvFiNkqrjp99DKYfn1qJ70pTSWnwZ7jZaP4Bie/7vpVUVrc7kMq5yZmh11hUH9w9mKlO5EAaNLnsGQBvJlLvtN9vkouRtJB50/O+7EyS/pTWF/A+wT4/i/QtzQoinGHr4E+HzEDotttv2guYCaG39iyxv72JdT9hZAUxVS0J7FuKMZ4WvXEY9eS7+swfdGEQjfDjtdZkEwX61v6Ugl9Ml7kYnflf5iWe1JhTDTvgPfP3cR42v0tFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1viat3YNMS+oti6mvLbtb2IXfJ1XI6MHZKsGK7VzRI=;
 b=soAlAEVHzqOsOXSuHOuXgzk/FaXuHG4cFQpJOn+MNH7gOu6Cuw7yGxF3gO3/i+rKJO6aS3Gl+NdWTgDunMl+iv+ko9IFU+LKB3Axlou1whqsqzOb1CDAw0/EaLNKFEOAjmS6rqYDCSI+xjTnzgjbuiq1l1efdUCmLoy20g/C2iOjyTPbmegVn4SgXcgVTpMZ4PaB7QU2+sfXZWu4qCgEUgOnAKt966uUKEkdYQtIBFlky3Y6pLPWYGKxyrhKnkGcq4xQv4+qO3AQEAC5ngZVdU1Eb9vlQ/MdSTsWnDdzKBJASF7QUsedbB6fBnteOJMp2UMbsQiSXfd8bYs1KMtTxg==
Received: from PH8P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::12)
 by IA1PR10MB5996.namprd10.prod.outlook.com (2603:10b6:208:3ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 00:49:14 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:348:cafe::14) by PH8P220CA0026.outlook.office365.com
 (2603:10b6:510:348::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 00:49:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Fri, 27 Mar 2026 00:49:13 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 19:49:05 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 19:49:05 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 19:49:05 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R0n5Ba4149955;
	Thu, 26 Mar 2026 19:49:05 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 2B08D2A61; Thu, 26 Mar 2026 19:49:05 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202603261656
Date: Thu, 26 Mar 2026 19:49:05 -0500
Message-ID: <20260327004905.3892552-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|IA1PR10MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee9fd5c-4b32-452b-0d89-08de8b9aaab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	tS3CXwXI38+Mc9s8Ig2PcPt8T55ATAsysFd6E3RY89t9EN+w9nxCCiRfafGCrNJr5VKJXZdx+Sv5BWqsP93WBUcK9eyk8a7/JSPQl8/14b11GIYXAi3zmSNMqq1wMtCNQSUCUIMJg8O71GyYXY8J36hUtcoZYkFtuWe62oozDjrHoo0wQ8QpvEhq2nrwgW2D7Zf8HOGpSR4DYcJJ35blzRmdP4FVNt4NijI+1uPgoA6Di8o0zyj0QhCwAQqN9v6KQX06NIxd41j4+GGBgvA4EU3bqaTcTjplaWaJSSiWxtZi7idDfGQcL7+GcRyCbKwgqZXwvYw/K0u/FeYainrHDulC8A97TMqpXzbdr2kE5MxQxsBBOrBrSAILai8OvwX7JTz/GB295aVq79Vo+3MLOBvTQEFIj55hul02sonDR5re+l0dbDGvssL4wLMebwwW3ZM7VWzxKsgb646DPYdxv3HBpUBjMS2UJunN+RbuosPVefr5VPsRhKjXyGvx/PLazEUzB8q7mMLDzN4JVY0i7Aad5CRm/MAkyCEDvwvHlc271S+N5x9Dktoez3dKwXrqMk4PchdyJQvhFv3jvU4LuB9F81Wqc3d6Oirm0EDsm9p9wgMCJale7w0iPHdPWze3Uyh66WIMzOCYeKMG5CYTWkklGiK7jq/j8/j0/Fdpw/jXvdShwTkp6z01qWbtaBpzqyuOKRv/7/1/SGEtaD+ve9P8tde57/I5Bhs6Yyh/Xb2t6GVNPXVkynFJAAxdTv1t5B20/ByjkYuZ53xEQh+gTg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0mAhE7R924BlkKPqKoa56VCpBrNTujOJFU83gtjMXNU6QY3DQhzk7c8rF2HJmp9OvHSgVsvb/5ixDm7cX1TvKrC0VgVTxmv/Un39kLrZrIlvp4nbXXzk/UPeqU23m2BqGXdoKnq9ZfdDmLbsKwWpZRgXpJlmWGUY3mXPk6UGQk7R3tAZs9f+WCQVm+Eb0GLBo3EGBCIUzfbBd2gtmkKiYOQ/UXXxcdy1wMJClFSPkHCpJyxZ+5TdQgkQHyKh8cIy3CEEPLg++W8GXr7cUbRj6Sznna48KrjFZd9hdRA9XF4IIsQJFQ6TkDyE7eXRAmsnEwwZTVYmeWp0X2MMeZBZcldVmE50a+cyjOFJLBVN6qsz8oQxxpaOtVjGD3MYGMeP+pqECZLi8gOHZqyovCLZr3T5tgO8ZDl2BQtXLBIgN1AGYX31sGuRC0YaS5CB/pOW
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 00:49:13.7414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee9fd5c-4b32-452b-0d89-08de8b9aaab9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5996
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Mar 2026 00:49:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17452

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Dfcd503b5a59bce64c89dabf41ce952c2704d33ea..9b8f565625c94162412a919a93aff=
b4dfa297a6c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 642efcd9..36936842 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "fcd503b5a59bce64c89dabf41ce952c2704d33ea"
+SRCREV =3D "9b8f565625c94162412a919a93affb4dfa297a6c"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


