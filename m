Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E4DE909DE
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 16:57:28 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16977.1771347442650502419
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 08:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wWEaKlE9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.42, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsKcsvNaBCmRQlGnDhoGO7B7+VkGzGeZSzxgpfg7WhxxJ/UbgWeG6Ln4QhLQRBEc+o+h4YwREqJDolUuzJEiCmxIFHf5QJ2x83VFczWK7d3EN3XcxWCh36cSIQcOWIRK7nFaa0+kIFAjnJVOIBUDPCJ4DQiaTyh8MSTZZNWk6oW/vOFJ79hp1+6h5bN1Dyel3VH+4I5h7Xl+9df1uaxzQ9J/TR6KczGdQhS18Fxe+IZSyUlp3uelZ32rxDX3aabhd324XDxLLqDWRKDU3TIyswnLMbhrsFbFBpFiAv6QgTpwra6EPdrK31re+qou4qP+BkaaeEQrvLeuSVbKL/f5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/GMRKCSEvzS3GhWPUBY1ZhE4IEIV5Jjpjag/gXCqj0=;
 b=K26fRfiOxYwFzXNXPFfEZe/9lvHZ6Euox4rr6IRbWgVyLRMFVuZ3nKMDA9YCHT8ic58vVLtyJYg7GSeYvcCfZs+D1BYiHuQWZQAQb7xzoHV17W1SsDZ+MVubcEDp02hQlRXmHUNwWD8tv7+Sm9SY0Koc5NUjKu0agozmfUOyoJ4QfNbltBfSHYAxP84HCLGMKpMcWEtkr0S6F1U0AlcVd9yPAriavV6u6A/CdhbWgYebz++zG0IX7wKPe1+UtiDqip/DIEBwxnAPdGnKabe8iDh8W+CGqQRcTHkh8g3slOeIfKTrpevsBmK9PhwfVPWOppFfMxtreCZb30mrgrOYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/GMRKCSEvzS3GhWPUBY1ZhE4IEIV5Jjpjag/gXCqj0=;
 b=wWEaKlE9KpEe0WA7MXZ/uIHmaKZfiwv3K6VU0JjhhThKKD6JVZLim6W9DxGbN04w6ljsMA7uSCb0XrL7sxH/ms+ar+NVXFtL8zdPnjjnoXJLbLHCIF0ltgNyxts33v9fMDa16QkWQeJaigs2f+Xg/dZMz3zdvllZvHlVDscptjY=
Received: from MN0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:52f::27)
 by CH3PR10MB7139.namprd10.prod.outlook.com (2603:10b6:610:127::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 16:57:19 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::55) by MN0PR03CA0020.outlook.office365.com
 (2603:10b6:208:52f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 16:57:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 16:57:18 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:57:09 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:57:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 10:57:09 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HGv9qu3659967;
	Tue, 17 Feb 2026 10:57:09 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vsONp-00000003PK8-1bUo;
	Tue, 17 Feb 2026 10:57:09 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arago.conf: Remove obsolete mirrors
Date: Tue, 17 Feb 2026 10:57:09 -0600
Message-ID: <20260217165709.812321-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|CH3PR10MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f67c931-0a59-4259-a1a5-08de6e459c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RG1nUse4g4bhCVoYD62LH0GFXef5IRE7LPEw0nu8WyOM4pcsMoYdoNQv7cp0?=
 =?us-ascii?Q?ByoJvTh/Ld6qUKV5lOohbZlu2oSsND0ZihRzgU76wuu+cu2nCD5LOS84p0Fv?=
 =?us-ascii?Q?i/1XRxvsNFHMCSosNNTKKV0HRqYoDN9ftyEOUg3lF/ljJaWI6qPxInjKJItn?=
 =?us-ascii?Q?dODzeVeVyH6W4rGABzA6fBHIDPIvhrQiyh5Vn6ZdLCeXbRvlxbbQJ/fgHOr3?=
 =?us-ascii?Q?NYtlgqkw5Kkou6dv9Cdv1iSpK16RlQZfbrCgvwPS4kpd8kpO0t6UhnFD954g?=
 =?us-ascii?Q?vlMGBpO74uvrexGZsevTbW91TMBjnDxD+i+J1yM4Y0iQNvAPJIQP9w5PZXOg?=
 =?us-ascii?Q?rv2mopBMSDKazres9BW0UVzks4YpIqEajMnxdZMtVKkMqUCHN5SaYanA9piY?=
 =?us-ascii?Q?mZvPmFj4GPwjQoqmc7sfv1WGWX/cIqM5WyPCoudgGKMcQZ8Gd2y5N1Bq04bq?=
 =?us-ascii?Q?Cjh+NuZ2lyrSRWydQXDD22oFcleyV6qa2pwTkRGAGXUaFfgbk8N3LJZ1G1Ol?=
 =?us-ascii?Q?2e54uDPGmQdwXnBN2AhIC6+v08SrbzNm7BnDXJdQkFva4rSUmWhaEL04c7oq?=
 =?us-ascii?Q?zx1aNbsGpItKAU3M91XEqbTZ4cSvK6pIUohBhuZ9bZMwgitWxuWL60/jZ6A8?=
 =?us-ascii?Q?o2MJ7iOf0QzbiBrrgGS2VK9RwXSvxoH8lWrfEn9CuN+WVIGs1+aHM5cem6tP?=
 =?us-ascii?Q?EMDBGHLyqQTTZUVO1uSyqYvvc5sP45ajLyvRjDQ/1YT5xMLy7ieaO1WJrvaI?=
 =?us-ascii?Q?3uRrVZ8v/om8iWU5Q08yZ/87ramq1ZsBrf9VOo41oisa4rfIX/bFFrz2+ER6?=
 =?us-ascii?Q?8zoQxJwb4xROQ13ddqv9w9DDrOYHdf3U5Oz8LEZy+At+Pmi9SVjQ8dNETVCw?=
 =?us-ascii?Q?vHic7+CxDgxZDiO9ceM2UzDVFoCXZkL5LAcY1v/CX2TWm5Vf4BtZ946RgsyK?=
 =?us-ascii?Q?pXA1muTVxc+niSwv9XP//giE5zuwJrc5ATC6Y9iSdnUGJlHUZ1e42wLGmLsA?=
 =?us-ascii?Q?IJFCc9pK7s9Pm4vMq9INvDYB3CmCgnZyINgH/XVByaoVVBtlrs0+PhnNPbW0?=
 =?us-ascii?Q?YlLNF8ft8HBkEHRDugzbtxPPFBFDS+D49Wu1Vbcv03DVJMXQpyhgYimepBDz?=
 =?us-ascii?Q?dVnoRlT+BWXNZox48A6hpf5g4owEt0BMBPHB/16OgJ6cbPSQg4Syqeuv3myX?=
 =?us-ascii?Q?oIObUxmPUSol4OciVv9w3zECGjhqNZynRqLClgSuFrRQ6BKORy8uTdMnKHP0?=
 =?us-ascii?Q?LN/ys7BU/eQ/ob0RVfA4Lhb/UwS6wfVHa2e52rTSgsWq2899e18aNUOBW/ig?=
 =?us-ascii?Q?UMO5jQaT4RYfZBo9Nf2UVlSb21RWMZ5JDkv5tDnnqotWNbX62xrcEsVg/M6G?=
 =?us-ascii?Q?gKSAgOPdoU28/7fLgW2SEBgOLCRHFrPl53HVJ3BbMCBkcwnqOTufB7+uAb/I?=
 =?us-ascii?Q?TjDcjAl4cOyuc0UDhKlPcIHgMd/lBzfCyVh1BqKZY0P/vxSbuv1TV1gq/EnN?=
 =?us-ascii?Q?XCM6nH36ECQbecDr18UNdjj4140vg7N1+4gEff4FB7cDLcDl6/i4mmTljdif?=
 =?us-ascii?Q?Qgxwq3XN9Tdfpv49EroNUa6vRBWCY3xVfhM4agC4QYUZTvI6Pp0dyC2f43hN?=
 =?us-ascii?Q?93EVvtOaqlGUQVBJRyUhViwDgRRgTcDOORrRFn7ClRz37AEvjW+lO5PedHyq?=
 =?us-ascii?Q?FlOMWw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TkwFBM1ctEfnQ62brVQm/06kO+dZ+gLhhoNt5Nvzwcs6iptoN01QIR9zV+veVf07skwknonMXH4pT0kKerARtSSf2zaCHQryuSCS1AzM2tJGhzjtFVxxBoLLXOW3sicALR9Lmn51FKhxsaSJdI59x9KFt2TO5pYhTwMJSffIw++SE922i0FZpTuZcCefqVwx0qX4Hs5eKxXfQywZahVT0TOgnlNTvobVJYzP2bR4THcQJTjpH7QpNqKtwT7r50smVaGzNnyqsx1E/OGldKUEJijiGgkL0P5GA8NzHBLPKWgm45J8VhJPZlo71hNKoJPhhr0DtZkpbjddEC1upen+ac++yCsyvkYRfrUPte+QibLBpiH7ZBi4MLRUeZW+iPXLk+xj5745jiYoLObiQRJJvrcFM2aqXlxox3tXvjAlTpWHM+DVrDwKEvTJoJo6rUUb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:57:18.4785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f67c931-0a59-4259-a1a5-08de6e459c39
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7139
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Feb 2026 16:57:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17106

Bitbake and oe-core have dropped support for several fetchers [1].
With that change we are seeing warning due to our entries for these
fetchers.  Remove them from arago.conf as well.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D755d1d1593b=
360b1794a5ef15ee6da547c4e3299

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 90c757fa..4ec091e4 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -12,12 +12,9 @@ OPKG_ARGS:remove =3D "--prefer-arch-to-version"
=20
 TI_MIRROR =3D "http://software-dl.ti.com/processor-sdk-mirror/sources/"
 MIRRORS +=3D " \
-bzr://.*/.*      ${TI_MIRROR} \n \
-cvs://.*/.*      ${TI_MIRROR} \n \
 git://.*/.*      ${TI_MIRROR} \n \
 gitsm://.*/.*    ${TI_MIRROR} \n \
 hg://.*/.*       ${TI_MIRROR} \n \
-osc://.*/.*      ${TI_MIRROR} \n \
 p4://.*/.*       ${TI_MIRROR} \n \
 npm://.*/.*      ${TI_MIRROR} \n \
 ftp://.*/.*      ${TI_MIRROR} \n \
--=20
2.43.0


