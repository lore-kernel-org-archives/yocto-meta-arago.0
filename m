Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8ADCF6BEE
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 05:46:42 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8927.1767764793196713028
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 21:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=xCocJ8/n;
 spf=pass (domain: list.ti.com, ip: 52.101.62.17, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2ab00g20tj5+iNfKnurNRBCKtfaH87nM6BWamC+jaMgfd6IYxMwfAomqy0zO/MTiT6EN+1c2y6tfQsJPlKYP53drmxEdeHUwt6khHdpdJ0k0D9MVsH8Skjqw5rYJr2CyKt8RPzOhHPFH/0FRCNZH2B7NQ/k3lpt9j5ChcGuepa5zZmLGwg6geSscSn1ZXg/9kT3K03mXwN3zwM9aR1fsXdBnfw9pP0pz5e66lh2lj6HO4F+uiRY37gTX/Q5f1eBITts/GZm7s2+ClbUliHKkU4bYSa2BF8HNZL8uM5XTGXC1tdiZ52Hphgv0QFw2PkfFV2jArp5HiOo88Pc5osLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59Nj/B6K0XyY0I8va6E63Il8wpO/kKapAwWe5CPC5rQ=;
 b=oMvX+5wT/3jUUHPeZtLbIkBDw5WZO75k8Bp33h5tKoix6t6N5G98Zt7uiwA+j8VnKS8SNa6khlBs5J8glfkw/aOlWPpOeulJZjjlzNujM5BYT83TfsMweNByYeEcdTarxUb6prEMYHf6ljWSfyJWhsIGVvQU57eZwYsuaz+52HjK/zAUm3pvavrMfjzHoBz0eaQ+tfk4nqZXPDFFkfVPbiw5ZMfJHTzbaN3QG7B0VPO7QTgLQ6hgVWIdbK+k8tRajbVwbBkEUlygZ5yM/SOXH8WDmt+nh+rgyxw+vjAeWAPhLZOoJcVWZBY5wozhr9WykD5h9kEM12GBHd2wPyd2bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59Nj/B6K0XyY0I8va6E63Il8wpO/kKapAwWe5CPC5rQ=;
 b=xCocJ8/nfmk3TBGYskPlIKshX1GYsRu+ohXOoTGAL/hrspbPfoYPMOUHSyzE4fP0IQv45FuWvAO/nOHqZsXfvxA3vp71JBlaQt/Mm2IFz7KoBZhOoPQ4yxDlMSaaBs7NjqQEIdVwRtSqWraIg1LsOiGGMuSb5yeqo9ep/jqEipPEQiBs+U249rd5jUXZ0sQFkpMIs9025aZUZ6dM/2c3nj899sWwGV/PgC79Hyh+kas1Rq4kPSczLyrgnd5T3gMIaGhqfBt8f2Hcu1pc30oFY+GdaozrTpiJo8gHR5acossdLFMwri8CEPwsszRHABFqWmJ23CUqwEIhrym3ve7ctA==
Received: from BN9PR03CA0629.namprd03.prod.outlook.com (2603:10b6:408:106::34)
 by CY5PR10MB6023.namprd10.prod.outlook.com (2603:10b6:930:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 05:46:30 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::96) by BN9PR03CA0629.outlook.office365.com
 (2603:10b6:408:106::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 05:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 05:46:30 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 23:46:28 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 23:46:28 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 23:46:28 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6075kSCG3656673;
	Tue, 6 Jan 2026 23:46:28 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 999CA9ACF4; Tue,  6 Jan 2026 23:46:28 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Anurag Dutta <a-dutta@ti.com>
CC: <reatmon@ti.com>, <gehariprasath@ti.com>, <a-limaye@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] meta-arago-test: recipes-core: Add udev rules for MCAN to meta-arago-test
Date: Tue, 6 Jan 2026 23:46:28 -0600
Message-ID: <20260107054628.3896566-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260107052154.1598698-1-a-dutta@ti.com>
References: <20260107052154.1598698-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|CY5PR10MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: af79ade6-11e0-4b58-3613-08de4db01b83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VteF4MWOMJkrmC4Cs31eIsljfIY5Y/z5LC+Fc8Pg5ESAWyzTvUcZnuWG8Zcm?=
 =?us-ascii?Q?vTGomDhfblbz3qEbnueOQvVzgj4c4uTx9g97SprcQPr9SNuyTlA4KIoxjlrZ?=
 =?us-ascii?Q?VgJPaVUQGwPOgSyMmwiXkkoHf9QlQF3BKz4BMbtIgH4V0qLkAey4EsJY9dZ9?=
 =?us-ascii?Q?9hDTIB1ALUS0LzRgvEGk17EJwf1XPjIaMrzNtER5tfyUxLDnVlX9kzj94IiY?=
 =?us-ascii?Q?Wty5oMn7vsS4fV3tjQiM383A81289n8CzB+qN09DNk2vxVYSkSbSmuXbawLT?=
 =?us-ascii?Q?ZOqY2xbPfjlNYdRjdpSM44gLfrFNz4yf/x95smd74k4eDKK4YdwPxXLhblSA?=
 =?us-ascii?Q?78cVBUWNhioiAqb/xYzNtV/DzM5npBrtOLf3jD1WMQghC/gTvZbcPlhEFOFe?=
 =?us-ascii?Q?+rbW5Xr0FKUL9rFogTsjQ8mG92gr/M5fgvG1fa8+zCbr25GJJgEKtOxpcSM5?=
 =?us-ascii?Q?MM5Zr6iFmKAmZxF7soTQ55gjxHtkv/Q/0Yj8adKFgFz+whCMHZ6cBTATTzHG?=
 =?us-ascii?Q?IXm5kEhofMQtbqHCtoXQLpfsHPw+r4v0hUD0M6qAnIv3JW6UYlU44VQscCx1?=
 =?us-ascii?Q?FaNMTzBq3WvXCPtBrdkR1t3X8Dh/R/mjPg5nDqz3kZrcCtByFAU8QGFJSXuk?=
 =?us-ascii?Q?qa4mRYViS7/cNMrKUGSNuWIAhIrAOzajzSTWBVp8d7Dt3xNsvVGbt6+wYD1I?=
 =?us-ascii?Q?DSZuw/dE7K1JqE2Ht8yCuQwRsjjUbfMA58+QvMU/hdObuOhWXh8WLwhqQVsN?=
 =?us-ascii?Q?5/4okH6x4WcU+zTNT39VpW9Hcbw7qPKhxWQA6wNyCMbwCDZ+8Wc3qQDT+W63?=
 =?us-ascii?Q?SVmIdgtsixBoAhOnSxbJ81RjhBVvrKfnwX4NBARrFc96NEAEweOkTNjrLFbB?=
 =?us-ascii?Q?AuUJ/Z478TXLE/6BjemJCSm0myCc5sTSlfxEvWDW/e1Vp71ZdgomxwaduwxC?=
 =?us-ascii?Q?74ST7oMUTLJj+CcqSJQAtSdT5+Sj/1+4lxJW8Wc7kCKmbOdslSX+bnetAZni?=
 =?us-ascii?Q?2BHGNp1EBCjWwVFOQMNMGl2j7qQU0R0VReSfbq/9nFiTsjsq1NGdLIdf5KFz?=
 =?us-ascii?Q?M3fg5vTF/+vCKqOA8153tqk3aZzJThLbUlpQxJYpW5vJFBOcFTu6takRR+v5?=
 =?us-ascii?Q?byOk7v/JH9DE6AFys6jZ4bIpliAorqmDP+KOG4ubwfZI0Keq4n4iOxINXshl?=
 =?us-ascii?Q?1hSAJP73eKde64mtZDww5DLBvsXJ9pbgEpLgRhRfCgTnuVu/nsM7q3F/hTVx?=
 =?us-ascii?Q?ZtsTP5Tm8cB/3NES9l8LAgZY9720I6Lbwd3QTYmqwx7mc29OVvHy+RX72NVC?=
 =?us-ascii?Q?7b4qjTDSlz4hAPVJuALmchXnOxusWy4WHfmkFXD1obkt2kW7oDhClWudj32z?=
 =?us-ascii?Q?+WlOHNH+7xk0OxKHn3LPFQCMFQ4wa/BJs7qCVlxSpw9Ll9nWd6PJ8DOEUxO4?=
 =?us-ascii?Q?yJBTldgLHe0Ks+Df4PEhkWDbt/ePWweZFM0wtb4qeYFj7AJG+okfofrWaVRO?=
 =?us-ascii?Q?0kaZAjTLKFTndwsMFJ/Nz2Vt40+RlZSMO8TelCY16K6EM2PY4cL6XXAFPF2i?=
 =?us-ascii?Q?m0eXxzHuWLRt+/n0pkg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 05:46:30.3812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af79ade6-11e0-4b58-3613-08de4db01b83
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6023
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jan 2026 05:46:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16936

meta-arago / na / 20260107052154.1598698-1-a-dutta

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
WARN - [meta-arago][master][PATCH v2] meta-arago-test: recipes-core: Add ud=
ev rules for MCAN to meta-arago-test
    WARN: Commit message does not include file/recipe name: meta-arago-test=
: recipes-core: Add udev rules for MCAN to meta-arago-test. (COMMIT-MESSAGE=
-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-test: recipes-core: Add udev rules for MCAN to meta-arago-test.
              meta-arago-test
              recipes-core (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH v2] meta-arago-test: recipes-cor=
e: Add udev rules for MCAN to meta-arago-test
- Submitter: From: Anurag Dutta <a-dutta@ti.com>
- Date: Date: Wed, 7 Jan 2026 10:51:54 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d8dc6a7e3484ef941a32505b838788839=
186b8dc

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

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




