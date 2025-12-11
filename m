Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395ABD43358
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 21:11:53 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1172.1765487505717833033
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 13:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=fS2m00fa;
 spf=pass (domain: list.ti.com, ip: 40.93.198.66, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5paZCRPLn6Y9nJT/gOe6t30I0herI2DpvI8HCzic5Ah+lDlFIKgkCsSpjd3fIzcLq3Y2UIMys1rOzsDQ/LBvx9H/cqjN0d7shHiEbBmZLTErZsta2EtOf2stEg4+X0hUF83nS5Qe9w/O2WhOUQ6RywgBjEO0P7ckQWVjiSj08VHUDfjVgXa5qDnYYiTumpH6/wiRrDcYGqONQuP6p9HvxIk0C1xZJCfm5eYFXE7nd5bcIvCPK0wrqK61fykFLVQPbhXA/ZM89QFZvL+Bh+o8bvHGGud1iceOKHOUbjvVekzaH5MFrIKTAbOeXsgvFAL4/4W/OYGUIqSGgVn19SKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St21XDLm9ayzE9fis6VpurG5t0HBmSSBhlPy5XS1mdg=;
 b=xhYETZ1AqH4DwnP+axzfjrOuJnp30pMVe7zyI67xtf+bKYjaraQKto7VQ2mPn/i9WolwxtMhB1XNSDt+8lFIEGudNGPTC2sa77mDF41KlrEZMRHzZ1uzSZeL93qdwyDN1v0CYUVaRCWzjuF+Alz3+2SfZgnqMBPceizJCH/Bpca2gQGlkf3kDoHGy0xAlA9MBtsj7LrpSyZZQwqbrKdzaqEOudzrDsWTeZItydGRBdRSd8CVL26qVU2hIeXHreqhkMOI/48slboP+BLY8g8Y20Uvm/FzNOjD9l/5GxA8IFedPQFzfBybg83+LuVXWY/3fc6IRi5g44bPW64XnBFWgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St21XDLm9ayzE9fis6VpurG5t0HBmSSBhlPy5XS1mdg=;
 b=fS2m00faHXqNvE9gCEvkXsgdF/jB1Z7+1+D/Lbq2HoLJQPn7Pd9NklCJZB1VF0/qISLGK+Rg2zMpBBe39Haa0CukRV5kb32DUaY1bUGfgLZ2oVY8W7CvpbptrWq1ign2gesJm4AQD7jQUmeAu7Rlc7BL/wLQ+y2HRJ5YQBhKeQ270lcUk091XfSMHue8qWqoKjWGDeV25FxekuPzIxnk507EWRtdOCIPrNW+FgmDlk+YiGhLwDgoBhjl/0cMF9ikojDKI/v/gp19kZ8/trUn1R3PVr7xZ98uQf0sBFNrWBQ+bJuPCYGK4Rx6N1uqPi6HmKmXT3SFaAGEF+l2MARfIA==
Received: from BY3PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:39a::21)
 by DS7PR10MB5021.namprd10.prod.outlook.com (2603:10b6:5:38f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 21:11:42 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::69) by BY3PR03CA0016.outlook.office365.com
 (2603:10b6:a03:39a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Thu,
 11 Dec 2025 21:11:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 21:11:41 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 15:11:38 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 15:11:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 15:11:07 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBLB7qB1118286;
	Thu, 11 Dec 2025 15:11:07 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D365B9ACF4; Thu, 11 Dec 2025 15:11:07 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] branding-ltsprep: Move to ti-6_18
Date: Thu, 11 Dec 2025 15:11:07 -0600
Message-ID: <20251211211107.406233-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251211205209.4118948-1-reatmon@ti.com>
References: <20251211205209.4118948-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|DS7PR10MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: b220fde7-a867-4e47-8b8c-08de38f9e16f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/6ZCUxxBhIwA4EqWSXESBC29mKK+niRSf5gHudZU2bYCNU0XpTwzoqtdsVXq?=
 =?us-ascii?Q?Tx0xje0m9Zy8XuCnmlm6EaZUCXfBVlTSJjPYNsWv0JuXJCqoaNTEk/IGQwIY?=
 =?us-ascii?Q?bNRzN99gOS/CIEIhJR7ujmR2GfGJu/QJoelMC691DNLYZ0E0aw09+qAqQRJW?=
 =?us-ascii?Q?4sR4luVZp5t1PDB9w2HBzTXdRw5D8eif/5HoayDeA6I1goW1xGsjAs/3/e7E?=
 =?us-ascii?Q?ATaHPBr0j8FLuQoLNtFS7OnFk4nsWYTjvRZW6O5SMi7MLUk1Kj9vTJnWwezj?=
 =?us-ascii?Q?2renWBIkRS3h6KggNPYbwj+u2TYGa9f0T4tl2JwCD2EAVxwUMWjQMJ1bKtax?=
 =?us-ascii?Q?7bhTSp+kxZeNYpeGBe6m/a/15widUQz6ZzDkmEqNZcM4KI6qkKqIm5RJvo2A?=
 =?us-ascii?Q?GIiOMMcXTbfBOAGjq2Sr7yCVuDX+B8fytnLa2rg3bEzwOP6utiDMMsIryGmp?=
 =?us-ascii?Q?454GenT/cHTQazxUVTNT/NWTmwzPJmz1anqagpVPbAV/ANAN1GwfRrkwxSyj?=
 =?us-ascii?Q?vu1fcvemHE0a7ER2JfeViwY69EsosP2N43C64ibGk+oiFxINMusRhYdrOpKN?=
 =?us-ascii?Q?p+hWb2cs0gAiW1w2B6+RdSa6NdOZn6/3yZBDM4763n0XmzIPMK7DHRQ2M363?=
 =?us-ascii?Q?mE3kY3atyPYuHOaaG5NAFTMricrfpZn4tpWh7X9SZ9/bYjtAd/TfEbJ4xsjq?=
 =?us-ascii?Q?s1WWTw7MNo0JRbmYKTqUSUA04vtCpkFVVfCSiDaLhDa0icRNk7EL844MbLaT?=
 =?us-ascii?Q?pxH1VXHY56cQ2S7hOPSbn/c+z8cQNB2R8/AFfyOuKaNV+NHWli1LbIsajDjs?=
 =?us-ascii?Q?c9XmaLdBM/VkLI+zw0FJYuLm7z3vQTPM3sQvT8Ker9JwQvfhZ+htewOMi3lV?=
 =?us-ascii?Q?apemRcMfel3NEW51S/KeqaqOzVJQiUGpE1jvoOsrLDUSMfkvY+fFPnGAmS8s?=
 =?us-ascii?Q?TD5V3rSwQncfStnDvT8MjmXhKV2IQhF5Qo7xoCzixxiK/t3heiZj+kd19aqU?=
 =?us-ascii?Q?Yfbe9SsLS2ZSg43afR0G52utH7S9vYzkcQbCwkcr/us1ER9tCFCqXSrfLDWQ?=
 =?us-ascii?Q?oAS8ET9v6dOkhW+mP/z+73pAwBqF8XFYM1SxvekhIGvp3yDhhCOUvZqeXpKo?=
 =?us-ascii?Q?ad0QqhZtsb3G83I7mvgWniAfNHmnsi5fWV9G5T3542xdivMcxVCdELj7T1jc?=
 =?us-ascii?Q?YYqtDfeVcs4a/fsVp7fns5CNX8cDc+iJqj1Jr/Wh4mfif957SozF27jHY/Rz?=
 =?us-ascii?Q?HzUHokT5gY0VuKBX7ZUl55Soz/yOi2j8s7oWeSxJS8sgnnSxAtHA5Vf51YS9?=
 =?us-ascii?Q?l4ENRwmoFSPwNhEhlxFnUwOKp7ncVFn8ikzgR+BStBGWDBfKH+PSbqyQCuo4?=
 =?us-ascii?Q?Sm3KYKinplsIa6a5RBzbJECxAhXcAhulm1d7CDO266f04IKT3XRc+0Syoymj?=
 =?us-ascii?Q?ZcwHthm6+R+/S2SpMWYjhanT1IxJxGqNMfplj5xJTEQCrgLL1LBulF19YzUf?=
 =?us-ascii?Q?LEUeCfiOyusEpJPfJJG8sUIzp+6Xya81uKoDyhmOGrH39qqRhg8JmVeqiNBq?=
 =?us-ascii?Q?qAiNKNhA6S3NICBD57Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:11:41.2773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b220fde7-a867-4e47-8b8c-08de38f9e16f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5021
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Dec 2025 21:11:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16888

meta-arago / na / 20251211205209.4118948-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] branding-ltsprep: Move to ti-6_=
18
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 11 Dec 2025 14:52:09 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c88632e71ca9dc625a8721c5123714b98=
a8cf08a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512110100
- Commit SHA: cd8e92d046f4271e6524c113d6970fc8a50ffb4c

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
ERROR: Nothing RPROVIDES 'libxml2-python' (but <build-dir>/sources/meta-vir=
tualization/recipes-extended/virt-manager/virt-manager_git.bb RDEPENDS on o=
r otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




