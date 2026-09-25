Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6424C9832A
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 21:26:49 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8526.1790371599399178779
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 25 Sep 2026 14:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=B4CwjkMC;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=R9PXT0b0;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIouWC2801091;
	Fri, 25 Sep 2026 16:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2U8yGv/dtZmp3JU6FGD5Q3NEYBNzyjjAMi/AMs6vc
	/8=; b=B4CwjkMCifCcUsyc86+rAbXJqGkc7DXYIDiR1E+bV90jq12NLzFohdiK7
	uUMMMa/ctNcgFc6VDzynBx2gQV/K9ZkFIIeUNruwwp6MPQOcvPwEa79BaROeCX46
	UqB4t8gDLRawFDk7AJ1tX8sa1vQWRi1a0WhPwiHmmPR5KjYBjx6CdsZFYw9mwsiJ
	bRY2E/mNecDzbF9EyADwk9DlPaVIW3xCiyqLqNJQo1QpR4c0vOlvrwFqfRdM486w
	uXUZWZ4CKoVlIaiDESdfoABcoE4W4gjCeGodB7ookEuESJ95mP1UdORl1+5jXmFa
	YRVRi18bowFnfI4d9xRYQIz2/LMaA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gwtcntg52-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 16:26:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6nT55w6KXsiMz0jP87Xk3sXVHJ2wK0/7uofv7pzJMWP5yN3/Syvp1rVW0JdOEB8kAFvOht1V3tK0vRPD4W3kRdjzgfto7jSUT4MkOV3tyOATk+BG3mrFW8pVo5+yWRuWm40kHQlYj+q/SXUXbRAMwquxq18NvSuCBGwoHRw5vlhodRacWBX5wmzwINMLhL1XKLcWQI4aQ7l99MLjDJYzfd8raGBavboNkSTxLttN3QtsR6mtStVJrCiussZjrlFg05bJcQV820HmY+WsWiw8gflnzQSSCGlV/QLWPy8/vnV1ksnT4CsiZ/FqdgZgdAOAz3utXeQSwAYxAV1yEPbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U8yGv/dtZmp3JU6FGD5Q3NEYBNzyjjAMi/AMs6vc/8=;
 b=ZglUBdMGh0KSL5Miurp/Uyvmf2umVsapYDc/xyIw5r5ZBN04qgosfeVK6aO45JD/y5KmqVUaX8iutyHK/0ddblw9HFHIy8ziHHE778onz3Xcu5VPdLAaCgrQcGdjNAT17yyVX9stvncgINj59heLenTDrsAhl7QwCqTU1ceQGdSVbN/YIfcf6Kx7Gt4gAl9jMwsLY791bs4c5ULFtMcJkq12JyQFHmSjbZhBN4sXU11wz1wv35JW9lxR5e66Pi45JnpkUUhKuFNrTPAZ7h4luaxOoIgkB3WhtDz3N7kWaKd8YD5pO+q+to/kdhNQZh9Gmnjxg89DjJBCwTvuA1/HKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U8yGv/dtZmp3JU6FGD5Q3NEYBNzyjjAMi/AMs6vc/8=;
 b=R9PXT0b0t0RIH3suMF7EspXsoF2KPjJ+CXWlQbjEMDXmI1UwgkEyY3wQ2KnuhpUI1VDYSedHJP2+hzuX0uAum5ObfVvEuAGXKXsqm+3L+sPjGTJX5ga8A3hw5QE6oI9BHOGEce94lnbkNOuYA3cnAilPDHbMOrMJWxKVD0VIdlF0mlRfpiydW/rUZAbgLiY6U/zcSS5ELMcNhLT4QRDqBqfSGbHydp6Cy4m3tF03Ayc5gM9ymJ5dokRz3tAwo5rLFxzoGa6cxCzJrM/Ebpfu13YRU+cVfDAwbVqhyqotlgNjG5qPXluLrQ9+psS0M3A/HbNqRJYGba7/fEjfoSqRkg==
Received: from SJ2PR07CA0006.namprd07.prod.outlook.com (2603:10b6:a03:505::18)
 by DM3PPFBD8703CAB.namprd10.prod.outlook.com (2603:10b6:f:fc00::c46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 21:26:33 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::76) by SJ2PR07CA0006.outlook.office365.com
 (2603:10b6:a03:505::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Fri,
 25 Sep 2026 21:26:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 21:26:32 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 16:26:23 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 16:26:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 16:26:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PLQN233479205;
	Fri, 25 Sep 2026 16:26:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 94C459A9C4; Fri, 25 Sep 2026 16:26:22 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ti-world: Clean up chromium inclusion
Date: Fri, 25 Sep 2026 16:26:22 -0500
Message-ID: <20260925212622.4021140-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260925210225.2158880-1-reatmon@ti.com>
References: <20260925210225.2158880-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|DM3PPFBD8703CAB:EE_
X-MS-Office365-Filtering-Correlation-Id: d67c8bd6-4466-4c09-108d-08df1b4babbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	R1/MvGzEkU+7TCZIbbNKzgNNyqVwTQridJog4sExTmAig/XSkzMvDZctBdFJY+gPFF9RNd1jrVGo23ByTXXQTy1Xw4GDhzcWz3wUsXNvSGiO3yRDQjE6y3v4ex5TklBVLM3B7Xz3mC57JMvExaf0Aw4CpTK7kdvx3Gz4eHu4qrrgSVIi+kOIywCNkWQgoe4VZTbKnf67/9nmoprddQKf+drRobPMYavwAEjKds9cetmLDUwWJB28Hnl96lbTOvJcB5Ov6e2qUDwD7bZB7Lw+XuOUckDM+krB4bIvrFVnobek/secDdtPWVYNLeYZqBvJPJeCMbR+rVbnsPszP/U6ZAiwBptGULE4PErz6rEfeqCzJF8Aa4QJYcYngiOaee8ly+1aEUVFjIqNC23USAyG/nCeVxCtIh7/nYATmtzSZDHJJFW9nKmWeY7vIMv25nzT2OWWWe1v+FFLFQ2Gk49q10nvyYWEuzH3dkXKZnNdk7BU9XeZ+9AAeYxR82GrS+dBwLVdoSQ4tTtBhwRU2TQ8bnkCf/4mGyGU7RoF2UVSYE4SMek/qh3Kg9WmU58oTw3gjkFwRWAZXNxvjuEfTIYFcZ46WR0B/fuEBMWFrV3Edu0D0nH25SY0TtwpN7dKOtZU59vzzR+uzu+M6kJ/fCtxJDWusep0Xube4ANcbayfexOD2YHgrELmjD7BzaQto3F0evhuq20QV2Ds8FcjlkqARQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dImOKpZCOX+qCyvaW1I+hEBSdQZr8WzgZodei1xfRLQCxzDeq37iKG1/98R6ZesQdtgxB8nmjgNYZu3zmSBfMaX8jk04oSb/bJLn+OlyhEpIKiXxcoHlMW5l8xg/MRe7GfMK8CufX96OZpMuzC0bLTOH2zVoyUpG1UzuX3R/O7FZdyFTT8oNRfLPR5RyPNg1CvWd4L6hJyAsMYllp1KlYwfR08qtOnDPA0mgnL76+NGTUUrLCbizTaMK+Ie/A5xhkwRbbTjJQYUw0Ri6/UpzgvqUDKzcrlXD/7Qn6YX/NX3FL9e9DKTdWPS+m+SJNpmMmlOMQrt1jibgamZHEoFrdBSe7jI1GhqWCe68e4idNoV3LL3BKLoyyVkaP83XUMc7zfRP/plEeQ+COZpiroDT8b8k/5REK5WVaK5hm3BOsktUIVVGaO29RINBYu0kYEFP
X-Exchange-RoutingPolicyChecked: 
	nTC9MI23SFyU2qidVXTfaUQaT/43Rc52oxVOpMPWBtkWwQv8IWmE7D82bkibwB5n2DWwl0VBer/TAr8QqCdgweq/L18Oa1W6nBFgyHLesVxdr4F5pimkZKNLCzhkzcEpxWTurhtjtEqNf1oIeI7mPSaoNheEQd2FgrFqTN7nbN36JECsutdhsXNyyD/R1ruNjnnGK64FM1ljWVwyYXhI4QwSroMhFMl3U44WVvN3l0VmakftLiif3LksGrScM0DEGWBhslQx2GBepd5Opr9SJobbLAAFHE2uqAMPJTFsmmgEd8wd7fh2HU0enHmiK1GfMEzguzTVm51BTOlE7v1z2A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 21:26:32.6281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d67c8bd6-4466-4c09-108d-08df1b4babbd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFBD8703CAB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4NSBTYWx0ZWRfX0DURRN6DQuL8
 PSMeIqebF/evonn4Shjv50uvZg6wWvI8sQXP845yffkICqLEk2B49N+RvxfYnAkL/Y9elzzbLqt
 CkwGfI+6zsCf82ReE4orBkO/CncoWMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4NSBTYWx0ZWRfXyQ+K3R6KQG9y
 nZMThTkHFQxv7leWgLJha0H72z7WEeDg7zn/Cb89mfjAgZ0hR5Ea4Pu0M+pF8/Jy+G8X5agbaxX
 6U2xLby94IITMgmvHFszjgmRMEuGeznMAjYtViyNVfkCOI4LDdRDq8cfN7Tf8g6+Ix4efjQDDVy
 npcB5kjO0pvu16oT7QTBpOdPUZtJub8KW/+7GIUlCh6mPhE9xdkU0Qi1uBHOMbrKHwJru/8tTLi
 RyK2yQHIKUaLvEITEhKCuvu/jXmQ1H43z1TkM6CCr+QkuqFpOQKouBVrRP1d04ZIzikle2dsbvy
 4zsW8DJFVh5q6y50PSxSMmBv8kUAvK+Aey1xjG26pyM2E/cJ8crnGm6rl50/CLlmc6dYUiUkdNG
 b2tTbyOwsOPhsYrMHlwXvxyeddPQamDzwkt2GnuVd+P2gKXYiTzHqwi5WXaL+WdpL1rmiIrsv1A
 BAR0W7IlfwkGwRn/AGA==
X-Proofpoint-ORIG-GUID: n-K4T_4TlWFwSy6ueesSErKk_Rf7wMiM
X-Authority-Analysis: v=2.4 cv=P6evFSAu c=1 sm=1 tr=0 ts=6ab6e70d cx=c_pps
 a=imb72M7KABO0D7Cp285+Zw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=GH0ulPVK7EXOIMOZuc8A:9
X-Proofpoint-GUID: n-K4T_4TlWFwSy6ueesSErKk_Rf7wMiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250085
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 25 Sep 2026 21:26:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17709

meta-arago / na / 20260925210225.2158880-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] ti-world: Clean up chromium inclusion
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 25 Sep 2026 16:02:25 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8b47b3026df0d7d7ad3cff046e0ab84fbb648dde

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-world: Clean up chromium inclusion
- Commit SHA: 6e0dd96eebdd75de156536406d0cda78c2f8b572

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb




