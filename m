Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182E9CD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 22:18:11 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22885.1778797083990038856
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 May 2026 15:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=g/gTYMbj;
 spf=pass (domain: list.ti.com, ip: 52.101.61.26, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+54Y5e6OhUZjnSdRrev+rPZpiSLylKldPSxKZCImjGub9XZWpz2OHCLycOHBx5I7VCiwXOQZhSPKkUUVLWAHD0RZx1bjgpQlz2JAF6S4kMU3GUyZ/X2H73HBPkdmnTuG1EKHZa5y+O0b9NYlqaxl7tRm0EHJ/BaCm66OvbQT2Chod1RjuVwJDWVXB993wDXQCHhHuFe79cHnNIXRoHkO0s/HbjKSe/KhDA4p0rPsqLsnFFjbLYDlFLnOlavu/EHnNBzp1I6JaG5Bw2p5+vLSbt4Nj0ZN7cuV0hedrZEawDFsOgqjjzHXe+91H1ZCmdY0F9hRv3rolmych11Y1mraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgYV4L0uP5TnV6iioms2kbyhNkL4yh155jNw/ZrxxJQ=;
 b=SYYQyF6g+pJrZJdCD37LHc2tRQvIFM93b/DLnpagsNeXw2Wukv/Uy2GcpnUfR4VbFElmJvfyHWGtT2TglnPGtlhDNTAbBhzE6+l0k6QGOfV6lNtdMZjWUhG2pxgRsgvXES65pDHJNb4q9GSuH0qHxy1Ck4KQamN280xF3ph1ry0wyE/EdsxocmxGGziDTfoOrXIIba8Uh16LUVD9WYWF5ZdPEhliYJoj+jLdlck3zW7qdHUFKTqlhaOh8kZV4p/cty6anv+3LQrVk0mQeFE2VbeE3x0vb1BHVa3rnYA8UM/2UsVLimqc27aD9bERnH+75ar2vGLhNhIJdG1swSxzGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgYV4L0uP5TnV6iioms2kbyhNkL4yh155jNw/ZrxxJQ=;
 b=g/gTYMbjz04etBlTRKw3z2TrHkpI36E4lLV+1gMhxydFO1MBRabrh4Yqob714RGQW+hMXpDNT3hsABVqxoLGbPoOsKhhpY7ftw1SvHW5u2vAPaddfjfjQa9r2qlmIFOye3z/Vu2xTrHYsmy80k0/pTKU+xqL9q1+7vI2tP089lLSFIXs9I3MHRhGU+lJi/mpXzC8jII2Q07Kc7Uuwly2SMFN4XsHMKDzUY1iRLCIBckMWDfU7l4sSRWAFdXEcMOfdOp6dCWmt5Uw0oa4Skp0aVhDhgo9n7cgFDt3OB5rzrKni9CaZOOONyhAm5AA/yqXQOMMgx5JtlvOBE4rD/qDgw==
Received: from CYXPR03CA0032.namprd03.prod.outlook.com (2603:10b6:930:d2::14)
 by CH2PR10MB4326.namprd10.prod.outlook.com (2603:10b6:610:78::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:18:00 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:930:d2:cafe::8d) by CYXPR03CA0032.outlook.office365.com
 (2603:10b6:930:d2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 22:18:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 22:17:59 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 17:17:58 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 17:17:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 14 May 2026 17:17:58 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64EMHwoL3114095;
	Thu, 14 May 2026 17:17:58 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 54CDF2A54; Thu, 14 May 2026 17:17:58 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH] open62541: Update upstream-status of configurable server patch
Date: Thu, 14 May 2026 17:17:58 -0500
Message-ID: <20260514221758.2435179-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260514215426.452140-1-t-lannynd@ti.com>
References: <20260514215426.452140-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|CH2PR10MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: 39406d19-8e93-4f07-f11f-08deb206a7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nMAszsMe95jNCCHqvRF/R3KHZI6aveZ+fC7f0PfXvcVLQlvRWBWNs1mtdtly7o7fBSjpcXVAwEekxdsL3Lz0oW0QiCTyRkEGE4PW5mACDwYGaHWKCA+Xyz6EB89FGNVM2h3Dm+Tj8XkTIYT+PE6CXQYszGr6IgQEHyEM+pJVUhasAVdofB7A0DhZMOK7Z7Dl5A3p6UmSnpZaFemL97OrFIj868oIL6aQNIM3p5ELV8a7WA+o7T3PcT/K6RoblGi85x2ieRgHDR47fUf4EWw03XL3dpL6bN8DDElM2PFmQwwtxWDpCCWMWBpU76/Zej4AMI/zyDGYW9OFHLtek2J1f5pbMElGccrMSzS96Wk/l027po+uLF/bTqVxmOZPp7pDvHMkkV3yvgq6qeyCeITdy0v3Az5Ova/zHuEuBfxihvBbQwyPxXrykxcYmZSILIrtodWXgAptQGUoK7APk0dn091C48dXWWTHdrYSlhbWofyD9UfLYcii1PMh6Q8EeYAmxiMee61zdBo85suCCRLAvY1l1kTwZktP9PL+UZ9m+zipZaAqRXk218N+tOvhD6HQL9mJaCecD9dGH9Hm3rJZRafyVV4AtUKwNe1dX9+t9W8SMg2XSAFegsRkn34jkvUmdrGtl/CWsCDS+6U/5G3QAahoYYxrQoLe3XTtVUAXQrWHZEzOQb+VGRspGyc2mWuefsVMIrZNfnIUS+d/L7Bz9AU8I7MXb+1DUznugjmKPdI=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZOPVayAcdE8BdhQQwmq9BGhgYHMhedaZ3hPBhtnKXmf+FVSIK1kYh7Y5AnmLJzlAdRmve0s8i7v3eHae7ddOfZ9l4+lsTwcw8r37XMB56l9RhVkflwxcLc2Y8awS1DFRp3XsC17BZTHjlaGF1IvidcVRcyVdxW6YzJvmv2VQ8OOaNznJfi7IfqJzB4RQZ+nBz6s6IRQ5GMysjEOAKNrEm1IC1dI+zvN6A6bHyROLfcntns5U1NEcKePer4RIv051zIwLrIbp7fJcER58lYh82o0ObMPbvvOqZthu+bzz7v2JqdyOzzEjY0Dgh59NyGrY04M7NTtUPzJKyA+H8sef8+ntJt+1o8FqmBU0wVCUf3qsmGNuEuXs9MOoTG/mStCkyc3VmU2bMqGrwQzsP9eFDNsje15xz5j6eWNuAvHjJUhDRmixpFMETFYTM4o1+Uh4
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 22:17:59.0157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39406d19-8e93-4f07-f11f-08deb206a7fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4326
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 May 2026 22:18:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17521

meta-arago / na / 20260514215426.452140-1-t-lannynd

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] open62541: Update upstream-stat=
us of configurable server patch
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Thu, 14 May 2026 16:54:26 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ef33e487d48dde9938f966586fb2c4fff=
3ac2ce0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: open62541: Update for v1.5.4
- Commit SHA: 494ee5ba207496a4b355aeb84b014ee326e9f5b4

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




