Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B028CD4F27
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 23:16:33 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11774.1762989383380931459
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 15:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ga09h698;
 spf=pass (domain: list.ti.com, ip: 52.101.52.53, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8zKIcHhjNFfY2UzjaK2XVZ8iT/GHz+HHVQtZsn7CtTJ3823jfqduIrkto28XG3ddvKY2sHTLQIebv3f+YHpwnoZlB+O+NQoPs+k3Oq1b9f/gJnj4BKol9GU61C1fBRPh16fg3dMDoNIt5HrVSXpxMk7Lc0WNKbSTAWWCGygxSuHzfqxRa4nCFj7pKHKb7VxIwNpizNFwdwyjogjT0dlp+9gFtmwK2UmPXs0bvxtjQYX/Bncg4iq6MFfJHlSq3Yyk9zlegY8wgWPU0V2Q7ub0/KTiTXX9QeUTNwAzVXep6CpJZYwUp6tnAcq+b/U3vGdyk8uEj3LVKlIe7dpbHR8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dB+UW/n00O30cvZ5ZYhwxQtGQbKpREGWlzvk4wdiKpQ=;
 b=yL7I59D5GnNJXRh4EToYxxgf9Po2NiPRT35EUkAJ/bMO/AIG40+9XXGii1ubjtWOYcafXOOcHGeCkekfGTKOVf0MjYR/P5BrmKk6L3iVCWXzRUVVJO+63bh41Y576qMMEAg/Qha4pZmofSSgdw3r49hcvIpZyczdxu333iBofyNn+o/feY58J3v58vdaAJ74p46mwjUTlpOXdNgMxFLX971djhAvrKm/2dfax4P84JAn8lS0AdLOS1Xo5DOEFluPcpuY/JdJ8ouNvcEvKvu0Qg112uwFXq4AMRZxRiXges93UozuTSkLyZ+fW/3Sqr7aO4WWie7dYkjZDz6Txc7RwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dB+UW/n00O30cvZ5ZYhwxQtGQbKpREGWlzvk4wdiKpQ=;
 b=ga09h698dOTwEVXAVMeqj9WKJdd7RjvGrBp1oCD8SdrgnVC80G64eLAjKShylWkjDk0rWE3Oru4Ws1s8OTOWbmxdb3hUxJgPqeDR8zRWJUJ5OhCjeqOfSAMnqojLrfy4MPefFMAjkpQMfC/FOI7r3R1aUSXb/S5oJ1qgKHN7yPlt3ujgXx5+S9mFXwPDFCJyOCcz3a8vqtIDobIkdDb8gsMWNwACh+EpddAqE1muR23w3JXo7lciXl3YENBTBnaUzHAEzlSnDR5JDryGL0roF57L+KWDS81k16yAgheyP8+EV4RBfeZAOvjs4FNynx+052yhFTFaSZZ/CCKgv/O40w==
Received: from MW4PR03CA0033.namprd03.prod.outlook.com (2603:10b6:303:8e::8)
 by SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 23:16:20 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::a7) by MW4PR03CA0033.outlook.office365.com
 (2603:10b6:303:8e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 23:16:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 23:16:19 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:16:14 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:16:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 17:16:14 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACNGEm53456365;
	Wed, 12 Nov 2025 17:16:14 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 96B04D6F2B; Wed, 12 Nov 2025 17:16:14 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] udev-aragoconf: aggregate generic udev rules
Date: Wed, 12 Nov 2025 17:16:14 -0600
Message-ID: <20251112231614.1228894-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112231224.191420-1-rs@ti.com>
References: <20251112231224.191420-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SJ0PR10MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 3365bd60-f816-4199-c027-08de22417cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N7IACE2We0oCe7D/Y/tA8BbdNIBHtcryfa2xN4gawsz9UNlKjmPTsxrgMVrf?=
 =?us-ascii?Q?pHBsHKVqGeF7V2UKfAxndOYlsKYCKmdt4mVxuMIS0pUaK7RJyV80YdlwD/x4?=
 =?us-ascii?Q?E1I3TgimYeOHbi7+jMKORtYMjmeIv63WLM8/uhJNjaCFfgV4Kd0805h2/J1H?=
 =?us-ascii?Q?VCZ20Q9Ym1PZu4UFaijSALxxr9kUoB9gjilCg38Iq2GX9OK9BjYxTZvcU3yM?=
 =?us-ascii?Q?umDrCLlXbJX82yhklqM1xX5IMjdmMH0n2LFHbfEm9beTeg/PRec885gK6U9I?=
 =?us-ascii?Q?s8Jiy6Uk3FROWjFKrhTkWsOK7ibpwmbCf7bv1pKL7Vn7Vcf60LV3K+F1TY8R?=
 =?us-ascii?Q?aZNZ9makMZ/rqaVnJZUXV7325WmZB0WTSCVVKR1wT/2w0YgRLUwJO2hWOAU9?=
 =?us-ascii?Q?mnxPvdX0eBeZWxPd3ujovmc6AYi6ll3tKKypVmusf+dP62950q7sdN/BAM6g?=
 =?us-ascii?Q?OTamBToCnwjUAkrCQfvrInDNOdz14h5Tmmz4iFqyMsFHcFQKvRXEF4K3r4p5?=
 =?us-ascii?Q?oSV9hJvA0cdRaxtrTefTd4QqhQRP6vOTjhwihw74pHKH/Qb9DrpdH/dAdg5s?=
 =?us-ascii?Q?ngwwYZRB8Ez9YmHCRxyFJjW1KX6nE5f3Vq2YMhHoW9I1riAafZqIGZM+ZPdw?=
 =?us-ascii?Q?VmEitp1CcDMHdeu46dPuDpnfYfzWsr6hf4x8l0OpkrfrFICB61WsQ5Yq9GoL?=
 =?us-ascii?Q?/uB4X2QNVKmlcM3v0KFVDHiV5uoBBFIE5TVrFdHwzdOmvihD/f6rfjcZOwuP?=
 =?us-ascii?Q?0nIoC1qRakZHjJKPCAvz9pLbIK4JspMMPgLYuKl6rBWJ1eHpG3Dzb7YLIhdz?=
 =?us-ascii?Q?RNiLUNDFofmCQmZGoTGGkHi8IiDWGGBQms8HLPwkG/k7MxVyK3kZONrrtN9q?=
 =?us-ascii?Q?TPrsrgARehZX4zgH8CNLyNq1YvLgHlXDAj8mcgz6iayEE2X5MzWEYIwrm1ux?=
 =?us-ascii?Q?j3Bm6TKTIFdPvCxTclKGTsUKbih+IwPuOsphvY0C8WtI0Nvwl3WXxqoNLyFE?=
 =?us-ascii?Q?9/DZ3yac+IzfKzKaoSA/rEltGn0cb7/ZBxQ3i5rziZP4Jkb7Hisoon4MHrUu?=
 =?us-ascii?Q?nRiNksj8DyzwBIp6NjFwZ1rPALDwuryQTSwGDU9eaKck8jDZvFWWRr5RfAro?=
 =?us-ascii?Q?hpr+dLT6CrvtDH6pgxciM49Eo5tFGg/dcM46Vv/I/iloyL/IMZyt2Uf0s59H?=
 =?us-ascii?Q?mTh+z9xeb8q+X4fsE4xuCXHc3eDFVpVCGMFpSNGzVFbUW7Rlak4vAQRqnJ1v?=
 =?us-ascii?Q?IxO2Ty98gTSKq84K96X8kXfAJrEBrks4xK3v7RqE1lIukHWAHTc7GXXmStL7?=
 =?us-ascii?Q?x5WLvPaVks9jAXyzYyObMi8KAZtp+qiRJtCVNpvFB8dIj9RU3J2WgqNKcRnX?=
 =?us-ascii?Q?yRNLI4ooggbvhxxzceRoQkmNDTNAgEC/OY7uXHZiKd7ndIKWarE/8ko7Wfvm?=
 =?us-ascii?Q?4yF8AAIPyNJK87fTnnwkpJ4KT4By4Ot+LgskLkBjlGRfxYHnZ08dze9mYMfN?=
 =?us-ascii?Q?J+mi4FMfnT6Ob29w50FppTsazqfRM7Q2Bc3S0CRDPh4/bsJE/1tuz1WX6upX?=
 =?us-ascii?Q?mLp5zxRUsc44YRS5C60=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 23:16:19.4355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3365bd60-f816-4199-c027-08de22417cd7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6350
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Nov 2025 23:16:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16754

meta-arago / na / 20251112231224.191420-1-rs

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
- Patch Series: [meta-arago][master][PATCH] udev-aragoconf: aggregate gener=
ic udev rules
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 12 Nov 2025 17:12:24 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5b339b4a11faf074f49e0d5591940cad3=
d96a6c5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: syslog-ng: Remove this recipe
- Commit SHA: dc9880094f431f05b8de3c876b56466f3bc8e98f

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




