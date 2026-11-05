Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6841.1793914070547274382
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 13:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=lHEOSbA+;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=tY0PTkha;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5L8Rjm3475985;
	Thu, 5 Nov 2026 15:27:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ANLM03QGKfH5j+iQJ3F0T3gfnMJg/MG55JrU/oqp+
	To=; b=lHEOSbA+5L2A3zvdAAek6z0qGqtxrrfQkgxriZazGCsI2kqZtT8ob/u1O
	xy/mJ1jQ1ATaFZHwqCaWFXrKxE28+FEw7QygIrR9H+5lM3KMlkpeaolVXEFfLtt9
	irTQC7dEW02I12OtpnF8SsbnsQN3UFUNI3+NXZXaZvnF//Spp9U4boXpn5fyPjsy
	TRqVSyek6FHYkoszTRmwwvejzp6zpXy1gCNmgB1+I79N/6gFm6lm15IRoqMVtDGq
	mDY1FlteZYe11jUkmHmiAqe3aqM41ow6QQjSDlAljCDQHLbFdLFNwmUbYHLzGj3v
	IPaJ9RHhq/g0eWZydDlDwdVor+rWg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011065.outbound.protection.outlook.com [52.101.57.65])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hrgp9pv0t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 15:27:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlHfIm6yIV/EbQFKU9fZaytDydcw78O4cosLr74Jq+l3MuqWJZSEz8Uz6t/NiOC/hiVHwC9NAxnG4AG1v5Fa0RB6MRJR7VYJtXVzek+2JhqUSlN4+re+30PI5LsZWbtMKiuhsLnlKZrk1bpTdzXYL6Rm3rT2+LrWsdrKNaeC0HxUFu0rEWl20GEC8Hoz/hjWBe7kXr1vH83l5CZM/Tp4kRq6KvYIPTO+XEOJk2pg8N19pjGe7WuG2JdtDT1K1NcT2ovP4229NeaR4Hkai6ipBR10E5pcBny4Ok02SxwlqNLrb5il7xlSF2Jdv/yypqw/0XxS9jEVk0IaIjM4++j1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANLM03QGKfH5j+iQJ3F0T3gfnMJg/MG55JrU/oqp+To=;
 b=hShmvNtBDPNen95mio+O7/re9AnBAzcHQHROIUMbvyYL0DSIGMGhvS9dwiDcN8yC0gTwfttnDMcv+QsauXkG3ecuI4AY8CJYA54m9BSL5E3cXPWR/axtk29MZd9lI1awugCyDfnH+K6ckuYkaI6KFuFObFU60scIR7Kozhn0eugQ5GIWeAgCRZtLggwR0Pa2Wr73KFJwMWv0wiz+moMyuzCH/9Gs+e1nKNQesJdK6FPbkwa5aXaTJu5N6Nx1wCvl+MkYraizFH65sH0PPzzw2iZCqmqZtFF3LVHOP0nahOWNuHq4JdQYCXIaWKoHmk1xZytr5Kn5sAYy0mG869moXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANLM03QGKfH5j+iQJ3F0T3gfnMJg/MG55JrU/oqp+To=;
 b=tY0PTkhaPITydVetuzrVtFabBNMQTFxOg8hjkX2/7VhHWUgJeUTucJzHBCNpvEl/SMiRjPlnK7+OzNPUdF7YRMLFVNbriJtJh5devka4/iaqLtPkICKR1QEtepMJjBIcxMCHifWdQmBXDIVzXkPj9ukovt11CP8buEVnrr7eyW3NnbhBt1504LLKadqa0/3xDthQ8uDE5GqC5rgCRpR+I3B6VdGBuKAbSveZqc3upErOWVAC4dn2zW9s7GVaSpurfVj5pBiXc6zA02pkWretR6ZHsfOiddqUEzYYxwuOHkM3cAh6B/leylEsMMVsbBDyKALZoS16xxhaMfTrG3Tarw==
Received: from CH5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:610:1f4::23)
 by BL3PR10MB6114.namprd10.prod.outlook.com (2603:10b6:208:3b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 21:27:46 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::91) by CH5PR04CA0023.outlook.office365.com
 (2603:10b6:610:1f4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 21:27:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 21:27:44 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:27:04 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:27:04 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 15:27:04 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5LR4E5485915;
	Thu, 5 Nov 2026 15:27:04 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A35039A9C3; Thu,  5 Nov 2026 15:27:03 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] wayland-protocols: Do not add wayland-drm protocol
Date: Thu, 5 Nov 2026 15:27:03 -0600
Message-ID: <20261105212703.1078865-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261105210048.1311709-1-afd@ti.com>
References: <20261105210048.1311709-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|BL3PR10MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: aac210e1-c134-4dcf-a925-08df3b83a1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|3023799007|10067099003|261028144727099003|261009223027099003|56012099006|261026140227099003|261026121527099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: KNKp1kbfT0KOFmi4wHl/tomUz+nfNoJwV0Aa6IYZ1drwu3GpNTqYY8N8rPxEMoxqPYe0QZJNtmBy6iCoBOQZWcnsnWScCHM2O0K4AIUJwAHRL1saxGDD+mxgtKho8liVwTM8leG7QFWTd/RP1f/2+cf9S4s7E6VyXDnujO1e971ekp2mHcxDRWD+NvNLKUqo8ROsPzyGCwRdagqNjkAEPF8vNibEIpl0NAJV8YrqmW6x4icnP9nytvKgRUuYrOFqHv3lQEn9OZOD3Mqn9mDHV++596NSmjJfrhDno3BnqNNp+5lDreurzGvOW4SG7d39/PJ9IrLSKB3ArkesB/ysmupu1PQImVtjxQILLQF74iUgqmYVChaohzjFjOQsBEK8PikDvPAg9i58TsTH+Oetbm5BHO/Zcnko/F3jQdwii+IW23+Qeq119prR72X1i3rPmf4c/waNDDLR0efVRQ5etqUOdJrsp9I8AlhrZn0Dv9X1VYriqh3RWblPBGclUsrs6sBZp857Z9xr8qklV+32UU8xdkj9MDff1yquH6fiCKWrjaIQeq8pLDPrL8yoiKfsvBdyxGrwrg74itUZSb8RHgRI1gZYJvN8r+9hEOXNILwn/ZZx7tK/zqWeVk+1/WhtqasU3c5h64z4JGxGf6qwLOmM8pUQs5eLDz3kETkVyJ21m86a46O/DyYtuXgFoakYnUGR6oQirxQsgw/4rLMmsQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(10067099003)(261028144727099003)(261009223027099003)(56012099006)(261026140227099003)(261026121527099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YAaxiHmNvU+5fPP0y4+n63JDx7GyqA2zCs7Bi/R8QtFuQNFGbGIQIIWXZQi0lfx8HYtCEDE4uPTsH1two2qrqgXoY0voiinqsTNuhw8KORCMQrwS+Swz3vwzlnpufNq2MzYVPuX82V12i/5LXy6qYC/FK+aTx7lYae/aLqSdq2vkJS3iV4RkKtWfpXnpYXHEfEACy3VvVSXH2ebhRnHMms9/hc5EkH0RhhIsWk+4BD2R+V3hFaRdqzpL2SU1n/K6BRZ6yC0qaAbwjOygnOtwmHKBSIohPvcAn0hKcjIu2Xf8SSalP1sYD0O2uSoFtH50YogVnA3IaHK3ABLMfIejxaOZ1AEIhBbGEqblL0V/Ti3TQou8kjCC1thlogkpLwSJCzm5oiOmthXzV/vcjCpXVrXi8txfzUPeZBCPyFIY85mIyJzuCd9RMQ543kxUgHEM
X-Exchange-RoutingPolicyChecked: y9aqv1osy63ipbZmBiBTPU8IzmMi4jGtqzusBrDLOQwjI+9QGu8ggAQHSTLNHJPiykA0eSb3eA3cx7lTNFuwE110bi6S2Fnq81AEx/TjOmNyYIZm6jvlhrlqjWFun0XJpS6Wq5ReJ5avPSy9ZCc/GBsW48I+ntwdaSXHtv8v7Ug95k81MTxXbCEscXYdH02ks2ydJV3pUKRvUxrLkS1vKyzkdSrG8lCLICQrqWzVoJyh6P6DN6uZouj7iMlmSXVzTtYq6RSWT9rlBdwFMmk8MyhDdjmHGkPmHBsow3PmpV94o09TLVM3e0DbF0Z8zq6iv/FeLTJn69dCP5WoHoFHGQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:27:44.9559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aac210e1-c134-4dcf-a925-08df3b83a1c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6114
X-Proofpoint-ORIG-GUID: -HeoKy4396Lr6XrsGzOLqQlI5lyG0vXh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfXz32K5H0gfJ0x
 yhvC6uPHfGh3VbmAppTKHSIDeP24cxoXtr/bBXiLuIYmG5N1bqDRjAfoqp2joMo9btN3E1zW7j3
 QKwzwrfrYVfwgulyt+MYNnD2WSRNKP0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfXxKAWQtFkt4/n
 xEh1v0mgbmlZtUd8F+CXYag22LMj2ic4jfKqRespdkvG70soi3VOFLkP9dnx0kBrQQtButv73o5
 koWDhJNQ9HzFRfn0IdKeDI89yRlazK11+tUFnH/OpatmeaY5GO9XBQiSU2FSOM/VqqMLa3dMVJ2
 Y02yOTIyEOAJP4V7MSts29L5T84+DamT4TqgDxvqMZhT1U7HSFIxUHFuHFFzPinGw8496PEJcmX
 ta+c+sbTaKvNOoZcfKbrtFpvfS4N/3Ec4AoQHBgxXnf+UTgStyA3b6i4wYSUCnqMP81yc8YKGEd
 2NwJRflZ6u5Ku9Y2mKKeAIQtY3/bCZXllFoIlqk5C7QgG60ciyLqwKhaqfaTcf8KzgyilL8XeEZ
 xHg3q/+UqOOVEjBYRaz10T50UaIpy56YFFjFrHJArKmtjepTcF9CL4Su6u3XDp5sZazCBKkNBPn
 z+Z7MpdNowt9IFUr5Uw==
X-Authority-Analysis: v=2.4 cv=D+jSufRj c=1 sm=1 tr=0 ts=6aecf4d4 cx=c_pps
 a=X9aWvzuQDVJ7vSK8h/Ha0w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=EADlED8ZOg9pm6jPsQoA:9
X-Proofpoint-GUID: -HeoKy4396Lr6XrsGzOLqQlI5lyG0vXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050085
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 21:28:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17773
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261105210048.1311709-1-afd

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
- Patch Series: [meta-arago][master][PATCH] wayland-protocols: Do not add wayland-drm protocol
- Submitter: From: Andrew Davis <afd@ti.com>
-From: Ramprasad N <x0038811@ti.com>
-From: Angela Stegmaier <angelabaker@ti.com>
- Date: Date: Thu, 5 Nov 2026 15:00:43 -0600
-Date: Mon, 26 Feb 2018 09:22:00 +0530
-Date: Fri, 19 Jul 2019 15:19:17 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 62db34d3d473fc555c775d5e63472eb787fcde4e

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



