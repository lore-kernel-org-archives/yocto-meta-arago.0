Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E7E1125854
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 16:39:10 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.693.1773247148561878158
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 09:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=PYPhMyYW;
 spf=pass (domain: list.ti.com, ip: 52.101.43.71, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LonG06Mhh8Zu5T2OWbb4XkjmstQG0lid+U1NksCNatjKWqvYXCOFeRJCzGMX/g8aJtd/9PG0MmfmrcpsRT1WfMpLML6K8jNgwVzdefy0kSkyKI7ZFJfVUFCajUwFYWaNgtCFTGzdWPB9pQrYupy2K5hWf2TzFdHu+i1WFXbbJNKZYDDT7dqNkhK48hyBscEoc7fKoaEV0UR5dzevsZsKFG3tbMOYh+ku+kACcIm6twEtp011hcUftVJNBQuKBMPSxEFMOfjwPx/L1ODyCaJPRyx+ScNzeL/bwIeVBj7yOzwHOJ+OxWCOlhgJuh2v2r5Mflet7w5AWgbVvi27kNip4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EimFB1BNPZ284bl9JvBbjlftIInCGBSkrgEyNI4phEA=;
 b=fhH+Tn0yHRRfV/PSMqLujMKGJl/dvzLy/84E1Y0boWLYqo2QpbrYejXWznkZxkkz1QZb+XMdAeEME4awIdnvJjmsLsXXGfefTNuMPAW677Tyq+OJn3HHrhM3JB37k+0pkYDpNO7A2OdlnvKnzf821V58pc7H1xARwdnT4m/Zf/IPWJrclsuv8olNZkakKciKGmUD6onmSs0KDxf0PasLggKdIEJEpdFP4QhiHQ3TP2uwG5HjXUbtqTMqBhYJd+cLZ8/fR+l3vWweakxEaFgdHYXp1BuCBBYHLYbfiaI3VgGruqvJWAwcehzLIaeT5RXeFiPJPfTzxYNTyrWsqKUJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EimFB1BNPZ284bl9JvBbjlftIInCGBSkrgEyNI4phEA=;
 b=PYPhMyYWjECqj+CWcU8I5OMEurCQUCBR5KXE3ZB5QW0upNpG4ypeQzXm5llLB5NoDYKeffR98OM5LjOjEE+Ma7WyNtsYTQy4BHOCh3fcI79GXqpJVLo77I3L295PZK0XRfkxB2DdRIPGslNfycoOCnw+fP8l4iBsC4qCPlDYmCsCSd+lRLLBSrVE1u7Yffsoj++h0GaCypaD6vKq58Vms6BWrI397nTAEQAFLkQgdjGzNE8S6qktr7v+kj6D2gPBJSUdzB2WWFrN03u8t/H8Iygt4uD0bAv+VqMQv1RF/zOPbbmm4Q0vIT2ohd6sTDT5z3QiLo4FNoXkOceVvRa2WA==
Received: from BY5PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:1e0::31)
 by BLAPR10MB5186.namprd10.prod.outlook.com (2603:10b6:208:321::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 16:39:05 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::a9) by BY5PR03CA0021.outlook.office365.com
 (2603:10b6:a03:1e0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 16:38:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 16:39:04 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 11:39:03 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 11:39:03 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 11:39:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BGd3K3513240;
	Wed, 11 Mar 2026 11:39:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AECF49ACF4; Wed, 11 Mar 2026 11:39:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] images: Remove C6x GDB and dsptop related packages
Date: Wed, 11 Mar 2026 11:39:03 -0500
Message-ID: <20260311163903.371443-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260311161931.394451-1-afd@ti.com>
References: <20260311161931.394451-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|BLAPR10MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a5a855-720e-4af9-aed0-08de7f8cb53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	D1uRRgtX337u1Q9vVr8lxrDCNt+xa9/PwEJtu1WVWs0bcV4Nk9yQZYSqQcu5/orNfKnKDfc8D+7/mNFm0OFsJVaR3CtAqNIG1nOa2tkprmw5K6ad3jyawvCrOSiTUeov8rExeAnmcoN4ob8gUwFJnZIwxyIx6Vxuhh7IvvM1MIYvXLohMRzgWB6BZTWa9S9ty8mZPJz8eAGQN3WjPjSjbfVxHl4uYTvxUmq3NZlAXOgRzq8v+8noH5yX0v58EJ8reuMBRchqE5JSBSkN7CrOxkv5A896jTCuIO33r7VZa8Or5EKgA0ls9KAWppOWB/5Zhbu5rdwxYlTvpAGlWvubIpTr5pAuOf5/MYF8g+UFCsdkNoUB5dDOfEu2vbXxCb74yOAFI5LTnVVZhLVpTKFSCbFx2x0SJP9ZrnajLF1pI+zYl8rsxTMMUlsHZL2gTP09VlBlKLM9v8zfA3Y87iiqeuYnesDJbLOiGq1RPb3wvVICEOvK0k7odgFfwvhMnRoq/yp6Hg0/d9W43+cGUa82KFG5rj6/fV2vFyejbx5jq1LX6JrQMyrjFkgUkGOhPIe+f3SXWW+kvkU5rAnj27BsUpoJy2tTR42A4xeHemIHLNVJ27NO4fbXYw1YV6G9RlyzhycHCOFVINB1435M/2HSYbQ8CG0dwStiwBIahwdVijFvZ3i8yaySi7JcDnm4kb5+oSTuc9LqcHWJlve4oPX9FyEfoIFbiZGGCFrBcmZK4UgRkiAlagATq3mBT/j+sqEaJKlOc15qcySVM6ly61cbGA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	u39Uctd4pfVqyhdjNm6K0xfuroFRoTe9irac0HKsnt4/fXp1YcGT4KyWvKcmD1avYLACQBNz/xtOyksVaAVmxNFTbs/vGIRY3s1e63+HY6OaLSufdZn5d6HIZXXEWt3MzoHWy1G8Lqd1dJ1YIN563ExwREYpYOq4xzoDowaREz8EHRRmyilFTPGUH/l1LZOxfsN4cuJ4v38u83BoRLDwNqXqL1ky4BRHA6hos5tfk9A+V3MhxAij6GzBJEtdsQ1NWzSXaaC7mxOKNs1u1rST4tXUEi90u9Xqj00IKiiPjKN1iOtFs6OciCPK0JAfJ2ONbYzQtjz/22PxQYZuG0xGa4msSqN4LvbfYKcApSCN9X2gnBakXhiAtJENSwGhGwQBfUfBF26fWJuBEM6b9EGsz+n31qL2wS3YbBRJXSxQzDhYGaNHGg+VGy6iLF38dUZg
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 16:39:04.4719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a5a855-720e-4af9-aed0-08de7f8cb53c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5186
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 16:39:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17313

meta-arago / na / 20260311161931.394451-1-afd

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] images: Remove C6x GDB and dsptop relate=
d packages
    WARN: Commit message should not include directory path to recipe: image=
s: Remove C6x GDB and dsptop related packages.
              images (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH] images: Remove C6x GDB and dspt=
op related packages
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Wed, 11 Mar 2026 11:19:31 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 924eefadfbd844f2577f21aaeffdf6749=
e775bcd

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: bf13de211888bc29ca4b2882630cb6c0135cdc8d

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'weston-dev' (but <build-dir>/sources/meta-arago/m=
eta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk=
-target.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
ERROR: <build-dir>/sources/meta-virtualization/recipes-containers/container=
-registry/container-registry-populate.bb: QA Issue: task do_populate_regist=
ry has network enabled
ERROR: <build-dir>/sources/meta-virtualization/recipes-extended/xen-guest-b=
undles/alpine-xen-guest-bundle_3.23.bb: QA Issue: Package alpine-xen-guest-=
bundle is skipping required QA tests. [installed-vs-shipped]
ERROR: <build-dir>/sources/meta-virtualization/recipes-extended/xen-guest-b=
undles/alpine-xen-guest-bundle_3.23.bb: Fatal QA errors were found, failing=
 task.
ERROR: <build-dir>/sources/meta-virtualization/recipes-extended/xen-guest-b=
undles/example-xen-guest-bundle_1.0.bb: QA Issue: Package example-xen-guest=
-bundle is skipping required QA tests. [installed-vs-shipped]
ERROR: <build-dir>/sources/meta-virtualization/recipes-extended/xen-guest-b=
undles/example-xen-guest-bundle_1.0.bb: Fatal QA errors were found, failing=
 task.




