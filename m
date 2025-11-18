Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A54CED25D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:35:59 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8721.1763458556600603984
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 01:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=iBqrT2Ok;
 spf=pass (domain: list.ti.com, ip: 40.93.194.25, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqwATMNitXMJw4IaVg9sUmnA4+18xyqbNq6ll2e5cq5f0LWppqzDKGh7nqtkcrOiEO3BcIxiBJlBCdWd/AM1oNaX7ANpFUx6Ga33pPxZFmphnEaI5i5CLYHVmkOTB5JvOGxBE+ldKc56fY4v0vQD1OwnrPw4ZPY8CT4VC+VYUzBFQZWNkSqyvd1cU0Yv5/udC0gjioxKGHHVOApjdfDkvTb/8S/aizpuxtK/umhtiDxb3E0G5RthK6Ty0LvZ1cGgy4HRWrz5K675/Nl95eNxKcvZ43/uiFLtZPyGkv8ArtntqtdZGvfU+su9vzwoUcDU52IUBIQXMoqaS1eZ8WR+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBOqMB+J3mdNgbFvtC5h3pKPuoRQtFJRWgt8YfE8Jz4=;
 b=KnTFCpOKfqXiLdXG7FkqaYteNEzLo46Q1bAKVuuJ/P35YFl8ZCSreASqKH3UKpvKWC6Nju5zv3y3V1OXwpDfsCjB5P9HzqvRpCCT2LwLniXTDyrcglF7NGTGSm/HWP2MIesPm+l3g6BI1/h2VzpM4ssdhMFL/dZ9jFCKOYnQiVor/gzC9e44nXwOlR2Cb6hb3RLgiEVBv6tpKiUHRfPkH5wgmzxt9GNNNJ5+W0V54s6ozSKPRILxR1BYoVbXzx2IBAv96JtwIszUO3notJw0yB8+XzgShxeYqLXF1K58Oe1ppji8IuHfChlhTN1qUuPngwMRp3h3ySUWTwyptkn77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBOqMB+J3mdNgbFvtC5h3pKPuoRQtFJRWgt8YfE8Jz4=;
 b=iBqrT2OkKEnLfGdNHFhFGe629o48vp/WO3V+wcwvyCzGi484Mur+6c/tNRGOip6B4xdwGtJapelqbTvifGTT9bVPhkWfeJIMNScgtPTs+NVto+tQaKEGV2nbQXBmHeUOwHCwPwniWLiJzdu8j9+oX6DREbJ8RjaMRMlyv1tx76q6L5VbjtC0hlQs1kAGAinvE62ap+pnDPzbVPiVNZfXjgzsq831+5Fpn3tQRxSFqtew8tQe3NZ/MJw5dzUYf804YFk5cyF9R9B/UxsFrHZqf1Z8nH5GGgjWQjr3U7PY24TOGCijWjvItmGdDpt2PESLOBCdW8p2NEgDdqPO8Rb2RA==
Received: from BY3PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:39a::7)
 by CY8PR10MB7170.namprd10.prod.outlook.com (2603:10b6:930:74::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 18 Nov
 2025 09:35:53 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::9e) by BY3PR03CA0002.outlook.office365.com
 (2603:10b6:a03:39a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 09:35:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 09:35:53 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:35:47 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:35:47 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 03:35:47 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AI9Zlpb461825;
	Tue, 18 Nov 2025 03:35:47 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 58117142E29; Tue, 18 Nov 2025 03:35:47 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202511180100
Date: Tue, 18 Nov 2025 03:35:47 -0600
Message-ID: <20251118093547.5846-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251118091328.3260958-1-lcpdbld@list.ti.com>
References: <20251118091328.3260958-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|CY8PR10MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 29414ce2-e7cc-4a82-17f5-08de2685de33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hjzV0yBfXq2urD2H3zf04/Ia18Nv7S82sp10c7EIPDrwcyStcSU9AzViRnMK?=
 =?us-ascii?Q?wrDvu5QJKcgXUjayFXLQ2/NB/3n4OLj3A097zG5mf/4qf62+qnwg2bF71Wdi?=
 =?us-ascii?Q?CyomxejoLK5BB5hZeFcj5eXDnFJ2ISKqp9IQwqt2hxnUg7vYGQs+GEgjq3ZS?=
 =?us-ascii?Q?oBB4z/nEv1jwRYAqfzbXZaIexiQDFt9bKvXLthAKV9709xZXp7pq3bAoM6iw?=
 =?us-ascii?Q?bdYsTD4LGFVfwy/wtcZXD12RvPnUgYE/xuMRm6H0RX+Y3sDCCDy0CpBU1to6?=
 =?us-ascii?Q?7fvW3GOIAgb+oWVT4tCtj7vfPImIv3YjvWcUT4onxp2SZ6p+YpGDPlznBfg9?=
 =?us-ascii?Q?SJpVq4WwFm97cZy4YTH2GZwKeX2QeYeR3P5e8hOkE5DsLZg1a4bfiLmfF5jd?=
 =?us-ascii?Q?/wsC3yftE1vGkMnN2l+7IheLJLg02m5Y/LR0CbOawQW3Npss6zlmhrVB4Oe9?=
 =?us-ascii?Q?Gwor79BXEW5utFqcH28Zr+JjKzpDGrqN/044h5jt85WaBvFp9gpzr3/+GNa+?=
 =?us-ascii?Q?R+098HWRQ8ARUuUjljYC8Uiab+eOFIT2qdil44xez++4HgoDe98G4WMUK+5f?=
 =?us-ascii?Q?KVf0FKuLEtL5nk2VqdZHsCWbGvw9l2vYXl4kURlq3d5hswi9F+LRx2H+efqP?=
 =?us-ascii?Q?d5xychUwECud6sx0lqx3lgORBWnsUV5g2gme+5RjRXrpnCkxJCjMh/+wIqLF?=
 =?us-ascii?Q?p/bDtJBrgaQqy/TJb3PiQeBW2KxksZivupUQXLhSO1e0sSEWgZSi8A43PRIY?=
 =?us-ascii?Q?5rD9qzOnzCt0QEI14EYkd5b2qOgGoT/CP79rpzoPqgQwWUyUYBfhmwoAuVOl?=
 =?us-ascii?Q?w1ND6ExhwXUIsrvxqtlOP0MLeASV3n9Q8tuPmYMcoFvuCfUCobGdSnH826++?=
 =?us-ascii?Q?7kSi+FvwRkrxbxHrxF0wfWwUyTm+5qEs4wtVeH6n3nYFxq2rI4G8GOeMounY?=
 =?us-ascii?Q?EeIxUjyySUNstVcFOzVBxhoPSxlF5/NQqV9pXPP8BvaVGnYvyf5b6rP1Q7Nl?=
 =?us-ascii?Q?AX8IzqD2+r/ZnzH/vgu76EDn16dfMlzKgMPnEV9TqbbGrCX6P7JC7nROPtjV?=
 =?us-ascii?Q?CmFNfuG0W0mbV/V5EPuxwpQudTi4UIOfgUkDjvvdUF4zVpDiJhCX906awglc?=
 =?us-ascii?Q?DKrrDFIM9AiEjoAQtWuEW6YQspLKGrB0xoyWgYVn87UfZl/+JIlT/j1Guy7L?=
 =?us-ascii?Q?k9b6OQyVoRSN0jSLTG+SbF3D/1IIMp3bSbcoJotLah++OpcjmddtUN0Ky20y?=
 =?us-ascii?Q?LMytWeXuhbBVg8z+xrPoLXQV15Ar6R/3c8iTmTQpJ9TPodCkfBpCYwZ3UmNo?=
 =?us-ascii?Q?dbCi3sQkTEZY6CeBbhIcHChKIaxgN5wbd/0tZWWfstJQJY/EGG9JUFqEZxNo?=
 =?us-ascii?Q?917Daw3NfmRN0yV5590UyV42SH5zWQ66rtlsQ9lmEfQ+QO74cjLvOa/A1Es4?=
 =?us-ascii?Q?KTmSWYfi559BWVF0/jLUw033id9WtGefQRzW2qDTIaFJ7y0k6Yf9TNkL4Pfk?=
 =?us-ascii?Q?kA1S7U7MI8l+xXBp+KOpahqhQlmsFfhvTZY/9JeQqP34lQkPcmnLei3Hpsi0?=
 =?us-ascii?Q?YBuPmEkJpuBd0e53ttc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 09:35:53.2275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29414ce2-e7cc-4a82-17f5-08de2685de33
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7170
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Nov 2025 09:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16783

meta-arago / na / 20251118091328.3260958-1-lcpdbld

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
WARN - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202511180=
100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.master.202511180100. (COMMIT-MESSAGE-2)
        patch



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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.=
202511180100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 18 Nov 2025 03:13:28 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: dc9462b103ea230eb609dd5db14c157bc=
e26c52d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: libdrm: remove any rogue specific overrides
- Commit SHA: 29882c889b016c47cdcf6ff53dd8dc373f2a8ea5

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




