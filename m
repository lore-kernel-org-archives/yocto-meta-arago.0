Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE54FCA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:25:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17709.1790785551199047210
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 09:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=AIFqLXwL;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=iBsH06d9;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1HMF3333344
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=sl/mqwRU+H0l8DrHxzNWQNuZhexw9R+q6vk8nhWkR
	BA=; b=AIFqLXwLeozWd8AL6um44Oz0gOf28GC46rBRHHuNzLy4hXHifXZifJtKc
	kMHO7TZNxzRYR18nEq3GGm64ZiMHEKVjy513y7G4c+q9Xd2kKBrxkFyeFYAtHOP+
	XNn01SBu4JofS7E2D/0vO5KkQfREPKZuRzfS2L3geNDgUNEK0q775TcLjeGQNkK7
	4GhpCkIuDdAMEixtWtpQBzL+LUNuVXfKvYcn+uYs2NyKvevflK+c1Nvf0Lm49Bh9
	gKi/Q705TAs3BNabAQP8ypfrlgBiK94pmLgldtxOtz+EuC8S613OXnGufzA6C/Ud
	dfFcj1Xe6syKaOUh+bk6m34uG94+g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013036.outbound.protection.outlook.com [40.93.196.36])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1t07e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:25:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwCOnihZ+CdUj/TeD9TQzIjZVu6GtDirHUpSOhwccJ/OyZHGTDY2fw3dzFu5umTDly+pd4scYpcP39+zeAVcZQXP7DBA8xXhyynkZlopNn1ntofe/3yxYZbRSgu6YcIqflhNXwDzAO5704syR+1Jba9lA+nYxKVMcWW/aBjQ3XFhufjKXSr5DmtNJ2fsp89wkH1NrFl6ohgCPWENm/EAEzE2+gNeTcH6VUnvGnnt9RTbl+vK/SZKD8zRjkW3GkbTsY16k1gLyfplJZcn5rRnERRxHKXx3zneGo/9pE6Qs8WLb658QVwGdNEFx/5vWG5IxJOqgABgFyNhdSjfwSKNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl/mqwRU+H0l8DrHxzNWQNuZhexw9R+q6vk8nhWkRBA=;
 b=a5lhaiJh6eWEhKxw6bWuV5IUryKRBWjGGc7G1sDbOxgBGdVG3AXzozYl2wnYjB77EHXZn2goUVKLlnIorPC/e934J7xvtWwbiZuLCG/6LmivdDYnqkwFyDM94vADXh57QlYWuZtr1xvEKCbMRdmnxsdeVXkARErBr3sS6DVK3m6eSDTgpbhOM4azvA5LJyJ5S1OC73gP1YAlqv5BlVlgeD5YHvVwgCcnCAeUHZF7qCRNHl+pY3jcvM/XzdaE4E5hXwxn+V3brSDIefQIvQAh12OU8MrAqUItnbwAyQBjxvwaLvTxb34kEGZHVFfmNL+SsHzarStz5nKMH0BlGb0BQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sl/mqwRU+H0l8DrHxzNWQNuZhexw9R+q6vk8nhWkRBA=;
 b=iBsH06d964Eal2d1utlwwqKWcYSqT8tGmt0l+apwYEnbxnB6IqtfWVQvArAicheu4ZH+SFQ3FIezK5xftSVjv+Qqi+RK1AzWWm2DsWzpUrRMCArHrpj0CJbRlvl+vxP6kR5dYSBOGh1nXxHkj0xb6Dyozem3ab7tvJupVCOc/h/h1Mu1RGXVDEnYm2l5LqQw7nL0salV+YfgXxmdLTAJ0bgqk8ezabd0Fk3QOkVCg7GZy+dqDRThgOhiCMCfrZCtrWdsCTtL3f1lgmLxr29YLkAyqh4fEMBPhA3Fbws9fow0G9xgmx8Q0hbbndjUAuJliKw0XoBywUMTlB+sfJ2jlA==
Received: from SJ0PR13CA0193.namprd13.prod.outlook.com (2603:10b6:a03:2c3::18)
 by PH3PPF553978BD2.namprd10.prod.outlook.com (2603:10b6:518:1::7a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:25:43 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::11) by SJ0PR13CA0193.outlook.office365.com
 (2603:10b6:a03:2c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 16:25:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:25:43 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:25:22 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:25:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:25:22 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UGPMiq3455226;
	Wed, 30 Sep 2026 11:25:22 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3041A9A9C2; Wed, 30 Sep 2026 11:25:22 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <b-brnich@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v7 1/2] chromium: auto-load arago extensions at runtime
Date: Wed, 30 Sep 2026 11:25:22 -0500
Message-ID: <20260930162522.1892566-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260930160338.951001-1-t-lannynd@ti.com>
References: <20260930160338.951001-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|PH3PPF553978BD2:EE_
X-MS-Office365-Filtering-Correlation-Id: 592cf6f1-9693-4f6c-db44-08df1f0f79a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Sj0eLw2nogqon9YHmEljh9SS59hV25mruQP6aTZeyiZ4Cz7OrzNrn12nzAryqGOKfJKCIAf+3bVqhObeStwEiJgw88wcqgr2zUY+ObbNCV2T+okBu+BVYZvvLGiwcqK/IQ2kG+ktYBq9Sg4kIGl/VE2eba87GZ0JucoA9S6BEN8ai5WFMNhfZ+zCamfERedH8w6+0d1yJ+UG2fzQs15nv955wtKIxPMPt4aVAbHIm7MIf/4uAwlDWbFjPqPFqYqmjN3uzuwQ5tYF6JxlZ0Mt259BTylwEUUDbxq6VlUz+nyHwFaVVbPYV/gdHq+RyCoHQw2AotQj36kP1ID2tF9EmzL9nCe2hVvwXRp/Q/+m+T2ysFYZkBgD/zsjBfFQN3unvc4l2dNpqmUfDagurWVIp28jGksXm37NqitT6JC/clWHdX4CBepfeENi4CFNZXs5oUMw4WKGnrm2g/MnrxPT96NGIoL5MFkReO4QuNGWK7C7e/7d1NEajK9r6RNd51ShcLT+ec9tLFVO9ZlVsc8tFCtVjEUtFm5HFzaGD1P06HLExWqy+O8Ez+6eO4MZiTSA3v74hKc/AoOXcBovkMFEAJpAZ0jR0Y4Gd+0eZWbetZpetjB+BIEhkpltN5EiB1jb6wnZPzw7Kj3IaB7WQKqbCQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nG3peY6E5xkK0OQc7UZpq+VVMszrDUlZOfMxRDos0QVc8B1GG/t4fs9gv96vwQHg1BkmBeN1akhcvRmR1m+bk1i4ufh7+bRhmlJpqEl+okE5AO3Dt7ZFPpBU6VVOq+QC2VieO1myxCH8K+QRAzDQwnR/xMb8WCLpBHDLJswAD1mZ0VYKW2GouZJUoosXwJ+jdAPxnF5HWBSEalzIXnaxysD0u+5A9m+yZv3volBttolmaxIqDjN1OLxg+dRuU+H/8sRjSpyqsCBmi+Xi+G7me92iCp3v3zxT0FHWfJtqt5H6KFLP23PxS1gjObwscShujX+2m64Z6bpOmGK3pOgX9rf4ViHcOwQ0vusg0eAaRGWK+ZdiSDwmbhzXHpwOKeHXHoafWXHvn4cft5TQqiC3PqHc8I1eY9CfBxkO4OcuQymRTXNgWpU7gxakhGnzHWSJ
X-Exchange-RoutingPolicyChecked: 
	BeVn5arzRC/ehrYV5BoiBKy2wKqfhYYCaAgR4mcLW/90gkGZWPzMohBCrIvaX0vMvgOZwnB1H96gtgECprTC8pFUTLui8PxVJASqAPO7TMgqPHSQVnWWdJIkS3tg6RtLmUxFcdxYwDyaZQvy0avI0KJqNSL6a7dAi69eikjvhFmL1MTut5JoeIdZgr5GjI2PYztqYGPEtBgGeOPHxbg0CQMGw5wpi1GD0FBNzzcDsFjZFOu5CO9CtSfW0ou/44ab9zmwMLSGljjCyV0xZyQ1L6mkphxtJDJpbg7w7ObYGNH4OtxV4vmOWkYiPdsBBXk6OVahDaa11NSDYwEOEjtu8Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:25:43.4216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592cf6f1-9693-4f6c-db44-08df1f0f79a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF553978BD2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX94l/lS2w/M62
 UNfcfW4ZHYv3xZj2bQ8ZlrlXosYIp3j28tbQYAUbpWlRBb9U8ir2/jN9da7GrOebMvs5AgcNTSl
 ExOjnnM6LEcERFuj6ST7TM3eWwD0o08=
X-Proofpoint-ORIG-GUID: vqlDmqZOzElj0_K_UGrObMx-Auyui3IP
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd380e cx=c_pps
 a=vqIpJ22NDJOYTIB/W/KhXg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=RM_rJlpamhP9fblFMz0A:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: vqlDmqZOzElj0_K_UGrObMx-Auyui3IP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfXyPyGCzaHNpn9
 ufUN+iPsrV5bKUDdmuKJERonBbmANyUcsu1GU73pQzhakIHqMswdECgy2mdoIVpU7e4CfAL+Isr
 gEOo7ipQ522cjTq0aG7qb1xUnewgKBadqBsTw09nj/z2iWRy+q1BRVA7Dhe66iLTkRUjAcyLn5X
 J4plIYkRA9QecPChlmMzBYn/UqxOligtsWpipe0cjyZ65FcyNM2QqX7mD4dUlvEtcJZgwFddbM/
 7t24mIu7fMQIEQREaGdfe0uXzTeHbvi5CYtpyv2D6snGVfKNnDH32oPNwCO2vAxY9mCXyiVbTM1
 0nRStdrN0Djlwgz0g8nA0YfeMQjK/qqouWseepUzL9UZ6kOEkMiYLPGoa5k4/0/xppiNXGD3Wvo
 JMXaV0NWu7cl0QhmpeLe9y0NT8Z9IhVNkpaMbbDaoUpnxRGMV0Ulj1vfBWHZw3i0KIew6NqY4lb
 ugaq4yugVdff5fliUnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300065
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 16:25:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17723

meta-arago / na / 20260930160338.951001-1-t-lannynd

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master/wrynose][PATCH v7 2/2] chromium: add force-h264-youtube extension
    WARN: Commit message does not include file/recipe name: chromium: add force-h264-youtube extension. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH v7 1/2] chromium: auto-load arago extensions at runtime
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 30 Sep 2026 11:03:37 -0500
+Date: Mon, 28 Sep 2026 13:22:56 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: ba6391ad6bf62f32a072f2336cd0cdcff0d49567

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: open62541: upgrade 1.5.7 -> 1.5.8
- Commit SHA: 170fff909c58178a4c21b76fb3866b17bd9b7cc3

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH v7 1/2] chromium: auto-load arago extensions at runtime
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 30 Sep 2026 11:03:37 -0500
+Date: Mon, 28 Sep 2026 13:22:56 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: ba6391ad6bf62f32a072f2336cd0cdcff0d49567

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Add exception for pipewire update
- Commit SHA: cc1013940d3b41154ab5e3e6e82a9b584a02820f

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb

wrynose - PASS
=====================
All checks passed




