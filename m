Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDEDFEDA1B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:43:43 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85326.1773776612983210382
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 12:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=nUwHJrbb;
 spf=pass (domain: list.ti.com, ip: 40.93.195.7, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaG8/8FfB06vKmq9gUNmyT1Zx3A89hlzxnXpLN2Rh5HT1PoneEbjDyNWgPjn+TcUodCHuVCroC6pTvy5xUF3O7ArjyXmHkHshcQ98qSDbeHgwmIecxii7ibKPk2XRPpfupDog0S9hI1gMZK4gaw+Mp5mEoj7+lKaUZ33PgBA1ZP4vBYPewArp87VA3KrMzgFv3KTIiMhUvyPDYyu0YOAwJLB6+bVWB5ZRpCxVWeWtc684qVTz8MYKygKIVoLoVax/TXwEYzzj22FkFZ0syrCRxXR/Qnr19lhm+0YSo1cGZ3Opgb4v2EiGiniApT3p5woGsfnOQS9SjT8mkLuUBUybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdbCAzGR3Zdt0mBkLpX22lQFpIZhUgHrG6IRgmRuC8k=;
 b=rbV7KtyQpRvOoDJMHtUdkyQG0bUeg/0wwyJ+VFxFKJu8bqox/LmvAiIEMAd+uhxC6Eq8QhUWFwJn6WZ7x2UEERF0HssqcjDGHIQml9JrY8Fu0JV5qgYUeUStawGHi1+ObhsdIaq5+4GVD/vD8s1QJ1cHOMy1gcR/0PiscRSrphAzGcMLlTcl34lrqCN7RGsMXExISRhbhZNt4kjf1biZ9pjNEnRdhPqPuFJmJSfVTIuRdeveDGn2c8NAAzpKGnm3ejpYn0jQdETkbY8TJfYDgYK/ukuCi2aveXi3VLiEnXO2hsFvE36BQNT4IO1fUuj+st2unLhHv0IKbzpfc6TPeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdbCAzGR3Zdt0mBkLpX22lQFpIZhUgHrG6IRgmRuC8k=;
 b=nUwHJrbblP6k1TAg9gmoj70GwZarCK/oIT2G6Bq9x4jrXD/d/ZjNZmS1KDQLthGsvhP2Ch951n5brWpqfOZgD/eHCPT60WpJOHNVzzIKfMKs9G2V8CvMoT1ooWLkqrNT1YNCkMbyrlmpxWSYhiPtssdxuEG4qpvyxB+5JgBQkS6TqQrG64pW7lduzb4Zzh/KVOkF4m2Uj/UkZ6qZ3f/wre2W4qOSRFQNnvFv5lFgto7GqMI5DxtbRW7lDEz0Ua7uOE9uwkgD/rhhFeSduAhnK4DxSWE5/gEvgA3v3LX+JHGtb3XKm2CfskjeWgvZmYWA/igTKD0oZntDsodo3ElBug==
Received: from PH7P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::34)
 by MW4PR10MB6581.namprd10.prod.outlook.com (2603:10b6:303:22a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 19:43:30 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::d1) by PH7P223CA0003.outlook.office365.com
 (2603:10b6:510:338::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 19:43:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 19:43:30 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:43:29 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:43:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 14:43:29 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HJhTuY3257895;
	Tue, 17 Mar 2026 14:43:29 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 79B829ACF4; Tue, 17 Mar 2026 14:43:29 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
	<b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH] chromium: Add a patch to fix build against GLIBC 2.43
Date: Tue, 17 Mar 2026 14:43:29 -0500
Message-ID: <20260317194329.2905321-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317193808.343457-1-t-lannynd@ti.com>
References: <20260317193808.343457-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|MW4PR10MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 5060aa3a-9a32-4d3c-2f91-08de845d7758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	CayxIbYJyBoeSNghLhwAltd06lWJAFrW4qG21di9akYZXhCa8yCWlwQMcjQauuYELAMFqr0xxRvIh2UpeVglDHZcPXP27PCK7La2edc5Atchpp3ZQgLfx/L7e8n8Y6FJsXK9Ou327OYXhE1yHRcBx9u5J0nrwaNIioTJJ9zwnf5BC6zEtafs+T8Fnk3bR6Pd3s6+O8nP9vxIrkru2T1MGSVXKEMVranz35eNxhIMReSHG7rN4I+ORYKoUWVM+H9Q0tbK93VTtT1YhobaH2ox9E7VCpsSDQkYWWjwzMf43bX+4B+4qjyKjW/F5EVBYs91feTMN4YBEsiq8zq3fNN+4kNipxB9WI/IRsESqzn+PR2klDzQxjI4CljyaLfmkAJmk+O71xFgBcCaWtO5Sj0tWc+7Wq2AplUMlznyQtrLmiH9OwUbuYEO1IWlwzlIaHNoveQ9T6Uoeh2sYq8K1HeVIVN3xHnyouGoCGuw9dI+0f7CdWK+CH7bRhattvDfg1wf2UklB5zxHM3WUSRqU3y0pf5XMMh5kW8IwL+ulhyId1i+ZLHt9fpczy6N57WVimOM/m+dB43cbrSnzyomLZgb4n58543hJv4wb3Db/rpwdVvo7JHbBCYJ4QvJh64T99LTKkxtZSfhaALcUPJmjxuGKqCGzrgIvyMZT7lXG6ybHlp7VeobW3PwyL9xfYpI/Nq+IERUhXMfhVg4hmK76NfJBoVhKyWULElt7rTv9c5hE2Cg30f+1nl85N2MHPOlcl2kLiaETj66cNsFBNTxI3ZT9w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MadtrwqTVOlEoekCHwVQZh8/k84DGjdK9tSReuq305rUZrE1venLDLy86zP5g4wJp8cv0Ye/25zMZQTu8DKNbJSTbrfDKEDzI4Kvb4KzjLjIDrG1nb97qHMYNNGIb/bGbK07bjT6JLccOYDYHHZuDThUI+NrXJItb7xcQuHYNc8PUNjXsovSpzA3/PzvTQhWZTTDIGM7nxhan7UBC5zDYISDW3gY712SxS9kKHHpCySTaizUt0QudriOq1lQvspQf8FZztlwFojjTPjbiW5B+Q6xeRGOYv3xCViZVFxy4YDLUPmvFgONuChrb6nOyZiVlqMzHC7gmXCH4VngFw2XcNE+ZVL/0SA06Ry9aAKe8g6Erw4TRzdt1SNPnfDWkFPjKGmWLsS6QKxxNY+AcQYhk+xh0ajd5TXrZvTNDlL7OyqsLDI5Pi3Lya2YLRiSeUvH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:43:30.1447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5060aa3a-9a32-4d3c-2f91-08de845d7758
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6581
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 19:43:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17374

meta-arago / na / 20260317193808.343457-1-t-lannynd

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
- Patch Series: [meta-arago][master][PATCH] chromium: Add a patch to fix bu=
ild against GLIBC 2.43
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Tue, 17 Mar 2026 14:38:08 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 88029868c2147d0de98a03eaa0922cbc1=
e2e28d3

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: 64d6190f700d54addcd17687b7428a64c2bbb0fb

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
ERROR: Nothing PROVIDES 'gstreamer1.0-vaapi' (but <build-dir>/sources/meta-=
openembedded/meta-networking/recipes-support/spice/spice-gtk_0.42.bb DEPEND=
S on or otherwise requires it). Close matches:
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




