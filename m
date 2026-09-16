Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A1BC982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:17:21 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18970.1789575432899452558
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 09:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fUmK+zuM;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Q1HO9iAa;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFanlh3543386;
	Wed, 16 Sep 2026 11:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FKVlc+I0/qxxA5YarxgDVW4UJZkiNvSX/bGip9Vr0
	Qs=; b=fUmK+zuMACrgKIVW5BaSyAb5CnVlt0GVrseIYlf2mS3iJSHv7AXFr2GmS
	29cwHFB8AgmfCxTWZEvtf6QuyxdgwaNnKUFGVMaxvC1JN8acql4we1eLBo2o7GEZ
	siqDS7ndy9Y1ahM8LOyvFQ/P5B2Gw7u2HJlhIfo5jG76TfVISsmb8JB0OQUY6aJR
	QbCRI7D2hVMbQXaejWa+cZYLewhBYdDcelyKXVAe+++As6kZYiorUUSKIOY7hCFr
	M52Gxd+OadbMoTIDVP21AmssszTffeExlPSSOwOuefw8hdRfD6a2c1p8ZcRivn5l
	8ULkYf7RipuVb+6hFIVew7CoMzOoA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gqqmdaw8x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 11:17:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KB8g5tqaDgAU9jqLXqmWXkCRoHABlIXXpOXVp3THuJmRMrmLOb8nZ3EHY73Bf1MKCsKpQS3q3/svNE3+wJHBqnokXJrGCiDo5bcTgrnJg4+nUSJ0RuJzIH7nNX6oDF3od7+KTUFhrxesyA1XcelT0dtiamByegoMShxtA9qseJJa1mSIdpO7dIfYmIWJbNKIv93Y0Le8lHBGvZeaWoOdW02o+sLMzZ47FS07oTO31V06K7ytuA04M7XEQHFSG/bOTfZB+iuTgqDES5Bm7f6ezcVuWusYHQmdKtEzXwcFOLKTaJdnnvQhgrC1UD022d4Ho2fP73oK4yH17WActBnoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKVlc+I0/qxxA5YarxgDVW4UJZkiNvSX/bGip9Vr0Qs=;
 b=YBgrE/rbEllSdQYVMUdD+GV6Ks4zX80g0RU7nWaWx1khIsOy/8VtyzkatALuV+DZEZV2vcdR15ht5jEEtKdqXT73UsgdLm3zUGDALYAsuxaDaP7Cs7O23H6c212m2QFnidToERXbonSfKfA/iFLBm/GrBPUJxBSLrKJN10hzVm7J8c4u5CcH+WHAqYJUvBg8OhXCucAyxf+D9gvL9W3W7hr+t6sJMGEFqDAm/eyLyj43gLkhFObyDnlpk9wbCBcD/dnxss11czDsGwPWo+qI70uk9yKghR4JEt/YYPhkcUIGpA+SfKIYMLGq5ygobW+U1Nm2l8zHgY1+p/Qcz9qr0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKVlc+I0/qxxA5YarxgDVW4UJZkiNvSX/bGip9Vr0Qs=;
 b=Q1HO9iAa6N+Sf7CnL0m11HSw6xjBg++x8xafQEBkiRV/8j424IvvgMWuuLZScPiSce5QdYR8OV6eD1WYYEqx0XbWku9UdgDs3lRYXB/3/vvahir1wrw9Asz5Pn4aYCyAiBk5YCHaiAtqVvRZUtoKt03zR0IWuE3nlZW9qG11auyDAXaeT5Mzk0899Tq7Sf8hWbVkv54/HTx998PqjD8HXBCAYpg4NT5kvjjnZZvZoBqZyrLz1RvT1y6vLz9pnTjYVwGsCVcJ+2xZPB2EhrfKmmEYscFx6XI06KrRcJ35MJZmMOylNYirJOJqenpdzNkKgNdKNTEcLDxoYjIoknN5mg==
Received: from SJ0PR03CA0249.namprd03.prod.outlook.com (2603:10b6:a03:3a0::14)
 by PH7PR10MB5697.namprd10.prod.outlook.com (2603:10b6:510:130::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Wed, 16 Sep
 2026 16:17:00 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::7c) by SJ0PR03CA0249.outlook.office365.com
 (2603:10b6:a03:3a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 16:17:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 16:16:59 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:16:08 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:16:08 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 11:16:07 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GGG7ea2130254;
	Wed, 16 Sep 2026 11:16:07 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 389699A9C3; Wed, 16 Sep 2026 11:16:07 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <s-kapoor@ti.com>,
        <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>, <devarsht@ti.com>
Subject: Re: [master/wrynose][PATCH v2 0/4] Add PipeWire audio stack
Date: Wed, 16 Sep 2026 11:16:07 -0500
Message-ID: <20260916161607.1041219-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260916160547.1287287-1-p-bhagat@ti.com>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|PH7PR10MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf6430e-b101-4eae-68a2-08df140defd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|13003099007|56012099006|6133799003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	EHHjrpARqLgZafBolJCC5P4Wm9Wuo2qrMGi8eA2Lbb/HfisHJeYoySWB7DHhmj32AFMjpTv687TTalqbUskFuTBCU39psG4BSEYitfldO6ZFz8OnscqhCpxMKfc0jiwXdgYmapN/ftWTxfvAH2Erka1pZB10Zr+WraLMN5JH2/ZemBxCn4orKjjRXa7tdrJX28J4pHw2cfVfhItmrQJBir5ueaXhN4I+Uqx7CgGgchYprKnyVjVtZUWPTbiiAHPA4u6Hujm+nK9GYvXTRKzmqxkifOTuBwAREeraDwgIABilmfiEmGL0XTBmmATby+IlcVnIeEZod2RQtv7dXcprKaLFe62UM2zHoefWVCz5oABPja/E9u382LP4RqS0LNYCpf8dutEbFOim/zwxZr5vh7JYB/JuWlIJJVU9lTxXTE0GU8Wqj1nQXfpX0kIYnejpGbsIcKHsOk2vSfxqxyte+RJZp9FDgGQ8oH2muxEeC7PmiHScQi5ukvE2l3PFMTTYIirR/z+8EO3VWGhp9tlkCC2hY7skhUjAsuvacHi/OqJ9q7wtgieGZ6WcGqpg18/QzxWOt2rYhNxycQWH2nPyTHhH3vM1xwY2bVBuAkMJZQCMH2oeaobffAZ4/5U9EV9A9nlM0ftprepo8NqJSZo/WQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(13003099007)(56012099006)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lcMLj+IOasZn2Y1EHLlP19MMc/sYjqe/K4SCMsaJ2TwKQUwEVkVJUkL0ybtfd1+TxlmK8wV4WSCsgB774WW6gtRCxXUCe/rF0sCkjbB+6oxy5KdIvt4RwoKkGnZKTppaxCbP3bMykOSvlu29Gl7Uq00YLlzOL8T13pruLqYN/AuQsLugDbgIjjOSMfzGE86UdRLmg8M6Eo+30uMsMkrlfZcbwGgC7earW7zcC8W5L/vN1N5l0yhLkpmp0hhEBEKnChqoxRyBnjGD3rQi4HKtUi8mqSs/pwz8PQER6x3Q5dACLZa/rFBYbX6ui6nJVJDf1259+fKNJQhhcKyH2fWGPjXA+cm9/JEuDwzlgty4wHRFL3EYRdZQoOn9NZ9WCynh0n5xk4O2PeqyjzBXJyGMq/3lipXP1/RusngHLlcoVqTnbI+t93OP9vzqSOTqinmd
X-Exchange-RoutingPolicyChecked: 
	dbTWsTK9dVQsqNW006V7TZILTCei/Y5tw1CunsIoAB2hwDeJhF+QswY8nIy3+WtKPpkOhu+Nb3g7SKskARTYWbKOpjkXR61y/v8G+dvtVb/QyzqqKaMS/N9X2/YV18j9urqvdvk+a7XwiHLWqemG1GNG3YrOH5++OC8SDVt3pMrVtpFlV0oIASXW1P2qd2LIkuZT0Pi1I05iWWcbw+X0NYmVu5UM+UlqvWsXJRuC07LC9uctWNXMWoZ/d/BZJXYBuLwceC8ahM67ym3Wgc4XNhF9WsG/jlPgCMBw2UzSsahitHr3jaC4P55QXjh1YzVTBUnSReFCavFhE2p0bWhV/w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:16:59.9882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf6430e-b101-4eae-68a2-08df140defd8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5697
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyMiBTYWx0ZWRfXzn7QMsv/34YO
 th69ne5UGx2xp9TFVyCMfWVZGrMs/gSf3ajcOTIbLsrMUf+3hkxL9YTvQXb/gDGU1ysTFDFqoYM
 b64pOSr88VNUPN6DLcPL3+MzPpV7DRtfXHjPGPleVp6PRNydAFpiS9nhCpOtz/DWFeRMAXgnNY0
 klgwypcNr9Fk+PpdmgbLWQgHnXn3ygFMKMzmOFWGaVW7gYzCtlDDdj4zCXHm24BN6GoBtTy13jC
 5nS8HEclrGQMUFRrzGTdXUZfl1U1F3cK7vDhHOLfJE7Q+AAV80MKTa+DTAVn/AceLU0ju8PGKfT
 qjQZZAU//Rv72yuRQb9+s32XbTFarBcs7BfKNiHDhu+CQ9SGPNYi3Y9Iqj/HWCG1o+QJUPXQ2LF
 pcMZD1OgRj4yjHSZLzCj3JXyudzJW2tyQXMwS58sNPUusREkE0085rKVHTNGdarl9UiuJP26Nct
 4LtIaPHTojDGkC3jQog==
X-Authority-Analysis: v=2.4 cv=S6JMU4sP c=1 sm=1 tr=0 ts=6aaac106 cx=c_pps
 a=V2btASzwI3AgjbPAPCrjFw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=Y9CL2Sg-HMipyg_6zn8A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyMiBTYWx0ZWRfX2o32GL6CqFqN
 dw6QKH0CSvGekknnJt6xqihPS2To+cSOsfiKdnGXO2KFQQRmXgZKHzeRjRuEojXDb9OEfjoLmbr
 0mkvY4gRdrNcTlvbmFb69tILM6tuDYY=
X-Proofpoint-GUID: ZYs8stDX-zGPEd-dgcyxSv6X5oOoymX8
X-Proofpoint-ORIG-GUID: ZYs8stDX-zGPEd-dgcyxSv6X5oOoymX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160222
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Sep 2026 16:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17679

meta-arago / na / 20260916160547.1287287-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH v2 1/4] packagegroup-arago-connectivity: Remove pulseaudio
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v2 2/4] recipes-multimedia: Add PipeWire bbappend, service and config files
    WARN: Commit message does not include file/recipe name: recipes-multimedia: Add PipeWire bbappend, service and config files. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: recipes-multimedia: Add PipeWire bbappend, service and config files.
              recipes-multimedia (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v2 3/4] recipes-multimedia: Add wireplumber audio configuration
    WARN: Commit message does not include file/recipe name: recipes-multimedia: Add wireplumber audio configuration. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: recipes-multimedia: Add wireplumber audio configuration.
              recipes-multimedia (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v2 4/4] arago-default-image: Add PipeWire audio stack
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v2 0/4] Add PipeWire audio stack
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 16 Sep 2026 21:35:43 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 1abcbbb111540dfbc29adf87fe738313fb7bd587

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
- Patch Series: [master/wrynose][PATCH v2 0/4] Add PipeWire audio stack
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 16 Sep 2026 21:35:43 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 1abcbbb111540dfbc29adf87fe738313fb7bd587

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
            SYSTEMD_SERVICE:${PN}:append = " wireplumber.service"
    
    WARN: The use of :append with other overrides needs to be manually checked. (APPEND-1)
        meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc:21
            SYSTEMD_SERVICE:${PN}:append:am62dxx-evm = " set-audio-defaults.service"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
FAIL
    WARN: The use of :append with other overrides needs to be manually checked. (APPEND-1)
        meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc:20
            SYSTEMD_SERVICE:${PN}:append = " wireplumber.service"
    
    WARN: The use of :append with other overrides needs to be manually checked. (APPEND-1)
        meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc:21
            SYSTEMD_SERVICE:${PN}:append:am62dxx-evm = " set-audio-defaults.service"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




