Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819C4F46441
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:49:50 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47117.1773654583392482912
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 02:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=bzHxE8Do;
 spf=pass (domain: list.ti.com, ip: 40.107.200.59, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYQpCqR+GJvwLfoVRBlo64zaHXGhxbZ8bXQRQYLxl73YTO/ozhNFRCnBvz4JQueMqfvtnpj3g1/2tWz5oU6hZmrhfWyRdhGUM8xUByFVvR+PvGtR9dEY/Cdrce97YPsMxbWMsahGPx6XHrLW/aYcpP1ubEKfdNH6l3rQgbLnDAGgsVU9G7lLbDPCcTlwUL7fO7Y0F9ajymNF3Aj1FmqkWBnsAYihRyQpfYPlmNXBbJfkBCs1PqFTy6UAwkLbo4C3EhqzuYMECnBpAPH0rLgo4Z630dT5EfY/iCGwA6+xjR8M4AmFdZDLY3rH5rRck6Skb+1l2aEAVxZbIchFTssVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpIje8fonGegHPf7sjxTCuFKa8bBAsfNsU6NGINAHlQ=;
 b=AbKmZZYmfGaZlAD4RmgKkVuatgG/ZC4G8C7fF0+i0Moqkr7y/HfFs5Ty2gFymYBN+989/Jn+485PQsTgQ8JBldCj7nbcLkPamUGDomhXv67MvKdr3dH3Yy+JKEnelkGyV66HBy43bwQnzwmb/poB1qvuLeAxfmqQyoZ5oa5y37WUzPTqqmzjsgSmcjGcHELSYjU7V0CSfg6OyIL/vhKekL4c6qciRax1pRp53eZleUULvu5shACXoTU0mQKqSLZ90Ew0worRtpjbcB3mGRDNTyHx8qLYWDxZXbkyU3iMPwoRPeiHtXc9hYqRwGDiBkMBAI0dG0jwsSYvD3ofrxl43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpIje8fonGegHPf7sjxTCuFKa8bBAsfNsU6NGINAHlQ=;
 b=bzHxE8DosevXr7MYftclW7XOOLXVhVHmUP/xJHPKj6mvgE3NnjY+dq2XI5XFtzNSzrmHKSE+AlOaRkQHSIeM6sa/0Uu8e2IQPt5WeuSP/2oPJLi9YFXTVRiNBJMvqtol1ABmUUpNgc0T7HBuFUag7HJ92yTkBtdbadN3ccWIME2I38ochXJIS38EPjtOf/zp1H1xq6ZOvLQRSABTKEIU+Fff4w4jIm8BEclSo2Mvq4B5eym8CrXZCVpiXOLi+YU5FZZysj7cNGsYaIapX1WprAw5aWhqAqZElxlVBO7+WmxRzXo/3pKZ2GIG6S7pyr5+hxzRAAe60/JdDpOvdNuo1A==
Received: from MN0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:208:52d::26)
 by DSVPR10MB997822.namprd10.prod.outlook.com (2603:10b6:8:38a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Mon, 16 Mar
 2026 09:49:41 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::33) by MN0PR04CA0015.outlook.office365.com
 (2603:10b6:208:52d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 09:49:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 16 Mar 2026 09:49:39 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 04:49:16 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 04:49:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 04:49:16 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62G9nGoa1063910;
	Mon, 16 Mar 2026 04:49:16 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6A0449ACF4; Mon, 16 Mar 2026 04:49:16 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
Subject: Re: [meta-arago][master][PATCH v4 0/1] nnstreamer: Fix packaging and buildpaths issues
Date: Mon, 16 Mar 2026 04:49:16 -0500
Message-ID: <20260316094916.3853459-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260316092648.1377711-1-p-deshmukh@ti.com>
References: <20260316092648.1377711-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|DSVPR10MB997822:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ba5ccf-9fc3-4338-83c9-08de8341576d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9ekyg49kACPnZuPtFtNeQus7sOfNGZ5aBjl32s6Bnm6QHAfqkOlfgf7BUa1PPJy8IhTIAfPmOSIGae7RFQKq+WBMoWEfZJba8rmGud41N9ItWRd6ENJ1OVHpQ/FQ081oqplXcCf3Jlr9JPLg+4WX87lEHmsFqRhyOpKwbTB2pruUyqmZhvCY/Lja9JanuAGeuIuDM9wWzgjnDEP1MASa9uPnOIJKrDHj6udmC8g9YJvcMzKhvi/DTXaZqWdcer5iFH3PRfHANBBeoiscyfYAJNpLDVIoRvEgkSkDJAyVwURcHJ86v3wSXdjRl4K7wD/vxgD5kCUSyq6EQB6QeX41mdDuC+5Sb9jB3hJBB8QZSaUzYD4oqAISFDAmUB+nGT3Kwh9TCUzmuLURVu5NLQfro3g97iLKj2HeqVhO6w1V7jq3uDRgW5SN9uE3EVm/1oeGNSfYkoecHCsnGUE6HPru11yvdz4nT8WZAZ2qyZOD9i0ocWEOKKntNafS5Sy1I86jVG4PckqIqSx6/8y4VyiIIDsdWNZN9pcnW0zVSzKuYCFbJbGXiFz1h4kGe4ZsnVGy7vvhtQn1uXROQwHfXGQLtlarF8heDUpnuwvtTVTCI8mgmeq5w9O2bU+aHqSHrRhfcgogbrb8F75pjgSmA9wR6KQB5tjnH+fdfSG3k4ldFDq5BQWS2dHOFANeH2pdNArXXd+onfHXnpayC6uwCwevGP/AAdls4/IDVhG9+O6b9EP/gZJu8AjfoZitdQnG44u5IQRNhKDsSBW54GMLjJvGNA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qANi+Tn5a2l1foHHlqEYWY6lP3WkA8dyNArCz6qZ9tQDGWup+gS8SidBi2RE76NlOg9Qs4zADw+6hhdNCzF9ZD50dSwh6/At6kGTlQO40qnJ3pvWn+JJjDgmdGlTDRVgvCkRxEhLwkHOq67avdjzOk8QYuQSH3KMZcyA3d7v9vAM0M0rvkf9wmNIKcaBxa7Ual1ZGYcp2TGhTMl/4B7JwoGBG6wMtpV4uAQBFQ5FzROS25A+/hRX2FiFbPswYNiYIuwKNIG92mEEppMfES3XT1CS/r1W+nJq+0Oj8alNcuINcsqUs5VaOQrI38adHbu/qCQyTbguQHr+HuRv4hDJdnF1fl8nWGO4yxZOL3LF7dxVcwuh0J3h8idSjdlj2lRRx5oeRH40TRurY2VkcxTq3j2F/613n3RK5kY9nqt/twH/nPya+0m0Smaflk8iIkoB
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:49:39.4906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ba5ccf-9fc3-4338-83c9-08de8341576d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997822
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 09:49:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17347

meta-arago / na / 20260316092648.1377711-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH v4 0/1] nnstreamer: Fix packagin=
g and buildpaths issues
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Mon, 16 Mar 2026 14:56:47 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 523969de2baf0601e64555c54e47b95b4=
ae5ab8b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ltp-ddt: Sideport glibc 2.43 patch from oe-core
- Commit SHA: 7f7f74b57d9a62b24cf8c5509fd2f3c9abfdee8c

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




