Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC983CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 16:31:15 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15750.1782405071791850129
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 09:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=i5wWa21O;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Z3WWHq0x;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFdBUk3618297;
	Thu, 25 Jun 2026 11:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rzbsiz5/PZtQAu/tMgFP2/DV+mW4K3+iJKWcgbC/d
	aA=; b=i5wWa21OcSZvNTZi/J5L0DN7U+etuShS9khchl1YyLCvqW9WqjRTb1Scn
	b3qsDylACB8PhK6XRsI4KftNvtf7xTAbMFRSKACcpJymaEQsCRaDqZemnAFeEFLa
	++sPIQnUVJ66HP0BNjDitWYr+H5s9OeHptSIHM2Tb8qAEr+VoAzktRHk5Rg3brU2
	drCagt99MOACxPFzBtWJQ9DHqBzIA3jvHTDqdvWLxlX/HWJ2SAQ94rBpCQclkbLw
	2Ir2WpKoPsoDVfL3HM5geKpm5k3s6DWRwy+AcKQaqwK4UTbV6Q5fasKaXgdGm/eh
	O4dH9WFTreZBuK/4rvJlBx8lbR2HA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011071.outbound.protection.outlook.com [52.101.57.71])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f12jcj7b7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 11:31:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmxMXiGYLyxuNNTFYfRDxooSBy9gTCClkw8nQjwLCcaJdHPnPfi4Bj/5SQgURGRIprcuaEFCJZqmBpRG1/JmytHI6nnvgEwtR1Gk99Kp69ejtLbOsi5EUnuAfZCD+bMkJc71G+8jHrXs4A1siAVShuwEEKWJqFqop2tcHmxXSbRC/+N3lCOWDH+zJF7mW6c+icHwZizjmOz7/j6iKh5ij2SkpRMSc0iLR6QtDLYwGEvB/cfPEfAoz3jKB79wOATA6dBH2QUpetK3EhYFV9fPYXYx4e0NBj1khyZiUGJHE6AGzFTCbgp7lVcQciryVqd8dwSYksAREZab+gBYhNRs4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzbsiz5/PZtQAu/tMgFP2/DV+mW4K3+iJKWcgbC/daA=;
 b=OwblxoKkyAJnrZj2YZ8cqNZyEAIzuB5VL3c2AhwrEdobZy1xFmCK+jL2NeozCClXWiPP1etIPqTsrLfjjUz31Ss8TCcSmkmln9vyCDkrrfVSd1Di0V9pWYZ1r951wQLJnFjCy15rWG2bDKTe6+c1ecVauQkCOM+UmyfiGY81TOjeX/RUIbz0q72HVIHLojxep60IGD9e9W3AeIKwFWps2XSHgW3lUcnA8VsnTlYlVamabxNz1RoJi5NiTOf4wkzamlL64ey+OyBIvwekVhtty3Kx8vagxfCGuGycfdUrTjtdfGtmTU7pQRyaLrFc4B6l0tXzQ/yISSu/jopEaJ5gww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzbsiz5/PZtQAu/tMgFP2/DV+mW4K3+iJKWcgbC/daA=;
 b=Z3WWHq0xrtx/qgGQVVkgyZaCWrGJ8zjDDGIclKtfIEmR27C/US7uHdc4+amil/K1WwfkPnx7x/jnT+WBbDTBDwsA4MpBVJFYnOgI84gbjwIXcAzCmt+D4dBZqbaTCf9kQHzGn398YyZ2DWmx5kcfw//ePbWL7hTQFntdepmlOrVBvJMEoeYx/MoKLFqHUnC5k9YpjflxxcXtx/WlAmoiYraLKvWPgnM1Y90vCqgvpmeGO8eP3KJj6Q4hRLUrERXU2Py/IJsu0O7lE1E/QnJ5JSLGfqfiCQxgKZXQKT3QPqc32mon+NQ8o9in9qeEvkfAEbbTQd/MfqTCdmjeivOZdQ==
Received: from BY3PR05CA0036.namprd05.prod.outlook.com (2603:10b6:a03:39b::11)
 by CH4PR10MB8026.namprd10.prod.outlook.com (2603:10b6:610:243::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 16:31:07 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:39b:cafe::33) by BY3PR05CA0036.outlook.office365.com
 (2603:10b6:a03:39b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6 via Frontend Transport; Thu, 25
 Jun 2026 16:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:31:06 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:31:02 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:31:02 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 11:31:01 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PGV2hm117787;
	Thu, 25 Jun 2026 11:31:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 34B319ACF4; Thu, 25 Jun 2026 11:31:02 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/wrynose][PATCH] linux-firmware: Move this to meta-ti-bsp
Date: Thu, 25 Jun 2026 11:31:02 -0500
Message-ID: <20260625163102.1311503-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260625155609.28414-1-afd@ti.com>
References: <20260625155609.28414-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|CH4PR10MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: dfbbcd99-0c32-483d-6d96-08ded2d72850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ocLeSnXzR6w4eqVMhnl5bWisVjn+n7oSTWAtXO98kQB+4W9vXlXhinIE8KTQtbDjDsXtkwtz0ZnBgMQvTEtUywolKM1lv20v3JHGHpuZ+Fr2lBJSuDwE0j+n4IxjgmDpwg8D43sZPBF7RkSdQ4YKrDRThK8NKaWkgROV+7dZ+Xw1orYbmgMC1SfFRuB3S9VsL6MZomE9vXjCGRobSd3OGqtA11YywCrGXYBZ4A/BKD9gfCOHPd8i8Phfe+v5Ct1QCFY9zVdnw9Ig9eRCGG+FdN/oYPu1gZhV7vI+FttRUn9FQKubKk7L7DGRi8UfFtJDEAHuvl/E8bAKBemoqOmXLEwMDpvhRcZDYU9TBkuUp24514B8/xArApIv3wAZSJTZ7EjRYLwIRfpRPKKAgU+kwEpoS2cKeUpUGsmvYrGy9MkN/IgiW2GeF6wLJvF6KEmHGEe6UASh3OjuFrNmKm7DomLu3nhrosmUxEe4VBcgRMygDiqfbXA7nb4TGtPmn67G4uHjpAaDGJnfwjteUy8HSYJwQTziMoKF0JBzcopGyFmbVtNYkhVaOEq4wtnMFhc0qXT5GTqXpICGuRAdHIRIxBISALLfqQhoJ/4jMrg1YBHr0Ecb0HmMW5Tj2iQFrTwQWhWh3l/+Jq7jw2lBLljHaglvEB7hudSTSkUHoDzG5P7QAJtziG/X/KKp2a1UVekBrgOG/9/scpooksfRsFVDVw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IKrHXZOjMLzvTZ/l6pPT9qJQHl4RecXdx7sx2yTkww+iVK1CWOp16TECSxA1Wo32kXudvzS16Hd1X5M+WToV4CbLXrAi2QQHtJ4VAWkEoervV3Ox4xcbmlpZbohqM6wkGXRD/LGPpZTmgEyMoGVjJG55V/ikhtG0IwLeXTWixHdldpTQLlUDCcnqffXBK1bYZjRwkOtNo8KrfPKfc6Q12CF9UXxuhZEZg6BMiXzcy1ae5mTliA8FjixfT7yaFgCEfCQkXidHmKYNnioNFeswg7Go8MzAx8cWeaK5c4++CIlyVydRFZOrAYupDfZYXERtPpq+if/e49fZNiICIXHG+PA4nyc6VUsASNbPhF20YMs2bs8CuTlCgaoH92cmiTUVSX6Yb+MqJ63dCvx2WPO+6I73Ysdzu1fLSJERx1D55tP3o4/ePUhZwNUyBNOZ3ABq
X-Exchange-RoutingPolicyChecked: 
	aywkJBFcxjkRO0UUsdqZVEXWCcNgJwCJE2qmjy7KON/QsSNwR+7y7zP0IQseJfNDDI6C2+VXqdWIbTO/6FMcIijMzeEWMFde6PKmZ2z9A2umB6qrJOoNAomv4LxGUniuA9n1Nikx83gn1cWUM8+343FkeD72/5urVtBZCJdO3Ro0nd4nwRmrHYZieJO2FLZfXPkg7SL6RcoExNTNUvdw6oBWN4FUz12DwDPfCmMXCajxGjOl6x36/+36VAKHVXgmO67Xkehapwj4QY/muWSkwrJlRokLTTfVvzSHM5MoHmwyx07xZeiYy4ul5M52dCPg49UEWaqapL1b1GP2/jcSfQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:31:06.8011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbbcd99-0c32-483d-6d96-08ded2d72850
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8026
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE0MSBTYWx0ZWRfX1z5EgsxeZjDR
 /G0N7nZToRA1ePxRIJXmTkId+SJz7IcvDuKDdGVSTy336ARMvYZ7BQMk4qY5vzG3H5D7y+I7niI
 JxnRy29aujnZVqs4zBHY1mCTLx9sygw/JUkg/dd7phTwsugl+bEnaWeTRWqh2E3Jv4h+x3sBmH/
 Q3tzhGOUCR4SLKzrCuv9VugEOmaTosQyIKtvc04quGgbbk4aRlLOQ05vDfoTdUsz6UIXrvdXp3i
 xRtCJcPo+WZddXA475Fjb6HoDeKfyE+ctZLOhW1MJdtsOJOqldw+ml0DIBxthqFG4tMZWQjq+V+
 QEbmFBO/qbM8yrNYXaxV00wXIXFaq8toNgG0rfye8hY2Br9ltF2SnJU1o8pzErbTpJZgUJiJuKt
 lYXHnbzJ3YN4LT1OC0ZEuj+YTGB8LjWmqqTAuUi0cJOhHQlGd9u0Fo6IG4rJ2EPoBozFqVRaKZS
 yDWFqHNaZnoxVfNoeDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE0MSBTYWx0ZWRfXzs8pENpUB0rE
 wac06WXFzx+blEnanblaDqLOF/57Ti49OPGDbohCRGxTerLA7XNwtyFO8pljjaZ9wwXZUTkrH0P
 odAWHFNAeYOS/ltIA5SGlf7gMNAjhtU=
X-Proofpoint-GUID: uWMlNyASYdHAMsOyKgFMCP_159_3Kvj3
X-Authority-Analysis: v=2.4 cv=WrUb99fv c=1 sm=1 tr=0 ts=6a3d57cd cx=c_pps
 a=lFLl6ekDlCbwJXWYbP8qnQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8
 a=B9qoMl6_YG6cw1pvHNoA:9 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: uWMlNyASYdHAMsOyKgFMCP_159_3Kvj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250141
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Jun 2026 16:31:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17574

meta-arago / na / 20260625155609.28414-1-afd

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
- Patch Series: [meta-arago][master/wrynose][PATCH] linux-firmware: Move this to meta-ti-bsp
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 25 Jun 2026 10:56:09 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 169c45e3ca8cf505abe379a1108a7c9214c11308

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: gstreamer1.0-plugins-good: Move to 1.28.4
- Commit SHA: b6ae6b374b229027b3c12dd96d53423431d8f1e5

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH] linux-firmware: Move this to meta-ti-bsp
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 25 Jun 2026 10:56:09 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 169c45e3ca8cf505abe379a1108a7c9214c11308

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: README: update and clean up
- Commit SHA: bf01d471b1c2bfce8d76cbe792314010a70b2927

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed




