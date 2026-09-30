Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C54CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:59:27 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18527.1790787565715251961
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 09:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=K0pL56uX;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=oGjmOvRk;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1kjf3890525
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fr6jP7P5xEmXAiltJ6P6lnykZCKxYciMyHjuLchUI
	k4=; b=K0pL56uXMpmFx7DMlIYW2xN/fT5J4TzonGp5zwvwOC1WzVlPtJqzIVzci
	khVoOMPksOQ3n3J3onA6z8lSj9tarFy79VEvVn3+pA1TXlzji1QNiSG4nArI9c20
	zbbR7mDwpCpJAeEjGZwVHDbHqJhyiiOHwmXz3ueGWWiJf/j4d1exap2GR+qi6eL4
	H7uB6dRSDOO/dtD6P5t2Dxtsd6fv5evpF7zakP3RT/WFt67CtY+0c0kW0GfsSX3H
	CDrz6ntHma0eb2yVLvRR6CQxHkMX0o7+/1cxsE3j/SdKFTR7dRb7kd5S+JtU6oos
	JwpNhtBcN2hLHERkAUjwQi4bWBeZg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s229b2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:59:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YK/zMWaLVItKQmr4t6e/9J9gd2pcTAQBYYGQj2CIKbPoblNVJz3eIG4STC8UxBxAYAxkZrARuIYEef9BmQgKksvxQ0avRb9X813SY/YQPpNlqhCL9qUx9Asuoqyl47vd0LdvuS/XgDgCNDpW1lDnOMtuPc4GNlRYKMoBl5wtWyFFIm9GSW1KCQzJOqFjR4yQvjZieGX/daanmKMFwqBuNSpVuBOgmeEtb1AwDmBqvx/ZM/gWXwxtO0yCH3C29SlVU/MM/SyPGTzagbKvh8fq/BcOMSNwX8v6d3I7g1tCctXJkPLjJEIAbmT4Ip/69F3OHNro1BA678iLWelHCjX+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr6jP7P5xEmXAiltJ6P6lnykZCKxYciMyHjuLchUIk4=;
 b=YD7vLA5T3DdyWXr+gSjFXSssfsaqy26EollfaTOAM9dRrngQupVuO5WkDaeNOJy0tRTQ0ic13hCb7C88M97F08RurqFnbkv9VmCQlDfR+vaizJwnqGQaIe5aHudBuY/kXJ1PUW67308bOdlKlfBH+qBGM8xmTth06VuWCeskwlMRaJoGXm8Pvelf4nlpWPcJbQs8dFi0AWgrJ74BtdPSxrGuPlBIDGZai6Du624oaw4cFLlejCqV0sBKjz2QU85o1AFA/Yb4UIGnSYg54IKkU6y93OWQc2QFTSEvW7uD1W3IeVgWhTDyJhOwIzqr0LlcW3DcDHFep9Sx/47fPUyQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr6jP7P5xEmXAiltJ6P6lnykZCKxYciMyHjuLchUIk4=;
 b=oGjmOvRkIqsPvkg1aoX96nYu6Irzqfgk9A0NphML5XvvFBy9Wg0JKE8geXE1dPJgbCJpwrp2wa7smts+RABeRaf/Pzn1SiAy5d5waHrEFD0zM9qQWDS+/Ini+XovIlqKXyP25aDh88TqFSJaZBUr7uHCtbNo97QKIAy3VWKP3OYNCKu5WAW/RNB8EgwTEYT1LSlkIdeFxNTOgsm5YyW2zeNrKL5FVyss3Uy+SbBKGgCr1E3XJ/3tqnDTlphXnfGfeZWy02NjwhH6TnIfY5lFWHyq9f9I2OHDugNKmQ9VlVSaWB9ED/nRUflOXA/foj7acMOtpzKSAKDD57UqGb25QA==
Received: from DS1P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:454::9) by
 CYYPR10MB7676.namprd10.prod.outlook.com (2603:10b6:930:bd::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.7; Wed, 30 Sep 2026 16:59:19 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:8:454:cafe::38) by DS1P222CA0012.outlook.office365.com
 (2603:10b6:8:454::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 16:59:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:59:18 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:58:46 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:58:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:58:46 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UGwkie3504239;
	Wed, 30 Sep 2026 11:58:46 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 183089ADAD; Wed, 30 Sep 2026 11:58:46 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <b-brnich@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v8 1/2] chromium: auto-load arago extensions at runtime
Date: Wed, 30 Sep 2026 11:58:46 -0500
Message-ID: <20260930165846.3072481-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260930162017.1163748-1-t-lannynd@ti.com>
References: <20260930162017.1163748-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CYYPR10MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f373bd-0598-4148-0f93-08df1f142a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ZpqzVFGDU9bkJq9sksEaWUrd4qQ3MhJ/BRmaTlgZ7UCx9rOymhcV5IW9Jd+tiV0uL9yNAbD2OIk6psGH6OQpetVINL2yYnp8UBrriAn2er5cobGzy/qucYhWbgndBZy7S/Kv6PmCk5yJMi45DTRdBHPaMR9QhNeWyHlii/Za6gQvLDacxtecZdiCyVrF2aWL8AuWMvAXfEjG+6+rHaZrI8Az1usrZgCT3PnO02QIKGtC3etljpcnPGcQsPSOYI+kZSHXs/St9j5512WDnDPjTugd2CFv6gwVas6m6jlBThiDP12xZMjmpLG44y5eslMs6FUrIlUcn5FzzxKdNlctw8tE3LULL3ufpgA7b0ScIswO64s+cJbiOJkwVa5TpcZz9zHCV1yNCwX2BHeluPY34zCciWWSqZFttJtSfEobAYy9X2+SwZ8o59ihmYM++ceq7XVBIrhsJFk/X4RNIZY90pWxghwMWA25ppoxkFGOQ35T6MCXYkd0ib5BnGiZRLbR1lNu14u/Jb8qjdhrgPttQOOCIXGdhA3JDzEd4KvVhNI04FHYi2qqK6b7GFhH8az9ZbHIUYtZ1+5Oao4ziGJZ/dxPB1yvLppsfYN+kMCRBYKC6pJi8Uybq+KAJcheHIQKfFs98zNNtxMraLh2cjv8ng==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uc1J3sQElFLEkZ7XBoEKOLTxNwsL/cYl+YiweFHiWWwGeBlVk6F0+yWriOrqG4Jf4Feq6goq4hY9TFssgUraeQ6MUUlkNEytTVB9ZaN0QA7syEuBf0MHQgt56XOGu8hIlcDROR7DmmZDeapkVKx8NEEdKg7Mb5wMxakCmQC2Pf/60kBGRag0m6OX5d873iXVOgN4GbgynfPrQNxUtK8QLO+uiNhzI1wcsZJ/RZehJIYVQT992TDFca9fUMSF1QDyHOudY+ZcvzeZLfFkZLN5Gr/PF6KkWaLyiztj1XTKmwEfs5PEbb8AHvNDYXplYrt8SmDfx/lKk1zNvhXh0y2gFXOlvokSzvxczADLnaX8hALP0gX314eDdyv6TDawbDrblwIz/QyZ0+0xIbPt/ZACsy2zVYXxENjlCuqz9qSdL1CTuAkMtPS1r2rbOZ7ndnQi
X-Exchange-RoutingPolicyChecked: 
	SsXNI41H9hveMpk8uypItTV4q5TpgIhw+PdNDLrD2/91a6KBSON9xsoKijEV8HhR6tKuRVsCTjzwWCFfjVyzlqqUXU+DaNXV9/FoJLRxQiMP97HoUeV0exOxXyHSOH0PQaxS8o+cBgcOM8PFa1PVXHIZT4XFvA7IKkxIm8XtGL3p811uQOfe43DNFpodpwcPgxCWpaRaIqfI/GzVMmIE0Gwo2kwyr6ur8vKo5K6xxAfpJv/S6Lw0Wky4SqVmXQp/2iTbE0O1oJ7XL/mVn1oxo23foSlk7a5kyNnR0RIZg1HaV7XAauXdj+N+t5pStzU8rQyJeRH6jXuL7eMR4x6+8A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:59:18.2101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f373bd-0598-4148-0f93-08df1f142a84
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7676
X-Proofpoint-GUID: ld01qyLPuvasMlMnRp4iNC1Ev9Nq-5BS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NyBTYWx0ZWRfXzb8SA8L8zOdr
 uz4RDMSMW9BB+joBVcEgtPRoe4PrmHBRcotRSW/BzY9bS7EdQYyRkOf1l/Tu4Qq6dOxQmSUbx18
 hkjKIjRTgDqVHMmEsHlPPXyNl6oJxthQ7/RMnqf+TDflaGyoTcAaJm3RUQUofER8Kg/7EP/Aic2
 OQbjmfOqRRVjyEEXjg0OKpEhHBF7VHb/fCd85LL31iU2/zbvr8lFdulXTVn9MvKpAz8N5uzE1Bk
 2Z5PGr+kVmYHafONDnmxEgR8KM+cx854q6kgOk5VhxGrx1HmDoxTnXGkc1mv4xEXv5sZ6FaZCIA
 X09Zeo1dzUbrIrtn+nxyymFHjDQ0uIRE45iHgzwZwvKB+NwM2E7sGfTStN3SJe4A5zHmf5iLVX+
 TnhEIiUDEYvbYA8sskjEwnyzgSgBNp0uGyCmM4JCidph7/OJcNNJJ3twExPrPbHQJnLyjWqAx1x
 pobAyND4qkd1m9t8hmQ==
X-Proofpoint-ORIG-GUID: ld01qyLPuvasMlMnRp4iNC1Ev9Nq-5BS
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd3fed cx=c_pps
 a=pKtxidU6TXaQx3FGc3VI+g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=RM_rJlpamhP9fblFMz0A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NyBTYWx0ZWRfX5LXovLWs9d+/
 vy5Pr/nouHvkqlBAdLTptBf34SMZEsrykqgsGUbjgliLtQ2FKpEsJlLmC3WQyUdE3Glbq1lIjCx
 XlfYg4tQewz1jRCbZCet1Q3phx3LFgk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300067
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 16:59:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17724

meta-arago / na / 20260930162017.1163748-1-t-lannynd

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master/wrynose][PATCH v8 2/2] chromium: add force-h264-youtube extension
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
- Patch Series: [meta-arago][master/wrynose][PATCH v8 1/2] chromium: auto-load arago extensions at runtime
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 30 Sep 2026 11:20:16 -0500
+Date: Mon, 28 Sep 2026 13:22:56 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 541d351971eb5b70b3ec245c9073bf8de644dac3

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
- Patch Series: [meta-arago][master/wrynose][PATCH v8 1/2] chromium: auto-load arago extensions at runtime
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 30 Sep 2026 11:20:16 -0500
+Date: Mon, 28 Sep 2026 13:22:56 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 541d351971eb5b70b3ec245c9073bf8de644dac3

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




