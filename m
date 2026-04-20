Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909D4F5A8BC
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 20:23:56 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3260.1776716631394169927
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 13:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Zcfkixtl;
 spf=pass (domain: list.ti.com, ip: 52.101.62.52, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jr4LHnfn4HjrAnt7eg/kJON9NFi2A1t21RIz+wDfkxN+Ng4w+sb/TKuoRHlJ6uOHRReCtMy1NYtL0wR4P31rGBbKnfXHN7d3v7GACqwMa9ViGF17CAyNdqc3Cd1PBRqJsyUaEaKSQ1PWwSFcXpY5RE3EXflaADk16QsJ04H/BVhUyZsDtgLesWeOavrYZyRNKYQGyTwtixdqiFietRv4bvt4JdaH1yAoH3dv2MI/0KtOpLCjm2JuHg0QW92sKOceZ77RuxMlq2PNXcsRowrfk+36snOSamtVuXW3PwHiu1lGsprdQyHmcZMFffpK0mai0XF4/ibbPETtDNkNUihXfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fS0X0m/qx+4mTpF7/P9FYfgb4qRyLDfpUbmAxhyiP4=;
 b=oRkMw+1Avo5aJAf3XOVvCK64IuTB/+AikN4+9TBo4XedWxK3FUeK6/XhW6slIUP2FNp0dxhWY3Z21dleWO0NRCb5S/uIM8b7wycHkh6P8GS1WKKTKmf9qLDh9vc4dr7suRaQBt4qMLXOn8SvUwxUVC5KzA9GoRcoof4Z72f4p3KAUppBedBwDJjs2t3hTub6ysViMSL9nRlIeXE/nZGOVfP4oYlHS4/iTjKBCUHay9ecFf9g44Rba49HhiVRaNnqvO7atSWufu9qIGKFen7mttsyyIET6SALk2i9LymK6XqYGw0+Q6jL28vJA3djZOWTDoY4HTxap1LlrarKt/BtaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fS0X0m/qx+4mTpF7/P9FYfgb4qRyLDfpUbmAxhyiP4=;
 b=ZcfkixtlVwV1WU0VETzy3X14g5BzJyEgUZNJm1xtg5QGqgfZsw456XAjDcFPlC1rfQbcmQqT/oOaqVYXYpA/s5/E6WCrFclrjnOEksseR1aEkuMzi6jHCKSQLB4lUYSzgHSPQUztGdLOGAHMSk8hI08D3qCVvC3vk7O57MaaOS58q6saZp+cOJWloJVt3St5VVR95J+c39//Z6xAGsnHL9ljXYz2SnqEKATX+fBkBdM0R/qy2Poycp0ve3UnV7Y0lrqwVCvmyd2b2Oglw+EzKwZ4Xn8uaNlTzWF4k7zOfbGp0GKcGA4u1JXdQ9ossdYwsu9uJK885YavxXuedC+APg==
Received: from CH5P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::27)
 by SJ0PR10MB4704.namprd10.prod.outlook.com (2603:10b6:a03:2db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 20:23:44 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::9b) by CH5P222CA0006.outlook.office365.com
 (2603:10b6:610:1ee::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 20:23:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 20:23:42 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 15:23:42 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 15:23:41 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Apr 2026 15:23:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63KKNfxf2688500;
	Mon, 20 Apr 2026 15:23:41 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B68F113F51C; Mon, 20 Apr 2026 15:23:41 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] mesa-demos: set default PREFERRED_VERSION
Date: Mon, 20 Apr 2026 15:23:41 -0500
Message-ID: <20260420202341.851581-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260420195557.22133-1-denis@denix.org>
References: <20260420195557.22133-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|SJ0PR10MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fadb76-a342-4420-8f7c-08de9f1ab748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QbKFLrv72N8aakRTunxKdSGtYsOW9wJ2PgLkHVS2uJHVuSGctyTIAy5gyaQ1ZU1gi3Ch4gKkIiPSW1OD0IDS+Wpq5RS1gMNCBa0KVNuAAxuOPBtjU6mesUKrmb2ewBWcOLXQ4QsGZoyFvfX7mOyhXMH0xPEtWJIJXxkV50vEGIxGF65KB5o2GYHUHIbfdeG4NlfFaV72RlFTlH2+tfLHzbe2r1o8+x+vc8BUIu7Y6wptR7DoCG9TDnGAAs8beqY7Eph8YriguHS1r3ULIwPs++ltoLHFxAGb6vXNtz1pwZF/5WbOnOt70LrDJ1XfK3oGvZH+4AqCXOH2yUXZO2bMbVXcrISRPsQ1ETj1yYm9/9QDx3a8rPh+UwFxlB2bUAMnR0OGRmLY8kkznQyJru0mqYgUvbQainsMnruQMPPieCH75FCs1h/ELjU4Telq4/LHcWpTsxKpk1AUYZoSeWeQVYt2PwNsONUSyShmso6UwiTcOu2bplSPmKny8OKS0FpV+zbzljOl+Z7tc+TAvmxzbU1q+scrolKqy1ofs5ejIfLryZwanGYRt40wkjF1W8/Vlq2Cz1SCUFpa7ZjyaeQI1fb+E5B7Sc5gGJca6ONLD8D0OSAXtL/iJZgBZ1fqa5sYRih6/UAxBuvDMJOBNM8qXIxeBcvEIME74wGYbsFN2Is2bzJgYaDQZVOg3HIEkykvjuUeTIvHTzjHyEr0fueKug==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iaRzbrtVCd62YP+cDNPbazghGH8cRTAQvDaJyfahn9wCLLfThEA0xnzeNgdSTBkrIWMb1EfBNiuF7V3hZpfh2ZH5g9hy53lFcqO520fkw6xopsLTvduZauN4yr4K64FlAHJyw4GWP1s23af9s/4s16PoNxbJYZ0Edei4WI67+9yfSNm0jsOBbAv+s8x+PuqJouVdMu5b+R7Qd5d+7pd7xOkhoCazoqv++6INtm6UA+AbIk8pMYR95SiOBRG2pJnu4exfLn7QVacq5BPhCgSVcifJ8b4bosN0257zsfVq2KuJv/ePJdsHAMBVvAXelg4J647WRuErwVAyN+sItCqZAmia1CIUJqnGQJqYdH0D562VJL7Y774WaCMQiDBIOHKlWYnGGihc+EeUFJrLEVyy1+qYhWWP4RopbHTbVvXJ0LVVXnozwkqAcF2oZMbFkvDA
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 20:23:42.5100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fadb76-a342-4420-8f7c-08de9f1ab748
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4704
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Apr 2026 20:23:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17477

meta-arago / na / 20260420195557.22133-1-denis

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
WARN - [master][PATCH] mesa-demos: set default PREFERRED_VERSION
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
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
- Patch Series: [master][PATCH] mesa-demos: set default PREFERRED_VERSION
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Mon, 20 Apr 2026 15:55:57 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e7fb78dca537389589264ca362112b4d8=
bc89695

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202604201357
- Commit SHA: c3de43f19b4d7918ebe43756e8a42fcf08383a96

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




