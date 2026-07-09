Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E080C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 09:54:06 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5558.1783590836806237998
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Jul 2026 02:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=D9OuTnxM;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=vKyYGQLr;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6697d4fD436293;
	Thu, 9 Jul 2026 04:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8Y/iOBdIJYZgZYKFCfTGjt+3/5jwqKhYdF2aT+iTv
	+Y=; b=D9OuTnxMt11RjSqqPE6lTUUjFHd4ZrMeiYV73rTvEXRiChdgDRnfi4W4r
	J3ugczyABpP/JAIsrskwAnKh8wEV9ePy6lolHyD4P2f8X/PEGi7YpDrGjYPLxHRh
	xhaRxMqgQN833xLZ4+/vU5/wCsjSR9INnzoLhW79sWO0mp93+MOXTN7Brtkh03sM
	8tx/pKAZp149+keUUPGK1cNj+m1m5sjjgDtXqnmXfG4pbQTWkY6iNemnSB00BzeQ
	un7dLp1yBwHzl9r7jcCCBN4YUeXIPUJP3mzOcGlOe3dfX+kRo9uZb4KK3PffarJ/
	U6fud6BsmBcg1VjPwjHCzvc15TxwA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fa1962xvt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:53:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e38vh1VmNOi/wX4KwSx8MZmkMTMoxuUSgLec9QqfK0UxEM09lN9TA9/vdVRYcNU93Ccvl0pexTmQiwE2f7zSpMxK4g/itCetvgNwLuq42SJjaQEMdKVOo7jL7ZoKYopX4J5X8lxTQk272j5l8iGnRcWkHCs39K4AiAFIYNno2fh1Mbp/J2sxurKOgAjsE6ujODotdTlK6jqTPW3rDtlr+/FwgwtV6ROJine2Hrsd29AGeBKDPC9pHnbqdD0i97zUXJvm808WwvT+LloI+vN0TkI2hTY33cr1KJEB/NX5Lv/pP11G4WUHq0aK6sF0cKvqRDB2c2jg99LQmb34Y94FHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y/iOBdIJYZgZYKFCfTGjt+3/5jwqKhYdF2aT+iTv+Y=;
 b=x3YnHGlYwBMuBO+UgAolyq89Tky77qa3sby/gmWO0H0PA1iONhDNisvK+IK+swWm3GFx2exmPbGImH5r8vC1fr6RVZ56HaUUIpWEltoBJoicT7a0+Pmga+lXfL3tFHErwM/J7sJDVDj9MXA3uy7DLMvLIVaBDqvnz5blL403+1TFdW1n2U/zQ26iGbHJw/0tMuY0HCnm/HKWNnTlOioGPSTx+kAjSyE5y7FnO6LyeYRwxDYnS+KOICWQUMmCZ2Max+teVrsqKSpfIN3Y4WcAAJP41iP0CW7bRk7xJ/q5veYlGm0uh6HAZ8oTbx2BVxqVBwbJoKxNeYsK14/juiKStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y/iOBdIJYZgZYKFCfTGjt+3/5jwqKhYdF2aT+iTv+Y=;
 b=vKyYGQLrOlleejSI+XbbxEFuUHpOE/zM+dxlPoZW+CoTlro98c0d68Jh6vpUQh9VMG+upkCA+ea0YaL94YVCeRPme0ai79qmzMQ7fTo7Azn+essmjUEa6MO1tbslR3obvP3HnZ2aMMqkC8aJOO2aoWSqDvQTLtsV761DbozwfpvGFmKZ11OlRSG8Jzs/jN5YcwG0Y+dtZ8DtSM9B9UP6Ab3C2Wt3TjpUdrfVsVlum0L+iPev57ZASDDNIprBxiH0W4tNWJnCQ9g65QC+XFbO0ldOauWJU1Ke6c1ZddJ9P1UH1+20T6YMq4f4m1t5PoP7XsEwOrFSsajUTARQH1RWjw==
Received: from MN2PR14CA0026.namprd14.prod.outlook.com (2603:10b6:208:23e::31)
 by IA4PR10MB8634.namprd10.prod.outlook.com (2603:10b6:208:56a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 09:53:51 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:208:23e:cafe::6f) by MN2PR14CA0026.outlook.office365.com
 (2603:10b6:208:23e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 09:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.0 via Frontend Transport; Thu, 9 Jul 2026 09:53:50 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 04:53:45 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 04:53:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 9 Jul 2026 04:53:45 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6699rjwe359792;
	Thu, 9 Jul 2026 04:53:45 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 8B2C4142E1F; Thu,  9 Jul 2026 04:53:45 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
        <prudhvi@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>,
        <denys@konsulko.com>
Subject: Re: [master/wrynose][PATCH] systemd: drop 15-eth.network and consolidate eth interfaces in 10-eth.network
Date: Thu, 9 Jul 2026 04:53:45 -0500
Message-ID: <20260709095345.1185416-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260709093141.3785706-1-y-hegde@ti.com>
References: <20260709093141.3785706-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|IA4PR10MB8634:EE_
X-MS-Office365-Filtering-Correlation-Id: a1af4fac-f227-49cc-a5ab-08dedd9ffac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5XjlV4UbJx52QsW0RXUduB3/v6HqMf67cWE6A9hXbl0sTiO/LjHI+u3cTqLArkU8ftIIAy9+S09x8DqzO0V+uPHveVGioAWZ8yZq1rOucOxrDAb8/QxOgZx1DC+CMF+nIdLRDcwIoegk6DoDnMTjyNXuUYNeUKG/mgADfmfy0wQqk2AtRuoKoVDLr9tEWt+okvlx/KP6iJSPkjoZREfgOGbYjHaEfAcDdoNmVwAMs0e4eeO3xAePagZHEp3YDpqjJNwsb48oak/2NonSFq9GnF+QXrYf9OSTnjo0sdajZmc+qzq6IIxYpRHfypR1HebR5Bo6qt3tmC3pIOhS9CnoXQALA0V52d8UcaCi8TmV4V3Lw3vCSX9su5T8IxNK68oSXIPV7NiPpAD9mrmGDWknAo1wine2AHzV5Yhf/g+rRDkkSiUq3y5z9h96Thv9WI4cPMrSvMVD5PavlqJMT8y904IvxHjhMJLpxh8sHdDuxSakhz2zGIJ77j3rHTVKvZrQUK0wgBcCsZLUo3F6aEbO9IeuRd8wgFVv0NRrPpoUrm/7TMbmSCRfusiY52d6mykfqDfwiU/ym86N+i7LfnjW7OKqII4JldaKkT/bG69RRMh90c3Mtl9J6mAAOe2tDOBTRhHiMjZGc8i991esUNJ9Z+dHFTCKlinaIAloS0+2Z+NT31q7DW0GiM4YwaRk3CyACbS8XQ4aoZDF+I4gZh93Ig==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IWuGqwJ/B/FfpkQH9R5OXLuYd5UqF3zFteFcWAbJxmh6Lsj7pwPH0Y+DXy0IUPwGJQCVF26UO8BEFXlzhcf11zeRF6eoOSDAE3dOIrb6843bZQr2CJL9wWyp0gH1DALksyyFWPrbj0ieLw6oGsnckh592IaC5Owlz3h60S0Omjj31UdIxEYJtC237GQ7UnqyLNn3oVlNvmqDccP9CzQvloxs1Zw9c1UlCqDkOE29UVYuUXlQHNwlzTAxaQveiu+AmNrz5zKAUVbJVh57Mf9XERl4liFt4lE6kgfe+d44wo9hPSagbGHfYo7u+jnah5LqCxjB1+fosP3C/H3rMjNKNJ88WLjJ29V4UPwSlbuBRaoLJWwH5yc4GpJL2nnl4xEK7hnJslomdkzq5HSR4dyOsBO6pvm0pEVdSNWUfLmAFN+J/IR7qoBBojYhbq5qe3DZ
X-Exchange-RoutingPolicyChecked: 
	cU52C0YWH8ltgxfopw4uS/CyiCl6seQEAkkSLeCpBlWbiYioumtR64EGN2y6C084DA/W9OOy3Fe4pGNFuhjL7jQdbDIBkY8b/PruGOGNZeCdaKzc4CG+pd4yv48Bcc5U8uAGBDC2QkzuCCRrRR29QXKYMwmPe+oqVdyd0S8Oss4wcwdh83NdCk/LiA6nQgJ9zd1GemeZdYatOcwFXY3FUM7VjJ0g/t9QOpqYhP99RXGvbLR4y6mKJVrAHNApxy60XTIYcGm4pVWAym8B6hOePeo2ScH0H7Z63ZT/fG/+tSrDh5X8J451Rn8G99fM80UnjknwmcFLZHrnr1nVP11Jog==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:53:50.8689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1af4fac-f227-49cc-a5ab-08dedd9ffac4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8634
X-Authority-Analysis: v=2.4 cv=Q//iJY2a c=1 sm=1 tr=0 ts=6a4f6fb2 cx=c_pps
 a=/dw4gKU6pt/qT5+OabM4uA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=dYe-Jx5wqS9TZ9zUEz0A:9
X-Proofpoint-GUID: WHslABtzxoKIzrhFyYU6LcjpY5TBO7oK
X-Proofpoint-ORIG-GUID: WHslABtzxoKIzrhFyYU6LcjpY5TBO7oK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5NCBTYWx0ZWRfXzaH0MegGIbuv
 STnlB/6VzlHeFp5LsWqy82xfn6ely58yeqEndDaNTXFvgAkkSqHRZ8rZsUNvfU4lItMSpeYjglL
 S7vpJ0P2iQ/HahwNwO+X8Voq37ggXTQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5NCBTYWx0ZWRfX3u/bTWAvXoyv
 wfdX5ec+j6D1Way+CCwDtpLB32KGpyziAwnFjeSVj/GC+ROzOUolCgVSZ80P1U8UwQ1bOCU10/N
 UFiboWOmg7NFtWHkb1XH+sa/oOon4aRqGActxjQRL7Tctno1U9mtRehLpibzQO4jy1qmHv0f0X2
 RuYz91ytuRkkJTOo2kRMVWpHiDPs2XlimNtjTHk0xAIbRYMrpbbfc222jd8SScdGSa7YIkWwWts
 6V/Vov3O/B4qX5W9U/TAqWM20hG/Mp6iS4x1pKH+J0I/3kC6uiSEvmChPhZy2zjHffsmFfkuAgd
 L78NsfM2RpCAgDERD4XirF481CtY4YuCTwdjbO0cixhmejHtelyDvEAjewLOGwav/8HVvTt8Bei
 /gNupL25cnlf3cOq7MbVctFAMweEAJjKNsYuf9ESvKog087sZjr+en9dUWg9zT3VvE3UR3y2/po
 nWse2o3/qjBxUOs1h4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090094
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Jul 2026 09:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17587

meta-arago / na / 20260709093141.3785706-1-y-hegde

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
- Patch Series: [master/wrynose][PATCH] systemd: drop 15-eth.network and consolidate eth interfaces in 10-eth.network
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Thu, 9 Jul 2026 15:01:41 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5b0676c4b6f1eadb09e3ab1fe881ecef3b075c45

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Rishikesh Donadkar <r-donadkar@ti.com>
- Commit Subject: yavta: Add patches form embedded metadata capture
- Commit SHA: 7dec756385e53bdcc50efe2d5e5bc72a802681a4

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] systemd: drop 15-eth.network and consolidate eth interfaces in 10-eth.network
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Thu, 9 Jul 2026 15:01:41 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5b0676c4b6f1eadb09e3ab1fe881ecef3b075c45

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Rishikesh Donadkar <r-donadkar@ti.com>
- Commit Subject: yavta: Add patches form embedded metadata capture
- Commit SHA: 0e9d2a1627f91f05159cdb6a2fbf70197d574783

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




