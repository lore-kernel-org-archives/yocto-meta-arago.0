Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EE8C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 15:02:05 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.549.1790175711730452670
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 08:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZVo8VHg1;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=G8ch8Dl9;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDQGVs775625;
	Wed, 23 Sep 2026 10:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4083jVDTjSA1hoX0Twxemj1wiI1T2BVvser2qefzQ
	nc=; b=ZVo8VHg1Lsm8ukKJGYekMjpJLnEO/DaCSbBSLB1lMmzVKwEL4onWq2e4/
	KsJteyfDsfJPRSD/wiAqAdPl1rzfNUKY2YxcclIIdqRSxvaq7qwe6VxgKg8ZvPgu
	FWxt3MQgAEfFW6OIXXKKFKGe20sYt4hk7HbQil0OqkOGkZ0m04fUc+lQ8HPakRr0
	W7boZ6C1ksNxCHCGwGX++XdgwXZdBHUbCKzYDMm3hExZSzhCr8FXrGfUbwJ7k8o/
	PJdPP+2DvN6l9rQbPvFypvDg1dvm2rVYpvgqeeCvSBdPXehnd6H4en6zsvI5J2ij
	hEOJxIt5c88VhF9SitgKuNOkM0NIQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010009.outbound.protection.outlook.com [40.93.198.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycw2sc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 10:01:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXL5M1AtcrqWx5rozkkMs8C8sCKGqBwxtwFiFcrYrQ5om+TiMG466tK/wskpNUz4OR0RQfonEgm+K2j52V5AbatS2aiuWbqLCisfPskEaMdEzcgu/JJEOjJKc2IkSA1pk1x7cXUe/TOkqqbRmAXYcnRVm9IZGQ+dZ4sGSupMm6vcW/meBlenEvCHNrRLl7eow6vc2Qis8YJAXy/GivULLP31nkBZOFZRDfRnvzjqMcHc/OQ9kPaXsIcln1SK6kGn2XDCGq7eEbvIe3lw3Q5BsD8coIFvefiW31eW43Ad+pJZyEVYGVYFw/GHcOURclRQXZ+6hTymleg7cQl6dfw3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4083jVDTjSA1hoX0Twxemj1wiI1T2BVvser2qefzQnc=;
 b=yNRzKFZKLgePz+6oodCwvTAr8rkxZtuwnKvCCt/yU7HBQ14PzN7TeMOCwAJPMmQjQfRbvjKxXwP33Tz7g5MtS4CHT1tcFqA1yxF9Hhk6pXOT9c+31vsRM0qYaFerhog5DAqtsdx5zP6RYhwJnoOXuV5B+ce88GrEUMguOf+5R5BEOu4PiHdVkgWeiJvrJ+0LaGoRBsgrutzJCYHxi8Bu+TK+McfHZznLkrfHN0CxDdxG84wkyp1cSfDcwDYF/OHZtFPCOy+91RtUXb9ncELl+8L+itLSW9iAbS+NnINpFJ3HeHwvACOsQwj1DUzWIgJsXI5iEYf9tpoupTN2qCcbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4083jVDTjSA1hoX0Twxemj1wiI1T2BVvser2qefzQnc=;
 b=G8ch8Dl9z6ySkyOQzzwFEmdgJUcBuwEFxCc3QYzVFGqirPJL/7RHeohpomdvIHjZG6MBmlWZHmDeBOzyhirvZhQomV5i/ERNuGFZtBsAyEnlob0LZG9eQ6fR9B65hHLRbM6CYDd223VRanOId/k5YHsRXgcEaximkvHFhBKayP7RGPzuEHtwIzthzJqDuezPmFJiCvD6wE/Z21t13gMISDUDt/KXaQkkPPqcTpr9b7fYduORC7tlSpxe7aXcihu1zrJqxmmrhdezbVV3+k3pip/MPB2RhFl8z38lVpSe3j0PwAneor9nC9zA7vPmuCs1c2m9Ad3fBQvpz+Dld8qxmg==
Received: from BY3PR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:39b::27)
 by SA2PR10MB4651.namprd10.prod.outlook.com (2603:10b6:806:11e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.6; Wed, 23 Sep
 2026 15:01:42 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:39b:cafe::4b) by BY3PR05CA0052.outlook.office365.com
 (2603:10b6:a03:39b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 15:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:01:40 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:00:46 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:00:46 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 10:00:46 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NF0kH22809463;
	Wed, 23 Sep 2026 10:00:46 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 73A699A9C2; Wed, 23 Sep 2026 10:00:45 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <denis@denix.org>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <reatmon@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>,
        <sen@ti.com>, <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH v4 0/4] Add PipeWire audio stack
Date: Wed, 23 Sep 2026 10:00:45 -0500
Message-ID: <20260923150045.1405001-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260923145543.2140007-1-p-bhagat@ti.com>
References: <20260923145543.2140007-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|SA2PR10MB4651:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0b1a5d-1d3b-4d11-251d-08df198392b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	n2okiZQsgb1oeJriWXgPxdmjRTxvNUwuDtgB81pD87FnbbC4dwEneTJA1wxvUPqBDUJS8w07mHQDw5oxZKLUv8Xpto7eEs5Arele8kspsJjmIu7NdCjk+bdtU4K3FuNgVsUj5QqzL2VaQoZCKrjeMlsBoM8Fcr/kJk1NAMAQWd5gBwsRBr08N0qBXgWr6dFNesRpVGWcqgSylT/DtZSVL9L+QAn+eNyMzbbZBk2xoPvjneBf9zxXxa/1QmU2PgdQfjGjR7UaIer4p/QSZ6ZXgN6HmcHB6iQOePtjbbPGzAvMj8Nn4JRYvtO+Hf4yOU+DlfGMZ+hfkW3jU5Gcqk9xQxaFnxzjya0LYs55GwtigG1h4RHbb4pSUzzKpszVrnmqQ3dvsbyNJLxO7jVo71Nm0Hhi0qUikt9CRhQTUaA6cGvLK0YrG71fLW3k53re+XR/GiDG+naWZMPdsYeokSkB99j9Oj5NQdJV5TygH7NocbQHiXI9bLSRSJpd8ldMUtVNCk8g3ey/dph6ZGUhOedqb0ZXbu/Y2WNmSwynz9Fv4uZEFjqkNNOOKXMWtAFFiiw/NX5oPCdVc/WxkTz+LjbqQ+m+vWe2CYibIHkNzXzC3kq8ufPN6vv6r6a9VNFM0/O6KycPvVxEev158mRv5Trw3w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wSOc9jsDZmKbDWXeLuIR7EFavUCNltBgO09hJVy9F9tS5HUa+7VgCalfQKC+8lQ1p8QtWSTo65q3IVAlie6Vcr1mtX50Mhy8INDGNLPIhcCOT27o57h4QzbPn2jOHDoxVvB80MQ/HYW0teFg/GVhfluX1+BT4p0K02ZsLEQv18Uhz5VsTSX/8jHwSfze8NCzijaHTTN/d/za89OSLunFYxnWP8YavGJ7YSjOkY4ay+fslAEFa8qEh2v47edsEraZqu+k8sRXBsn50GTMCipPfUZei7G9A2/5ZhML1dWlgGrSltZpM0HqHb/v8r7Q9FXYmZLslFt8o9v3mw23SyIumcLTR8bWFpxrnjJkgP36xKHPMwieIYMLQFV38AVoh/aQE6oxM8vCCzaHUsc452yAr9WrGnmSYzfrx8uxeCCMoYhKvGx31jbakMCfORPKKwXS
X-Exchange-RoutingPolicyChecked: 
	KlF+zFPa2qnHquasiUhWMsnXLJ6fjJ2Va866l88u9qXmuJ3xRo+I8yXrUYJ8QqvFnx4EUXqhLA7cxanFVaG/KKnrzLrLCnDuW/7HGSaXU8jAPaHyTC3uancMuAY8hMYk3jWImrLsOO9DULjrSD6M3mWOwPIPtDZjzLA/CF3B0iSDUXU5GnbtITEFj0TcWNjUuumwp+dgabU7PkbaBvpsS317FgyC3pblgdxFeyV2KDADBR5H6/ibEHuoAPjpDSyV0nWt5KtTzNL/jjhwt/+s/h1mHyY6GmhKh1+0auxsGKjQBsvEh6RtH2dTRSppDBfK9g7i2Lr/OV33zfpc0owUHw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:01:40.1413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0b1a5d-1d3b-4d11-251d-08df198392b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4651
X-Proofpoint-GUID: nvkmdn4qm32DLt3WkAkGZ1a4nsodHGMZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX2w+j9k/z9LGD
 y5gZ9AXB/RGz7O68Vi4p8N/l/LanxUtRXZX1SbeRmS5Rvu8IaJ8ZxNcl7Cb+eW6nQR08tM/91hf
 BzHz7tZrvgfd9Je+wRZEpsDLhXaecoE=
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab3e9dc cx=c_pps
 a=MYJxclL+TLfs1lE1Gew55Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=xocUrvCl2wmQOL1DfS8A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX49HPAEitqhoO
 tnv5mhA/wG2SyjsQAOcfk/X8M4Kg7eBtSH6JFhQi51RBoSNWoKKBHMj6wHobZfu9+Cpbn5QrZmq
 5oIIKSJNrDwDMOo50cxrfmJ/pT3wvcpp6XdMl9BExE9u+ltymUiHGUU0i+aR0BsxqRZnQjSn15k
 qUtynzzg2XMN6z9BE8V9l3CMyCd5XwyTMRUH9iL14NlYSNaOcbUTWbqD2++wEKVEzjtlppMETmU
 iRJmXeaI3fDDAyhAVHMlZJGfuAMhAGU12m5J3H1il62ki2hxRd6E9lUodjoq1Q++YfxxK9RFKrK
 bx4B0o15IL/Dk1QEHFbb5z7r3dZaOSVRAwVApNpZtRUAHnGFyDyQ/BJgDipedpUWGvfkTtyhYoZ
 dX3J4eJtGDAY83RoBq2JzLhGNF94HQ==
X-Proofpoint-ORIG-GUID: nvkmdn4qm32DLt3WkAkGZ1a4nsodHGMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:02:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17700

meta-arago / na / 20260923145543.2140007-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH v4 1/4] packagegroup-arago-connectivity: Remove pulseaudio
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v4 2/4] pipewire: Add systemd service via bbappend
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v4 3/4] wireplumber: Add audio defaults service and enable session manager
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v4 4/4] packagegroup-arago-multimedia: Add PipeWire audio stack
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v4 0/4] Add PipeWire audio stack
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 23 Sep 2026 20:25:39 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 039a302a13b84a496727b6f14c803510eb9bee1a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-world: Clean up chromium inclusion
- Commit SHA: d05b97861ffe7345ed690e298d7f1782d0d2bab0

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v4 0/4] Add PipeWire audio stack
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 23 Sep 2026 20:25:39 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 039a302a13b84a496727b6f14c803510eb9bee1a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: gstreamer1.0-plugins-good: Move to 1.28.4
- Commit SHA: dc357c044e81825a503aa301d1b90eab41c1f714

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: The use of :append with other overrides needs to be manually checked. (APPEND-1)
        meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc:20
            SYSTEMD_SERVICE:${PN}:append = " wireplumber.service set-audio-defaults.service"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
FAIL
    WARN: The use of :append with other overrides needs to be manually checked. (APPEND-1)
        meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc:20
            SYSTEMD_SERVICE:${PN}:append = " wireplumber.service set-audio-defaults.service"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




