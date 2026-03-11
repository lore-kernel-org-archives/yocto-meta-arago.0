Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59997106288E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:35:24 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20353.1773232520895974936
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 05:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=sILdI4xZ;
 spf=pass (domain: list.ti.com, ip: 40.93.194.56, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvalQUe/1739uggNVec+C2BSVL3KxKnJiCTE9DNkiFn1m8R4ZCBfjClaeXr7zdczG0LJKpcV9DMeJeed1rEgypwkHLhqBGyxgYbhX23rHW/WWam5PYDyw5PClgoJ/vydqVqhkHjj6PIOFc/wcpRvWiuYgeRJeVmPMSRNffbTpRrD+wiOglxNzQnUfno3yKICcEKK1rhjWdOhz2Un6xOemW2a7sNYiKpZS3iVKPGNuqriPEitTAwUVU1OMygrfNGc0Wr59TYitMU44u5d2jTMqAkXHnSwNfP6Vg5Jty49AgaQqLFCvvZ42/JqWO4u97GKPUiwdTSdTnw4OlacGhP5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1+V1tlPX59hg3dT83jNR7yN6YaPMcpnYRiFl0Ld2jw=;
 b=TO4dXPoARCEh7Y/SkKORfsywxdoDQbx3BQ9BWgRCJhniTsaDsdttK52evWKQOugWVjTpaMowrEqO/yIIlCDTXduqQPif5bq+m2C3eIUOL1vLbgNR2DDpUPHX6bDx23YfemB5OdCHwXN0/GVU4d0weACIRFMUAmwCCMRk2x8c4MONLGsGFSVc9c4rSbMmSA/ePQ9EDNtGTqv29/iH8NEuWZCFblhPTdoZRG42bDptnIsqwdQWY9OPSDf5U57qjl5YWhgcnqtj8XfakrpzawElUoDut8xB3QlmpxzOv4VTkPAxRAbiMUzmJGWx0uYZ+lcaEurK+j/1l9qVpjDxswhK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1+V1tlPX59hg3dT83jNR7yN6YaPMcpnYRiFl0Ld2jw=;
 b=sILdI4xZ58DHzRWGg0AaWrMn25pMWAlAUugZfZi1zKm+EQpoarOpH+oXrDGBb/YbxkcZ2ek6PuKXZWp1zFdppnv0+2lD7rJ971EyQN9qIjHbr8kPZdFHkIZMid8AC0gGBaiyjVX7vJIRrwtiIcfo+im+u1GEoAcPf3U8nebtGSHfgmHWXllbEoxvPpYjMVTEAw/H4+qeNVNM0FuQxLnjzpZJ9mP2Ea2RCl7yfAXmHmO30HNIfoAMsouJZjfoR3WUThNGYIpvDynqb9WVJgqoBmW44O7smsWbZYKgIuxW04Z3OxosY1NoqyIsTNFUbx1/aW1XpOvFy8YuVI9yTAZZ4A==
Received: from CH5P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::9)
 by SJ0PR10MB4413.namprd10.prod.outlook.com (2603:10b6:a03:2d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.13; Wed, 11 Mar
 2026 12:35:18 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:1ee:cafe::19) by CH5P222CA0024.outlook.office365.com
 (2603:10b6:610:1ee::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend
 Transport; Wed, 11 Mar 2026 12:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Wed, 11 Mar 2026 12:35:12 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 07:35:11 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 07:35:11 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 07:35:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BCZBSj311574;
	Wed, 11 Mar 2026 07:35:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AAD8D9ACF4; Wed, 11 Mar 2026 07:35:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>, <c-shilwant@ti.com>, Denys Dmytriyenko
	<denis@denix.org>
Subject: Re: [meta-arago][master][PATCH v3] linuxptp: Add support for HSR in Linux ptp
Date: Wed, 11 Mar 2026 07:35:11 -0500
Message-ID: <20260311123511.215660-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260311120943.3524472-1-danishanwar@ti.com>
References: <20260311120943.3524472-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SJ0PR10MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: d34dc095-84cb-44e4-0c2d-08de7f6aa3cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	gek7s9o8rwU6i8CgRXH4Ix3oQboXxiwfqpaOQvlTkBknP4hpp1wtvlWA9eLsl/efe3qZBW4coWFHfRJqm0cSsurbwutD755+N8rwbkOSICizxmhyvzcNsk/8cF+nmQOClmeoKT7q4DBox5KVVlG9lOukvnARr/s4jaB1tJ9L+HJDvcGgGE6Y/bh6IuwlQDpwfi3THbIiJMJLL6pPSWJiwXOnQKTX0CyE9EG6dMj6bjaa0B27zyd0rlJvsU1+MZB68ugdagdrT7d8sVnd0rfeY14aAp9Wwl7wlg3Sld46gYS0KjNlCnXv2OW4mV23mEWXdrWGLrBEobF8YDrLxONGiR/4T8k/9FjBn5rJuN5gI/WMETnMKaIg7FRIhJ9hWZGLrnQmv5NPRJtYwvSY4No21Hp6H47qcxrakRJ5iNiHBbl3OnBelLogOTzNAE2PPlo4/iQKMe3M3H6vN0U8fpCvbbiHkhobZOpwEZ7ZBJ4fF5OYQ1qMWiWMlA8OhKA/FiUOVmYhxQk8C5xlHgxEiuxxcpdQseMJB87ltMn1i/eKZbdRq++hwe3XCrB/Z0X87CkKUMTsHjwDN+HMwlIxTwjoIYWV0tK0nqCBsWhm3eEsNafBTRYPw+uH1kOe9u6fPH+ezyfrsATpgAkgycmzPgpmbVo/HJ8MyDUqMwEz1SXNEJ3IfzcAsQwFEIMj1fcXVLb6A4+AC4fwbbn6ZhUFRx40hlwruqR2izxOwbSc6ltSRd/6ZDG2UJr5BVhz0mbCnn3lj+HFYUfhW5T+urnwi45ZzA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Qye9rkdN0HMogFCV6OWxjQCbvXMf8VF5UItu1aVUZn7AkPMTllwBdm4hqT558ZghiQ/itHfMDUWDqb4EKsll7p7HrDwKE1RY54ZnUf6IheiWhxI5YJOVz2Y36xye+uWvM3qoCEJdMX8fejQ4McjGTxumrrTlYeCTXfwdEhzyXpct1NU2UkvR84yxtsLFZg+g9xCbpR1v1Xf+CoLzLAoZ/WTGHl3X9sW3XXtFjd7TupIQHGzMkDt7VSKldf5NZZ0RPaWnlfFUBZhtX8cFs8CRQ+jTvC9Cr1rCJ7gosK48uWXQ7kjAKKaXnaPnBDpauwGn5ClBYyD9R9Gr2wMTmxCkrMaGBo8o71OxqL1hYUPJZwzIb1+ReJOC84NVHkc1Bkkz3TP39ySWT5EXqh5pG4IFQQs9yQo4z7+AKKoJBPMQY3eLR19N2w6cIfDoucqwxyhw
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:35:12.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d34dc095-84cb-44e4-0c2d-08de7f6aa3cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4413
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 12:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17309

meta-arago / na / 20260311120943.3524472-1-danishanwar

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
- Patch Series: [meta-arago][master][PATCH v3] linuxptp: Add support for HS=
R in Linux ptp
- Submitter: From: MD Danish Anwar <danishanwar@ti.com>
+From: Cliff Spradlin <cspradlin@google.com>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: MD Danish Anwar <danishanwar@ti.com>
- Date: Date: Wed, 11 Mar 2026 17:39:43 +0530
+Date: Thu, 2 Oct 2025 18:37:54 -0700
+Date: Thu, 18 Sep 2025 12:58:52 +0200
+Date: Thu, 2 Oct 2025 10:09:32 +0200
+Date: Wed, 22 Oct 2025 15:32:22 +0200
+Date: Thu, 2 Oct 2025 10:34:10 +0200
+Date: Thu, 2 Oct 2025 10:37:06 +0200
+Date: Thu, 2 Oct 2025 10:39:45 +0200
+Date: Thu, 2 Oct 2025 10:45:44 +0200
+Date: Thu, 2 Oct 2025 10:46:17 +0200
+Date: Thu, 2 Oct 2025 13:01:53 +0200
+Date: Wed, 22 Oct 2025 15:42:28 +0200
+Date: Thu, 2 Oct 2025 11:51:53 +0200
+Date: Fri, 24 Oct 2025 10:04:33 +0200
+Date: Wed, 18 Feb 2026 15:45:27 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 33d20f0a92149a81c714e669cd09d7473=
b219aac

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




