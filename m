Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED0AD7879F
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 17:38:21 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22229.1766165897545899071
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 09:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eP7UdggH;
 spf=pass (domain: list.ti.com, ip: 40.107.200.30, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q36QOW8vWx2/hPt7G1X7ekrehkJ8hvr+MPT2FBSC0odu4tnhksglSnhqQVK4H7CcUC6XUSTA7zul6jF4rONCqSLtrOZXJDhJqhbtNUNskkp2P9w/uGNjGLl2+Q0c9h+BwMfxk8BQSRxkGquYDfaGVi4VbLbSqF3w9KEVVUcltaXaDp0ZVT+UoOG+AVYAIhzwFJAPws9ZI1VF0fuunpRe3cnSouy6ynjzhmftNiUsTfCngg2bfPt3F6fyTo1RRdtjkRGMI5C2V5iSDLi1lGrwHU2YbDFYp6AA2ccnZCGmxxPj6RKITg2+7ZqmB0HwKgI/TSvHiECVq1f8muuwHcPmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5Mrj2oMeH+lJ4H6qyGm7YygbbRIc8xL/+W1v0IHRNo=;
 b=H30OklFLvFEtC3NtXFZYG0lwgM6DcwQbkVQPBUxiq545D5UrNd1DBsVIpnZ8r/7e40fwh68LTtk1DJqKEkaFrlE3NCOxI4++p53c3bRK4/+0w/CXgd2d76rwmHK6cVxt9B5r1rAIHbRztYwX4vXWIapa2iXABtkkj9WFgs4HzO4HvQgY0/Bfrax21lrsLK2iTextwyxT9XSihwN9aru1a8jvyPQnuQlH9vUb7Llsqc7uB7JovfxD1TsY9vsVIqrQAMxIBCbDzFm5AxPCQkIYpUh/611wa8A0KHGfDAs/U1XfH9MyqdA6tnXetIXwCPp1LE692uBplqaEsnCbWYw8DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5Mrj2oMeH+lJ4H6qyGm7YygbbRIc8xL/+W1v0IHRNo=;
 b=eP7UdggHe/r4JgSnfaW837g7S9+223KN+0rExhBmkO6i2yrfKs768xv42vURGUPrsMsPEYIdaBJVyFz4/vKjL75NzwtJ/CQdU3ltSyBD6joj9yDgqPI5kNvd4bG8VnlhpzYffWyZNC+Y0T59ZWR5d64KRNg/5kpQQAitmp8Kw5XO1DVDTRA53zcbNqC9htSYo+sUg38VallZdnmUT74YGHkYN6AsFD5peK3EtJO0jyLUVSUY4RxBfmuHA/ZWmGkQ9Iqa9U4jremnvH1nXMfoUjmCkNyqPep2mSn0+oNykEZsSR2IimtmQHWm9yv098BQ+Ur8UJ5/N1v7PUivfWqcjQ==
Received: from BN0PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:e4::12)
 by IA3PR10MB8187.namprd10.prod.outlook.com (2603:10b6:208:506::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 17:38:12 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::77) by BN0PR02CA0007.outlook.office365.com
 (2603:10b6:408:e4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 17:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Fri, 19 Dec 2025 17:38:11 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 11:38:11 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 11:38:10 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 11:38:10 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJHcAqX2330433;
	Fri, 19 Dec 2025 11:38:10 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BD4F49ACF4; Fri, 19 Dec 2025 11:38:10 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] FIXME: systemd: Remove new OSC prompt feature
Date: Fri, 19 Dec 2025 11:38:10 -0600
Message-ID: <20251219173810.3158404-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251219172103.363206-1-reatmon@ti.com>
References: <20251219172103.363206-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|IA3PR10MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 9423dba8-55cc-409a-22bb-08de3f2561d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QCOI+PJEpPEITxJxrH9+g3PiHFtpd68MPsGpvxp0eGNmkWqFXS2bIsqtkogo?=
 =?us-ascii?Q?yRMPSPjTNT5+dADT/WG87vWvgFdhoLYwJ2Zs4Zc/cAUN87idsawjPMnnlM+q?=
 =?us-ascii?Q?1Rxiq9sEl/fGm9Bg5072kZV1ar6OPCZ901D8GVdqJzJGDmbQ9DZUVrQh1hC1?=
 =?us-ascii?Q?aeihzZGZ8rzlqv89kMaxdzMs8Gv4L0GaQmW2LbO4wxO93IQlFD2wxvZJxT6A?=
 =?us-ascii?Q?l6iFtNZY3S6vl0tw5gznSR3m7uqr+yn0HSLNFe0tR+bHM5BqoG0Al8SzyP5r?=
 =?us-ascii?Q?ttoNCwRT4mr/nAfUuGrf+HbcszpvMLApv/l34al56a3mErkFNqBBBUyaAQdv?=
 =?us-ascii?Q?e/4ry4w0/zzDSyMY/hUjOOmjkefLFw1dCPwaNzfbcLwspMnAnnIe2CzqUN6S?=
 =?us-ascii?Q?ntmFeuUgRrA1mllJ+hXncRrqhJy53TTXCCVMCW6Wp8CKQbVGdseq1uadtFpT?=
 =?us-ascii?Q?+Np/tSlUSzW1iyb4H8inDzt7ov07ylv6qWj8i9e9d3+NmI/S+CYNn2md8VMi?=
 =?us-ascii?Q?jVXyQdsgzk1PhW73CGxW/hMXcJm2Jjs+716KNOl67KvG1P7PGVlxcxU2MpMQ?=
 =?us-ascii?Q?VPnHqEptSvjp+cdsNhlXkOdVcaRHgCMIKDOhRzdMBQwDNYHGrua8jd6rMwL7?=
 =?us-ascii?Q?jxihgSJ7bYuUYatCd75po67R6IuOrnpusjYtm5UgPrVkvaCVABR+/CEvqrE2?=
 =?us-ascii?Q?+thNYSBjXIXdYnYB3qg/VtSE7BePRAOO2wysf+tvU4atLTFLhO5O4UvuEZXG?=
 =?us-ascii?Q?WdHi/y0CNd72Py++nP7q7YFa7MR+16vWZYnYItEk+pwlzR3t2xZaPFCCX2QF?=
 =?us-ascii?Q?s8Tmx2WlW0PrcOwk9OLvYqia8udE/+2iwwCURYI93sIQPiDSjuH6j6wHMGMK?=
 =?us-ascii?Q?eqvfy+GyAiLh4hD9JM2eRUnNM0rl7s8CuYb6FJsNV+6ZibTcZIAWQtBWJtxc?=
 =?us-ascii?Q?bgqn+PVtF35Oa0yiYxebyrgIvJ/8jD7fE2i6A0GwpZqoNyXT8nx4Fh2LmPO8?=
 =?us-ascii?Q?dX3oQwPopsXQ5kXJJKz5ZTLe5G+fVIaoTOKD45BRC5mPfxdFmEqcrAT95k8J?=
 =?us-ascii?Q?YnknuqhuVO324BgYQyM1f4P0Acv5w5PC8vsT4c+LOEANVOLYVG6OOzqEwGEO?=
 =?us-ascii?Q?l5mrVMeQ14TJ48letM9H1oDV9hchOs+xS5PSN1qvDPHtXb0mJd/y1gCCTfp/?=
 =?us-ascii?Q?k0Fc3hDtbMoLHR1U5SWRdyI8Rz7MGAhUbaLlob+5Q96JvDclYkTBZi3ZUOZ2?=
 =?us-ascii?Q?D2wHxxw1ZaR4oEVBxC8fzMI8Zd+Oc+XL1TZUjjsgQq9c6SJgHkzN6Ckzjmwa?=
 =?us-ascii?Q?7b4oD1f0maXeTWMld8l+p2RJ2PJWzbQac159HRaFWJTokmu99FPMMMS4CeKl?=
 =?us-ascii?Q?IPNAdwSEAswzOkw1h6jc5bQStbezpDmlA/j31YXaThHc83Eb2Meam9F3ajt5?=
 =?us-ascii?Q?Pt9E4lBWpcVyJHIfG4paCS8ErgUvfrgsibZa3050dUDAKOyzrZUCBP6zKyVb?=
 =?us-ascii?Q?QqEh9yiq1B0BiM3lP7+PQ+XdkR6RR4S9dglrMvU2ZzOV+9+A9AcFeMdPXwM5?=
 =?us-ascii?Q?VlOz+mVF4SLL52H2MXA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 17:38:11.9725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9423dba8-55cc-409a-22bb-08de3f2561d6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8187
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Dec 2025 17:38:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16900

meta-arago / na / 20251219172103.363206-1-reatmon

PRC Results: FAIL

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
- Patch Series: [meta-arago][master][PATCH] FIXME: systemd: Remove new OSC =
prompt feature
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 19 Dec 2025 11:21:03 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ca3d9ca76798db687bcf5df95b606810e=
7f17c1b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512040100
- Commit SHA: 410e1081aaedc1c525825851a9df7748b49cb659

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'libxml2-python' (but <build-dir>/sources/meta-vir=
tualization/recipes-extended/virt-manager/virt-manager_git.bb RDEPENDS on o=
r otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




