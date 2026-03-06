Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B2AFCC07C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 21:15:49 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5124.1772831748913851903
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 13:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ZNh/+EMS;
 spf=pass (domain: list.ti.com, ip: 52.101.201.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r26NZ+9fGcRmYzWrjRicfx7vbk9/RkeQ6h/t+H5QMTvYugv0wTw+wt+Nn5SD+pLFwkLuF39qMnBbCvUpQuPtRduPGEybbymLbRsk/wYyFrHF9ShF8oQzdXR8dBTvkoR3xg23O7QKaTibVgvPbX2rZkJW+I94vHxo2G96cHGPnXVUm5gXaAki7qv1XmLOliP1FFxiOpyDWzcTbRog3qYKiQe1IsN0YAeumqwFtfIBqauK+0BGCjDK6ybAH9cNYrkSxDy//66IJFkahYGxu4x2kPymSfXODHpMnF9wQvoPyhjR01GT+o1BR+Rf5OsNAi4roF9GyyPB8QxaCzhQL0eSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGyVMPOPVKQlAyST8l61lPf9+Ll1JNztezQ8kSMC3wo=;
 b=nx4Nx/1LwayjqO30vW0cxx6SnxkcvElTHn5uljC9dYUBCr2oncwCeJSl9OTMgxl5h1Zyf6QKuxJVkxCNdQuN5OV3mUTQ4qA5U9zMT9joNUuRfeh7XBYKiD1TZSRfA1Xa/C2AU5nDECQ/LAAaR4xLV4ZPidst6/6OVpYsu2JW2+78ASZOKEw+9TSnWYMrqj/b+Mz4rtsG9x4PW8nwWdSQJIsaZBRSN+HT30bl0WvRAoj383J3qYulYRTDwT/prgKGVk5NOC4XHM8o4xRSyOfVswwnHJIaegTLfhCg3bTFqEEjIpLCT/Qo0qUaPfGAjWZme+7jvP/6VdTPEo4/TkxxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGyVMPOPVKQlAyST8l61lPf9+Ll1JNztezQ8kSMC3wo=;
 b=ZNh/+EMSFS3zzX90Dao3sgZ5yFTJnYSCmg4BX4/kBi/SVyRw3AbIwZWr1iLsMNJfk44JpL8TvJwRUDx8mb8Ld0MIDM5YeDLskQvQuK5lvcDdN7dItf9qb3D7wjWWcba5n1ILG0Cu/kKnIT7o2Jwmt5fZnaU14omOgbWRRUhbWSj2Ky4L9zts4VhjOnwQ6k0QPHmqnbCm74smUv49PKpWMNCblfqNiH7hb6M2F2URJCM4ZUVxkEilNKW2AtEHkFsiwUhWSzPJ2Gy2Wx06wHr6/StbzvUd9kVVMVrA8l+FpSdd4pzF6fje3ojHMNHAe9Bxqcvggzs7ZmrzGUPWUiHxgQ==
Received: from SJ0PR05CA0138.namprd05.prod.outlook.com (2603:10b6:a03:33d::23)
 by DM4PR10MB6064.namprd10.prod.outlook.com (2603:10b6:8:bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 21:15:42 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:33d:cafe::84) by SJ0PR05CA0138.outlook.office365.com
 (2603:10b6:a03:33d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 21:15:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 21:15:40 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:15:37 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:15:36 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 15:15:36 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626LFa3J3383295;
	Fri, 6 Mar 2026 15:15:36 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DF4C99ACF4; Fri,  6 Mar 2026 15:15:36 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
	<b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH] ti-test: Add request and websocket-client to packagegroup
Date: Fri, 6 Mar 2026 15:15:36 -0600
Message-ID: <20260306211536.1522259-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260306211058.881417-1-t-lannynd@ti.com>
References: <20260306211058.881417-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|DM4PR10MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: da9dcc78-284f-4e35-39c1-08de7bc58520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	C8g/uE2lZwd871aKe88N7+jFyo6h6oC3OFglkWcvTfqbBXJYs3/14mO5HPHPBXsCjTbU7qbA00OgT0tPUtxToqoNMum/YwY4exJ5f7TyG2TWFQJMV1oaw+aLq/qKelgyTNVA5xvs/TwY2dN0J9HBF6RDt7nGPExojU517j41ScndrRyJ+qZtdblcr0NchpP4Nd0V1gTLhMMkVcNKgnBO9T7MFbzYlQegStpwUB2WuPMfjmkT7u3771VkKW82r+4oBiQi4X3RTaVYvf9klXIe6hI3NeOwHET0TDQfjvI9iFfhbyVe6TcQMt1xmyuVTqVZW72UUdE7o3Q09YSwOgqt/l6kw2uz+8wCXJ7A8V/YQ84Wbol1YlnxRDR1By+/3jYrzUdol69T6E37wGSZ6GYVyFyKy7DjzPRV1/wF8DBAEBpOTtwY3Ju+95jZdTh8PLRW8KEwYOx95XzZkJ+7BhlSHq7i6IDlFbn1OFdxsXjk9VrbSJCYM3eslNY9bS4e6oP3MxdH5rO06xktyBGp3JgNfw0havZqn/Klyy+oxZ/5CzpeANAQ1nEpXW82PXOq5EuxUFTZ+H1EfSEcQSA6429QGNQRMV2TgdGHuw2QQ0DL6GmJNBP4kirjBeEpEn44YgKavGp2xZ6+K05dTNlJLi3iZCvWXSIVRUJI3CTXQJLR27OnXSVjnaW3TmprAXAcejsKRzh2/6MD+eL3l9P7zf9HAuqZBGqTapdD6DX4b5OLbgYGQf2I4caqM3QQxg1V6/Aw9XmMo33Q/P1cyV8Bq/Tiyw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	z6M4WI1s8fztrCWTCarxe9q8dNeaA7Z/eaHiXk3HzhWwr9Bd0vViiFLLgg359Y5erfISxx8gHNbfxcHPB2IPva20yeMlBWNTubQ9Grhi2pQdsLyHmOuyKl4Qqtw2sgiGxw00NVaBWt4vYUKRC1zKRhhurYmEbenRqq869/3GHdXPjXgZOZr42BIu5s7lTcFTRnC91D7tiMoSjqWHh8yzYmOFvA2RJxMn8KDVozi4ArTAToBCPanqp3EKhTBVbBGgoVWnjQyqtALVcFxoDl+pamNWoY3DMto1gYque2ZXfCbMgvVixDVaCOUNMh/gPhffp3zdlY8kOVfK/8boRLEG7N6K0tda7/O+HdT2nH+G5T5izCOqDyR6yJ7qK2dbi9Dvl8HBpJz350OdNx4kQU1dSTJFKtf4oUNfkeoPsKtGTdK9L0Fk2Vvr0Qj3jlwBPe9r
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 21:15:40.4194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da9dcc78-284f-4e35-39c1-08de7bc58520
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6064
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Mar 2026 21:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17279

meta-arago / na / 20260306211058.881417-1-t-lannynd

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
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] ti-test: Add request and websoc=
ket-client to packagegroup
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Fri, 6 Mar 2026 15:10:58 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 06deadd037467d6201a37efa3eeb561d4=
3044968

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Add settings for new emptty recipe
- Commit SHA: 734121fafb74eed2944851c62c11ad8a48af52db

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] ti-test: Add request and websocket-clien=
t to packagegroup
    error: patch failed: meta-arago-test/recipes-core/packagegroups/ti-test=
.bb:80
    error: meta-arago-test/recipes-core/packagegroups/ti-test.bb: patch doe=
s not apply
    Applying: ti-test: Add request and websocket-client to packagegroup
    Patch failed at 0001 ti-test: Add request and websocket-client to packa=
gegroup




