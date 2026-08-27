Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E842AC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 15:11:56 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38813.1787843513207037663
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 08:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=egXZrBlD;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=VYlEouQO;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RF0YZs3048261;
	Thu, 27 Aug 2026 10:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fGlCfNAU8gCg7FxzRv6O3/R7VAu4+8E3m2ishMXSJ
	k4=; b=egXZrBlD/+y196Dnxno52JLujQEc7mqL/L7FH8mNDTxQ3AmMwm5p6v4Zn
	qk6fbkTma5B6R7tmG2ZviPe5RezeOFy9zxqCsmRyKwGOgnIbLrDKfvppBI/MfdhY
	ujazZDFEGToCI18t7vTaOuiMyRGfQ1bZQ9r2AF0hJFvz+LOddrWhktcsE8belY/P
	eijKdgWBmcGcOhbklCx0+3xGUAn6xnovwxEa7w0mZp39KuumLlqoRyUIM6bOTSBd
	DDPYAnmBGi6YC3InoeRMKMAy0AGXJrhLFTv9JTRNQtePTai/BdJV+U5ECUKYioE+
	9sCEQbhjYd0Dd5khUB3Klq0XS2r1A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012055.outbound.protection.outlook.com [52.101.48.55])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gakag1mn2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 10:11:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXgkpWsLF4dgL8FdkmoqRs5/cc3oapnHMzwRH3tkGqqjGi/9ZvypN9K9SAAAXR1X9ILUs0xDpXFrqe0u3t5CDB2IJ3tcy7Hz/uf/ht1W0xQgUoRvO0vQ7TxD7myKWV6aRFCCHUgq+lmbRbxlvE6ZxnVX+ClH6t0RRiy9pTukQfI3cFkrxzniv0cvF8xBwyaDgaLsvtfp8foGG5S2epO0PHHQnr9/yphsKyUUq+Bgo3nsNDoOt62uSoqzu3JIDdlq5VwwUGsA+hfHzAPMRCljF4haDcmOp8gXBFqj4ElU8DqUk185YJYy7DNCf0U3FQKalYMoDmSVofc8W1RIJuehVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGlCfNAU8gCg7FxzRv6O3/R7VAu4+8E3m2ishMXSJk4=;
 b=Z4sfI7P5BqHaEU/x7caVB1CS2xefppOXeRWiEXAtptprKL7fpBdrZWbzryFy1ohk18pgRKmQwYyeFPsxlmAp+uNQslFRKwVRzntMq+MT5fui4y8jJCYrlEmVcx79dgivz1wu3DhyF+kNrSD8I79CBNOm6YFwYNvIrJMfqqE16nZvJB+5EwVMedvt9Hgb/cKWfVfxwjhKV9gHhtD2P8rp6slPGox/LQdrc6ysx5EVJumvq41k7C92mOoSPuBPo/f84BvB3hzJoRV89+mEwMyt5v6lc+9mQHyBpmfG5t8TFiN6hpUjBKsf8+Uaqgo9X63kZ5lpgows4tkOt7KAF7yvKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGlCfNAU8gCg7FxzRv6O3/R7VAu4+8E3m2ishMXSJk4=;
 b=VYlEouQOZfGZNGZuUx4qNAPS7AU4WYchcQov3bsNihqxJOs0+q1bNVMH7++ueonVg9newvgrKhhyEaMmnc2co//ZMsKq+Pd+y7ZKxKSwO1sPOhq2YK/MN/i9TJ0O3JgZGLnDVyuHQsFR+KHMD4g69GdsdO2J/yo/0rMgKux8BBdlTX1o1MRCrcxct6E5lICr77/ieyi/F5+IImQrsT7b+fmSv1rG4GSQmDtRJ53MZ9QshYRBVevZlE23TEqVt8so6cWbad5trKNojKbPq7vdpBxGyRO1bfnSX2F5oAroCpnL60rbupbR4reSbJyVqOCyX29B/kGwz07CQwk901DUcA==
Received: from CH2PR19CA0012.namprd19.prod.outlook.com (2603:10b6:610:4d::22)
 by MN0PR10MB6006.namprd10.prod.outlook.com (2603:10b6:208:3ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Thu, 27 Aug
 2026 15:11:44 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::8e) by CH2PR19CA0012.outlook.office365.com
 (2603:10b6:610:4d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 15:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 15:11:41 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 10:10:48 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 10:10:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 10:10:48 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67RFAmkn1042361;
	Thu, 27 Aug 2026 10:10:48 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A3D8F9ACF4; Thu, 27 Aug 2026 10:10:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH] linux-libc-headers: add DMA_HEAP_IOCTL_EXPORT uapi patch
Date: Thu, 27 Aug 2026 10:10:48 -0500
Message-ID: <20260827151048.1591742-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260827150719.821469-1-gehariprasath@ti.com>
References: <20260827150719.821469-1-gehariprasath@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|MN0PR10MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3cbc40-7d11-4859-15b2-08df044d8020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	06b/qpwm3rC1Z1+CdVwH+E3264WMtiEn+UM/nBF6m65p2tneGWYJoT2FWH2BVE1dkhtWhlt6O+Kgrszhggsq3UKrDTdS0HoTuKDe1uOlFfCzE9UmAgUHiC98zoBwgWpThOBrdYssWXMa141zbxoemKSzfr8GgUJRcGtXht8u92Uc1/PFChKXCVLpGSvsg7VU0Zt08FybnAXw3QWdkNPgQVVIKkMYs3tYhgsZO1ecRd6CL1+RIabRLeOcEh/wsHAxZ24frePjphKg/ZgE+yXKLQfsULuAe/VqKKvZ03zn+0lNlYgtZuaCRYXufKS0xqu7jWpv3TEfU9jJU53SBOxoz7HTz1Z0s015zJOKWjWWWdJTStvsV1uAliKkvMVo1H3xri9ToOvtr3YyszxMhGxvwuAbhmwuDULObjvGMoGWBXkglmJq7uQGaZEoOjWZhIlJ1L1qee4/hOfEg3MkCSxNVLcj7MmJPLZRA8EuMYETyeDujTZP09OkuOMLSveHGhUk4ZZFg2bXD9SkkgnK2stz0e+EGFuE107S0PdO05EDjqcSFnXgCa/fXMughEbPN2Q/AGZbnTjFycyX0ioRABr6l5B5hbcVe6kDHHMa5SNimIpLbnFdTa/9IdDqijtR0xVk/+yjZKFaxocOPvvGsQ3tmA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8GwZ1Cdp1/2Bn1PbPcLke3TB1NXcXMbSLZRO3MZreCpRDeHQv26OLGQHG53ZwCqoY5YKJdUr5JCn9i3j3MPhNZX8acwm5V2dT3xNM/AExuSsZHoU7ssBo3l2Zd+oR+2HZx8qfpWgWi8uHu5K7lTI/QrrzhOIhmxGSXy5IWghj30vOV/l3eWtCe5RMhcaCuy+vFQkFTPbYNa29v9CZ1wtSi//iGAM0WnQoJlAlf9yqa678hSaCXlV9+hEqtBdsE2rdhwHnOMrNlZgaHz4fzUOPm7BMdlO0dcWD1OPGFyDt4bGvOrFJSNB+/Fdmt6vnp38m3znaoyg0I+RK140qeJqBLjR58nwhR2d5wwaOH8LUPLK+HW2DCorp4DhiTfR0emEOH0hiARL0v4x1qrduTo7IrQ1bSmDwcOw0Ggd/AqlS2rgIo64G4vaZ77tkk6XwRcV
X-Exchange-RoutingPolicyChecked: 
	oOOi1ZKQ/Ch1mJrpl9NWgtcZq74SX5Ij+HIVNKyMZDBNreQUhGG2Pv90VCCGDf9M4a3xFvT21fm3JMCUaci3+nskEvwg7LtK8gL2fBF/0W07QRIXNxOF1UsN0x+9tesM/cLHK+UHGo/58GXvmH2yvuk8ITOOp/fNBVwbw9PtgaQygmkA+P4v/bik/LsPqWtCGRSmwDtoMcbGxSLl9o+LdZifofxysHd5qQx3oy92GXlh1mGFPCkpMsxNG8b1BY3xYBPrUJF1z3DsC+bc1kCZI5Ptxso4sG4DKur01K1iP4nqFzto3vN38DULYq86AIee/YAs3YOuMfMUOVyazuEEnw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:11:41.7249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3cbc40-7d11-4859-15b2-08df044d8020
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6006
X-Proofpoint-ORIG-GUID: J4MuIbkgAp--oxvMefHOlQ9_t81M6x6G
X-Proofpoint-GUID: J4MuIbkgAp--oxvMefHOlQ9_t81M6x6G
X-Authority-Analysis: v=2.4 cv=VrMTxe2n c=1 sm=1 tr=0 ts=6a9053b7 cx=c_pps
 a=FXm+OvNBiSWvAu5LmLLQ3Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=UVL9wXhN6NU4wXYN2roA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEyNyBTYWx0ZWRfX93gK9s/nG9Ii
 iC7S8LdT9b6E/i7MATikWc9QBQyeWrI+9erVOhJ4l5KFvDQg+27JTVTx+mv0ZzRybPDQtYtS00D
 s3OLL4Zbt+7B7cP6lH9ZsEBLd9Z9Ba4GvHFPyRxmALA4IIVOkm23RaTErWC8hZnDch3oApE61RW
 RIfAr66hA+MBinBDypVwaQC9iOHpIA9gimGAa5yP637bVTmGQM1LFiHCbNXeGGzJKrURhQwsK/c
 RbGwt8IbJY0eqhADqZUNk4f3yESoS30bNpeDhmYZ9RPHYKWsfwA8ErB9q1xrTnUTMQkp4d5lX++
 S21FHgRLfbEMcfqik+QQjP4PXCYrtRC2VbdPMbIZQOogahy0YyR4CYS6kesPUNzVCx2819YqJ1T
 IwBCocLEdJq3Ni9ScV6KwnYUtRd5DX5TprrpvtEygRiqQzDt00BYolxdfD0UJbAly6gt4TlQXE9
 YUkb5hUTFh9zrrlkO2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEyNyBTYWx0ZWRfX47DTF9kHdzqp
 ekLeI5JNtkUSV5MPdkzfXL1d+t4DhY7SCOdLh0ihrErn6ZQhcTAOQw27vN5S133vIfmLGqy+aFS
 BThnjTpD9MReyqHJLIKdHmrXlun+/i0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_06,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270127
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Aug 2026 15:11:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17608

meta-arago / na / 20260827150719.821469-1-gehariprasath

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
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] linux-libc-headers: add DMA_HEAP_IOCTL_EXPORT uapi patch
- Submitter: From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
+From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 27 Aug 2026 20:37:19 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8a2b9c56deaa04b5d720d43801763cc2c56f4fe2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libyang: Fix CVE-2026-41401
- Commit SHA: 73ab0405254988a501b849d221acf5f468cb8997

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_%.bbappend
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMakeLists-do-not-install-git-directories.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tests-fix-typing-of-size_t-in-printf.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-extended/sysrepo/libyang/CVE-2026-41401.patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




