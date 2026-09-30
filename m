Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FBFCA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 22:43:04 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3421.1790808180634890647
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 15:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DMO9SjAD;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=tvWJEC0u;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UKk8dw3825556;
	Wed, 30 Sep 2026 17:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ChPFOqnTwrBOOjgLp08BDdjZ+BZGkjow/gNFu9Dq6
	Ek=; b=DMO9SjADs/if5u8Tge8bfoNNF9DkvzUdZac7fQcgOtrD45zzsu0QLOHW7
	lBNktbsZwtFPKXeTKFP7TBq4biBaiqCcrUffLZz7pmYxJQ2VKx3Gv81t/EW8+fNG
	H5qHQK5t8uhzruHZ+i8f32kA9uAO/AryVLL8svxT1FmCoDUaor2HHxLsVYhHy3vk
	Tefk3YGMu+zpR1JI0ah1o/cQN96QsVwyAZO/Xxu6eFYHJk2PeNri/P72UYiVEYUS
	ga9BrtKOx0hVUDQgt1dFeSLssBqfVFgwE3d5ZWQapwIQ0QF9/1rZmnl6EkhTQ5PO
	WNWUaKxZCvCb/2ah6qtJKXQKnbYOw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djsanx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:42:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akpPpBc6zqsJ/L9GYMarDM8N2LxkcaYhXd8bPwDO/2vo28JUGIMjR4xzj9wsL2GQ7tpzg3wqyIX4ibYqq+atHJHFpY617QqHGUZDqtLt6WNn3/mqjEirHaHpmS4+mauQNncfh5Ff9hKHRHxHAFvjcu8h95LBfFEK6ES8dMklK0NqJW6j7YBgq2grSJDRRBUqv1HL9oUhLfHQlP84JLnpDB8ZZ9VjmSWrFSJxvE8PMMBMmMUtJgHZ5PqdX2Antpx4es8b6qapPGXhSmbRkt+LbCprenlp+H/vqPqFtuCjAyUnz1fefpqDaagSGDM7dceq44ea5+8vciMLsZeeOO/5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChPFOqnTwrBOOjgLp08BDdjZ+BZGkjow/gNFu9Dq6Ek=;
 b=Yg16F42DYY5MPVeRFGSJ/7V5fa50EgFRiBVPj8s7tThi23XD35yRolgQ8nKaJoFKjKUMrKdAMtJuyVwFdDrU1OjbbQaAJtAsj/jPc3D/SnMQewnxg2NG6eERGIxCRImVZxcsRHEDJ14l0BVywTdbft+qZyzmY//YtcALxq8+D3ThSAJ6vCBN6lxFFuOdDm6NfF3gkttQkXHmadz4WdkBwTyuwBKQOQ3R+wn9K0Mmi5GdOIeVcTDVJ4FSdxFH/F6pQVogJ1UO81IGXRyvmkmPxFXEPPcxt61tIWI7qmQJ0HXMTR51K2GY68CQUyiOhc8pCKyd9v+jl+96liKAzsL/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChPFOqnTwrBOOjgLp08BDdjZ+BZGkjow/gNFu9Dq6Ek=;
 b=tvWJEC0uQySntLy/UjKtpVKhMjPSggBtbu/um+Tv9b6zhB4TqYm4sTXGkkt379LckYCtxuX7aPBjRU48fzHgUFXR6IFOvlfwloEJY8etb0fJe72uYolSdZmAcIMg/GVbntXSf+GP66b4Oxb3YX3n2CAYv8/Ij9arA0HQWfgad/JQLdHfSJBHDe5czSzEACCxDsE+ATvBLZokyvdVxUE/AK9juXe2R+LDrPQZjhQ9pUsU57UqUcgeV8yWW/Y7vGWCft8b1bn/WtNqK8fGKH0J9XLZGI/1jPtAEgnahKnw9rE8v+CVYYybqKP33YvJR+OyC2NAYT6yyBulEHPecajv2w==
Received: from BY3PR10CA0019.namprd10.prod.outlook.com (2603:10b6:a03:255::24)
 by DS0PR10MB7126.namprd10.prod.outlook.com (2603:10b6:8:dc::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.9; Wed, 30 Sep 2026 22:42:55 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::92) by BY3PR10CA0019.outlook.office365.com
 (2603:10b6:a03:255::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 22:42:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 22:42:53 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 17:42:16 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 17:42:16 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 17:42:16 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UMgGMk3094477;
	Wed, 30 Sep 2026 17:42:16 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 759D29ACF4; Wed, 30 Sep 2026 17:42:15 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] mesa-demos: Update recipe to match oe-core
Date: Wed, 30 Sep 2026 17:42:15 -0500
Message-ID: <20260930224215.3452543-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260930222241.3467841-1-reatmon@ti.com>
References: <20260930222241.3467841-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|DS0PR10MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: d83bf73c-96a3-4635-516a-08df1f442a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	+eL5YPEQBp+tNtTIGTUIas4bQ+broT4mc1w/S34SU3V1QUT3AHa8MLCmGxkYkiN2QcKf6DQC9+SHnB9Y6hUrjwt8uXDDMBG1Dt6PUfEPGEOVZP0PcJ0hzKHTHWEBj2iZD8/lfYY1l8FN4iph44gZut4AoqiF+ovm0vX/9ureEIdAjiywJ2LlLZXGZK3X9A2u/GrYKINMtgidgKHt8TQBSslxbLvSwdscYRSa9uMfkzVU94PJNCjboNlih12TDZHrBS8cwd9l1nPijldaXS/9habC80EosqrUvPUhT8Jy4OGHY1L9D8K+wtDF2a716IbrBr5UDzWH5oEABpu8hby8tu08CoKs8sgXfVEQTOdcsfrFAGQeG/1GErFfZZKUKcT1K9hgkBxk31PL89xSD8cOVK5g1bBa8Fwv91IaENU9z/QUKV3mzKAM+QPlgY0taBl4zeca2U50y3mbwwscOZyJKIxaC7G8U8xHbCUvHqBtqWp7IP5LjYEp5HQku/HklKbHBIYUaOjtpJGMVW8mP0Qi7AGXBXOU9NPVJlA/o2Q5GC1BvlTmiHceN0AS6XD1HFHFeN0xXwU2VsqgYlsBBvYy/ksTambQmL0oVOLgdPKhmps4C5CJkRbDW8ydTeXdjYJ8stUxxdOtM/cNe8DJaOh+AKqKMHcVDySVOIIuwD/hML4zYsZcUdJU84gDeflQya+ZsL6c23loYPH+YCr3/UqrBQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	h7iPeXtGu2dtAIN7qD4pXtIEAIh0aUYexHTB+lrSOjDL05hwH8+tYY9X1Bide4+SmIMiOj462Sc35O794s8UAatKflugeZJim7eEG3+iPYr9FTU4u2yrKm7zD6QzpWjMR5SOwkJ8PIzw2iXmSi5PFeP9vaOGjvShqP8Mx2QEjvsd8p4f8qQQ/D9A2vd/r/E9VOyokio8xgwVZqD+zVDfh+CWseZpWbJ++CtJ3sGtTAYBVXfu3NGGM55N/e0VGCBtv+WW6Y+Oj6dC7zjTwMawtoe94eAT9d70MrsViJUz5Q5PWTLhv0a2YwwMdEDW8AZd6+CG9gAehlRALMt1JhmUbDCgwmGI5lqlvqalKmjawY/HSCIjgKRVM/jjrPEpAJjTkR5oiigEb9dQEyvdAzp9ilnLcj1eh/O5GMboFlkq5k7r2pDFUnr01jJbl6GNG8JJ
X-Exchange-RoutingPolicyChecked: 
	LYx1PgGKM/HeCbyaQQQoUHYHYIvFGUXPghQ8Wa2GcSBTCke71UXJWbz4jS4Bcn0xKd6IcCUjkIYCPcTAQgo/vKmjLfwczBYvF5Uauuhlm64Yd6Ag+hnJeyxcOGWdJvsKqOO8SKtwnIc6hfBe2R3Lef6XR2lTDLT3qpidQy3/U1OO01Lyb9/paM+VwjQk3v0xzV48u32mI0Vo9AnyBe0f7zas/Z5mt3RrkLo8kWjRz8Nmq/WkhlSTT1P06jMv4Uf1dP42jdKtANvnV8hlkXaDzk4DlNkWN6oGAEnpSRH24H4m0em3f/dXf3r53BaLgFqOVXKXHCGAAqlRRPQhJKJZuw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 22:42:53.5295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d83bf73c-96a3-4635-516a-08df1f442a39
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7126
X-Proofpoint-GUID: pq5aOAmrdjEBbDw4wYh_4O7qbteZjmRR
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abd9072 cx=c_pps
 a=PQms4psfS+nBHIg3Mxsk7g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=u--UtgHZ470gLwCd8uIA:9
X-Proofpoint-ORIG-GUID: pq5aOAmrdjEBbDw4wYh_4O7qbteZjmRR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA5MiBTYWx0ZWRfX5CHS5fgcB1up
 jIiT1y74hG3oZk5nZejv+46zUR2N0TPDpZ5GcM+lc21nXo2WyzMNLYKSKUpSlm3Jsq4UF22Q+Dz
 oDUNfa5mhhGxhUbRs2ezG4o1jqKhPn4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA5MiBTYWx0ZWRfX2fZSM6bMrl+N
 uk8ihHsxCdou0jMyNkNBf3nfHULRHpPs9Iz8kEC17Bd/+mvyA3KbdOJbCGhtbqxwMTl3Onn+gjA
 OflwV+RtRsuI9gnY82vfDR7oEdlaf2E5yWTEXhJV7SJVgFqEyHvaBoE2sUQq1eAe2Em6tY4UK42
 7PqcbjEWlKTiT6EmEM2pIfes4QQEjjDi0jUsvyCoJSuRoWz9ELyOTE0NZj0UdFllHDPUxUbPYvO
 9jnO4VEEin7iWG3F5nYCBJufmA9Ac/H1YS5klaZs3DckS9XoaXs/TiV1qCUKvUS1QmmBQr29IZA
 nszoHQqovxjETPR1wDwNpsWx6nBtZY1L8D/hMa3JJfvtg6cEnLeU9cpei2p2D7IKVFnw315S7Zp
 P9PxC7Cqqg207KsUzqcxdkoo3dLItllldsXb7WUnCDYqeqqOdi8cNDRUbP8lFlvtXqymE+3BJO+
 PTGiKLfnA0Ejl1BBKLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300092
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 22:43:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17726

meta-arago / na / 20260930222241.3467841-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] mesa-demos: Update recipe to match oe-core
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 30 Sep 2026 17:22:41 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 09d793d20a0c28ebbe837ef98d635bf63d731dee

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: mesa-demos: Update recipe to match oe-core
- Commit SHA: 02912d7770bd5914129f8d95d2517250b398fe1f

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




