Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB90CCA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 19:16:35 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4464.1790709388986882349
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 12:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XmUp7cFW;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=mgdyD+x/;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGLhe7486829
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6A3+lYx+oD/AJhJ1xAfw2sj4anf5hAeohGchem8Hf
	94=; b=XmUp7cFWKeGBmNwaYIWRUpA5eW7mgGovXKda0o6xJvP+aIEQXakWlYRVd
	3qTk1YJRKyYoYMG9rV9kKD5i5iaguYliOOwx+gUT9/FvUXDZOOTkkZSkOc56yIZY
	NPu8lnNmX0Zj6a5li/0NYMIEkUSUMwWAH9Go5vVNgoNVENAUueQBDT2x8kqGubeE
	VGq/QouJt0PygeUMmlRVijq6xn1Fdlc/zbHgiY6WzaJa1aRjYqLnH8/edxNjhyzg
	OpbQvar5z2CAhaNGbzLP7bE+jAQ5AH0dZza8IzkDyQkFr3vgUiy+DDqgmJt8/Ztn
	bVniz3kSQk3x/3NaVm5c/msj0AhJQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010018.outbound.protection.outlook.com [52.101.85.18])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc2y6a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:16:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOT5hLYwhSuOkFqKhQdlVzRQVA7LqjHYrmIegkKEo99BO3B1UT8wr/33KLL9W8UBF5vqfgOKgM9gxp1z3qCqtN8NFmARIPStzPTRwWAixadgs8iGcxUkv3jvicB4RE6vj8ClG91iWpQp6SDvRYguIOh4h26Q6e3GSj0B/wt+HN4y/F2mz+B3h6B8fwwetzuqngamT20NPypl7tRZk8TD64ViYYPSSIE/N3IEwujifR/5jBybhbTmmjOwJlaNYUogNgq9mXejJxeS51RsIivxuqKwzbh0YoELT/djvq5Vqsw/bjxHpa8rNbje1IdnBUNiH46USPo8EWJWlEjrJoH0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A3+lYx+oD/AJhJ1xAfw2sj4anf5hAeohGchem8Hf94=;
 b=d8z8Zd1ItqF/KRY/wcxdEp6DMRsmhTxVZDZlj33upRYKzbsK+pRDF2RZNnWgkzvwvgPlod9coruhQmNzTBkMcCXKF84tQj5vaM7gxiwDjZdfXZmP6Rfnkeih0wlhMU8p8x0eDPwcYtkHwxH9smoQmOiWZIR786s7WxwGPXFxIjV/U4+uNXG3RpVcwaRAidFOZSji7hKCuRGooPV4SxfNSz7WYNYQdUeBwZpxVX36z1Itquo08eYPAzSHLoXY3NHErSo4TIQJT3bN7LW7jDdbW6cf+lSqol4rWLWhCxfMiWaPyvFAc6ziQVqQRewOSigy/GZ1ZIVazmh7sN3Dnx9EoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A3+lYx+oD/AJhJ1xAfw2sj4anf5hAeohGchem8Hf94=;
 b=mgdyD+x/hwrocWwLe/7AQWEzNcwCGPsmiHYK84UmfAp1gXtcDaDGy4FPC8+zOUdC287dlofnpjHTRin0/3XstORbTE43TshQzfqa8dTWIoQFswgrLRWWmi5i1lROB8WxNGPRbZwGNwz1iTqBBnlecizy0VX2Nt+WumlbCsCJMELtGtPvJgTz081/GIx9OtekDzRI28P7FZhU7qHGVaSuVl+J0a+UD1SOouyZl8ySV30uqalPzsG7nMHRKONV4XgUc+6MbdYXe/IDUDbbIk8mtjHrmZc8B5BqqndN/L9BtALNmUBpCqIT2h6naP0aSYOJGbxylYdCYGbb4jnJyMC3sQ==
Received: from PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::6)
 by DM4PR10MB6016.namprd10.prod.outlook.com (2603:10b6:8:ab::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.7; Tue, 29 Sep 2026 19:16:23 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:510:34a:cafe::8f) by PH5P220CA0008.outlook.office365.com
 (2603:10b6:510:34a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 19:16:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 19:16:21 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 14:15:35 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 14:15:35 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 14:15:35 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TJFZSh1643136;
	Tue, 29 Sep 2026 14:15:35 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 928D89ACF4; Tue, 29 Sep 2026 14:15:34 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <b-brnich@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v5] meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards
Date: Tue, 29 Sep 2026 14:15:34 -0500
Message-ID: <20260929191534.2522147-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260929190849.3465293-1-t-lannynd@ti.com>
References: <20260929190849.3465293-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|DM4PR10MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b6a6cf-2024-4000-d6fd-08df1e5e2557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|13003099007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	7sz3WYrO+HXVr6ty+KBcsFf854JPahTDozK7wtTme8WIp6/U7M5CCGwKRLkIhjKmP8Y5JbKkIMoez7M+HTSxjbDmUzEvugmgl89yKn9lkIU7zy3KsGx3Urdr0DgfZb1Q7Y5cOs2X/B59+HXeuRaFlTZYCLl77uMVpMmSThQpPoE6Wsw97V0XRSEBFLn6dDcWjOaGIUq4YukRjBhYZApgiEirpQgUT6HKMGlzmPMXH6xcY4N5eEwCEzCIOn1WF00zPKHKM5yzXXYVZaCCfhAjSGwEPuIqqwyYO8PfXRGyO9PwbK2I//hnPANnSImhtpRDfnRuxd8oNRuhzBoP8kCIvP299QLSfEwhY4ntYSz7dAtqTrhoDstR7H2IhIDvja4pUKUju4f0ccf15asiectXEIodhw/HBa38bD2oQNsGJq0oYiIFCPk8K5u0WUxhAInFt4g2xsdz7sFKFzLvK/0zDnwObDZDtMG4BHOj7cgLEhKU/Wp8RrttYBTeSUP+tz3fPpdwadM2DwwBXm7FuNZ3NZYP1wABOBOnEP8BqYRuyCFqNrOAXShBdgL7Lp+nFvSjba5y2DExW3qXYu+bJKttnWHh+GF+6iiDkkkU8Mz9LVvQq7nEw0k3BcCUbleOpPtiQsm0uBf/w+yjyJZqiCSwsw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U+HMiGeIS04L9VB+Cm8IYQltwd4PXl0/Qf9p/8m80vdOC1wy/ipEa6GlZgz1/PIdEUgXRpTSYcWacMAYY12Y7xLJxz1GWqqx8JhddLtj4PrauIXbrm9LBx60y/diBnlgK1Xs70C3+OrU00zZvfCzhBRdAYClMf+U62jbgU+SL2kZ2xYCBTtOxlTQehUb0VkqHMU3UhLs2JLO4le/iJO6JvIciZ0nVvZgW7HjVkOjTGcAp+x1v/sz9NOobwTK7lbEIsxZCXLf2Fo4sI/uXFau94ypht+WQD78xFinx1hwsjjSJ+qYQ6fRGz85RwmghhkpGbZtnzUAjMTSxg3+7wfHCEp1uTDaMnKN33d3tmt0NyREJgBQm1phpVyAx+ozhULUe0KYKNRuT/VGOCowgonA2mDSH/Ehb1NwBm5Lh0NW+M74l1NpRxvkzXdBsQkfMcMX
X-Exchange-RoutingPolicyChecked: 
	AjG9UK+6TXv7Pd4CmlM7gT3KZjrLwhqB3P95Oyw0YRMlazGjp45Gz2D47wPZZfFVDHtdPfvRkPbVE445hN6XbL18bndva6whpduT+/ipT9ObRPLyaGkdyAmj1HviJDeUyVjT0GQI1arkUetO41p82EHNKQpDJxBs6VOMC/JxODvBOlebYQYmoKXat6LUs/5uV34raemEJ5QlCfJ5uRyeu0LGkK0lM+/qNChHzgknSx35L0xsFaGkBhKPGuLDSVpV/8FpRVFRwwWgiMOon7aQpEEDfJXxi6VzdZAyboY9ezF9jrZiiN2VKZjH5JQUuVGc02aXjscBCQhNogYG8iKcJg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:16:21.0971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b6a6cf-2024-4000-d6fd-08df1e5e2557
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6016
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3NiBTYWx0ZWRfX02BndNrMUbFc
 2INtzI+Dz5674t/6EiyOGtqJTVCAPtINUYr09WkZYpXQ8E/c/yT+Dt7/u3VVTzKYyxTm2WkyFAB
 QAnsDgsgWywpX3ujHQlcrUkJp1zgsqo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3NiBTYWx0ZWRfX+RKiQVB14/zW
 tWnSEgG8JL3Io8p/Zt/dU5jrsIyZgHSF2tubm0mns6Oov4LWmc945SAW12A3rnnOruSrB+brpOn
 63OQwA7jZJ+Wp4M7sS9OIAo66AMBZU8O0et37OMsGZbW38vc8wCLp8Kvmb2qEgtybkVMOGq9Zo3
 fVn0BU4XxJilBypLXUbvseXv/hkBpNgH0GnWO6gT0NxtyZr0VDgfPflQz4WpY6arRHoL+ZgLyOz
 GD52WVmqrn7ynX/SBVLWiDjcfXG3NN0tyav8nMvY3UxyxH8BK4rDbKeC/IeluErhsLtmSyXMnPX
 ac22xpX80nh/ROvXIP7fs4M7xxtIQAyNxFNlNazZ//1aOqt7XJVj8X6xfBqvqxEMAOhwJskPrJU
 gq7fliNfkl+z7A8zN3WJxIbRkQW5qMb/gcIQKImjybKCpG943q53y8W1OmkO+G/flMUFRlTo9pO
 JjWFmidsKqSYyyWHxSg==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc0e8b cx=c_pps
 a=sq4e4Hzo7GxV5rv62ORG1A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=HEkR33bzZac9dC9FEEIA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: FQ0zDiHT40WJROngGAxxnrAjiFAL5yg-
X-Proofpoint-ORIG-GUID: FQ0zDiHT40WJROngGAxxnrAjiFAL5yg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290076
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 19:16:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17712

meta-arago / na / 20260929190849.3465293-1-t-lannynd

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][master/wrynose][PATCH v5] meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards
    ERROR: Commit message too long (> 80 chars): meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards. (COMMIT-MESSAGE-1)
        patch:85
            Subject: [meta-arago][master/wrynose][PATCH v5] meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




