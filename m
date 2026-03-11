Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513F81062893
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:45:24 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20073.1773233115279235388
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 05:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=C6Qu5Kyq;
 spf=pass (domain: list.ti.com, ip: 52.101.53.67, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXTJ68xxfQr4cNRAQspR8c43Iwzm43nYVjyk2cdZ5j7yavTrWUg5bTqlHpXTAmrFybi7uhuVzOz+awosgKfWRt1B0kJ1ByiBQpXMYW9SXRvaT11Gf6ZPqtlIblyXInnu1uQSDh930MZMVQKqCuflbzTwsocxY2djySHrH0Yv7zIr1yYcjmYQR1/sD5wQ5N7c8SnNXSFKKN+dWUu8w4XwJnJrfI/3JeGiwbfu+zvt/NMJAZrSD8nxdpU1/ynfTQiUp/FQAh8MSqeoqrE3Y2GYRovXqhjqsu+19fEIEtsOzpL3hYmlof9m9dEDXvwVPvdX7X50djFX2azOT8U2aMop4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36/VyzzpXqpiJ+yQsShxCS+WdYpofkKJYftn1hnEWxw=;
 b=fJVNvazbgNkTbjsLvbk9rf4ntQNIK+DrYKoIq81b/ufwSwFb4QXHpPUw2761io8Ym3vxJ0zEQL/pDPnkHDWJD8S7uq9e3Cz9JTVpacuc1jpkcEAylgnHza/nxG3gfwoowowW4VEJ8EZHIs8UzB5SEiPMLi5KySgYj9DcsjhBgrxgefoT7HJwwqvi7ngo7hwKud78WGKP6GF9MhnYLs1juap5OJvKXM+i6s91CKOwDkXlUwu77jrUvGnK5KbfM0fIU+HMR/Oa6cmM3voCR03DO8K6XEcA9L7e6EJptvz0SBrrEri9sY82dQdzSV1Q1TL2rib8lTepp3NLoVU0xp3Jvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36/VyzzpXqpiJ+yQsShxCS+WdYpofkKJYftn1hnEWxw=;
 b=C6Qu5KyqduyoXCL1vDbwWMK1zK7hufiFfl8b1/G1hbklHY7CLrfx1Ty0eXFNn65rd7s9HF/MwKguXw69+Y9zOtZPN1rdXL3ukclxV06e0RiPRpzSjtUCl2PGZfJw9ECoRlGBbw78S2BkW6fq68FbUxKNcBkai5hdn3Ii3cUw4ppjwP51FOrCJA1ocxtlOsrqGK50exveqwWIrykxLPEfDZ8Ze2jMP27B0cHKuANvBbS4kIuBpHd/mBkcxbktytNcJfkGN3yP3v0DCPsP+JkCaP5LJcc/BAtIJv8EF0+caOPPNkfRwCgXtKj+AFe3AU8f+JsQ+rbjvrNtbKZ5tKnBag==
Received: from SN7PR04CA0154.namprd04.prod.outlook.com (2603:10b6:806:125::9)
 by CO1PR10MB4404.namprd10.prod.outlook.com (2603:10b6:303:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 12:45:00 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::7) by SN7PR04CA0154.outlook.office365.com
 (2603:10b6:806:125::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 12:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:44:59 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 07:44:59 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 07:44:59 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 07:44:59 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BCixqr318738;
	Wed, 11 Mar 2026 07:44:59 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 387C79ACF4; Wed, 11 Mar 2026 07:44:59 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <prudhvi@ti.com>,
	<reatmon@ti.com>
Subject: Re: [master][PATCH] packagegroup-arago-standalone-sdk-target: add libatomic
Date: Wed, 11 Mar 2026 07:44:59 -0500
Message-ID: <20260311124459.224768-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260311122202.162775-1-y-hegde@ti.com>
References: <20260311122202.162775-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|CO1PR10MB4404:EE_
X-MS-Office365-Filtering-Correlation-Id: 427910b7-0d93-4240-b3c6-08de7f6c01fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	uNuEVFH5IuvmgGNkh2d8MQ1mtwei4q+IPw+p4YDK87NkjXitby9jXPYXGWf6gD3YZ7IF2OLkvn2n3AsMw+3uen3srwh7OCZXcyOLwfIzN1WjdMSuwH9qjZ0VIPXH4knx7KWH+AnQe5fOyn6ENtaIa27ir0wIEdAhapAadvAHyONvK/5ibPXrOPrvMoDiJCGywJoSL9I1Ua4nylLmedl43AGM1xstrwcAk2bOwhC990SxuoRoyscHi4e5ZKTMfUalGjNpvaUTdH4A8hxtarXmrhqbsK9x6tQDBC3Jv5IJo1ZheJ+wSKoBsCQW+QMCryoeCJv5TNnPUKctfiByRLhk+JA13utIl2erhYwVXES/U06aHBf/RgQbxwTohuU9bKqjrvUkSW43YPpeQImm1kUf0RxEVkowYCzj9NhnBZNC3taUAFah4/rMY5lNqReQ5AdM3Ei3RKw+wawnD50taauSTinxEo/E9cJi4bvQo/qmUt9SryAupnmydOOwVUdXBIqGPfgv68f8Ycw3SPwGcZzFxmnjE0LTxdbh4zwA0nvfm2xnZAQEn11FR0Sz9aylAG2c0GQ//cYF1bMxJosKQxutNX2CP85dkXaq/S+c7zEZ+6qMlJpvH+aT/xW1XaMm+Bt0HXADHLLgZ8KHmtO0J53FNP/QjjYs5eIycQIkAYlHBBcaEbgj7CmAHcCUymK0ESyg+Uy3yvfuXm9nVm3gIf7OM39Zxy5nrxuW+55AJ7SrXrffOHk6pVvjfeL4LxTtvxrgsUCGKGPpKsP5QjrsPgMMyg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HOwQrtlEnaJ6+GsoswteF1XDR1klM4R/qBfZkqClwrUSxvTcqxjaZHcjlplP1O2tuP+y36V0kZvdkh+Of1EKsfLu0gBXBVTNMcHT2I0ZJw4R8ivAvMLEgRZ1N0EwHbuuriZVqIMWN7+9GEIFkilm1QDkq8dMlDWRv/j+SU/mCKD6M13M+gxL6P9Tkchgw/ugOWKc5r3ZmrPaw6XqA9Z7Ec/mx4dDqkRN3Q8RC+W4ZnnU3O3DCc11DuZPYCJqKRu20RBUAd2ythpkqNv1EueAqKf8Fo3DwDXjcNRD1FvmeC091pMif+fbBPM6o0B/dJxxfjMqGV5rrc4SG//1J8GzKf7FpI8BuwEZgbFoZlBEuwwTQC1+JMJU2oBVYgVw6OdlQKkvFi9Tb46uGzszPao/r+ImMqbg+XoUysH4cfyJGxz8oqv2vzj703uJ7LSDwVkp
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:44:59.9004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 427910b7-0d93-4240-b3c6-08de7f6c01fb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4404
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 12:45:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17310

meta-arago / na / 20260311122202.162775-1-y-hegde

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
- Patch Series: [master][PATCH] packagegroup-arago-standalone-sdk-target: a=
dd libatomic
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Wed, 11 Mar 2026 17:52:02 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bcf6f5dbbbede8ae7de2d67c25dfc8723=
b1ec056

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: bf13de211888bc29ca4b2882630cb6c0135cdc8d

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
ERROR: Nothing RPROVIDES 'weston-examples' (but <build-dir>/sources/meta-ar=
ago/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphic=
s.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
ERROR: <build-dir>/sources/meta-virtualization/recipes-containers/container=
-registry/container-registry-populate.bb: QA Issue: task do_populate_regist=
ry has network enabled
ERROR: <build-dir>/sources/meta-virtualization/recipes-extended/xen-guest-b=
undles/alpine-xen-guest-bundle_3.23.bb: QA Issue: Package alpine-xen-guest-=
bundle is skipping required QA tests. [installed-vs-shipped]
ERROR: <build-dir>/sources/meta-virtualization/recipes-extended/xen-guest-b=
undles/alpine-xen-guest-bundle_3.23.bb: Fatal QA errors were found, failing=
 task.
ERROR: <build-dir>/sources/meta-virtualization/recipes-extended/xen-guest-b=
undles/example-xen-guest-bundle_1.0.bb: QA Issue: Package example-xen-guest=
-bundle is skipping required QA tests. [installed-vs-shipped]
ERROR: <build-dir>/sources/meta-virtualization/recipes-extended/xen-guest-b=
undles/example-xen-guest-bundle_1.0.bb: Fatal QA errors were found, failing=
 task.




