Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11ABFF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 04:23:22 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4615.1777436595093149968
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 21:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=xhS898xL;
 spf=pass (domain: list.ti.com, ip: 52.101.48.42, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXItrk47IrFAg6KMkaqY6wXiEFWSWdnNrGdWEODCYcyE0NpFXGPkWrBEAwqcHX6mwPPzVc02gpirwLAd7I1rtqocUZNYHeP3jwO0PPgADOeuaO/nvHhtFolTi7AFoUtdmxshhqdX7+94sPOLSt4ePWDvcdhflQCnp/Ju9dn3Tyo1QvlsnIHTiwXbXeyppLMAuYoOhtgpGKU0qVG5PURRx6dLLXTyKvNfSHucJSsLEOE89QfbXWmbLanKwEaQo4D54jHll13EJdOfZggS07zN71fOY5RUz/haXJU9O9u9Q3gmNf6PFyI3QITy2XYLP81Rviz3z9/r1VBvDGUOleXvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPESZrKFGOcA22Z7KjtK8a9RLa/rjjD+hjanquf+1iw=;
 b=Xto+AfE5Ig5m2Sz8NqYwrCSt6grccmW0ziGIcwhvabJoikUkPy6CNYgFRqB3MPLSUPmuDK98ZVvXfslVNOQLvWUNouFZKjtPau4EBKufOGjk1TvUaYtHF+5N/iio351No5Pny/49YXGYoFPwlz4kffh8YJ/e+L2xv9UK50sciZVxC9WJpvSOtneWhOc7IOVFKItPenZXhBeZWnc6uu9Zp6gfqVYDck5WqTWduGszdd5Y7pUHyBQISx0Vx85DNj1eP29cruM51lVhV/Sn9X4gD10AAb2nvzkT2WYYb/c2u6iz5xOboWqcmhgifcqgOO2rLuHMIHuxm2awsswEwpbNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPESZrKFGOcA22Z7KjtK8a9RLa/rjjD+hjanquf+1iw=;
 b=xhS898xLOhvP5S7fcKUaXcRkKM+li+GMTF9Z/Rapf1V7AxqGZwH01GtikdgANCKwXA53zafZFs9oC4CLUuuRt79muPXrdFCmARhbWY6BIHJLmctfb3nWiwysJVw2ANBlRrlSzmIbE6XVbl1l/NS7nfRevb9em5aLSQe1fnk5dQxCo/xS8AWX4SaoyOVb2tCPtOrThPiGUcxNCeA5J9vlLV6wSjksC8BTDxTnoOFEBhRcACezEhlPCqwPK+J12DLmoSk9KpgmokUKapgcJC8kTZ8CWHzynu4TXvRLqVCTLiJl/nwRrT3i7727VCmiDnxREvbrskHLXfPT62XVKaC2dQ==
Received: from SN7PR04CA0009.namprd04.prod.outlook.com (2603:10b6:806:f2::14)
 by CY8PR10MB7368.namprd10.prod.outlook.com (2603:10b6:930:7f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 04:23:11 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:f2:cafe::b9) by SN7PR04CA0009.outlook.office365.com
 (2603:10b6:806:f2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 04:23:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Wed, 29 Apr 2026 04:23:11 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 23:23:11 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 23:23:10 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 23:23:10 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63T4NAsO3780182;
	Tue, 28 Apr 2026 23:23:10 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DDF129ACF4; Tue, 28 Apr 2026 23:23:10 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202604281800
Date: Tue, 28 Apr 2026 23:23:10 -0500
Message-ID: <20260429042310.2088747-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260429034739.3842536-1-lcpdbld@list.ti.com>
References: <20260429034739.3842536-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|CY8PR10MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd35471-112d-4db4-9bec-08dea5a70636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	2aU4WwfBZbTOikIAwypzT6vlE3gIaGwnBsZttVbxgJTNZgPjCrgTI3/FK8mKePKMRJmPmuBqQfIhCTUXEyKdzPT1viWcqJeCYT3d81w7Imchvn9TnzddRg+xzQJRb0egSaYvnUyKhEEj43gvntgVsemhTDVYIiSnDZul7MQbDkUvj6C6/dCOTBMgOyu9rWqLS+hGXFRTzJ5nT05cNwvVHg4Sdoh/HEDOgz1lVve6zZwThKClZN7M17R3oSW3Np8SMzQyUY5TP2DtXTsuBNUowB5DWb90l29sFv7tkgiOM9LyQyXnfHRUXlkby5eA9nOaoT0xyOnOapLruyBXmf+pVNkBr/ZD+jlvTaYakwydX2vnh9obUlGzXgu3JSIPB1aLXtTSwzFyLr69k4ys0cKQtxnyNnhI10s9KbmAK0JOUUhFVZPfaeXJVq8rh6LKsld+ptu19LRXKOPwOml5/ZwltVAdUhDa3MQ0XkA3FTGrBDf3aOtECE1fRcyWkiAwuAuIfX+Rkh4BS0dkM8UGIAjwD5BL0Siu5+RnufIjhpBc/IBteUrRXsV4gnGWDLydzd+xoUQakZXPLDbRIRDxr6CbaVXNHxqus9TA6Jd3TL8yKBOuN9e1FcGf4ye9nkruE35n8FiOmDKlYyngY1NORw5zurvGTP0x+O4Jf3n6xfhzLj7+ZRVUg16VWqvWHHpove8tzO14BICO6FrYQ7VwroOOHmheNSeNV50s72q1b05MIq23f876bhdMdL2O9SzN81reRbHrT3TOmSH6fwslmmQYew==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	j9XlcWErnnd6kVI1OdvfdiQ60aULlxJpAMXKJqVaDjADa2Co3f1WAYJKb09WgqHvdN+5BQVdg1QW3EgEh8bSV9fm8lh/1IchTuROLbzH43R72rRnBRPj+IucIAQAn08Tz6SHSPHJiDKxsmFp+n4hqRIDwyG0Pc9LDfvpKjxgXRCZgWZPt/p2dF2bc4fFpitlO8nxRZqbTpLcViQ93MoMUk06kEwaNM8RSBpDta7iQqjVXUDlkryvoDvZ2MjcPTDKBAFyqpZ8QQ74U3vzJRyhdw7nGaHuY1Pawc6ou6AIA3EcfGEm/niBmNRismVbfpwqTVOnzj74zDE6Q8/tpWIMu54kbKR4D6EMALvurnS+pX7lZ7Trd2GvlF+Rvq2NLis8akz86SkxUqD+hsBoUQ4VTOSIMweM0mH3mtGXtG4A0fNZ14w3hC8NBTBLLd4S92bM
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 04:23:11.4897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd35471-112d-4db4-9bec-08dea5a70636
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7368
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Apr 2026 04:23:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17506

meta-arago / na / 20260429034739.3842536-1-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.=
202604281800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 28 Apr 2026 22:47:39 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ffab311b22884e00b67b9d295a8c8adfe=
4587877

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: meta-arago-distro: Changr from meta-arago-test to meta-ti=
-test
- Commit SHA: 98e93fc79fe152f972ff2dd0eeb57969ec887da9

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




