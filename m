Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561D7C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:33:29 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12658.1788356006584715874
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 06:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SIU7/eSR;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=t9zzCrMV;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CUqDf2126180;
	Wed, 2 Sep 2026 08:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DsWPuCv9hElei3hI6eINbiLQy/EGOHcClXgfOiIOO
	FU=; b=SIU7/eSRG0vAka8vALeBvT44m7fSmZifpM45tVIBWI4Gqhny4rSS9yUUl
	nrliuRTUVvoTiKRVjOqNeN6wuvDdiv7jt6DtI/dAtcwMmzA2erIoAKrAv1UCT525
	125Kwx6YTJTSM0gzqfwjpoVuz4RFvJTpYnf+oO6FeXuhxXCUU3sVokgamqVsPYL2
	1l4nUvoHbJRF4AeEZBXAPhYvNMT26/Fkk3DnsgCzZColTnbS02p5VVnGkrYigF51
	qENkKCPQeJIkRlh94+ZUxRruFL4WCUINpfIjHShgDducStOg06kVQZP6OKqCmJ0q
	B4nAetu90PvJY3rLgIfSVaA7zGojw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gec5nb05v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 08:33:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ON8DODn1BJ2OuCGX4iiLJ46yyWjs8YFaSdCU0Okw6KGqFuo1GcEdJC5v8sv8EI2GBN5fYaObq58cTxnYyeBoi0wNPT3hqelZVIMUF1KhBFy1FvXNBAru36W7jDfNLFIyQT0myW9rh/n5CudElwpMr0kfoIJ4xu39exbXnmB15CTgpcFyt6XD9TEYQO5SpJRqDmKmwgpGWS8k6ugtRlOsZG27IcJ0EZnjhhrHDFdyIdYigK+p2ICCChkLY46T6aHnqIvZwjZrCkhBWcV/qhxcoetF7jyJ/YyU44qAW/SyMNrIS8OehDEszkJ9a2R8CVU9v39uTurCjVVcHCQ/3YGyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsWPuCv9hElei3hI6eINbiLQy/EGOHcClXgfOiIOOFU=;
 b=BXHhBT54fOYlp22aEk4/NPExYP8/Suycf/vrmRgteuVc5/z0JMvdI9D5jG1rhb/+F19Qve+lewp+3TifbTA8bm6xdbl5q6ShQLj3b0COW8ZH7c4bKlZM92ljB1bYSXNVaM2UUzR8Nyu/YQko94RwGmTex3p9NREI/b61WG5NdpGUkBE9jWTfF8H3b5VRrx1fYlfCI7YpndGvWFy+jIEy1/aX3emG7lQXYb6TWHmGEbWKmoT39/h2Yh3WuCqWPUC6KTKULj3ARVN5Cp0RIPdmRdxJTe69Gso8jrJNx0mPDx5j0YVaq8euKTJq0RpcM66sT6Bjt1WSz1CurBN8aG8N3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsWPuCv9hElei3hI6eINbiLQy/EGOHcClXgfOiIOOFU=;
 b=t9zzCrMVrrYBnJ3knCZ8OyIDtATUPezG0OHJYBGOZQWHG01YA/fek0WJKAEXNm31KNePXnOTp8BaO72pGJF0bTac4pqcbrLjZPY48cvASt2EjWW03k+A2ocWQ1o6ePUjTVi401x4tZ/y9NvYBk0Vmp1pWr/gVvUtz0E2bhMvHnHq7HOUyFDTupsyhlFjSDtBeq0Y4vx5tx79jmPpM90O6vMOh0gQ0Fglqbn6sLjC+sQqyqxAhfHAGaDQ9w/8jSdznldjD2XjKP7Wko9CuU+0tykvSENeP6FAT5/f+rQrc4l92sd1/aMhCQ0pTFemfR3Dbdv+mE1ydaqwmZ72oF+unA==
Received: from DM6PR03CA0088.namprd03.prod.outlook.com (2603:10b6:5:333::21)
 by BL3PR10MB6188.namprd10.prod.outlook.com (2603:10b6:208:3bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Wed, 2 Sep 2026
 13:33:19 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:5:333:cafe::73) by DM6PR03CA0088.outlook.office365.com
 (2603:10b6:5:333::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:33:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:33:17 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:32:34 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:32:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 08:32:34 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682DWY47687851;
	Wed, 2 Sep 2026 08:32:34 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DA09118122B; Wed,  2 Sep 2026 08:32:33 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>,
        <s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: Re: [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
Date: Wed, 2 Sep 2026 08:32:33 -0500
Message-ID: <20260902133233.3997540-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260902132838.2135551-1-m-shah@ti.com>
References: <20260902132838.2135551-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|BL3PR10MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d45cf81-495f-4eae-db73-08df08f6bf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hibvvHbpoVwGE4F7KNNuKXcfyyyqXAm2lttJ7KmSi/8I/tbgVdN2HadXMDHR39QWiM349yM9sckAoUbeNQhma4F0zmFrVOFmLOTDaXFFhgpyczea/77tCiPsLDuXdHxx/2PcVD01inBcdaBRFSlEmglUKLm7fY4WjS/ELnmttt5l8+kOA5Y7L8fd1EruUPs9hNae4L6RfQuVa+VNOV9k9RXbHepXjJrcSv2xwol6xzJD0CGG/IUtjxRO9vVsfa8aLqzkqiYtnozDFaRTW+QlYFNy+f9AutIj9eUqNwNGksoYJq4dYs85WWn6B9L+A60h3szUAeXRy1JwqrAs2CGqyPcAa8CB0HT//fg5uG2y+49aBryjdveQ69yanb81ji0j+pfGCmgk3k5CPtiMlkJMR2jkj6kS+mdl6bsVBIPVr19XYOHsBT7R9d1SMVevBxoyWCo2He6hWR5EREPJN2seXwj+YaGP9QdBkQ1JV6URQvj5bwo6ovo/Y6YyqfNwEHROVYmEJL+bDI5bbjwDgKlHkYOKLJJe6QTfI+0qCfHGTONb+14qMkqMP170WpYNbN87O1efBm1MHWzZdHajJf7CM4ElYJ1DWcYo7sEW7EWJruNLoqzrQoClXSE2MRbP969IM1piZOwX+gUS58bwaf2akQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YkTNJfg7FCjTb5IXv1dmG1Gu0nvmXbm/q27t1YUv3F/Pb0AY27zn2lcZM9TjZVlIYpFPoNRKbUOlPG0VolH19tysUYZ9hJ0oC7RBMJF0X2ZnRaBwSkOKOlahoYI/ijidlTnOly6vSUHexE/QbKYDioKYhzDCVzVAfY3+2Oy7X9L14JhVY6W7qXc4ny0Kiwc+MMMo3Km6tFrc6wdsroGyaCEheJxodENwQri/usFeU4nsQakZVEWHJ28wnt0H23jULi36sJSU1j0XQXoWz9zmE4e/18izUjm3KHE7nV3NkVWD0WOj8W+V1nBdvXkptw177uo6t0W5kAyiE0Y69AhYL2gZZ//s7LZs24teqxagW2FgVms/XZiryKxrFepo4f3XsQcSCEiLPedaxVuKe7nBCh/aiT5TvPOjvF61Ps0FYTE8INIQoyiOquhhyYfdq6NF
X-Exchange-RoutingPolicyChecked: 
	c4AvV2LmHdifrkUjjqiLXJgkRKdrTqfaB6OfwUgMgKpuY2p3NE+/Bykd6bIJS+bo4HwFcFLDqqgG2shrk3IEhhUZddJWxdbt47Sa88CjcjIJHJY79wDNrFKB3WnWJhi3avRC1QAdh3NOySHc5tJa+ggzL4l1Iz8vN54+/Jxus4RNurAJjjpNRlx3BxMJQRVQZNZnliNM6NCLDrLmDSfzXc5blBDPISnZG1qVwR/FLhjSC7qI6Nm67okoePnCtyRwHPpTBOpZwV3KaMJuu4aHHBdFVFCnchCAcVh2rQAk/xHWVqyh54m1IAC/mR9/0IMSQsVA9ZcbUt+Y1R+XDrgjLg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:33:17.8674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d45cf81-495f-4eae-db73-08df08f6bf9c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6188
X-Proofpoint-GUID: fD-CWzbfhZ_Ulp0Dw13fAvLlEgvTVWm-
X-Proofpoint-ORIG-GUID: fD-CWzbfhZ_Ulp0Dw13fAvLlEgvTVWm-
X-Authority-Analysis: v=2.4 cv=NPflPU6g c=1 sm=1 tr=0 ts=6a9825a4 cx=c_pps
 a=ReLZl+GdXdFt35wSL8r9Ug==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=oRa30m_iAvQvyixeN_QA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfXzukfiptO1hxH
 HnJBZRrmFxUPhYQwsVhj4gXdBzzqHaGa1rhDE1q51mFMvNinMEIS+e4onZuJPLuI329OcQg0jvt
 pX1oGd4bj1NI1IrcObwhDKemZjfhdrI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfX6ROqyaA/yTAg
 oYCK/o8DRX3fKWdpRUNn0MrtE5MGYnszTEVm8XAkXMo7pe5SUzzMByq8B3ib582VEPPWTpVgolI
 PonNLqURy2HdzDplpNt3hSBMTKv3fxWmKSQ9XDOsmjKK9hM+HR9/UUjC54GzQaRM5oxQR02Q9o+
 MV6NgGMp0p9svlPYocd+BCy3XF0TTs2w+4nz2Ovt4NwRwoSJRKuctFGixA8C6TB0a2CBXAOv1iU
 8EgXxVOHKi5cLTj3zua7wX+IFWqxoCFAva0FYiG1Z3fo5kGT73q/mu2A4Mp7ousgT5cFgqB0PjZ
 N7KxVmGxd5CvKRN2/xv5xjAm56WTCLRUrpE3Cm8faubphCmV62NHopzMcmJud974lINMlQlAx3l
 ykvDd8lbDeKhs859Hk++W5ZUL7Z30VEFff8WyvApL4eozNxnIHlBIkWiKA0KTSh3DCkxVL3Aj11
 2s8aYyOewQpaT2NjWnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020119
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 02 Sep 2026 13:33:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17644

meta-arago / na / 20260902132838.2135551-1-m-shah

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:86
            Subject: [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Wed, 2 Sep 2026 18:58:38 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 96aa2a6657c423398618f3fba7ffd61eaecddbd5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: gstreamer1.0-plugins-good: Drop unneeded patches
- Commit SHA: 0122872fbf4cf57798351d7d0ef8f9a6a3712423

Patches
----------------------------------------
FAIL - [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
    error: patch failed: meta-arago-distro/recipes-core/images/arago-image.inc:30
    error: meta-arago-distro/recipes-core/images/arago-image.inc: patch does not apply
    Applying: recipes-core/images: Build ti-core-initramfs alongside tisdk images
    Patch failed at 0001 recipes-core/images: Build ti-core-initramfs alongside tisdk images




