Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1145CEC1459
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 14:14:39 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19261.1772547270245435770
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 06:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pWWdcrNu;
 spf=pass (domain: list.ti.com, ip: 40.93.196.8, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GubW0el6FnaulfuSzZTD821bebIzmXS5Frbpafh9ZIOsZsJCxhtWvfdYTc+INwe0jK+8Gwgdoc7s3anFOW3THxtVXuR+kwxxd6jhI4iWMYFsxwH16UjdS9EJkCw3qg+WHHYc5myyLbF3vm/ltSUW7A2pQpqE0yfG8Nl9ONW8UFaMt6r8ffEJFd80ykNl7G52YJicGPJWwMC6A/8smyfiDKdQY4wyoseBM9Qt138HtpRl186yU5yX5wTrhexeAG5J/Rbut2gpqQzQX5dSKPSTlak9K7z9chXaEhmLe4bSGu9qW/9dheiKg3GEaz929128L1dkBdQ05ea02qiiFhXQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnXj5KjyFZeIlU0qlNXEG0pMzycUzsxTUBNUGjESRA0=;
 b=T+h/UMSeCQeTSuCoBvRy6TubpWecJQyo/Z85Gh0rTisjN1iyMYnhBIGsta4CBxyotARaLSBw0uuEWjEO9X0/HmCBqMRuBLqrDQAVQNLtgDjfhtosp8W0GJ+03sq1UI6Z1/dVSx7PIrLHsLygJFcr44R55MdzB8jp22lIw87CaSfGyFjTnCYugRb0P+MCiYEZCp1b9cWuCKfLgd9T4gw8WJ3RW9gJT3rvjgfFUDpHf+b0XXO9bc/EM+X0rG41YFXwqlbTfTV2+8HEsqd1tm3406o+GiS5dVSfzdFJzwhwsT73ZfYBoHahtvnvJ77zu10xp3mu7563+KQf8zkPAjm/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnXj5KjyFZeIlU0qlNXEG0pMzycUzsxTUBNUGjESRA0=;
 b=pWWdcrNuo5H3ujd19LLlMMxXy0ZBaYh/i12kiw0RSDkig1ijDEHrLcfa+IITTdCZ5sUL1/d/NrdJblAYngfOeNu0dVnwVy6KpxTlKF5oOU4s17OW/tFyhWD/ZnIf2lC7S+QsO8wjWI0TiZ0Up06oMtCl5CLBVMdeokqJ/V9MzX46l0ewt3NCbQeyyeUq27N5/cb3HbDuf5qckfQaEVYuDV2MN4kT6A0GDEqeR3QRLsWpZTlTAtCGIxR/x727qSkRo03ObM8sxUHbt3ZTFzME6QeafZ3aDPQu4o4D0FsnT0Wi4Wnd8rKu7z0BFqR6E13EhHpHOjHrNulVKanDAYBOzw==
Received: from SJ0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:2c0::26)
 by DS7PR10MB4976.namprd10.prod.outlook.com (2603:10b6:5:3a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:14:25 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::c4) by SJ0PR13CA0021.outlook.office365.com
 (2603:10b6:a03:2c0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 14:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 14:14:24 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:14:22 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:14:22 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 08:14:22 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623EEM6Z3499110;
	Tue, 3 Mar 2026 08:14:22 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0EC099ACF4; Tue,  3 Mar 2026 08:14:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <reatmon@ti.com>,
	<c-shilwant@ti.com>, <denys@konsulko.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [PATCH v3 0/2] [meta-arago][master][PATCH v2 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Tue, 3 Mar 2026 08:14:22 -0600
Message-ID: <20260303141422.1079376-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260303135623.2564012-1-p-deshmukh@ti.com>
References: <20260303135623.2564012-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|DS7PR10MB4976:EE_
X-MS-Office365-Filtering-Correlation-Id: 5927b539-ea14-4549-d85a-08de792f2c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34020700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	AdF8SzqjyVmk0PvROUTevrkuGPtjO3BCzdEqon+WcRjpWAAoagDk+LTmajtWwRCjCsk/T210EybJl3ACCq/x6O3R2ygkTYVAkz37utlOcbIoDpcbkG+gzHp3aXiIGyNY/ZlwvD0KBuHcX0q/HUcZBDUCkjSXILNUNt1vMj98wghpB9fZseB5NMbI+Zj8p73U2As5OEY/oUOz9mWDZdD5JLM6lIcHRS1/1B4E3oxakW+sM/0qYYfkJpDJDmVdMjAyBziXeZAV7BRDpYRHRjHATyD89nDaDcCMwOu1VFviVSsq9CsdM/ey2ThrCcFU/scBBylvFOfG7ctjdol6LcBPWU2YnDfPMRYJttY8/rylPdx7mo4fJlTJaQjVdQZ5yILk6luJY06GaJPu4xciGlBV5BQDppHKvYu9we8FDBGtMzEFjaFYmFVrGXzinWREu2a6S7gM/xcWNV+ctfTsDQ/uXmiX8+zyI4qPPAgEGxaSDbUO4NOjocwKl4Axfmc+lVtaXSCBgbuaUkGaoYYAGBNwKymksKVbvM0O2/EMZnVr+zEfQypnpL2UjDDqYQkoLrFaH06/kPEabM1pu6qcK8FmRdJJPvPeTEkADjK7b7IhHVcdp3R+XpLtlW+0ZxHtkMEIpvg/uT9zYVGl9j2ILre5iFCejREmBKBzyFD+T6EjL5Rf4OrpYCva1wU8RS5OXCw1ZIn8PXakkIglhnf8WyVoqiPc7higT9TUhiYvDDJOOR6+RYZ93z17ICyC+xnXdcRV6rn7ZMe0jW9a7vQTlA9mZRjS7bazt6vZQTxiNupKonI7bSxG3vL/wmVjTc0J/ez21mfptIEI2gGA9swefeGm3w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AjZeE5iAA2AMdT4sZplG/b4cKvIZ4NO9oocKUSuH56V5vy77MmtQqjwiT+SsCWZteqFrFDP10WcD4FIO9zGku2wW1XFDtEs6kSC16Qr8eIaoRS2zUeToWDn5XTuL+a8bALuzKKys1iHg0GNvrjIPX0VghCZUAutwGFRg98MVPCT1BlR4z/1O0FtairSnP6Ic8PU5iJHPoopsgXlC/BZQI6O8/KSI8g0jkK+FTaHpXkXNUiaw0N7MsRXiQMWfs14HuJF1P9a7ag5svyT8Pyem4ejrquwqICITsorRJW+r/us5GSk219H6f6jM7CP7W4+vYlUkRpOuFqJ7UzCIJGI7kl7UzIDznbJtWfM0UK8xaWMTV85usnUsL0MAIdteKuy4K9/12tP71nz+Y3ERqJjLX8iMB497I4pubbKFiGxZd0eegsE7mDYOGkDYLsJGMAGf
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:14:24.6699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5927b539-ea14-4549-d85a-08de792f2c5f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4976
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 14:14:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17197

meta-arago / na / 20260303135623.2564012-1-p-deshmukh

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
- Patch Series: [PATCH v3 0/2] [meta-arago][master][PATCH v2 0/2] Migrate O=
NNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Tue, 3 Mar 2026 19:26:21 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 0a5fdd1e221b0e98f26dabc05d9d10f3e=
7016350

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove temporary hack for DEFAULTTUNE on armv=
7a
- Commit SHA: 58966cd5a2d433b4c915e652f21f2e2b2475ec21

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
ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




