Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD086C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 13:53:41 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11834.1785333220947460732
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 06:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qBdQCYOy;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VPEPNiLC;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: j-sahu@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66TDAbx52562945;
	Wed, 29 Jul 2026 08:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ohIM6+OCT2beC
	zSCe/z4s1nAFsAi0O8r5tA0CAbcBtg=; b=qBdQCYOyttLV90gX4AQlF2nbdzAN3
	8B0DbHivndh4LDS+XeUTGEV4NdLGs01bKGcb2/HdzD9Tp2LhPc5gf17nzw9TKBZQ
	QpDboSBDSZWrjdpHvzHk2xxaPHmhJuvtc3s3/r/RJmar0NQh7GGfyHK/OwmUzxvS
	np8A8bElCu+Omshmc5xPole0GO0w+l1VSNzuifyQ1rJCS3RYRsTS0fCF7qvlbLS8
	tJn456Cev81M+5O0EJtgKPLGU1SNfJXqs0J/gY0a9s1E/GgZ8hB/P2+MzbPGjqGu
	2/M2Lr6LRolO8ZevHDTgTM4zbBG0qFsoyAlBV4LbE2iSwdCtyi45vaEjQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fqhcrrgsc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 08:53:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIwqiZrBjhj1nIT2ZuAT3PpNGQuwTqFjOlDx1tbo8yIMRZ+vBgvBDIymSjJqK8ep4nvcxTsneKpZVG5h9ZlHWz35KgXaBLGCaxGe8mG86Pz7aNPH44C2pdQVi7Fp6ypL9jX/a+fgS7PVeFcBVIppcIviaK6HmvNMrcrHjAthUeuwB1IFns16zI4BLFAt7sL5BAaARV1/L2ydsF9aui2GdkhOr/Es5FPa/hwqC8qze1YCwQZ+Sz9IN4/9B75U8dSEhR0AaPV+5y/coIfbfkevD8YZD6KOeezMbsEF1OiAK4qZ1PCsxO+mkl4VBSCaNAotxw6M5G0g6OwJnl9u1zh84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohIM6+OCT2beCzSCe/z4s1nAFsAi0O8r5tA0CAbcBtg=;
 b=iPbqE7fpq9CaQH+uUkxi7E3a74uuUTA4PxxRTv/3KxQpw1m8szrGGufHgRyQm3PoWcPWJwFFOm5V405JtfSBgGV6M8Dfr3pyg1oUljmKTbXDSEEMo//Y3+Bf6NTvy/Df4XI0JswYZnQNZHfQzjWEogIoXgjAhTLMlz7YaN5PZHLZEVF6D33MpJoemnjNZMDgmI0isYGyM6GbsC1F/BZxa1tPKztl/q0EpAeoTdG8vmDIxTz56g6B2jJimGHEkdzsEbVVrsAZQoOoXlxSRNkki4D0e7565TeP7wu0+rBh27dGtXBO1lbpi5PxvwnnZB0yReYi3rwlBi1T2yMCNr8l2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohIM6+OCT2beCzSCe/z4s1nAFsAi0O8r5tA0CAbcBtg=;
 b=VPEPNiLCZBL9rf6qBf4udewSKmMYLVk6dLUzv1L3986Tqj5IIa8AlenEC91Pu9xP/JfpfgdtP1EjOnu93OzuSx2Fk7UDk3uM3bGDr47Emny17o55sAc90N4RErde0XGh0gdYgRV8glP+SJRrBRwv5/bvw13QJ2rnN+rbFYoyADc=
Received: from PH7PR17CA0055.namprd17.prod.outlook.com (2603:10b6:510:325::16)
 by CY5PR10MB5985.namprd10.prod.outlook.com (2603:10b6:930:2b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:53:27 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:510:325:cafe::43) by PH7PR17CA0055.outlook.office365.com
 (2603:10b6:510:325::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 13:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 13:53:21 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 08:53:18 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 08:53:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 08:53:18 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.159] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TDrGLX748174;
	Wed, 29 Jul 2026 08:53:17 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [oe-layersetup][master][PATCH 1/2] processor-sdk: Add new configs for Sitara SDK wrynose 12.01.00.05.03 Release
Date: Wed, 29 Jul 2026 18:54:07 +0530
Message-ID: <20260729132408.2783245-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|CY5PR10MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 073b74c9-04ca-436b-fd18-08deed78c0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|13003099007|6133799003|56012099006|10067099003|3023799007|20052099010|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nIm5Ofk3LAXcymUgEvFnzMVcLV5XM2dtmFwdMuI/AlQlQnOSk0t+zn/mNhsGlzmD8NqacjGz2GOCF0bZSgiET0Rh0mhbvtI7CzAtImxP6ok5Ln5MwBimVHcaH9K+npjWAUbObzixs86x48co83qYqIfXSNuAwMFZ5W7sNRKYQhmbscYy9NvSFriu5ukbpKY0eO3oEIUHwBTysaEmiDJcJi3gZv8xbL/7ZdD95pHBkj7GcD/Y48qXIb7mi2epwjLN+Xp7xQuNALBPpHNqOeNbgpdrr0CmC7JurEDMIKTGY+T+rzMc7ygVckwZQccmALpAZQwRWwTG/tzl+MILg5gxLItAGHiv5RZQpuzXqUomhK6DWAWpCZhn5i2taxcQrqIaTeyzaAQt4D1gUOz81DpFXYPjh0BCKJzff4yRIuSwvIiSnpXjYPfrGMpZwBy+l6PBy0facjdxLSOwwFWYbwoRf0ZMUiqZ3RvMMHsK2Yq9yvWZx6UpLsm02gEQS57hRqiIaau88MpmhF5TnVUhDXgYLB92E0AFYcpkhpszZDp2ahN5cUqx1npBO7xSnxHebr0ZohguTIKP0ifMvWuWF/hZ8WY4dqWoEbv3UQvyZGRBtQ/yofQxmtPyb62jVqf60kBJ7+UJ1dccFciVxgL4eFEoqw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(13003099007)(6133799003)(56012099006)(10067099003)(3023799007)(20052099010)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wOu5CVRr0W1DeCZ7dX3UB2fIpqvYjfF2lHsoxVXY6ng6AojXwucPhatv1e78ydiPxol/VjPo1nef8hxJ9X0fqh6QjZmSgUUpW1QHbsjx3apwJN95n4mKG7U+SMWSdG4lZ5NMlZkggDa6BymepqvN1lm+KZ20fXJp1QnUN4yXcwj7LOh6MlKyTyg/Os6Vkdsia+Pcum011z5csBu7hcDguiCXi/DREHpzvtgChUeGJI+RvL6C9QhciSK+k7hcVhywKeNZb0P57yy8KSoVL+HhjVGXX4WwlBRNlfWoGOOGshyTC+BzcSPHYhn6kvzV5n7xrRR433RbZReTg/TrW5cwBoA8zNCaynY4OhKS07Yi190jq/gka3kihEw+3i6TkOH9B0IZ4Ihb+lxxKjsDAF52Sao4lPN46VqI/cmAJrURzeTKSKgAkNQUREwczbKpm05d
X-Exchange-RoutingPolicyChecked: 
	M4sF9bYIsxsc1LKGjrh7391sdrRW7TlFcJLJy7GXzP7xKCq1QLOqu4jQ7/kFI7X7OwnxReDT+sTsYphEeniE5EJGm0rTWUEmotxkh1Y+KrQg1wc/THHfrkTNXMEq5JcVMemsuEXzPi/zBAb5A67QYvKO0OLkQp78oHx1TLeFFcxudyjwZ0WhkxVBqYVe29UcDMDiLlZ9E7KhsB62O+THY54ONuO1WDkGx1Zo6a5hSQtWzr5u+6mV34qMBNoAdFUZbRgoeVQap7IyzNltfb2ohWhylo9Mujm/Z0wjikxoNhAIIdMbVMucOEBjGy6ZjJtSO4GOFXkxZ3ZeCKu+PQ0tBw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:53:21.8370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 073b74c9-04ca-436b-fd18-08deed78c0c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5985
X-Authority-Analysis: v=2.4 cv=FLorAeos c=1 sm=1 tr=0 ts=6a6a05e3 cx=c_pps
 a=GLOgxCHNDJEaGAThK2D1wA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=WNDY76dxAAAA:8 a=SSmOFEACAAAA:8 a=DSwjZfX7kicaOh85TbIA:9
 a=cGmCe5m4nr0Rsbee:21 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNCBTYWx0ZWRfX2gRpR6x+Wnpy
 0gc/R+n6Je3HZZiDXNYBUUwL/6YfFXz1AfVb4yFyyzAzC09Szl+2/lUdKDMkf2pgQg2Rvmz1Pp5
 3okkeZkT6m14biR7uwj0b8WHTmRXRjmU31yfFfxhldCKlrH+TB4pNELgXfPDzM5/8QHEC7YcJMB
 FkDoA//r1M7mdHVfGaNs/bNfJgmCDXmJXyHOO0OikwdQoAj9UqWWc49ZwgsS3haYzcIGkUXU+TC
 nXED9vpUofrXW94fGNQRUo9kYjui+tYNMIudq1PzSNjcNIgWQFBmyZjRFwPCi6D8J6y3I+i9QqK
 lw6D5dWGcektPKQjdL4+kODhEX7pcKRgr+R2yB96zfeemcrY4cp1wdXkrP1EIe+rl35hjz8EExW
 h8Zx26jUvBhlquwXjf/M7SeB0Fz6Z65g8otiZwNfunu6TyTqyBfffUzQhy992pHPdaAJ1q7lgDc
 738A258vyeyM6ZYVHMw==
X-Proofpoint-GUID: Clif3jDIUdLHPYz_HLmy_rlGm_zw87x5
X-Proofpoint-ORIG-GUID: Clif3jDIUdLHPYz_HLmy_rlGm_zw87x5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNCBTYWx0ZWRfXzPO3xQJdr9YX
 veKmWbt5U0Zb/SmEA8OW22h1O+bRPRZoHqEMaKD68FF0/6/V6u5aXvRZRYpN6XZHtXlJdaZ7miW
 WvNapyg1MHat6wtLJ6ikPRUocmcFh+E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290114
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Jul 2026 13:53:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17599

Add processor-sdk-wrynose-12.01.00.05.03-config
used for building AM62-SIP.

Add processor-sdk-wrynose-chromium-12.01.00.05.03-config
used for building AM62P, AM62x, AM62LP and Beagleplay.

Add processor-sdk-wrynose-nongpu-12.01.00.05.03-config
used for building AM62L and AM64x.

Add processor-sdk-wrynose-selinux-12.01.00.05.03-config
used for SELinux builds on AM62P, AM62x, AM62LP, AM64x
and AM62L.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 ...dk-wrynose-12.01.00.05.03-config.conf.json | 136 ++++++++++++++
 ...e-chromium-12.01.00.05.03-config.conf.json | 169 ++++++++++++++++++
 ...ose-nongpu-12.01.00.05.03-config.conf.json | 147 +++++++++++++++
 ...se-selinux-12.01.00.05.03-config.conf.json | 169 ++++++++++++++++++
 ...wrynose-selinux-12.01.00.05.03-config.conf |   4 +
 ...ssor-sdk-wrynose-12.01.00.05.03-config.txt |  18 ++
 ...wrynose-chromium-12.01.00.05.03-config.txt |  21 +++
 ...k-wrynose-nongpu-12.01.00.05.03-config.txt |  18 ++
 ...-wrynose-selinux-12.01.00.05.03-config.txt |  22 +++
 ...ssor-sdk-wrynose-12.01.00.05.03-config.yml |  88 +++++++++
 ...wrynose-chromium-12.01.00.05.03-config.yml | 108 +++++++++++
 ...k-wrynose-nongpu-12.01.00.05.03-config.yml |  94 ++++++++++
 ...-wrynose-selinux-12.01.00.05.03-config.yml | 110 ++++++++++++
 ...ssor-sdk-wrynose-12.01.00.05.03-config.xml |  76 ++++++++
 ...wrynose-chromium-12.01.00.05.03-config.xml |  87 +++++++++
 ...k-wrynose-nongpu-12.01.00.05.03-config.xml |  73 ++++++++
 ...-wrynose-selinux-12.01.00.05.03-config.xml |  83 +++++++++
 17 files changed, 1423 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.conf.json
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.conf.json
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.conf.json
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.conf.json
 create mode 100644 conf/fragments/localconf/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.conf
 create mode 100644 configs/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.txt
 create mode 100644 kas/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.yml
 create mode 100644 kas/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.yml
 create mode 100644 kas/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.yml
 create mode 100644 kas/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.yml
 create mode 100644 src/configs/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.xml

diff --git a/bitbake-setup/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.conf.json
new file mode 100644
index 0000000..97df637
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.conf.json
@@ -0,0 +1,136 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vwrynose-12.01.00.05.03",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.18"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.11"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arm"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.conf.json
new file mode 100644
index 0000000..ef86305
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vwrynose-chromium-12.01.00.05.03",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.18"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arago"
+    },
+    "meta-browser": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/OSSystems/meta-browser.git"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-browser"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.11"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arm"
+    },
+    "meta-rust-bin": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/rust-embedded/meta-rust-bin.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "meta-rust-bin"
+    },
+    "meta-slint": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/slint-ui/meta-slint.git"
+          }
+        },
+        "rev": "main"
+      },
+      "path": "meta-slint"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-browser/meta-chromium","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-rust-bin","meta-slint","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.conf.json
new file mode 100644
index 0000000..74b33cf
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.conf.json
@@ -0,0 +1,147 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vwrynose-nongpu-12.01.00.05.03",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.18"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arago"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arm"
+    },
+    "meta-rust-bin": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/rust-embedded/meta-rust-bin.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "meta-rust-bin"
+    },
+    "meta-slint": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/slint-ui/meta-slint.git"
+          }
+        },
+        "rev": "main"
+      },
+      "path": "meta-slint"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-rust-bin","meta-slint","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.conf.json
new file mode 100644
index 0000000..c75af49
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vwrynose-selinux-12.01.00.05.03",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.18"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arago"
+    },
+    "meta-selinux": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-selinux"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-selinux"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.11"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arm"
+    },
+    "meta-rust-bin": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/rust-embedded/meta-rust-bin.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "meta-rust-bin"
+    },
+    "meta-slint": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/slint-ui/meta-slint.git"
+          }
+        },
+        "rev": "main"
+      },
+      "path": "meta-slint"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-selinux","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-rust-bin","meta-slint","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-layersetup/localconf/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/conf/fragments/localconf/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.conf b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.conf
new file mode 100644
index 0000000..359c3d7
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config"
+
+DISTRO_FEATURES:append = " acl xattr pam selinux"
diff --git a/configs/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.txt b/configs/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.txt
new file mode 100644
index 0000000..1ff3094
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.18,acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,wrynose,12.01.00.05.03,layers=meta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,12.01.00.05,layers=meta-arago-distro:meta-arago-extras
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,8ec316bc8fb45c182b5e0d9bb2402491c538f3db,layers=.:meta-flutter-apps
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,ef0611a598fd7ba909804be0c6314ed7c85725b9,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,781735b97ae5013cacabbecd38e6da6b510cf3fb,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,100027977216601000cbefc42c2ff6cf667e7b5e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,12.01.00.05,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,caa36c53f796beb25d9b9f58b1b7a492e9987e15,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,c2746a4a165fd99c2d1aafed17533555787f37ce,layers=meta
+#meta-cyclonedx,https://github.com/iris-GmbH/meta-cyclonedx.git,wrynose,02ec3a875f2cb3ae6ed85981d09228409d25a108,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.txt b/configs/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.txt
new file mode 100644
index 0000000..289b574
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.txt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.18,acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,wrynose,12.01.00.05.03,layers=meta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,12.01.00.05,layers=meta-arago-distro:meta-arago-extras
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,8ec316bc8fb45c182b5e0d9bb2402491c538f3db,layers=.:meta-flutter-apps
+meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,ef0611a598fd7ba909804be0c6314ed7c85725b9,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,781735b97ae5013cacabbecd38e6da6b510cf3fb,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,100027977216601000cbefc42c2ff6cf667e7b5e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,12.01.00.05,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,caa36c53f796beb25d9b9f58b1b7a492e9987e15,layers=meta-arm:meta-arm-toolchain
+meta-rust-bin,https://github.com/rust-embedded/meta-rust-bin.git,master,54721fa1c7a4edaba7fb63cdbcaf0c6253c5fa3a,layers=
+meta-slint,https://github.com/slint-ui/meta-slint.git,main,0b233ff476b391521e9fc3125ed97673fb2e898b,layers=
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,c2746a4a165fd99c2d1aafed17533555787f37ce,layers=meta
+#meta-cyclonedx,https://github.com/iris-GmbH/meta-cyclonedx.git,wrynose,02ec3a875f2cb3ae6ed85981d09228409d25a108,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.txt b/configs/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.txt
new file mode 100644
index 0000000..9a86573
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.18,acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,wrynose,12.01.00.05.03,layers=meta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,12.01.00.05,layers=meta-arago-distro:meta-arago-extras
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,781735b97ae5013cacabbecd38e6da6b510cf3fb,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,100027977216601000cbefc42c2ff6cf667e7b5e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,12.01.00.05,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,caa36c53f796beb25d9b9f58b1b7a492e9987e15,layers=meta-arm:meta-arm-toolchain
+meta-rust-bin,https://github.com/rust-embedded/meta-rust-bin.git,master,54721fa1c7a4edaba7fb63cdbcaf0c6253c5fa3a,layers=
+meta-slint,https://github.com/slint-ui/meta-slint.git,main,0b233ff476b391521e9fc3125ed97673fb2e898b,layers=
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,c2746a4a165fd99c2d1aafed17533555787f37ce,layers=meta
+#meta-cyclonedx,https://github.com/iris-GmbH/meta-cyclonedx.git,wrynose,02ec3a875f2cb3ae6ed85981d09228409d25a108,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.txt b/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.txt
new file mode 100644
index 0000000..d63070c
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.txt
@@ -0,0 +1,22 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.18,acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,wrynose,12.01.00.05.03,layers=meta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,12.01.00.05,layers=meta-arago-distro:meta-arago-extras
+meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,1c3a699f363167571ab39fecb0fe6f56691a4e20,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,ef0611a598fd7ba909804be0c6314ed7c85725b9,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,781735b97ae5013cacabbecd38e6da6b510cf3fb,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,100027977216601000cbefc42c2ff6cf667e7b5e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,12.01.00.05,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,caa36c53f796beb25d9b9f58b1b7a492e9987e15,layers=meta-arm:meta-arm-toolchain
+meta-rust-bin,https://github.com/rust-embedded/meta-rust-bin.git,master,54721fa1c7a4edaba7fb63cdbcaf0c6253c5fa3a,layers=
+meta-slint,https://github.com/slint-ui/meta-slint.git,main,0b233ff476b391521e9fc3125ed97673fb2e898b,layers=
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,c2746a4a165fd99c2d1aafed17533555787f37ce,layers=meta
+#meta-cyclonedx,https://github.com/iris-GmbH/meta-cyclonedx.git,wrynose,02ec3a875f2cb3ae6ed85981d09228409d25a108,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+
+LOCALCONF:DISTRO_FEATURES:append = " acl xattr pam selinux"
diff --git a/kas/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.yml b/kas/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.yml
new file mode 100644
index 0000000..2197de5
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.yml
@@ -0,0 +1,88 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.18"
+    commit: "acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "wrynose"
+    commit: "12.01.00.05.03"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.11"
+    commit: "ef0611a598fd7ba909804be0c6314ed7c85725b9"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "wrynose"
+    commit: "781735b97ae5013cacabbecd38e6da6b510cf3fb"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "wrynose"
+    commit: "100027977216601000cbefc42c2ff6cf667e7b5e"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-test:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "wrynose"
+    commit: "caa36c53f796beb25d9b9f58b1b7a492e9987e15"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "wrynose"
+    commit: "c2746a4a165fd99c2d1aafed17533555787f37ce"
+    path: "sources/oe-core"
+    layers:
+      meta:
diff --git a/kas/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.yml b/kas/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.yml
new file mode 100644
index 0000000..5bae52c
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.yml
@@ -0,0 +1,108 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.18"
+    commit: "acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "wrynose"
+    commit: "12.01.00.05.03"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+
+  meta-browser:
+    url: "https://github.com/OSSystems/meta-browser.git"
+    branch: "wrynose"
+    commit: "e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff"
+    path: "sources/meta-browser"
+    layers:
+      meta-chromium:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.11"
+    commit: "ef0611a598fd7ba909804be0c6314ed7c85725b9"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "wrynose"
+    commit: "781735b97ae5013cacabbecd38e6da6b510cf3fb"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "wrynose"
+    commit: "100027977216601000cbefc42c2ff6cf667e7b5e"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-test:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "wrynose"
+    commit: "caa36c53f796beb25d9b9f58b1b7a492e9987e15"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-rust-bin:
+    url: "https://github.com/rust-embedded/meta-rust-bin.git"
+    branch: "master"
+    commit: "54721fa1c7a4edaba7fb63cdbcaf0c6253c5fa3a"
+    path: "sources/meta-rust-bin"
+
+  meta-slint:
+    url: "https://github.com/slint-ui/meta-slint.git"
+    branch: "main"
+    commit: "0b233ff476b391521e9fc3125ed97673fb2e898b"
+    path: "sources/meta-slint"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "wrynose"
+    commit: "c2746a4a165fd99c2d1aafed17533555787f37ce"
+    path: "sources/oe-core"
+    layers:
+      meta:
diff --git a/kas/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.yml b/kas/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.yml
new file mode 100644
index 0000000..7926514
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.yml
@@ -0,0 +1,94 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.18"
+    commit: "acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "wrynose"
+    commit: "12.01.00.05.03"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "wrynose"
+    commit: "781735b97ae5013cacabbecd38e6da6b510cf3fb"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "wrynose"
+    commit: "100027977216601000cbefc42c2ff6cf667e7b5e"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-test:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "wrynose"
+    commit: "caa36c53f796beb25d9b9f58b1b7a492e9987e15"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-rust-bin:
+    url: "https://github.com/rust-embedded/meta-rust-bin.git"
+    branch: "master"
+    commit: "54721fa1c7a4edaba7fb63cdbcaf0c6253c5fa3a"
+    path: "sources/meta-rust-bin"
+
+  meta-slint:
+    url: "https://github.com/slint-ui/meta-slint.git"
+    branch: "main"
+    commit: "0b233ff476b391521e9fc3125ed97673fb2e898b"
+    path: "sources/meta-slint"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "wrynose"
+    commit: "c2746a4a165fd99c2d1aafed17533555787f37ce"
+    path: "sources/oe-core"
+    layers:
+      meta:
diff --git a/kas/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.yml b/kas/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.yml
new file mode 100644
index 0000000..49ace11
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.yml
@@ -0,0 +1,110 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.18"
+    commit: "acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "wrynose"
+    commit: "12.01.00.05.03"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+
+  meta-selinux:
+    url: "https://git.yoctoproject.org/meta-selinux"
+    branch: "wrynose"
+    commit: "1c3a699f363167571ab39fecb0fe6f56691a4e20"
+    path: "sources/meta-selinux"
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.11"
+    commit: "ef0611a598fd7ba909804be0c6314ed7c85725b9"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "wrynose"
+    commit: "781735b97ae5013cacabbecd38e6da6b510cf3fb"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "wrynose"
+    commit: "100027977216601000cbefc42c2ff6cf667e7b5e"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-test:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "wrynose"
+    commit: "caa36c53f796beb25d9b9f58b1b7a492e9987e15"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-rust-bin:
+    url: "https://github.com/rust-embedded/meta-rust-bin.git"
+    branch: "master"
+    commit: "54721fa1c7a4edaba7fb63cdbcaf0c6253c5fa3a"
+    path: "sources/meta-rust-bin"
+
+  meta-slint:
+    url: "https://github.com/slint-ui/meta-slint.git"
+    branch: "main"
+    commit: "0b233ff476b391521e9fc3125ed97673fb2e898b"
+    path: "sources/meta-slint"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "wrynose"
+    commit: "c2746a4a165fd99c2d1aafed17533555787f37ce"
+    path: "sources/oe-core"
+    layers:
+      meta:
+
+local_conf_header:
+  oe-layersetup-local-conf-config-specific: |
+    DISTRO_FEATURES:append = " acl xattr pam selinux"
diff --git a/src/configs/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.xml b/src/configs/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.xml
new file mode 100644
index 0000000..784f2a7
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-wrynose-12.01.00.05.03-config.xml
@@ -0,0 +1,76 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vwrynose-12.01.00.05.03</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.18' commit='acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://github.com/TexasInstruments/meta-tisdk.git' branch='wrynose' commit='12.01.00.05.03'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+            </layers>
+        </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='8ec316bc8fb45c182b5e0d9bb2402491c538f3db' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.11' commit='ef0611a598fd7ba909804be0c6314ed7c85725b9'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='wrynose' commit='781735b97ae5013cacabbecd38e6da6b510cf3fb'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='wrynose' commit='100027977216601000cbefc42c2ff6cf667e7b5e'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-ti-test</layer>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='wrynose' commit='caa36c53f796beb25d9b9f58b1b7a492e9987e15'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='wrynose' commit='c2746a4a165fd99c2d1aafed17533555787f37ce'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-cyclonedx' url='https://github.com/iris-GmbH/meta-cyclonedx.git' branch='wrynose' commit='02ec3a875f2cb3ae6ed85981d09228409d25a108' disabled='true'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.xml b/src/configs/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.xml
new file mode 100644
index 0000000..8d4cc53
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-wrynose-chromium-12.01.00.05.03-config.xml
@@ -0,0 +1,87 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vwrynose-chromium-12.01.00.05.03</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.18' commit='acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://github.com/TexasInstruments/meta-tisdk.git' branch='wrynose' commit='12.01.00.05.03'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+            </layers>
+        </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='8ec316bc8fb45c182b5e0d9bb2402491c538f3db' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='wrynose' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.11' commit='ef0611a598fd7ba909804be0c6314ed7c85725b9'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='wrynose' commit='781735b97ae5013cacabbecd38e6da6b510cf3fb'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='wrynose' commit='100027977216601000cbefc42c2ff6cf667e7b5e'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-ti-test</layer>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='wrynose' commit='caa36c53f796beb25d9b9f58b1b7a492e9987e15'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-rust-bin' url='https://github.com/rust-embedded/meta-rust-bin.git' branch='master' commit='54721fa1c7a4edaba7fb63cdbcaf0c6253c5fa3a'>
+            <layers/>
+        </repo>
+        <repo name='meta-slint' url='https://github.com/slint-ui/meta-slint.git' branch='main' commit='0b233ff476b391521e9fc3125ed97673fb2e898b'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='wrynose' commit='c2746a4a165fd99c2d1aafed17533555787f37ce'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-cyclonedx' url='https://github.com/iris-GmbH/meta-cyclonedx.git' branch='wrynose' commit='02ec3a875f2cb3ae6ed85981d09228409d25a108' disabled='true'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.xml b/src/configs/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.xml
new file mode 100644
index 0000000..0bd4898
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-wrynose-nongpu-12.01.00.05.03-config.xml
@@ -0,0 +1,73 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vwrynose-nongpu-12.01.00.05.03</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.18' commit='acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://github.com/TexasInstruments/meta-tisdk.git' branch='wrynose' commit='12.01.00.05.03'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+            </layers>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='wrynose' commit='781735b97ae5013cacabbecd38e6da6b510cf3fb'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='wrynose' commit='100027977216601000cbefc42c2ff6cf667e7b5e'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-ti-test</layer>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='wrynose' commit='caa36c53f796beb25d9b9f58b1b7a492e9987e15'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-rust-bin' url='https://github.com/rust-embedded/meta-rust-bin.git' branch='master' commit='54721fa1c7a4edaba7fb63cdbcaf0c6253c5fa3a'>
+            <layers/>
+        </repo>
+        <repo name='meta-slint' url='https://github.com/slint-ui/meta-slint.git' branch='main' commit='0b233ff476b391521e9fc3125ed97673fb2e898b'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='wrynose' commit='c2746a4a165fd99c2d1aafed17533555787f37ce'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-cyclonedx' url='https://github.com/iris-GmbH/meta-cyclonedx.git' branch='wrynose' commit='02ec3a875f2cb3ae6ed85981d09228409d25a108' disabled='true'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.xml b/src/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.xml
new file mode 100644
index 0000000..03ae8f6
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-wrynose-selinux-12.01.00.05.03-config.xml
@@ -0,0 +1,83 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vwrynose-selinux-12.01.00.05.03</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.18' commit='acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://github.com/TexasInstruments/meta-tisdk.git' branch='wrynose' commit='12.01.00.05.03'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+            </layers>
+        </repo>
+        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='wrynose' commit='1c3a699f363167571ab39fecb0fe6f56691a4e20'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.11' commit='ef0611a598fd7ba909804be0c6314ed7c85725b9'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='wrynose' commit='781735b97ae5013cacabbecd38e6da6b510cf3fb'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='wrynose' commit='100027977216601000cbefc42c2ff6cf667e7b5e'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-ti-test</layer>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='wrynose' commit='caa36c53f796beb25d9b9f58b1b7a492e9987e15'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-rust-bin' url='https://github.com/rust-embedded/meta-rust-bin.git' branch='master' commit='54721fa1c7a4edaba7fb63cdbcaf0c6253c5fa3a'>
+            <layers/>
+        </repo>
+        <repo name='meta-slint' url='https://github.com/slint-ui/meta-slint.git' branch='main' commit='0b233ff476b391521e9fc3125ed97673fb2e898b'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='wrynose' commit='c2746a4a165fd99c2d1aafed17533555787f37ce'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-cyclonedx' url='https://github.com/iris-GmbH/meta-cyclonedx.git' branch='wrynose' commit='02ec3a875f2cb3ae6ed85981d09228409d25a108' disabled='true'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " acl xattr pam selinux"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
-- 
2.34.1


