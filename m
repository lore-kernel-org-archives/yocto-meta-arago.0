Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABA9C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 18:46:47 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46722.1789152402805007712
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 11:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VM9OuerB;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=xe5riPHL;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHV0VR2544559
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3LkfvloFSRbRux/T9FHbAva/AKtuLG/APHMA8w6mH
	Ik=; b=VM9OuerBwZO3qLDfKX22M4PygIN82BXAG4h1yT1bVgU7/4v4dLW/rnbb4
	U8qTpyMoxanTLuO5dWI5vCqXvlAmN/2w51sSZEWa/2bjfuBWSsDbwDHr7Fh9NBRp
	9HweR8IA8gMBeE0hDv2zjbmCj58mikFKGasnL1YI+JOniyFoTM84OiS2BPNK8aL9
	iltFvdqxF313RSyiEauY6w4rjyWfxs4pZ+tKhK4sMfFVkRVEiJuiOu2AEH78Fx+f
	OdcNAb4blBfjBTkE0nHfrLk2yKd+4dKhaaf6AMQQPDBwQb0VMCoVdyWBE6JOF0nl
	2yXNjkW+doSbyApqgTtNFigv5QA7w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012019.outbound.protection.outlook.com [40.93.195.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyw9rc0h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:46:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqwCut1Xl+WvwIBNu5G9QVrTnSp4ZfmfRMZUM7t5bz1jutq0a/ndDKLeNTZE8oftqlagIi6LOaNpz4J8ngo4jcQk47DDbr+kjBVam2fLCb1yMhCFQm2ChsygZbQ1uIYtTTgvrFCPryDQmLVYBVR9wmixjy7ys9c7eh/obfhe/6WenlDI/0VDnKlWTE3iJd45XTkXA//DpDZTcbMkzAa7MzU+frAbIc1Afjccpj3lhtRTk3eqnZx38qBzkxHj+2BmazQc1PlZ2kxiyspU54/9W279Km89xaGT4Tz/rPoBbRpt6loR77E3HDM/SZiDG8+9nfYALLQwDQ6zO6toeDH6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LkfvloFSRbRux/T9FHbAva/AKtuLG/APHMA8w6mHIk=;
 b=SAuXOC9A+LiIrGmcvh1bHg5nkquebBXwp5yflig8euMlto3UY9bOIQ4kiC16DyldFtCWBx5F1q8ICJ6kdUsySl3qbkFoCq4OdVxAff42lX/9+y43GdJN+CvQ41VGLi6mb1ZGumReGnQFF25xtb0KLwpWYWRp6JgdckOR0vNPH5ar0ZFCvyOdoyg+9m2YPte218Uar1+FHo4e85GM+vYDPg3fPkAkaYJuL/Gs/S0n7suaYo7zPLVLQ/M078H6D+L/CN4tNNVVLPRHhldnF41EWvKiyY9kSPrx/Pb9GCs/Mq/JLTGnbSl8AFzdbGkEgMJknjWj0I4J/tyUnYfVSW1v7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LkfvloFSRbRux/T9FHbAva/AKtuLG/APHMA8w6mHIk=;
 b=xe5riPHLbsTTY83VGVqsxIDGD0UTAfuCo73S6arFwO/w7PwDPx4SFidZjlfzPEFNbOltl63spEHzE0sdxv3HAViUAH8sR40fHVVzSTMNUngciVX12bbAWGCeyWfmjEJ/G6ANqZnT+IUt31Q5zvDzOM922TKF4vdEb7JwOBX60QrLmq2i+chU772pLsoYZlxYrPlTOXTK7WdjIKQb6CSFnKv5i8qyoH7LjtEcqooPuqyYQeoYzAgVFl7NjJwFcABjPBnAjR1mmikFiaBHbxRCtr1X+0LRhJd6ViBmo3jVFfsJrYjzwJPGYp5tCTVX+T9e5sLRG6N8I7k5n+ErSAfI6Q==
Received: from BN1PR10CA0011.namprd10.prod.outlook.com (2603:10b6:408:e0::16)
 by DM4PR10MB6231.namprd10.prod.outlook.com (2603:10b6:8:8e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 18:46:35 +0000
Received: from BN3PEPF00022BD5.namprd03.prod.outlook.com
 (2603:10b6:408:e0:cafe::18) by BN1PR10CA0011.outlook.office365.com
 (2603:10b6:408:e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 18:46:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BD5.mail.protection.outlook.com (10.167.248.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 18:46:34 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 13:45:45 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 13:45:45 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 13:45:45 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BIjjb81733111;
	Fri, 11 Sep 2026 13:45:45 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BB4279A9C3; Fri, 11 Sep 2026 13:45:44 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <b-brnich@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v2] chromium: restrict force-h264-youtube extension to supported boards
Date: Fri, 11 Sep 2026 13:45:44 -0500
Message-ID: <20260911184544.505160-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260911183900.631578-1-t-lannynd@ti.com>
References: <20260911183900.631578-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD5:EE_|DM4PR10MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e64809d-8e62-4a02-4004-08df103500f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|13003099007|6133799003|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	61pwNsNj/qDbWeR1IRBvPSnoqHAa0RKfMEnrozaM5WrX7aRUcGwPKR018b4+2Nq6uefx8v8BoKUifILM5eviSxIumIzjfRyY0nmwmxoEX2uSBU9y7FqjO29L6oPJRYuUu9KE9f0Fypr6aTelIrvDvC+snlOz9ih9sQDqdz5bvNk1DolGvhfShj3u/ztOBw3sz4gNsjS+oPeKV4MSX+Lg12A8Mx1HZJXgkET7/5uTxIrwbh6fbGGbl4BNsmbyrEaKXztEzI/37K2lDZoR7nt/afjvpLMvOZol1eUlPLwsFkaNIz9T7EYYIUHZiJ3BhMylTv+CG7M6XFmmTFVZrXCCEb0MCTyPT0ZQrz8VIG/PN00NeMxSh81RT+E+JVARa6qr+4eFg+DO4RwxZOZWkOysh/21zWKLnIWGucQbGqHUFILJDH5EjJA4RhoLXfoJW0unRf/fxB6xoFQTe3wakQphilxtnYBrjo1WRHRrYXPEnK16jv6Tl4EAHauWrFQo22zMecipa3zDOpSrBYRP/kjfG1Nl6Unb2io5NfF5J+MtfjlHrP8PuQqjgmV5mjFRAqCPkie/Z8WIQPbTrEJxuHoH74ETGq8kyCeMv8p+nAuxiGhkBGPZhqIy35WfcU2ISAtjqSY2CytHTYFkWdvG3/Kspg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m3wHNsDPv+lPwbQfNuUFfC/HRv/BScbwua24+cxNGyQImz7rgQ4m9ImEJz7qrxmxjAFzhATndYZH4X6s8NhV/68nc4klGrbC+QgDHqM5dpBgtvEQB4SFALHDZ/tWfIDuM1Bm5OxXtnqDGAXSf/Y755+REhIagm6Verm85Z9S0vG+Kp0PPF3Z8eSJaDp8Xw+DpqSy0C7wmK2KchVKVCVliCFg9q0VfiBwgIKrdmtE0vt49kj+EhQXMjcO0g2DoPAirUr1aXU1HKjk79RP6kXW4VMmlxxFAdVKywCawJI7no7dzHEJlglsw8VT7+D59/KECiNvSzOxP+5Tm5kzIo5YDuVpYpLH8DkbKwJ7acZjt+u2Cv5Ux747I9ttjcpxmtzI1b75Ekzyv4zlNs8zZz8RFSqyscw3HW9KYzvnORtxW7Bj3Ityjo4lKQcCDXINjCy+
X-Exchange-RoutingPolicyChecked: 
	YKHln0lI5B+PNqwEsuuPRqX6VE5ZBwTmD9MAcV05x2QiJcRuI6/8WIax9gX7VqKVhnk96NNAdlZBrRRp4xBSDpqCdjY5Z3g28nv8fz0tnE1wtRkEN/2KVWS5yrE3xgvewwCeJkD6E/34F+7rXgIJmLrDItePw/5na8/WQwd4ZzXMpV0dKncK2MjY9zhtNSgyfg1+XwAv90XZku0ncKsm+1AtojLEvgUHhF1dvU9ctUUl1IykQ+lTbShMikByqTONqsFIH3odQoYQDeN/vIEWrxe2nE/Qedcnq23lzWevnMN1oQPGiNUYtWBVoN/wkYFeKdZMWLl9wuYjY75jFsxYLw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:46:34.4424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e64809d-8e62-4a02-4004-08df103500f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6231
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI2MyBTYWx0ZWRfX/sKLAm5nc109
 GOdbLvGnovKcJuzCpZ/Lt9deCD6s7hOGrXBKOOjlOhS1nqjmtmUPIm4iq6zFDX0JynWNp1JN5rH
 ZFjFJq36Dlj4i9PW4mjjkc/bdi9ZkH4=
X-Authority-Analysis: v=2.4 cv=ON6yTiaB c=1 sm=1 tr=0 ts=6aa44c91 cx=c_pps
 a=7Di9vct5tcmjM1itADynpg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=I4hZcFNLgslV7EgcVaQA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: ZfGiUxvldWva2h98nIVKxaYexssseK_5
X-Proofpoint-ORIG-GUID: ZfGiUxvldWva2h98nIVKxaYexssseK_5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI2MyBTYWx0ZWRfX2qTVFQxppfCw
 5XKCXCEbwxx66Qk5XVbmAEXsBN4J0CnAMUMlvAea4DP1X8ll7nwCfZTn1Xz5CoJrY2jRE96rips
 kbhHchNeU2ZiDh53p+CNhLkyY3l2nN+Ivv3kKJrDqGV6KNMOv2YkHTbC0hyMgvG/VOuDiypc+wI
 XH22nIEDKhe1KD5qrJrRHUcu4ibAOkI8MP9qmMjK3l51qh5vhKZPVvG+DeFJevZe3q/lpZDPqJt
 BnVyrcl7OhFdJcyrB43Ty8ZQZwf137Ketbfaz4paOX7lNersvVumFeDJ1xZ6MNuu11q+FHn7coE
 8Z6Cljn/OxjYozBXB8XhxZoGrV07ILTrCcNcARFjnTXElXtx7XGkrxBF03nmnDgBRxISN2ttwrV
 cpXE02jDw+mFfdEKvdDPvNHRjco2acoRHDU+MyzcZt8brDcwYxTQsYR6l1AOYnoJxuLIPgYJ5MC
 Y5mX3tCMGOFf7SyqoSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110263
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 18:46:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17669

meta-arago / na / 20260911183900.631578-1-t-lannynd

PRC Results: FAIL

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
- Patch Series: [meta-arago][master/wrynose][PATCH v2] chromium: restrict force-h264-youtube extension to supported boards
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Fri, 11 Sep 2026 13:39:00 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 715d6e9c817282eb3e7d6dbfb9f9f497db8e7485

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: netopeer2-server: Patch for OpenSSL 4.0
- Commit SHA: 745d80a58f87d57cbccbf78d4a956b5611488a02

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH v2] chromium: restrict force-h264-youtube extension to supported boards
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Fri, 11 Sep 2026 13:39:00 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 715d6e9c817282eb3e7d6dbfb9f9f497db8e7485

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
        meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc:29
            RRECOMMENDS:${PN}:append = " ${@bb.utils.contains('CHROMIUM_H264_EXT', '1', '${PN}-force-h264-youtube', '', d)}"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
FAIL
    WARN: The use of :append with other overrides needs to be manually checked. (APPEND-1)
        meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc:29
            RRECOMMENDS:${PN}:append = " ${@bb.utils.contains('CHROMIUM_H264_EXT', '1', '${PN}-force-h264-youtube', '', d)}"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




