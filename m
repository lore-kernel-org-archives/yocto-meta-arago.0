Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B540BCD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 19:03:28 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3753.1779822198260778713
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 May 2026 12:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=WFqbSLR3;
 spf=pass (domain: list.ti.com, ip: 52.101.53.12, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5BXbxfCpAdeNGdJBxZ1ihcSLWSMtt+V9JpruKOenerKoTTyxtLOEnKPRpW0f5+lSewyKuisDxgcFJVlO11owEuoFb3WP1vG9ozYdK4t8hnF3B6UbDeRtv3MLANGbVbjKAXi4P2Oq45+TWDEB4cZ0qjnVoE2GEco+nuJVKEhw0Rg813ybw77qoIKsH6TbBfI3ub2pT6ZTVc6yytmQS1DIokYR/HgXplR2+4QYKsfnpfjQfdQAgMjqIFb4mxLW7HNe6muQaDtYjxDZwq0Gq3dH6IwsmBz+1DrJvnEkiFJManZMFSQJiXkt9wyJwdZDMZhVYMWSKqOvSI5p/2b+2Mm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e53nPMwWGFaft+0LajOaTyoDjR1Z9SwI9WRlCc0NDeQ=;
 b=xDcdAtDE9LV6OWagiTVbwg1MmiSfNtDKsJ+PAZQsAfVWBtSkDmtfCMWNEHBWijXXekGDDMVF9834LXdDf1315iBb/uZAZxtj8sKDGxLfrQs9L+3kJdD6bNgIxmsFdZawbkbmiAzhqbS40HoNUVbT0B1tzItyD65Q1BbQf5vaaxIR4+Mc971maxhQb25tXxFRqak5wwf9DXV1piNf5Ezj4CUeN7whbrTg9hUOJSygtcVgvspxtbMe9/TpOvpeM5B7ly/wZn4WKv5scpckYiSpNCONoecS3tRf9vHAJLSXTnAuMshv21pgZvo7QR+AXLC1M182QwxnmuBT5YEfZZh8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e53nPMwWGFaft+0LajOaTyoDjR1Z9SwI9WRlCc0NDeQ=;
 b=WFqbSLR3U8Icr3A3hjWQp0YIZ1NTjQyrzkpMIuC/ygBGPGE+RvSM5K76JunHo+rJPNV5qCrgnECVes0gFLj7p0s00gB54XalyXQBodtqcGQM+hUpNH7NXgFjYIessG6c8+kO4XfqsgEZG0jg7ig5pdZp1A/SzvA1faxzgUY8UnrpjXX96kfw2ELWkXoGcj5P++7JWy4oo29ymIzO15x+UK5J0PzfYbW4qeaBHFosPt9hcja8kOPxpqAN6146ZKG2itjPBUDIrhJumprF5NH5VY4B2V/BRXq4z2+jKnKBHLEVgrN4aCNyj57rpfpOi15KNq5EvLVecr1ioRhJBQuWwA==
Received: from PH7PR17CA0028.namprd17.prod.outlook.com (2603:10b6:510:323::8)
 by DM3PPF70DB7B674.namprd10.prod.outlook.com (2603:10b6:f:fc00::c2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 19:03:13 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:510:323:cafe::38) by PH7PR17CA0028.outlook.office365.com
 (2603:10b6:510:323::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 19:03:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 19:03:12 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 14:03:12 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 14:03:11 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 14:03:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QJ3B7G1704461;
	Tue, 26 May 2026 14:03:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B398E9ACF4; Tue, 26 May 2026 14:03:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v2] meta-arago: chromium: clean up and simplify V4L2 patch series
Date: Tue, 26 May 2026 14:03:11 -0500
Message-ID: <20260526190311.2131866-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260526183938.378716-1-t-lannynd@ti.com>
References: <20260526183938.378716-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|DM3PPF70DB7B674:EE_
X-MS-Office365-Filtering-Correlation-Id: 830f68ce-9b53-4b3c-87d9-08debb596f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	YyyoedKx2gykFzqBcy0b24nZnoMG/wUdM6yNT8hkRcak4+tpi9kU8CfpM4cyZRIh8Lev0KIKm3592fDHLeB81tsVAM0KTuZkYnkeDwjF+3oTtGtYayHg5bbFT0mNXI5/HGhpXCesvpI1NZT2RZWqkTlx325YyDdmNXlsnfAKC7+iigqQa0JM30GB+detVTQRRYscTr7wkj+STJzmUczR1f0dZuPVdNzgrPN5joeIyy7jtAzD6RXS5rMBdIybS6td0mQnBKizDv7lMYKPIZzuewxL6ld/YFfEzsRj7VDF90KhtSEX3+iJTHkxIRwo9HXUEvECRYb6TF1Jk07t565FVvmy1lIwmfAzDe+OQcAFgWQ16HARUnLIYJ/mj5yk2K5sLzoAiQwbDty1Ik++EVQVVyRr7CgK9y5GCqsM9EgMXbCTyLqA6LIN1V+LnH/fG0vQeqz17sivsr4gvXSugPUeaJXoW66GQP2Z/kxYRxrUcLKsme98V/3BHzoCSZwW6FVhN5Lfjma02cJW8RqktiRSkI7uM6sYYu+96dIN5oPrc+ziinLol9E3EG8VIzyqJb9GPctzE6NG9GsklYJedM8TYUW3ix7eiREU7i8YYEd3XmFR/EvZb2BvzfhWhbpB1qfnUgYo6wChupwd3Ih+oUL8Shu2MHZ6ANf+wJwfTl3t/fIS+TttRrzcZnMNIUdd9ff+Ljfpp2/mNIpP1f/mbq7jRbjyrcfffqxnpzfNMU6dUEE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IFZevjtXT0LLo3vdDYwSag5iZOwkp2KR/drY0H00KQL+6H2s/O7XdlYAw+tz+9Bp0wNKhLUldCGMYubjwZ5+6s7WlPzbCJiyc9/Wb0rM0yQRyFoXDcbmmrN6IXQAZhFpCiVnW+cb13mlieLwC9OMkfX79Gde+esWf/RxrZwqMdWmx3VQeGlLTdJDPQldKcODLkfUyAW91QuZJcgK0eWLFdZv+PporkfI0ZLvKVGREt1HJhDvi8v4leE0SnFyT/B36ClLqOyo71P+tKpiEYi4v+Auf8nf5I8NFav1ogXmvnk2vK79YhW8elDf/MkNTzPpCGvA05QcJRt2r9xGPx8tNo8FedgwReX7sbnApTZf3ErXz7yfG62FYNujY5NCh8/VhrtP9KXDVCSzAygiBWWU2PP0UcrTKmMTw2h/AOmcikgGuSA7JeogtKh0wSK2vzbU
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 19:03:12.3266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 830f68ce-9b53-4b3c-87d9-08debb596f1f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF70DB7B674
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 May 2026 19:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17540

meta-arago / na / 20260526183938.378716-1-t-lannynd

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
- Patch Series: [meta-arago][master/wrynose][PATCH v2] meta-arago: chromium=
: clean up and simplify V4L2 patch series
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
- Date: Date: Tue, 26 May 2026 13:39:38 -0500
-Date: Fri, 5 Dec 2025 12:40:27 -0600
+Date: Sun, 17 May 2026 02:40:44 -0500
 Date: Thu, 5 Mar 2026 12:02:31 -0600
-Date: Sat, 9 Aug 2025 01:46:14 -0500
+Date: Sun, 17 May 2026 02:29:10 -0500
 Date: Wed, 11 Jun 2025 11:07:05 +0300
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5eb12bba00e1f2636f88b189235cc78d6=
5509fa5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: chromium: Upgrade to v148.0.7778.167
- Commit SHA: 7fc9c9be31c9337d695da43fc0cbbee1c842da27

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH v2] meta-arago: chromium=
: clean up and simplify V4L2 patch series
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
- Date: Date: Tue, 26 May 2026 13:39:38 -0500
-Date: Fri, 5 Dec 2025 12:40:27 -0600
+Date: Sun, 17 May 2026 02:40:44 -0500
 Date: Thu, 5 Mar 2026 12:02:31 -0600
-Date: Sat, 9 Aug 2025 01:46:14 -0500
+Date: Sun, 17 May 2026 02:29:10 -0500
 Date: Wed, 11 Jun 2025 11:07:05 +0300
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5eb12bba00e1f2636f88b189235cc78d6=
5509fa5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: chromium: Upgrade to v148.0.7778.167
- Commit SHA: dabf01e1446adc66f221d8152b2bf20157dd8bf1

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




