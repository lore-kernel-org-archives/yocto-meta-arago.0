Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E302FE9D40F
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:31:08 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24819.1770222661521643989
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 08:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ungj6uVg;
 spf=pass (domain: list.ti.com, ip: 52.101.201.67, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVor79XhfvAYfiQKbGntQOKtbq3Flt2BPz+Fw3Vc+cG6JEObFYw9cUQYqCPoW8MDmChKie7OOhsai31jkX92wpML1cGVFDvZAJEm68CXhgQ1LuzZhhNSSjpHhljhQN6rFepojoBNlLgDkraAWUqTM68jTMgUFY/lCyEV7aTlAksKjU5HvmL8CivXuMk5m3zTtKgjJNnJr3yxd6pBtk0Tu78ggTJzyB8mABM/rCY9cEsB6e00fsDfcXraZEN3XRleXJmd3q3STcKSBqwsvVJAKlo29qbzVTzRLx6QVjZehXexsuSS1+Tz7wXwKriFtxoZOfDlDsvthWJ5Mg1TnUaLpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6jKYRTN0U+Y8UoOB6tnh8q/x7U6OoosieXE3YpV/Vs=;
 b=ndTjWwv4tg2ZcbBIctBTFy9U2Boy1x71MOu+j807kFGPpmeX/hDJ8EhhjBslJQG5E0sEOeQcomct785DCVwpLSBhSDijbZUrsArxcRSSJ3cHRWKUBhVmY97+/DxbHFNl4pU+9ZAFwHeYY4V+TqzBlyT9Z/ViWkulWXfxHtcUN4uqfp/A8v32JhdvoCIlW5LevrGaqaiuVi6XMK8VSQK7CjID4jj85m9YuwQjXm5kzwwUkoY9b9tGBwjBtM1BvXP7vGl53jdqLI9tMIcDVxmG8nZazT8VrCWmFmAs+2Ro2dJpsuoPqEho83prCmMYj4XunwlWfkMk1hryGntclY82kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6jKYRTN0U+Y8UoOB6tnh8q/x7U6OoosieXE3YpV/Vs=;
 b=ungj6uVggYrxdJkwQww7VKTMOCx786NSve7sMnz/RE3u81oQz7I99KG+Pix9Md725ljrz/4qTfCwOQ+3GYSpFfjENlkxnq4sSaidRC83Z1I5kPbqhiuJ4CSAa+iyZCapSkn13CGUnfPB/IENOP729BaA/+doXGwzEQ/cUpkxnpVu77YWk3tqEZX7MgYxugmvYAvOzQPSDLG9FvgB2zIJ6FK4/idEr2B/v92j2lEHu6XDhwXqVoOZz7npCSRh6ZEIHtmDm/uRN1EbwyQXiWqfiI6C8LonkG+rmaiR1mRbqEheXTnPJK50VmQbxpLsLFahk7YUZ/8qFxxY0AT+vVVmrw==
Received: from IA4P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::6)
 by BN0PR10MB4821.namprd10.prod.outlook.com (2603:10b6:408:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 4 Feb
 2026 16:30:58 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:559:cafe::9c) by IA4P221CA0008.outlook.office365.com
 (2603:10b6:208:559::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 16:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 16:30:57 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 10:30:56 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 10:30:56 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 10:30:56 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614GUuou3682049;
	Wed, 4 Feb 2026 10:30:56 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2852C9ACF4; Wed,  4 Feb 2026 10:30:56 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH v2] pulseaudio-service: Add systemd service for system-wide audio daemon
Date: Wed, 4 Feb 2026 10:30:56 -0600
Message-ID: <20260204163056.3336685-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260204160813.2393421-1-j-sahu@ti.com>
References: <20260204160813.2393421-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|BN0PR10MB4821:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b196a3-ddb9-4feb-49d8-08de640ac641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vRiXiIfC0OW7tSQ1IRKxKxLpgnCkd4x3zh7fS/tr7Qk6psD638uLIA/D3Yoa?=
 =?us-ascii?Q?DMKLnDUneNrztc3kpP6fFO4u9XHTr7cATRYSMaE//+MuFpuuOgeEbZY3uMxc?=
 =?us-ascii?Q?NSETQYjDwlR6Zv3v622ezKROLFLVvpur9oQcTGBCBzBvPcE/ZvrwmH2WQMpx?=
 =?us-ascii?Q?VQchBwrt7yDyN7JTZ3/Ws9bw1WRHseoAsDPBp5xIwbf5ZMtUGuBZYFwS+Vut?=
 =?us-ascii?Q?xPlb+Q59FcQ00l6kpJye+RvxrZv7yJ3oEd7I73wYtZQq8vF4qkxuDNuOP8gK?=
 =?us-ascii?Q?SDVZaQzaHG8m45wR1bQpTEGGk/QkYG0haqaOxW3XyQ7ntUoZhswaazIfJD2b?=
 =?us-ascii?Q?ScDMYsBjOzgoEnbN/iPZmRK1RI9wgDOU8Vk2fDsYCgzs5u3XvKuv6b2FSNG9?=
 =?us-ascii?Q?37bArwMAE5/3iw1R4SQ2N/tWuDQVkSqr7d4S3wdIhctqJGqScwBaw/l9NsXB?=
 =?us-ascii?Q?t4Ff8Nk1hXEgMooOLt4mrlhMtWv6QnurJN5XqMB5VBgfuSrnDFPGya1pAKe9?=
 =?us-ascii?Q?qtJ2jzeUulHtkvTzp1IInE8bryjGJf512eeQizagDx+rzQtdza1McNqHoG2W?=
 =?us-ascii?Q?ZamgbeWloFCTugC6Yxksj9OLd5J+pMrbzmWdG/EJlsNLoVvdqk/19ikew/MO?=
 =?us-ascii?Q?UCitGQXGDCprW3SSpNibUx+x3VSxANbdzrG2jnVW6Z4/OErZBdc7ieAIrQxV?=
 =?us-ascii?Q?hRnh9i2Y1605fCiifiy89KYn3/6SDXtqURjh5jsS8Q4D/igVpnxisbJpgjcI?=
 =?us-ascii?Q?4h+dknbDwwIr8JcQcRKUWEcVwCd9+1HmJwDxI07QxYA8ryHAqnnUJlvGpfUF?=
 =?us-ascii?Q?FhEt/AWw33KSVoEL44ZhzrxJMjnnM2EvqfnQ7zTX6wzsSQI9g5aKG5sACzQG?=
 =?us-ascii?Q?IhuHp09UGGTOfUHe5AX0Z5QdtMGugzy9UBkj5HMngwprST3JKu0I8QZRROLX?=
 =?us-ascii?Q?XkotrWz2Ol2qZnAqKmC5Bvp/QbezKguJTqlm4lSS5ztpH5dPTKdAWG0EH9zs?=
 =?us-ascii?Q?u9gFk+M+Z1op5JfG8rJRXq3RD5+0fjRLyHfnG4hYLZdR5Dzsmb1jahcUG0xy?=
 =?us-ascii?Q?Y9wCDRn2fqTyl0CsRAlm/bo0iB6D8xyJ9hEchsySOcuSXQv+4QHZ3FfKwCuO?=
 =?us-ascii?Q?MClCVs0FSLjU/NIHAW2HDB91wLEvcUN2lA2vyHgSdVcdOlbxOf+ZGmJEda18?=
 =?us-ascii?Q?KLymDZSnhcsNHO2NyDHKVWQFN11OAQbTEhCv63Emocuy5frwgf/7idX8YeaU?=
 =?us-ascii?Q?2DTZGtCvVKL1F4+GWRq4UpcBYg5UcnWlPg0L4m26PEdQuqtN1chmi8yDh2/D?=
 =?us-ascii?Q?UlwtluDoAM3ynXHY/K6bRVWobri+x2gC8nP9zxu02rJe4UadyDIBhqHio9F7?=
 =?us-ascii?Q?9kXmfeLa3J6pykZIJSHzd2vaD/CRS9qG25PvT2aSBmjGy0G0SFHNNVoSZaAu?=
 =?us-ascii?Q?N4yf6cvFlSGXYBD2K0OAHhLgZh1wmFIyHHvFo3Rk08AgTmbtUgngKCf9sTL5?=
 =?us-ascii?Q?ji4K/0YoFC00aaEcGozLNDfydVCf05IvCOzLtI77TrOzjK+QaAxvALVTM5K6?=
 =?us-ascii?Q?ysazDRksM37cNzlxYFf2Npf9qfZqHxYV554BfBJ32RV4Pr/TSMOIQGLF9TE+?=
 =?us-ascii?Q?BZ2+Cc0bfHFLwIYr9i2l9Dx+N3T7fqNde2NdnhlDQIpGJyu2kAlwzMe8+RGZ?=
 =?us-ascii?Q?EzzIOg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xWqOOWKW0y9mioIZGnltgbg4jf+rO0eFZITT/VSotu9oCbTCIibMhGNcVc52CaybrXM+OXeYYxhyAm0mGBHk2B8kydfSkJ9TEs1ZuF3Z9rmuISxqruxAWj1yTvo2sp0ObL4F7MawsBsAsJ0ETVqwF3XQpBEGkRrdY+Fj7MozS5fD+0dgrBjFxtRkR0GA3Y09I7T5N2qJY1b6srH1JjEsmnIavhc22KhRvHxQQ4bvk4JKXkzfVvHibDHIanv1ZTdnGSgr93k/enu19jV3iAk6RpkjzzDv5kpbbq1+T1BK23Td1XpnagAECu5dCLdbKLGDDRtpOuSMggK/lwfn9HYyNjs0RCnLQZ/eRvgXJchTEdP1CI+bFUtKoPNN+90WX5sCBOU4JlTTuckUv3yakTQ+CXvcr24gK5b/7D9MCrwOsiL67jv4XVl5CeuYey7lLaBP
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:30:57.0568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b196a3-ddb9-4feb-49d8-08de640ac641
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4821
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Feb 2026 16:31:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17081

meta-arago / na / 20260204160813.2393421-1-j-sahu

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
- Patch Series: [meta-arago][master][PATCH v2] pulseaudio-service: Add syst=
emd service for system-wide audio daemon
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Wed, 4 Feb 2026 21:38:13 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9eb3f83089e67ac2fdf065915304bcd7e=
28f2a85

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: meta-arago-distro: Remove tisdk name from Arago packagegr=
oups
- Commit SHA: 5fb7dfe249b07778f706eb50635e2c5a2c56b13d

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
ERROR: Nothing RPROVIDES 'packagegroup-arago-base-erver-extra' (but <build-=
dir>/sources/meta-arago/meta-arago-distro/recipes-core/packagegroups/ti-wor=
ld.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




