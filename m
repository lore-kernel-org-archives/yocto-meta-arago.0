Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6177.1793912477307209696
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 13:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Z4E1tebi;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=RNTnnYKO;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5Hgjf51414140;
	Thu, 5 Nov 2026 15:01:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=LrOK3EDOurlHRD+J6pRebIiBMuMGloyCGv8splJn8
	q4=; b=Z4E1tebiYvmoV3UwPCfF0RuRxarXYkhoa4thrtHIT4Kb5nwD4YEL3FjSL
	iA4Qu+rUa5VHucHHO7E9jQcelE4s76DQM1Xdwt6LA29Ltz4yHiTHzmhKO5X8Ttmc
	NHveReq9iITk6Y90vSfm0r8vI1NcHCQ61iojUfZYObwoda/uRBal0hvMo4W5lq8V
	msKHGlJ9pz1ciU8G8qLBmxcaHbEit4RWg1iygyHP7Dyd1JFcWewbI8jtflw4Zs+q
	CYUHjR0fxZbjJL14Yf+OGYeESQtXEHMM27uN5qT1RZjLOF3qmgEpDIPDp1ZLmUPB
	jS1knzF7vFgBGyvhljWsq/G00OS9w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hrq6tm5wj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 15:01:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i29mh5Hsdh/2X2/NEz4VQPF002RJ0M+F9DNPP6aEtt9etVQRCWCwhxMYOqDuZpfUp1HPdK5MLQFNuZ0hBnpTNbH2Pyxu133iIL65M0eiUDlJvL9XwNCcY5PjAIDx9FllT5XmhuRecS30UU6JlXhlGdlB6NsGaR3nuCGC3KDr92tRcvGIECUJQRFYkT53h6U8LTJish+eCVf2+JDxiGizXwop2F2/VB3rjAER+TUk3obBF5S/ecB7CVwxPgj9LpGy5YDcDRaQfdp+03YLvdVLkclER5gqxbl6VZLemnxu0giAxvimGh2F82zXvtv+JuqBnUDIcsGV2W0iBS6Iwrj+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrOK3EDOurlHRD+J6pRebIiBMuMGloyCGv8splJn8q4=;
 b=rOGiTdt9k9c5ChHeH6BacIOL806Nfc9jdsfYrGrlalQhyfU78dOiDs6kz1Zr9zloZSFSrdTsBMEGm1tpmY2wDgVlc3bdT9nJ+RSrO1UYT2tQM/lXP5+/OS/GC/Bzn7obj/vZU1AKcYFkj8FWLq0StwmBpzX14Wq962BJIc5UB4/XSOpj1kBkfpGrv4Ppy5vMVsFydGSiWDd/AMhNdNXIeLxlsXlPFbEvnuswdQqrAWTfvmsXqoYj5cGDFChw5F2ObCsN2cXiWiilNL7WE9t2PnDzjAEE+bgKtvjMU6ZjiJV1cdQmmod7C/t7loJmg4follZGcLasht9DCL+ahnWwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrOK3EDOurlHRD+J6pRebIiBMuMGloyCGv8splJn8q4=;
 b=RNTnnYKO/5NlLH4EAWLLtlrr8T+gnTmqdv3TU5A8cbpVKdLhER0h7ykI8CjuYUCavauiZ+eyzhjS25rnBPJ2R26aUQx2Og3RbJ8CLj3RDom5/usyCmGwMqjCKowvGKrPt8bQmTPbGEJzKmjz+lIe1My2negLwWXHO8Kazu/sYppuydKLAA56ehHh4N0yutpkjHGpW1dz4rqiDfsRWIj7/HzIT5/2zE+vCY+hzswi9/u/xhPEJFYyOiy7Du/aAdE2yx1yxbqRBEayz7DHuiFzsIVyDoAIPZozLvHDxfzWS/rvsMbJ52+2EMdekGIdKgqkwXSyTP7NhL3Z6yG5LUVhyw==
Received: from MN0P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::15)
 by DS0PR10MB6848.namprd10.prod.outlook.com (2603:10b6:8:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 21:01:04 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::75) by MN0P223CA0013.outlook.office365.com
 (2603:10b6:208:52b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 21:01:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 21:01:04 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:00:48 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:00:48 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 15:00:48 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5L0lj63744595;
	Thu, 5 Nov 2026 15:00:47 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3580B9A9C3; Thu,  5 Nov 2026 15:00:47 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] libdrm: Remove patch adding extra OMAP BO flags
Date: Thu, 5 Nov 2026 15:00:47 -0600
Message-ID: <20261105210047.353846-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261105203726.1306888-1-afd@ti.com>
References: <20261105203726.1306888-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DS0PR10MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c6674d-24f8-475b-7410-08df3b7fe791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|261009223027099003|56012099006|261028144727099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: d5Bev0vA17jzWG8yRoJTDMN7fBgqUPoVW94SzhSEkNrxC77+LQg2rFrDa/z4EB8r5IujXERZJFM4CPSSMsRDWIzTPGV035MKzUNMZu6l8LjOljbiwAAMXB1k6+gRIIWWVcrRhzwQc/JazuCls0Slz245eeOLyoo4yGoJOCZ8v/sqpK7KuBhBBFUSwFLvR1FSD8UYwil1v0PV1mY6e68TMxUSPjgErVr+WsU4dpajZY6Q3STx4EJxyRVvHg3jGzkaqxz8tsG6xaXXpmPz2+OM2gMhxLKdhqepZ+F9/uyE/RrGB9Z2HKpMA7UGNTITo5UxfGqPIDdMI/1MBRfzSNEABBGWjqvPRaGyYSz+ihVy+9+2pfMwY1Iep5wUDOerwk1ZoUTwQi7eSRyAHh56F1RpeQItZsjEcybNGAp0uQBXRYA0Kb6mz9fOHbAV6kq1Z/QmSr4vtOWSdJQesXkarovGXwRMlUhFDx8vx6Yv+udcVbDr9RBmAwAUKCIUPw1k7zqs2Wqj2AyGpHdT2cZOymQZeT/kDcXAc0bmQDkPllqYJnQPlOmBPIgQ9oP0i3xBUa0WwzBnTeglhZHEoubxb1vBDagpPcjVNlrfqc8+jbkpfS9p9RfdKctFHTv14Hd65eKaxIzmGsgUo6hwLJc02/I8pfuYfRFoYbsMtm+SvQ0wd86TWmK8XSRNvs56o4Zxbf0KrQeZK9B/qyGL8F+1mNtUeA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(261009223027099003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VJ2jZf8gVNWoLkK0D6UUufoIJqSq26WVFhhCrVkN7+ndS0N39HDwK6Bm/uvr2jyQUB/Ufy1VotQju7gorI9Yy6xk1I4Qb5QAclNRe5ofILzFShZ8j9qpoeZmPvXyMMzECGSiHBdyJLUMxsGPWe9nRUN8ofkl0BNUD1FE1oYOVW7d1EbR1TDDJ9hxlk83iUoGRbmIdBygclMfm/Esq72DByBb7DwmjmDdxSEUTohogXJRTsqf0+qqseNlQ1yogPRBafltKkO/XMxMrgou5DLIb0pbzKt3ZhPqcSrwhZ2QM/+ak103GfHOPnzYALpz8HYbPZtzVMm3BV44iF6Ttjvk0Exiu2UyiPNEKvJbAuZaL2uXuGcSmSvExyh9sczBqRV0s7jC/i7zksuyyBAk7jJbBmm96rTxj5t+bLC097lEl71XUCkT+BSHMqR+19iXiKzi
X-Exchange-RoutingPolicyChecked: rr76+x/XozuJjaejYBkcKFqb3DSKnUG0CMpbW0sZFKZ771ARhAclTPIqyYxVOHvEX043iGgcInmm0l55RkVCdH/yAomv9N+mW0NYWBQUuXMHqrSDKPoIJNXGGyzD8YpYe+ajbUlOkpBzJGZgm+TtZEYTHeCNCe5cfwxPcffX5NESfctOWlznetxWLcQx7wltLuED5+k2TcNrBCAwVJgeQWHasWnm3+A11gtvxRLfh+HZKKONflVHypOtIZKGUlMdkN/r0Mz1e6I/zAo/JLmyEgoeEj9aYV7ZcN+G0VFQVyhNcbukWFIcpGjAF/lWuA8uAxkkmbyFO7sOelXpw6di9A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:01:04.0582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c6674d-24f8-475b-7410-08df3b7fe791
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6848
X-Proofpoint-GUID: -skwzoeilVBTFqwBVGHmjrdMrEgrZQcD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfXzWgr1jGLui9X
 9FXgiTPB4uPha3scBL5WK2S5KSYGuQ5BV8v1rvoZfkstkisSq3jo/ToS1eqm6sMkcxuP7YHqjZ6
 uy0o3KZc0EqFNwxvxcBDz4HPWl8EAIQ=
X-Proofpoint-ORIG-GUID: -skwzoeilVBTFqwBVGHmjrdMrEgrZQcD
X-Authority-Analysis: v=2.4 cv=Q6xHcI2a c=1 sm=1 tr=0 ts=6aecee9b cx=c_pps
 a=audpxvcsMtk9YILK9bmPfQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=TQ3I2iHqvseD27u6p9IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX7RtF38y/ACu3
 v2S5BSvKupJFzXddcWVNvqJammLFJnfAii8r7ze6KtA53mokl6dsC1M2IJ05gxW8PBHdyHDrzrq
 DH5YBOjpNDkWGrZtuLKs0/kr39V2S7b4OKeRYrkOho46DAIrlfjqH11C9hmNgJ8mI4i93estV/0
 rYcxU+7SZin3fe0nAfInvyTlYoxWCFYEp2T7W3j0+lbBHLgBEb3SJAvjHhaIomEB5H0URVEeygD
 F05xOkVCGuuZpDEFvZIo2LXqg1W+q8DhK8oHToaVZEtY8YeQvZ4a6/W7NvQcl3Df/6tT/P1tlOe
 q8/KR3MnUO6ZD9bHMtotGtwJC+NnnikCrzTaekRSNoUOiyUCEQdBzGSIMlU58dWfvbilahSrMgf
 eaP6eD4KYOboAzYvnd3t7Ata1QwfCi0V3R5VxNjpbahAHpz3Zwew/cqBg0E2ktmGWw0avjGB/yh
 oxuXLGv/SPTjDyVocaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050083
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 21:01:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17769
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261105203726.1306888-1-afd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH 1/2] libdrm: Remove patch adding extra OMAP BO flags
- Submitter: From: Andrew Davis <afd@ti.com>
-From: Tomi Valkeinen <tomi.valkeinen@ti.com>
- Date: Date: Thu, 5 Nov 2026 14:37:25 -0600
-Date: Thu, 18 May 2017 10:37:11 +0300
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: ea69c75f39bdee1852084cbb09f70443cd1742a6

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: tisdk-bundle: Remove unneeded ; from *_COMMAND variables
- Commit SHA: 4b006662694490151ff274a7042e42446f2e9268

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



