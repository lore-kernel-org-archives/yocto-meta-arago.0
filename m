Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB41FEDA08
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:43:52 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83541.1773773022608876707
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 11:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=he8fac9M;
 spf=pass (domain: list.ti.com, ip: 52.101.57.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMQsU7ldlLIcc1Osi8bjHJTnwBnCSnpcOSmNs5pcsTaOYDp4rRl1MZtJ93yf60V8nsxTKlWbstr7j97iZsvZYesZMcfsO9qlBqyoh+qQvuPTcMvn0tmTdKe0ljxRxv2ckoB5fSCgC0RE2faaX/Y4jE9NBVfkn80RCNWqHMU6JcEV0t5YBDNxSXaw8NNSyjbBAkIE8RBXq7PyygbBiDFfNWuJZcJD/xmYnJlHbdC2bE9TpyLkWnmW+OtQqg0PFj2YSgfWbTyeUnV4jA/ARA60RBqGVhGCaQn7CDbh1Ez+ZnYlbGWmDrtPMa2RsbgmU+THeAsi66uKegSAx+lBR0RDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zymDZGOjdJnoroXs1+DQhD744yJRESrWRUmNSiVUEb4=;
 b=jYJB57w11VG/LYVLGwJJ8Yg/8ELGQD4m5zAUrH88kA68ImidNG20w+7AVwXjOCGKvY6D9dFILxkLfGbo9s3WmJWZZgZPhrOKTaDf3SEQUD9jYPxGTEYdszgpyNm1PRtHMOOK6MlQQ01kB7qXzTCIN8MfM8hW/O4H3mlswCiTc8Lrk3PgNFgvusPScSaUTDX+5rWUoK6Hj4KlkEXl/rPGkSr2gFY2/BxjOOzzj5W8rNKPEkR+GB2L9Qz8J7vhG0RZVzT08LhL5jvIt6XsVmR+jbe4xzASyl4GyVIotR3CqBhE4+O+k+5Gy7AJdGKAcxrepJBl1L3kiqn44mHuJS0dSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zymDZGOjdJnoroXs1+DQhD744yJRESrWRUmNSiVUEb4=;
 b=he8fac9MuYvzhAPO5f4ggFq2YugJ2Be+4FM7TzPVOmVfjP/j0HRXCpRJwNT9AkYlJkbc+68kkxCMdIsSTjgswa2Fev5Dzl6X6Wo+hL3NvAIEfHM0xrGWG5e+LtFDFEaMFJ5JWbcZ1iy6R3pNYsYqT6fIU+Mkllclt4uPpF2C1S4YeyO2gLBF5JEp6QDPCxq4orBTsZmjJg4EMWc1i7EnK+p97OXRmg/WGSdV1lqZiTwCGEAepNzMoAKSboeJUh6HVzQzxtzSiT7OENxHwAuC69j1l8lbXis2YrdP1pW2ShAaMaDg55nlFv5LEiFt7vEI7kG8Gpzcnq5RB0eIJ9IN2g==
Received: from SN6PR16CA0043.namprd16.prod.outlook.com (2603:10b6:805:ca::20)
 by SJ0PR10MB4478.namprd10.prod.outlook.com (2603:10b6:a03:2d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 18:43:39 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::fd) by SN6PR16CA0043.outlook.office365.com
 (2603:10b6:805:ca::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 18:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 18:43:38 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:43:37 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:43:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 13:43:37 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HIhbMW3668725;
	Tue, 17 Mar 2026 13:43:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0FE9A9ACF4; Tue, 17 Mar 2026 13:43:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH] arm-benchmarks: Disable security hardening for accurate performance measurement
Date: Tue, 17 Mar 2026 13:43:37 -0500
Message-ID: <20260317184337.2893327-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317183932.327935-1-j-sahu@ti.com>
References: <20260317183932.327935-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|SJ0PR10MB4478:EE_
X-MS-Office365-Filtering-Correlation-Id: 005930bd-c303-46c6-e566-08de84551a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4y2wJ4fr0w18uYm6FO89wrtS1cY+FCR8UMuWbcYz8Teg7Tf7xf/cRS9bkR0uXxXpQ/NK/UEMry7BYJZQQuAmzAFxKufzRCDqeIR+R8zjxdYuW3qqo7MBrilNKP7BltEDZYtmIOQxJF3tydIA5JihfExpk7exBGB5Pq8jv+KC5LsHs06BaEARV9JnDsXcNERnH0vpiJ6REygZ+ltQ35xwRyaR0gANcyjXDnlF6rvHfALfSky3ZRpNDKp8NRJs8PDcfDzH15B5n0hZaCTxznEw8mSl1zg/3895NUmYqTi0IB6ILOPaIv3X6Fhj8PRr/rGDGWw4m1u1cPdNtqvVEiyGzxeigaVBwU3EDOVeuPi2ns2ZmQz10iv+RPvlQ5+t+2ONuqjKtO9l+qx2NkuqeKMygoU1OFn8+Qg+DjPrnn+kI5leg5bcrALcR5dGMt+In2KN3lFev7Ffb483qN3a59cBn5HwSnZtnGYDKpfwP1GsanNnrR18MpmKSHmkXPLVeF0CaKP3dBhxHTgIkkdDGHywUhvzRj2OZL+kduyp5ysfW10/QU8thqagkiq8t6TrHirbgs1w2eW6rYupTHXCpz9ubgzwWOyyVGTj6p2Y1EvMg+d7LGz/k9sNIm+Ru58tPT8zXUy83YXaXrGcfY43YAWxK3tA2saCpNz3YCUsBlnEJt9RJaY2XURRNd49mW6/tdJyfY7gpvIxY0tDpY3RFScZdjxWNOWp5HLKX1Tzqg0kQQzhlhtsLMrcD0QDCKlrCdeoJWWN14XDXtsELj4KHrXDBg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oz9cp/CTE30712Oz9aUUBamr62EvcigRm8iuEPsS/WKaMIOqHHD2an4JCdlWXFQCQCAiDpRTMI+MN1HN/G1t9X2FUgOqdTbJhhsVbDv0PGh+XnvJpPdAWBsDb5C8lR+Pe1nzRQl+gNFvOMhrcaaagaNX/fvw3V7b/8Rw5RWq5c2LV32A4fW0OuP90Sg/Mg/vsb81mWI/EnomGZpVBtRKBd/mVUMSslCy/wllenfOBBXr22zDNMYrSGeWhaif7ABillqWh1R16Mfoao48jAyLC/Ux5EojSXjZxhIN8luaOBIWKj2aZ8pes5+Ano6dQhVSaQgQRvH0cpNi4polgF+rPrYIED5nk7o9/aaPAZks2b0AHiYYbNLz4+mY52ZMqQzmOx3sx+CHOmj0rcOM/2C7QrPt3FZCii/pF0V+s/kI1BR9LpcNVSb5vXe9EB9ljJzS
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:43:38.2865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 005930bd-c303-46c6-e566-08de84551a6d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4478
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 18:43:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17364

meta-arago / na / 20260317183932.327935-1-j-sahu

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
WARN - [meta-arago][master][PATCH] arm-benchmarks: Disable security hardeni=
ng for accurate performance measurement
    WARN: Commit message does not include file/recipe name: arm-benchmarks:=
 Disable security hardening for accurate performance measurement. (COMMIT-M=
ESSAGE-2)
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
- Patch Series: [meta-arago][master][PATCH] arm-benchmarks: Disable securit=
y hardening for accurate performance measurement
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Wed, 18 Mar 2026 00:09:32 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b5e12dfe7c646868a3de71645865cacac=
a13077c

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Aksh Garg <a-garg7@ti.com>
- Commit Subject: kernel-selftest: Add the pci_endpoint selftest applicatio=
n
- Commit SHA: 4f82ec14f99f171de7298eecf527235e5f29e57d

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
ERROR: Nothing PROVIDES 'gstreamer1.0-vaapi' (but <build-dir>/sources/meta-=
openembedded/meta-networking/recipes-support/spice/spice-gtk_0.42.bb DEPEND=
S on or otherwise requires it). Close matches:
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




