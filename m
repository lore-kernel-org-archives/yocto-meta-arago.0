Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172E1C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 12:18:17 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7066.1783513089865708506
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 05:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZfuHS48Y;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=i1ChNFNZ;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C4XPA2254818
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Jul 2026 07:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+Hxd3dLVwIWbD904ViaqtC4BnJ6qZog+IMVG2O+Jk
	5c=; b=ZfuHS48Y4KFUQOk2pIGrJp6Hdqxoxlpq+Wd3QfK78M5/idoxFJk2pMSl4
	Z5ZTb1Ihy7BggVUwDYANN79fDu3v7uoDwBtocIuw60VAHLFN6zCJXkfBxBxiyg6q
	nOo1A3iRb0Cl5wzR8fPUXhgtx07b9UOvRaU+1PWfuMYR4MGwI+Eh46+1mwFr1DPx
	GTEQDwBvr1/tQ73O4x5Fa4lXmjUrS2iZB6gOXSH4eZQxwTUM+WwL05va3gTaNLy3
	aj7VEZ+dBkql0ghR4McukJ9UEzIVd/DCuzNrugSRlnIPCApo2/Qi0/5G58lvhG15
	S9yX199lBvQzOm7CdKuDj7tqZAWmQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010041.outbound.protection.outlook.com [52.101.85.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f9kxk8rcf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 07:18:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxvHn5QgEb3C6y0mjjfIM92hTk2nuy7om4jDCnQQpXm1/tWIeECWKHjzrqfNIlsSOpitHqUNWFlz/KllPYEi/Km35qgU/bYn2R1/ALsM4c011Xrr2E575crp+rqo204krqemjxB1PYDT8/+rx4MhWmCGHFJXh3bdYB+zoksK8Xf6Yi4g7wO0iKrEvpRHHA7H8sZpKpaul2bCuPtJfrhdmtb3DTvM4lRsudH1T9feUP7LjA4JjYtXgQC1zDyZ9vHTWvpoLRuy/+POmTL83GSgXyosJfCOsf0cMzFtzeoz04Gnpn4CEpB5zOt4BfJrKfEfTGJfPB5bl6pgh/tmkgILLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Hxd3dLVwIWbD904ViaqtC4BnJ6qZog+IMVG2O+Jk5c=;
 b=nysvC+mS1mx1go7m5YQuQsOQkCDTdl52LWp0X6ThbLnowa42caQ+YRrBasK3CI4mEftDRNHQQc753fygnz5UEmbabpXbcTF6UfGgWlTvmSYQBoIC/LUtE85XiTjUiJHo8mw6yt09tnuwQZOS6B6rFtY4P+pxPmGfk1vpAqa6f0rC9oDDBB9tDWhEzA/TYJ+iQvyWHODk5QzpKYtLa2ckwoc7ER992ipJV1rCsZl4obBMVNxfeTeB8XdUi756lFic9AE0ButDEPWZGg0XcuaBg2JvWf6qYkwaQW8G52V4WhdryVw0JC2/6vGLCWL0SPfrLdQ2kotmjCE2x/sU0Hjf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Hxd3dLVwIWbD904ViaqtC4BnJ6qZog+IMVG2O+Jk5c=;
 b=i1ChNFNZEZNh3W9jmQSNpHyo/4rxCrxAjd+na1iNXIKIVGLTlutegt6dXiDPT5X+BxAZJgne97vM/ahJnycoYZUTWf6f2xgasI68rkllCG7IJev1qXCdlOeLVaNH642SmJsKfNOInNRezHJnfM2vL5xunu1IAnIW6WrN2b1dJcZhcTRHLYS7CE9ahxOzsLVxewCFijtBc53B7+Z4QH+b9OqD2x5vWKo1NNldmhhaqL33+97QzzVZFJz1diCaBYuEp4nTJQ4kgEKlnZOQitFWLPbEzJTFCdddSJBp5fuwRvU/O2nXZRmVDG9HMbPSleyAaTPhKNpcOUiRQb09ROm5Dg==
Received: from SJ0PR13CA0018.namprd13.prod.outlook.com (2603:10b6:a03:2c0::23)
 by SJ5PPF07759F8B1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::787) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 12:18:00 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::5) by SJ0PR13CA0018.outlook.office365.com
 (2603:10b6:a03:2c0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Wed, 8
 Jul 2026 12:18:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 12:17:59 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 07:17:56 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 07:17:56 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 07:17:56 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668CHuOL2543052;
	Wed, 8 Jul 2026 07:17:56 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 63F6A9ACF4; Wed,  8 Jul 2026 07:17:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        <devarsht@ti.com>
Subject: Re: [PATCH v2] yavta: Add patches form embedded metadata capture
Date: Wed, 8 Jul 2026 07:17:56 -0500
Message-ID: <20260708121756.1950876-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260708115552.2277504-1-r-donadkar@ti.com>
References: <20260708115552.2277504-1-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|SJ5PPF07759F8B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c47121-e048-4b0d-06f3-08dedceaf374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|13003099007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	03x8Kazeu03Ep/EUJ42j2H0dPBB9xgSrWPjuZTRBdMK9Bra4QfYdbWrCYwAvn/NBDUo4rbyDlm+9BwrXxtNGSeTK8gY2R4ibXxbwV2TLc7lAACwLWv6EsMnfcQW96Vb940msrazLShrQrPWfRZkPlUN0nfGjxQZuXeD2pPFiSzG4RIXXIXOTBWuChLxXVJ/NBr6OMmkAXtAH0N4+apPLfrJ/7fOYEcfhhlzoiKwrw4wYKcjVufMZwUD6ti9vQw4SDoeXt+E4twxNWhJlGpjt4fv6WyFOR7fouy0pod8M/3LUeQ4mlX8x36WMT7p1mJrpLSb4gZavHXC5gratLhmUQHuw931HN6Va5tzCutitaep+VBRekle/XSGjZ4YDrsOzoMSSUb5LKnpfnuRNQyLFJMrfgFpSMD490Z5deZWU8g4bEbRdT/eM6bY/Cicw7ZXrq5AuPAfGD1NGeXSANM9gH3tSEkiSSn7NV+kNG+yuOUC2ZcSGyaGWfK134cJ6AsjMorjY/xQ6GBoldiOf2zzamE8pG8BjfiQECSV9AWCPnEJlZLKt7uVwXV9PDFHGvgCNtz79KAdHFif7oGtS4yS5odUa87PDY9bgvwx9uSKS3Qe9gH3nV6llUixN178Tq/vz+aVBmN/qXz4iDCOBI+reR6YEwGft93VcmW0bKBBRm27CIoqXIn2EJQeAfHQ9ZWiwHcxwU01KBZtWpcgJ9N5KiQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(13003099007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uwReP/YQygK5R2Jt1bcvcDwuPPJF8NzcNOM69zzAVeZ+683/82Fb3N6T1PvzomTm5GZbrHe4WM307WkGSsG3KnwFoWpP6o1hQbOVl/7x1BV5N+LOJisalr1cGC3hma/2PWwCU/X9Hr21CzCF3QwzX4+oCDfJeODAYYXGiZcNETQb0iwv0yKl/+btIXBq3Yaq0abPFzbpZ/iQMoVKlY8paf9pswR6N2lWcYhiYLyZFbye09a2TElNipxduwxXYH+dmcpviAp6prAl7ffjS0jtvg2+xJhv3G97pvwbIQZeGcdJZS1JQjOyQiff9ugyT7YCzzvIBH14cOzDbG39rYrnlTa6aNyzHK8+9CljPtNLB8H/MmZoGrFkaQ5isKUw1zUZZiPCtvLt8l5M6eN4joVFFQjb0l3+TSo4y00oiI1PjHqFZa19Wg3SOyFaw7QgTw5I
X-Exchange-RoutingPolicyChecked: 
	AcuXoNnLoZyTRzvVedyRzvDlbS0BFZRrGkUDP7ZbEQTDTeE24rUlimLXo1pAbW+uViW/9Nf2zHcLWqhm3oCCHWjz7XGfHr81cqbKa981gRBbgENUeOd/iroquHePXFnS3Of4rIxKLCA5IeuSg3sjJYVr1U8b2CrBXrvinjShrXthoQJCJG+ZO9PZEenS0CtbGqAL109jAukZAiHmrUd3I7XotLppOCHVwO5MWkAHqwo+5yCn47T8ChiHlT7pNJpRjRWdTmiwcVbNZebnXEQ3vPjpfZtUNhv3XrjmWDN+nWECrPO9IsbaPVzBZLxKaZUsMhpi3v244G2qSaHiwAZUSw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:17:59.6746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c47121-e048-4b0d-06f3-08dedceaf374
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF07759F8B1
X-Proofpoint-ORIG-GUID: QOr_sMuxtTPTvHnYIdk0sEeay53O-bER
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a4e4000 cx=c_pps
 a=duIt1iBHFgRvnGs5ekVepw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=g2kLcKwOYA4aNGWnFMcA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX1xeup+S1GWz0
 4GKJXUwY7mgfurwdSlL+XfOcXN1bT/SdMSpNH/g1S3+WtMQZh0nc9WeibzJRTGVxyxFgbON3T1P
 pZtnRD44pOqYp/eNz0waAyS+vRd1a4WsVpu75tPLAkBVEKAbJDuGIuo72S4MZFNaNVpvb8BL2fr
 G8QL6TCjH2ZUfQhCrjZHLjiH7WjlSLvqBZktYziSsvdw4rgoVdVCr/Oej175AQ5vmfiYRpWoJCS
 kWuKhMiBahKpOvuMB2jBrQjvkbqX38qxosxpzzX9hiFMMWcjSS+nYIQ4/XgfAEfxZfH4789ACy/
 BzOQh6ylx5eJbee9/m+Ptn7eqVoPn6JwZjqnvrtc0v+xeZCb7nrC06Gz2pmSc6zKlHdYiHdGfnx
 0vLsjLpoXa3lQ/EdC98DxYr1+JbNFkzJmwcIlIjXKxLyUia12KLTmVj76LVYZ5qdPfTvoVglYPb
 HJLYclYZEXoRkzOkSiw==
X-Proofpoint-GUID: QOr_sMuxtTPTvHnYIdk0sEeay53O-bER
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfXzUazf4Ge97WM
 uDE3QcwEIUa07K4p73FJ4TiTCkY6myTCwGSU3j09T++/hdnZOaAwWyP06bmzi3D7IR5WSOHPL6n
 I5i1zPIgKBzkst88Fq/9H7YwF/ad2XA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080119
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 12:18:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17584

meta-arago / na / 20260708115552.2277504-1-r-donadkar

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH v2] yavta: Add patches form embedded metadata capture
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:84
            Subject: [PATCH v2] yavta: Add patches form embedded metadata capture
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH v2] yavta: Add patches form embedded metadata capture
- Submitter: From: Rishikesh Donadkar <r-donadkar@ti.com>
+From: Sakari Ailus <sakari.ailus@linux.intel.com>
+From: Sakari Ailus <sakari.ailus@linux.intel.com>
+From: Sakari Ailus <sakari.ailus@linux.intel.com>
+From: Rishikesh Donadkar <r-donadkar@ti.com>
- Date: Date: Wed, 8 Jul 2026 17:25:52 +0530
+Date: Thu, 24 Aug 2023 10:57:07 +0300
+Date: Fri, 9 May 2025 18:43:38 +0300
+Date: Thu, 24 Aug 2023 11:08:56 +0300
+Date: Tue, 7 Jul 2026 13:28:41 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f6873eaab9ebf1e6ffaff08ffcbd8a825bc0ae5d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: linux-firmware: Move this to meta-ti-bsp
- Commit SHA: 5665f4b52096b5229aa20d8bb9ce1defce94563f

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed




