Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EFEC98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 20:27:07 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4718.1790195219661919736
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 13:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NRPIrjli;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Xs3WTjOz;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJkNgH2098328
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=riu9Y4N8LFSMi1Hq2ciMDAnNv/7ox2/Lxk/xVVVKB
	ME=; b=NRPIrjliY3sEPaou6p2jWXIN/CvYgEiwmJ9qf7hOAxp4darbanXq80YxW
	tb/wH3g0Ym9gGfOSxIsY2ltyDkn4mrz25KFgNpiANpdk1jvRWqM9U7hx4BRy5wgp
	gbZq7qhbawG1pqOvZm7xl+FXsdtWcvKWb71U7FkAMXEhe20ivFuCvEcV4FZ/L1FJ
	lzYu2bbkGA7rvZigL6tTUzj+iwXkI3CzmcBQ3m2ni6teSoXunk1JiKw2bp2kGWKd
	B681mYBqcepkoAMi1FWGjhQhEbpDCczBOmOJRY5oP3I+ANlhs4PQTYoypUom3E54
	f4dVfOYSmT/2iwCE6AWkzA6JdVnGA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycydsc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:26:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prsx5O6U+EenovyRPZFA6zXjiPGyTEe9edDhL9MGqTb3TnIW9nh5wHcSltP7z7i/lgsYzo+PNMvvOSlPgQz0xYHsKDQuxO+fSshVsKKt63VWMokwDv/7yrPQVqeV+n4chuzqdcqDv0KMWQg2+IJeqmjiKeuriBPBB+nVyyXgtUuvC6mk3QiyspOmFGF/izALruquD9B0EmyAj6PQ9fw5gB0xC0Wu1x4i36oCrjFv4Fa3sYZz39jZe6j+4mrWqajqOc7sRHTS8hpamNXnc7XobbTXRQvSifqgvGQ03gq4H5nOw5ccPMcyjcsXW2fhTavjlui/iakKQhyjxQKFvj1mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riu9Y4N8LFSMi1Hq2ciMDAnNv/7ox2/Lxk/xVVVKBME=;
 b=R+0GLt6FjPVASitgwFMKCJXBHzplFn0PYYBapGxSNaZrBKjGSlW/DhfwUZqNLgIS964GOurj7PI5z3pg4Erf5wXc4BtjlVL8mPRBXd6f2Ptnp7qVb9+UWjaVro/iXF0lT1Bf5YFawavhotuyPGvKtiLX235sDkUl0fJXDASRMeJwYYm1opoUaLsNCBG35gcqhh9oxUdINLuT3ZbRR3E7qZOufEVyPq+etGVZrM0QJyy+LD4Zkf16tKy+4dk+xG2X/dF08F8QyoR53Z9A9VOV/wBDPDAeevzYM4kmC6TmBhc5IoINbwzoy99U+qx2iM21WfVIv8bKfznYUMYCjf93Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riu9Y4N8LFSMi1Hq2ciMDAnNv/7ox2/Lxk/xVVVKBME=;
 b=Xs3WTjOzARVyJMHTP74n2YYwMuef59wo5GpYQK58t/LAhP/e9/OxSzORhJKcQTtGa7TqYGX10+YIG/eW4PaE1Zk6PSg5FvasmCZ2RbzclgxTwiNhdkNJ1H8u3wF7hyxKKPLObYSgC4a6xfJ/gQokjxX4rUESh+zzwQhPCP4RU1hr3KwAxqJwuX6aBJfiUavFz2nLfU9yC4kOQ2zNH+LKbnNAbFLZ0Acqhw0xAGS+CYxPU4xYx5v86mIJjn5XKUTBWTazPvR/bQAmSDP9XY6L0pxVZ6XXdfYnLqPzHVX/cGp6/K4JC62zu5g0hCa/VP5tNoHReMjK4CVANokZTW+DJg==
Received: from CH0PR04CA0066.namprd04.prod.outlook.com (2603:10b6:610:74::11)
 by DM6PR10MB4186.namprd10.prod.outlook.com (2603:10b6:5:218::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.6; Wed, 23 Sep
 2026 20:26:54 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::5a) by CH0PR04CA0066.outlook.office365.com
 (2603:10b6:610:74::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 20:26:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 20:26:53 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:26:02 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:26:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 15:26:02 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NKQ1u43615844;
	Wed, 23 Sep 2026 15:26:01 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 641609A9C3; Wed, 23 Sep 2026 15:26:01 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <b-brnich@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v4] chromium: restrict force-h264-youtube extension to supported boards
Date: Wed, 23 Sep 2026 15:26:01 -0500
Message-ID: <20260923202601.3525053-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260923202134.1085033-1-t-lannynd@ti.com>
References: <20260923202134.1085033-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|DM6PR10MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: 595ca84c-7d76-4ee0-56de-08df19b1018e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|13003099007|56012099006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	BxvTSJ5v76856DDEnLGmXMCQ6pj7BzX5ntTer2nJVcAEFHgREEOiEoiO0EBqpJAKIzfGysd/WrtpWjYv3jtDRKegMnz8utLLjBXMgXZtN7S/szwrLGciZJ5cEc4YvoZrgLvyimjmiwqWsnoWhYgonef2tNksxGuCBomH8hpc1vDSANj/WgvDESaO6fJS7HiizBbotNU/2EhDrN0O1sKxyqSjKI0nQCnyCW5VXfD5fzP9/6TBL6RzKG4pzZI/H7/z7g9T51UzJN1PwEcwdYtc7Jyd9Aek9glKPKcoyylgpuOWm5HXeiaCRdbgTSB816OGBhLm/JTcVWm0P/4pmZGdoGEqIkjgw6yYO9/xF/niMdNhq9ZfRsdxdQ3rhV1h7L5qSyC/TwU/0I4nHm0/F9HIjWEtTltDwkQPADDwlJRrVvi/dWSv1sfLMukBGY83+HueAjuVwdPkEaske8g+7xAn4OuLxBg2jIQmQOLMtg5rcaNoY+fynwfyC6rdB6ZZK6M6dmctHUxEmsL5Cfoj/xBjupsMtywhNanNiHrRdp5NfxLIrct+H/EnW1lebZyu4whWvoXODu0RFCdEE3pPOrOi2Xmo+3ODyyKR2NLdB1dQQ2IQfISVDkTtolCD5o0EjNzhXJ/aE1M1V79PZtyIrUuuZw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(56012099006)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C8RUOy8Bz0VYvY2o7t08BnHpReHsbQ4M/jKz+2Ed+JgXFKnwAF1DZf606dRqc+M9lmaaWwo2F4eU5/yP+hrehm20Z0DCvAIcYQyt4bTRIujKPGHTAZgk9G715kheWI8416YOjJgoUZaO34dtaNMpmAaIhZ+OZojZWVTnqB2cVPas3+0EGZjpgQ9B3IMDzwyuCeGnluO3zi0qdSAJK/Wk3I02hVDHj2fBdQTFSz7PSaxQp3MXkMl4INg+h70APG+PN+TX1i4AdhUSG+SyJETkPhP4vbVFZdbxkfc/QMnM2shAR7z9c8ayvTpHd2QjjBhHtHjMlt3oI+iP02mplSDmbvo4IOiL7Tc7klYhu67/Jtu0PUZhG/pY2dZzZAZ+kz7VTDBw3OhGOOKbVdh58DbyaLRrcrhjN4OygoAGck9XxeBzsFDqL1vxGQF3HGmzvhMe
X-Exchange-RoutingPolicyChecked: 
	PQZucgtT59P86QPq4vidwJo7fQ3csjfqX88DmYWAqVy9ick3rEXV0DR3WlteTSix8zPp0yJfdaUYJQjb47t0GZC+RMrsxlQEIM+uLPRLdi5tMXp8p4PJleI4by6bQ6sSMK30rf1Y9MnBYbh8XX/246yZGzJ7oxbZuL0sqtv078ETUwE9b4LzzZY2GI/RHw2k/KzF/tiMti1IzEnuM7JxpC18Lyy8U4eAysC9SbjLMIynExmcyCBdpuZmCvTZ5cJ81yB3j48CpBbWZRqKRPcNGmTujfeRbMGDxrfltgQcHoSpfF40gBwMVZ3qDk5H7nyJ+v2f3ljEr1v4u73ofpwcDQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:26:53.4767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 595ca84c-7d76-4ee0-56de-08df19b1018e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4186
X-Proofpoint-GUID: Bib9dWqNvwQ0shNYLSw-MYH8VY0w0jP7
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab43612 cx=c_pps
 a=Ovo9riOs5JmVBBfNyWc1Cw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=x66HwMoqfNS6BdpYiwcA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MSBTYWx0ZWRfX0o2DF3QfUxbB
 to7zzkl4bHN9tVpNfezVmJXkvFgVy/dLmdWVA0C3jQgvBET2kQOhoJ9fXpljL0uioy1A1Mepa9s
 S1OIfzyL9D0cTGHulPhNVEgyClOLzvJ3iK8ua3nQv7+rPJqP/s15GqG9mBHBhPkJ/WDS2ZEWy9f
 ftVIwc04zKQCusHEZQ9zDiWZg3cnFrgHU9FuC3qvAfW2KCuJqpd3OkWXYGYMSJt9iAiDxcW32nf
 ifadHhaaAvHn64DKO9kRPe3qSroQjmbgfi5HyyQKE3Ik4vFXxxzYN68OaAYse22LDhX1kW15yDD
 9VmpBy0NzSWV62/jonx87V9N1l9yP9k6yAiqGl8EnMRc2kersswfcPt3UUauaQaXDj2zpcNGKK1
 MBxspg7X94CtrQ2u/mey4JXmkHKuAmZjA6dMO0qRAuYI1+A+BaGOivpWRxqQa5lEyJVJOHb0Vsq
 0dF36K0gpu+xReHmQsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MSBTYWx0ZWRfX4N3hdSmK7Dhv
 vu4GhduzNwOZym2GYSW1f5APlVR5Vt3Mh5BrE2ib+Ym7xyzeln2Lh2FVhYQ+SJRm4kph5Mvess3
 dWsDb02iUOnoaYKmILE9D+z28GfjlDw=
X-Proofpoint-ORIG-GUID: Bib9dWqNvwQ0shNYLSw-MYH8VY0w0jP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230081
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 20:27:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17704

meta-arago / na / 20260923202134.1085033-1-t-lannynd

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master/wrynose][PATCH v4] chromium: restrict force-h264-youtube extension to supported boards
    WARN: Commit message does not include file/recipe name: chromium: restrict force-h264-youtube extension to supported boards. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH v4] chromium: restrict force-h264-youtube extension to supported boards
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 23 Sep 2026 15:21:34 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9e02e39023b1a7932d5db985da5c8d1f4c1d576a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: packagegroup-arago-multimedia: Add PipeWire audio stack
- Commit SHA: 2c6a9a5ebc9ecd113403ac25864f2aad67d8d71f

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH v4] chromium: restrict force-h264-youtube extension to supported boards
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 23 Sep 2026 15:21:34 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9e02e39023b1a7932d5db985da5c8d1f4c1d576a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: packagegroup-arago-multimedia: Add PipeWire audio stack
- Commit SHA: 3dd6a2053bb47fc053045ff21b32d1673d5f7472

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




