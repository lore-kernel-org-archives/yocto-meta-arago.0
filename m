Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF03FD88D9
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 01:48:51 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11452.1773193730241152727
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 18:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=GRP6lyBl;
 spf=pass (domain: list.ti.com, ip: 52.101.201.33, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLrhDaz9J2XwWK3UAokounQcxdXeIF6Rc7KL+VHN2iNGu5D5G7uxljeLFWxbQKntK0md8Z1jyEf0dFJIp9pt4LUhSXGgPplTzTFMjlMb5hJWi4AOYU6jfYNyc22t6e0NIcaPaomiIfOWvx6stZEovQIYbdJkQ6LlrbmNHQVU0U5JBxprXj/vN7Cyse93AS5thfKvQdbvJCn0h6ujxSSFJbaQLHiX2Qq3e408erFh8moU0nwEQQARxFX0G2cvL0eeDogWAAgBXuxpfUpm04FrXptOJyuB0xI8VAau2Ef/biWJuPG4PvCDe25f7CZs0RjHELQbJf/bc9+lsp5PRWOG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y15nt5lV2B7iATbSI2woH3pJaLNvLkaKqh9zdou/fg8=;
 b=yPKX5I8xDX+PFlUvLpQpW8VWcdZRc8tZ/DzMGFNDvEpgyr7Xqk0Mgna+xGZTamE5nY1/p+ngEw1X3MMg4jbc8gWYMdly+E8VXa1DhsEauCQR4QciXuYeXegizt8Mc6liDzTSfpMWii7PeB2vsAh3m/MIdc+PmtY5WO0haGwZhWKl0HN4aOelYz2MbYzvqFdcHBKjFxcgQVtVZJPEwmEZYxmGHWWpSLhHVkXNUw4GnaJJcvrRCV+LfzDMmB6BzkaHduST7qAQj/XXnNnMpmJt2cqsblPq0a/s6T0T2BoqHnaJpQKTKhRp6Kg2OnvSBBolSJcyzsymUHbqZe7DCL2n4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y15nt5lV2B7iATbSI2woH3pJaLNvLkaKqh9zdou/fg8=;
 b=GRP6lyBlmbHFaKBsewrqjFp41jugNf4mOy5kbayXvU3AU/0u3z/MrerKw+21dvSEpwhVpou7QDJa0jadl5qzMMPbLO3lfO8r47EWlbz3OxltA/Ghrrd0NdHPhuuw3+SiNIwOfu8cpeQOhu65RHKK5OhgWqI1RtDxxUgdKhMmtpD4abitS2SrHVGNBj778vom9LczKBl00boiBjSFYGxvUcxJU3DfLUZVMvVH86g1temWY5PgfwF7TNPXPeRYty71WnvMuP6+Ba+bWUy1DJqZTNj507xWPKXHQ0mq8TeDHWfkNCAtdPniBZLvDVUg5C1o8M1qUctUQZ3B6Ws6bXPZGA==
Received: from PH8P221CA0046.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::21)
 by BY5PR10MB4146.namprd10.prod.outlook.com (2603:10b6:a03:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 01:48:48 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::5e) by PH8P221CA0046.outlook.office365.com
 (2603:10b6:510:346::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 01:48:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 01:48:46 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 20:48:41 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 20:48:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 20:48:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62B1mfYS4152559;
	Tue, 10 Mar 2026 20:48:41 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 481A113F521; Tue, 10 Mar 2026 20:48:41 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Darren
 Etheridge" <detheridge@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
	<j-sahu@ti.com>, <c-shilwant@ti.com>
Subject: Re: [PATCH] gstreamer1.0-plugins-good: Fix Failed Negotiation in Non-contiguous Formats
Date: Tue, 10 Mar 2026 20:48:41 -0500
Message-ID: <20260311014841.1492451-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260311012906.3348907-1-b-brnich@ti.com>
References: <20260311012906.3348907-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|BY5PR10MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eeaec29-f3c2-4387-810d-08de7f1055dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	AG0EgwwGKlikBuFEcYYI01y09cx9xlZjf+b2CBcL7LXoj7OJgzJ1xGbshRTkMG59/05Ct5xXCBUoubti3NPX4TizM3tXYAcQ/4MoLWUGHST3oBBWrVB2QEqPAD/Sqi0+eoA+D95FE1SXxtK+HsWKeM1FbtCM/KJ9ztUu3zmIn8D6uD6/8uYMvx1NnWFEndaPnHknin99nAF8N4uzol+2+xJzmUvVPW/S2bhz0KdiPQNkJsvq97Dsr7Bzxy/XTY1TQhneNpzScfmxwCmJrp3iU/XP5v3t5GRggsslasapPYGqYJ7r5SPay+/qOoniKsIXWuGNR1vtsZ8RV1CuwqD9RwLXWaz2hMXqWh0Sxx+MguYAc90iNloI4fsDfK7pKbP5FMzPn0mpoblqJ8wyCVr3aZjueBog3qxZR/HvchvAaU16VAXLlWHSqxsT9Vm5H/fL9V4Xq/zVuca9jMq8JBiAxM7w3TkErBdp39gBZ7S9Ogk0/eIsaXPGFn1Domh5XDBfoiGq6Xqd6ZtgfZ61WwraMz1mek79EFpHjszME165hQFBSKdf+a3hbAOWQyqFEufQFmQjWMTNqKVaMeZZHvWruKjx2n84C9MwdGTs3S7yiPbR0laAGsHMbGIlFFPDfZ1QLFMViocWEEBA4ZiBt5Pi6iniYjBh1HerWwvKb+P9+DY44yzaUEZHZ1pdydkuxX5cHgFeKHctnV9ZOKrgaSRUX7mHk6MTfVP1Xe/mM8sSlJb57x01S5P9HnD7DzZHyu4tLwV8uUbWxaynHOpRpsZ2yQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sQUPOEvTnkIekn2ZPcBf0YqAz/SUEC5g8xix35ecG6yBr4BQ/lIgo9Vyv4VuLv3KWju5Quub2jUP80/QGQTv54S/fVKRTFxjVSOefXuujVsDsFQetvcDqdCE9H1MZJXK7MJuktQ0xv2J57FQvIUfVaO/cSqosPpy2lb4Gji5OVqHoHitkI4/2e/jbkNHyrDJA8nmz3x9hK4akjGFSMZ4v73c3wC6wL1zLWYxc09C4f8zqn+MwYkcncIXxKrxBiLPPb11UXsoDbgVISHEU0xRYPbzYUs1UCsMndOsj9ThitQcLLkqCYWsv41TQy7Gpyc230cGAeezsKYcNb3hohOu9qevAMkE6knPci95PrFudFDni8UJjkeJsEPZJofSij9/juLPdbTUhZ1ovKXnGYalNpedVAVhewn3MmwaoiViojbdO4KeaooLRQKRECRD+u9h
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 01:48:46.8989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eeaec29-f3c2-4387-810d-08de7f1055dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4146
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 01:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17305

meta-arago / na / 20260311012906.3348907-1-b-brnich

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
WARN - [PATCH] gstreamer1.0-plugins-good: Fix Failed Negotiation in Non-con=
tiguous Formats
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:69
            Subject: [PATCH] gstreamer1.0-plugins-good: Fix Failed Negotiat=
ion in Non-contiguous Formats
   =20
    WARN: Commit message does not include file/recipe name: gstreamer1.0-pl=
ugins-good: Fix Failed Negotiation in Non-contiguous Formats. (COMMIT-MESSA=
GE-2)
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
- Patch Series: [PATCH] gstreamer1.0-plugins-good: Fix Failed Negotiation i=
n Non-contiguous Formats
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
+From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Tue, 10 Mar 2026 20:29:06 -0500
+Date: Tue, 10 Mar 2026 19:47:35 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b7299117b5e4ba00cdbb3b8596ba65e5c=
dc45b96

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
ERROR: Nothing RPROVIDES 'weston-examples' (but <build-dir>/sources/meta-ar=
ago/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphic=
s.bb RDEPENDS on or otherwise requires it)
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




