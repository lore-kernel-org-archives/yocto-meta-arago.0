Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACC21099B47
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:20:03 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1158.1774045200209024531
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 15:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=vlUJY1z0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.2, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxAwa1Uk3ld88s7EOhhUv4pIyeVto7n6zLiY4n6NNfOBlBeoUplx2b4uVvdKFZF7t3BvEC/qZYK+cZfmnKI8lV5AZwEMYXtvrWiL9NalOc17/DBBFKpFZKI7JaGN0pwnWYN+l/XY6F/FgXvGfVJWN0Aft1Qm3lMf/FSoyR2lDdZP9Qozl/oUxGEfaDpp9s3ZXyOwJY1hPK3Kpn0xuJ/cBKj73yhc8844EHUeP6Wa9LlfGoWFStKzrxtNKxZ5aG3g8a8JzxBhivo03x7iVcuPCXVMD4WoG0org5m1KJJl8kjVhdbL3bzjkz2w03sb0eb8vIta13fQ7U+DuO9I46ryKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdpru1ZSNvJSymicl+GO0L1KFvDoNSq3BA0x3M2jRKA=;
 b=mgr4jr0BhfVfLPGtdceRLW2Sh3ZEGnVcbIczDhoNSLFloMfc5BDuUKjfG08RGfKivq5kSxc3gEcn2rvZVjE7u5ELpzZzbbcJkMkTycJeal2MBxhkQdypqDINq21PWP7IwP6ZGIvk9VAEsAauXeSGn6wweWHz8HhvG+OJvLhoHOCGRqMP37q1k9eiDMZPuOpT7hM22Ois/7KgRlWP6IESM66rXvAQx6UaBttaRCgcagDGDAijMDXVC9DUv9Ele1prJpNFTUJzOXsLGrVUIcax7t1nKpzRnofRhNnXU1cO1RtUZqevG3nxQruPiShrsr0J8B88T38lOr/drzf0ln6UxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdpru1ZSNvJSymicl+GO0L1KFvDoNSq3BA0x3M2jRKA=;
 b=vlUJY1z0QgnwG/lEcibCkVs6F5wcfpqb7zCzXxpCPU0KmwO7Bm5IE+2wqv1BzCdZiHxUwy8XOYuiwcqpm3LvjqLagQVxBM43Fexjd+4AkYqjutk+BkMdJmpttPbnU/r5wKWi2BFhmdOq2o3qD06oku064AXXgG/zmhoTnuTXbiw=
Received: from BN9PR03CA0703.namprd03.prod.outlook.com (2603:10b6:408:ef::18)
 by IA0PR10MB7623.namprd10.prod.outlook.com (2603:10b6:208:493::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 22:19:57 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::79) by BN9PR03CA0703.outlook.office365.com
 (2603:10b6:408:ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 22:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 22:19:56 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:19:55 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:19:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 17:19:54 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KMJsZd307995;
	Fri, 20 Mar 2026 17:19:54 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 Mar 2026 17:19:54 -0500
Message-ID: <DH7YJBJDA8S3.1MF9IK78VTXK1@ti.com>
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 4/4] packagegroup-arago-graphics:
 Add mesa-demos
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260320221404.3991734-1-reatmon@ti.com>
 <20260320221404.3991734-4-reatmon@ti.com>
In-Reply-To: <20260320221404.3991734-4-reatmon@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|IA0PR10MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e33f646-a6dd-41db-0948-08de86ced11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Nj3SHwQuGvSLqf/M03JXVf8QrKvNXis6iaADIPDT+FSBuG7A9z1R+SIajvrYl3jPo19NmsN2Oika41sf3UAJCxDWU8almIGcsGwHF+peP2ZY9xZMpJ6Az60kzR9dUE/1pa3Naixv3ZCK+kuesrh8HPk/JllsqRbI6cjYq+wjTCiU5lmpWhWvaBWWrrAJnuJ1gEPN14JeNhSm4LjO4UzJJOXSEnN8o08fmrxsLeDYvGXOV/1k6Taj0rkIx81QbW1WEx1SSXa4x57cHesDFQCYC5RRqlY0SJn3yA1e43p7RaZ2gas9OhFJQywiGf+G9Gizsi0fGjgAN7NtVcpnBNqo3HwmaAVBg7j3wT05EfpkfTSZModBYEeOXOLz2Nw7nzF632s3nsUQclTi/j7o1DIOePgsDatP+X58kFcVZ++jQWexQgiNBTK9fM1QPWSl0ZbpiDks4meD8OR8T7Fuwji+YBiFB1NUeHDavdCw1IcR61PIoNBCCDKL81EElbNhCbh21smUVJNgZF6zmqt4Km24mGaQQA/BV9jbRpWFbrSvNNElnnMEKabEySQ9J7PhkoZ/DZW334huD5MmG/L0GjRZZ/4EO++4puxWIdGD1kUDTXfUk6zzaWrlOkPrvLHmFdRaCen7p2wpwBDMSP895ueophV6vS3RzghpNuKL9IZbR8vAV/gEhrVvo3sH/v/mtWRTtrw0/b4fJqS0CT0jEF8WWywM9Vpx5vQCcUrY8Q6HWHC8Kg4nY4gAXpSj6IywJN1k8YJB34sl/DUG7PRE+xrGOA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LglI/oc9FhVF520VE6h3E3BBt98jrjspnJGWbudSzp9mHtopZIfo8uvvShjslYwHVM9hQEQYEFwl7xJZjCwrSaFD97PFkgxhf0YJAiEaUhOG54qfaEfsOtiIE+yBwfGkkEhy/qT9p4ULUzN3YIC/86Rw9LT+PyenE/ozNixnvje59toa7r20qLJ2ClhAgUcWZxioQ/K4j4R99WcXixU6LWQkhZX5cipLu3uDkbNfT75Bvk3T2ijkG6VnB4NQ+FOW+sZU/nc3oRwLUhU4uWhDOP+l9Ov1Rr+a53B6mcZYgl1RMpNrSPacnc1BXqb0bn3Blw2/JzzQMSmrBW3g3skSDI+cmk/Sd3Ciqy4NabR9gub7tk0Djx3+4wgmexMlJuX5XpYL8tP0SiSRh9Ug5YNzgDqI1EKW1lXaSFoRTAO0HVc8phLZrNU8/x6LMt/Tav0q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 22:19:56.1618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e33f646-a6dd-41db-0948-08de86ced11a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7623
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Mar 2026 22:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17411

On Fri Mar 20, 2026 at 5:14 PM CDT, Ryan Eatmon via lists.yoctoproject.org =
wrote:
> Add mesa-demos recipe to the packagegroup.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-graphics.bb    | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup=
-arago-graphics.bb
> index 026281cb..e3c6aff6 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gra=
phics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gra=
phics.bb
> @@ -9,6 +9,7 @@ inherit packagegroup
>  GFX_WAYLAND =3D "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'pam', "weston-init", '', d)=
} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'pam', "weston-examples", ''=
, d)} \
> +    mesa-demos \
>  "
> =20
>  OPENGL_PKGS =3D "\

This was proposed in another series a while back, but got dropped due to so=
me
other changes. Completely forgot about it. Thanks Ryan.

Reviewed-by: Randolph Sapp <rs@ti.com>

