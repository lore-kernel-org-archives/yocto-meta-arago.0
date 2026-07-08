Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBCEC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:25:45 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6290.1783509938144059804
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 04:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=gHWcHfRk;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ryQb14Bv;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 668BDODV2168729
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Jul 2026 06:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lEkgLx9kai7n3XjAipJKdpMwWXP/PW6HhxFj9xrnn
	l0=; b=gHWcHfRkv8RxEC+zckJcAvzgZJREM+0skFSqcMLcbC/XDW/cFvK66A45f
	aWTFldvnYkO6D6MOt56T8g2kCAFW0ovu9xhwa4lDmOkS9gdxqiZ/CNFsW7on2mUC
	pMH0Ozr4PvDBeS3SgCjZI8u3eIkbQ+gD2St98ENlBog1YbqSrLz0ociaGbEQanhf
	+wKzC/9Tj+qs+aRLcMbc+awjlg5FeCHEtBXpngmvj30d1xp5Ik/EOXxpBDj76Te2
	GnBXmhoLBMfIhHTPUpIAZXBg9P4bduFO3E9MyPfQz+1U6WlDIq4BrmzPM8esg/vO
	COBlw/+KLyjqRGUMk4FKoQsJ+VRRQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f9ng301e9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 06:25:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYdiqMb7oMkTVIwU0P/ndHHWMOnaf0DerJBgeRl8strDjNIpv+qP95I08/WMn4GabbjnJR1J4aw1FyU34kWYdjEjp5O/X8FJeyldaEAxqUwdYR8hdQ2lE/6npoPxJfu/N+CAs9hE3lOJPUq9c54M5HSBsuuOJpj9XT06vrxmDKxM/O9pat1NGL4o5CcmLx9xeqM0iTuNhkGjwHHHipGYlWac3xVkw0aFiGNX9o0e/r4m/y//x4o00cfYiEUjw9bfezx5fZJXe5QoxKgMu9HLqgr0pN7b8jpCPqdh56qkbn7sYYNYdf/SFSLYMwvS8NxrpPjIPmn39Kn7xkfJLesHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEkgLx9kai7n3XjAipJKdpMwWXP/PW6HhxFj9xrnnl0=;
 b=bamnCyJnYJOj9QR0cfJzehb4zRuiQyqO6cxPs64IJb7xwkDLO9gaWhvab01zd5JbEM0LXRkumnKVLcNsC3/yRYMahuTTFl7Iv74q9YZXdR/LAk3y7CEdVcSmMIaIH9e/MHHLIoitfc/JPYZcn0Uxa1vYGuFpywWtwByHXIBULJETtDWDslMS+SH+X5YIQb3Dy11EqgL3xduoMMx0qc7dKfc3h/ptxK9OJmNs+GL8SV02Wfh+4UQqQL+s1FUq0apTV9T7fVNDguP+St8y/lXWLs/pOrZ2zJvVIEWCfFs+YBZ7ln+A8AKqEv98LHLiEOYY65m9p0I1TTUaF1E9sGTOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEkgLx9kai7n3XjAipJKdpMwWXP/PW6HhxFj9xrnnl0=;
 b=ryQb14BvgCxYshK8l85hee1YW0u3dGZp7eBvlOZv0j6kWBcn1qJ3aK8mIBfVfDGjVz+WVT71AtLApkcn3lHfvFsoqOQQxEHOMIsU1B7k8RmlY0r/4phfNXW7pCUpIOcS8Ox5Ne57Lisy4kYnLKfgQK2m5JJC8HRSWbURsy8IkFV0UBK6lpnpwEvxEJ5eImqwi4hfWE2hXuKdfbMW6xasztspFjmM9Vk4K8o46pPJKPF+Y5d81RekIEHzwd6RLZ9yBJbAdvfrqom+/M5xRRaDarDaY9d7x25QyJlHTBHMsoZTSbysUNkZ2kDoBGE6TaEVUgdpyewjYaCp7/U6ziL0LA==
Received: from BL1PR13CA0030.namprd13.prod.outlook.com (2603:10b6:208:256::35)
 by SJ5PPF7A7588508.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 11:25:34 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::5b) by BL1PR13CA0030.outlook.office365.com
 (2603:10b6:208:256::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 11:25:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 11:25:32 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 06:25:31 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 06:25:30 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 06:25:30 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668BPUuF2490145;
	Wed, 8 Jul 2026 06:25:30 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E65139ACF4; Wed,  8 Jul 2026 06:25:30 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <devarsht@ti.com>
Subject: Re: [PATCH] yavta: Add patches form embedded metadata capture
Date: Wed, 8 Jul 2026 06:25:30 -0500
Message-ID: <20260708112530.1897035-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260708112118.2275058-1-r-donadkar@ti.com>
References: <20260708112118.2275058-1-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SJ5PPF7A7588508:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a078d14-a4fc-4a89-a469-08dedce39f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|13003099007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	YM+V24V3Ar3xIpp5fcyjE0OA65xbooeSGf6M1Ok/t5I2mN8sBDdsl412G0Tyvg58G95RRzKbgr+w27NANWaK1t5XAcQExaaOnFtrMzr4yPYK7q9d74iwhT8kUpP7EVBOZQClDsqlqbHxDy9jw3vW1AkWxWV3E/p37+jA3+FdKCpGMa72IB2R4j+DUcN0i5R4+GtdZ0T411xUknDK3tsu/qXfkyAA+UjRjjzxVvw3Dn9sAewu896uXa1wrsrwcZI+duFNZG8DW3UV/9VcLxEL0gdR9KjQPyMZ/1qM+W4LgprCu4H+BBytjS3wmP1eIRprcuJFA5CDcP90P84iHAq1AJhL72Dwim0w1IXcQ8gCjalr4Xorbts//mnuL+pf8VK22ZgIqhS7InvJ1DLmn+u7GEsU6dwxqs2K5W3KDPVS9+7Lya0WWwN9MZC2jdodY13jXrogg6rEl0TkhyVIss8I8/lfqj+oJa6erBA9nbujT0Q3iSRlZXo3csL9gs/Mi2yoKVAJoJFHnLX2DX3axXaJkspi8N0v8EHs8kVEaapqUKosdnp4eYR9AiW2y9aNEhjIZimRg2gMav/CEDjCG7H6h9F05vihP+PTk7PJocvq6BFOsVhIcMkqEDHioPJ5mf48Xl2J65WvugwgQ4zY9lGQxgf5ePNZCObS9N7ket0aJHxZE1NUQUYR0ZWqTv2Mp8hsE27r5SWz/iecRW4tJMki9Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(13003099007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	i1ZsU0VKNz5CesSNS1k2QmwNyZkHRtzV5kEwd1GHIv3a5lALStSrvsPgr9zo6HJSYzMKVzvJ95AUgLwhqCFtqoHiSqLLM4LUIohy4gvinmVdltub2unU64APQYQGP/5DI8ywtERjEsWF/aQjXrDFq/vu4gJuaRNHx12idPzJGoqPa/QTVPJpwGuT+o/OqUJCi+yb8CIiZmN7bUs8fFKRO1xikfh5pbl/TEGu/EGOBPT6zwRMXdiRYZKUyiupnEWeNxCAu3AhNP5ABSudRpEe6KYVXuRs7x2EpvotLvWg9rzh48Mrw10afyolmalHRBtww+MpZ2dBzH1jpG0R61KI6P8zVkSy2U/fPEC1+yJKXnIj1wSz+B1hIQdWYiF6MrAYHMTvTQrN6DBHq31hRMUiAEYodBstLlHHpTl0owWMTsxJVMp/3wADi/wyzK5hTVOV
X-Exchange-RoutingPolicyChecked: 
	oGZP16VproMKuAQX3WmwZ7eEDLvvQmRxPbkowIkZJMPo8V4noplZiCE03WG8xR9ByIEhqeJlA1AYtl+MqMjSD+ibWHm5gzG7v3ByauhW8gEEmpYNGZavPbYLgBeqlZRYDGC+bQRZiWwF0LfP6hyhYdA+mXIYFZ0YesmdBryaNCMthkNVD8exZjpUJbKzvHxNudhTF8iyuERN1YuRmMXp04xSkTHTRxcuE64mLwA75ygmRdEO/nijK+eN/ympjtufNr+IZufOODvph3LPT7TKxgYrXr6fsEByzIUxpLzCFZI0ebakN51GAj97RS/n2bzsRvcNUskp8CgdF9kl1qPvNA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:25:32.4774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a078d14-a4fc-4a89-a469-08dedce39f90
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7A7588508
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX/kexDh5VdLfi
 fntgpJCXPcK2R5IFCf4UVccZCUoZjGmU+k0JnBzNSCwr31sVXUn5ehISRjHDnjsNdzpr4NVdt6y
 QjynsHDg6noeMO8fxqoLEBkqF0DD+hgKQWzv4Hu8kd5TPysHmxuBXEgIyGFUDcIYdcc3ZruqduN
 AnMSoSYyYYxZ37K8FBk41UVgjqmnFAOcdk7XDYtenMzSTQlp+nGWbxn7CCiZLlhMWGgaJT9x22/
 ui8xa9W04y3PpOsEPAgEQTFyLqHVGL1ZdpMncl9qWe1IO7G52V1s0qGxd3X9wxUzU36/fHT4SwR
 x9gGOOAyrbE88Kwgds/DVLm3ouCv/2zKfrhhij3eWkt0zFj3RpBYWGZtXjkdUnRGJeZJRRltvWF
 LMMqQqQek7unKkM7oMeB7bgTpjW7rLu3e8na7c5goGpCKrq1Q8gwddlhd3gNVCwvZTrXNZwcKLB
 55q/9SYHVnNawQO6Mrw==
X-Proofpoint-GUID: -1ZKqIUDw9FHQ6cVSGfh9MJSB6OJ-rYh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX5W/u0aG/Gdb2
 ba3rvV8J6ruryvDDFCLiHRtc8H03lCnpi15ROyLjkjM6+FpEVxLRK/KhMqBhE/yuXl1UvfLW/PL
 nEBTD87dS03Z64x6iJX0LToWGocytMc=
X-Authority-Analysis: v=2.4 cv=OfaoyBTY c=1 sm=1 tr=0 ts=6a4e33b1 cx=c_pps
 a=4uekZJdLSFpbpqOwIdQ1dA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=g2kLcKwOYA4aNGWnFMcA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: -1ZKqIUDw9FHQ6cVSGfh9MJSB6OJ-rYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 11:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17582

meta-arago / na / 20260708112118.2275058-1-r-donadkar

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH] yavta: Add patches form embedded metadata capture
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:84
            Subject: [PATCH] yavta: Add patches form embedded metadata capture
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH] yavta: Add patches form embedded metadata capture
- Submitter: From: Rishikesh Donadkar <r-donadkar@ti.com>
+From: Sakari Ailus <sakari.ailus@linux.intel.com>
+From: Sakari Ailus <sakari.ailus@linux.intel.com>
+From: Sakari Ailus <sakari.ailus@linux.intel.com>
+From: Rishikesh Donadkar <r-donadkar@ti.com>
- Date: Date: Wed, 8 Jul 2026 16:51:18 +0530
+Date: Thu, 24 Aug 2023 10:57:07 +0300
+Date: Fri, 9 May 2025 18:43:38 +0300
+Date: Thu, 24 Aug 2023 11:08:56 +0300
+Date: Tue, 7 Jul 2026 13:28:41 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9a8f7c87a3d648c91bc10911520d87628d2c34ca

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
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




