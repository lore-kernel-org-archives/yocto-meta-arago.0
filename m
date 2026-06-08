Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E42CD8CA4
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 20:38:47 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64738.1780951113776498611
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 13:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HrS9oAiM;
 spf=pass (domain: list.ti.com, ip: 52.101.46.58, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPVZSeApWihvbLJIfuf+fJ4lj0y6zEHGNoXIjiiYNxPDlMzv0NQ15P61OY5oqb0/lS1g0DjUqkhJaC8dGssZNg0tXEY+1kPnn4fqcCMHNeFyzwMMg1sYpzZ93l5Cu46l97aUUHf/NKheCpoIT5iZR9vRwANAUOuy2foekmgfXoH3Qn6uxiZqUogdhtNBkzuwtyX6lW6aiLDI5rTANKFQUKwiBDibY0GAnABqmkgw4N1UuOt56cvRB9vaG/XRZIErSSGbb6sR19AxYIQa5ZAh40+Kq/ILcZCjnAtlsu+hAwll8dc0GWi1LgOd1rQENhBAF47FCAeKtfLxOHgvmBj+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEXnb/+ohV0/796M0RP3lq6gC7UXvzrDe3sRN29DVQs=;
 b=SodYU/hpjElOJzA+RqsSPYoWkegu+ytScaOTJVKyNCRkwtodF4PcRv4AqdfGsQ+Ds/zBX4RU1R47OfdF+uRBq1sxcVRMoy3M32rK5u3oHNYgkRPLTIwUntagN/MAv5sc5u64mt59DQaoOhSdIdN5F6aSdldUzxDRxjLC/geBgI1fASXzimmjxxORk3pLomEVedtxJ2J31Cylb30h61Y71XKQcwZGj011w+e4t5x7+Pkolch7Pi+STaqRVZdZC9WpVXMxJNdMTwWkQekoXTydZe6wkoFzp//uuTfCkedgi8KT8/8Gz/nNzEbq+uQLK603Uo4jPaNPcm7U0bLOiw8wWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEXnb/+ohV0/796M0RP3lq6gC7UXvzrDe3sRN29DVQs=;
 b=HrS9oAiMzGBIPfk4iOfCzzFSQQfaJk2xHZDvqxDUl5nnVpk9jhjBUUUFBksv5HVbOKNrbNH7HQKKeVWl120WDkWx3AevpzW2PM6OF1CQrZC2fVC6SNWdZKPSPxadocNcKzGceVd8Hw3sHFyMLoAWHtquHVjNGoVValgkeYsLYfjWe135dVxfRKmmW0R6y+2Tz6jTYKIT5QrEtojPfpvvxUZ/pRb2GoJU2I+9YevRnw85VYHvqLteQmCC44xdBqCQ1tDz69QxIOzpTHtZNBfWPtQlCUYyc5VxtNg81fwMrLhrrihr7VwPFcblGYpojEhixkE+zvyNHAungIb2sJhNjg==
Received: from CH2PR07CA0055.namprd07.prod.outlook.com (2603:10b6:610:5b::29)
 by PH7PR10MB6377.namprd10.prod.outlook.com (2603:10b6:510:1a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 20:38:28 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::62) by CH2PR07CA0055.outlook.office365.com
 (2603:10b6:610:5b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 20:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 20:38:25 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 15:38:24 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 15:38:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 15:38:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658KcO4S172881;
	Mon, 8 Jun 2026 15:38:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D623E9ACF4; Mon,  8 Jun 2026 15:38:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH] meta-arago-distro: chromium: add force-h264-youtube extension
Date: Mon, 8 Jun 2026 15:38:23 -0500
Message-ID: <20260608203823.966532-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260608201827.3937832-1-t-lannynd@ti.com>
References: <20260608201827.3937832-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|PH7PR10MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 76958ce9-0f5e-41cc-4026-08dec59de3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2STxXwFBBVkDKwyx/3B0Qy2+0nESRIPBV+mp+Vu7RkPR4LDT8Ur6kMlP8kjYJlCVfKccyFDgaB6nmvsreMik2ODCqlclKjrOcmVqCzzzaqHrtpDORSNTTgpuI0e85sNKLQZMY3DGyjIUsmTkSi1lrLpmQIi0AykHIiN1/q+gV5fEJ41TsvDKVJsrvBjnbPj/6QT74JO3/F4OJA2Y4jgw2aZGwHfxstDobVERaEaNjdHF7qvoU+EkUpbgROVVp5kaMS0K6E2PIZsq0j4Drc+WrpPnbdHpuM6N4GoWcZE8W9JKd9vw00H6IfP4TusEhz8v+/m/BnDFAWxZ1RpN+4f5nfF9K6XOTnWeto2dmoehxbHg7GMRPyg6B8qCu+CqvUIRo0hza/1MUf/5Oj+vlA18twQrP08ozsoHxE9IDKYPnK5NsTxrY2z+bRXgQ8/BEAeKJFLf8UI9JzZG+0FerfO6FlK7AjAh8/IrO5P8dv9DzmqizKl6gbtLfC8FbMR5CwKaVyEeDdHHxuhNrOtC/aknVl1hL298NtpXgIajSYXxQDGUdFkGh65BrfB1599rgPGU3yfaVRiQJ3x/KZqNvbP6A/ZS8rsRetbXYAtGUMwUMYsR7703nBWSGkk9DqTjlrGFuphoBJBFRWbLu2WC64LVHizcyB5hLKQzEq8Jp9llDCah+CDTZR5F4NKXtuucGuiR1NZ/D7uibULw5XNZekikxIfPir9mfBNk3/6h0L2FOjw=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mOQcRxe3Ol8sDrrkUbNJfSEBSLg4fUSJZThDO/aLSGdQdfAQ8D/aHT/oatpc4duFzpDrNv4d4XJ2/Xvt5xOwETLlBb/EWGbH0cqnyrfEbCrYGTrQZx+G8d/SPcAVvcGVkLRCJAMSHWphu9QsQAHexEyeonrvG2aSeEssTlu37xIBUnXbZURNrkPUkH68QUOWFAFkyqVLzUY+0m+nU9LDQ7Q0pN2XtBP8inKBKq4ga/qzahPKl3hb6EGt2wAGwSL7CEyKvsEsi9NFYYhS65sUckWh08SZKV+oVUAsh2fzX5/TUSi8ix0tEgIXoHV6keJL9r1H8eIySiBxkN41iaCIlKMu6T4zSsOaJg50ErjAaBfO1anMCCKkb3lwSLXO70Ma6m1SuEtFs31MBjxW6n3eVVWR5Q0mTS//JgwSrr6aiuf2drBOvASVR30DC2PbLImg
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 20:38:25.6863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76958ce9-0f5e-41cc-4026-08dec59de3ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6377
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Jun 2026 20:38:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17554

meta-arago / na / 20260608201827.3937832-1-t-lannynd

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH] meta-arago-distro: chro=
mium: add force-h264-youtube extension
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Mon, 8 Jun 2026 15:18:27 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 439c683d573a6ca724e2ce593e0934a66=
a3baefb

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago: chromium: clean up and simplify V4L2 patch se=
ries
- Commit SHA: 30a611f56a4bd74d421e36ecddf705b956c01648

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH] meta-arago-distro: chro=
mium: add force-h264-youtube extension
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Mon, 8 Jun 2026 15:18:27 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 439c683d573a6ca724e2ce593e0934a66=
a3baefb

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago: chromium: clean up and simplify V4L2 patch se=
ries
- Commit SHA: 0e97f60a272300075fe2dcb4190873b19c32663c

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




