Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3ADFF8850
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 22:35:11 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29652.1777242900662634845
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 26 Apr 2026 15:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ow0Z99pb;
 spf=pass (domain: list.ti.com, ip: 52.101.61.0, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYQdxgd3A5gTH+z6LWTOlZjqMTFXde+FhPt6ZpE3Kyszblpzwn3IColhQbi190bZiTb//DhCD27XAgHJC5xHNKKRoROUFGSbCk+Pf187zxK8EgG0HNigoKHK7Y81oGUpWf6XDZYnrm0MuboedPDLDPKspgMintklm4lwJBwVVgpW3FLvDT5BFGKhqkhkFOOFUywG1fpd3MMIR0DCDrri9WC6lOrtnva4C3cOyMZ0pmuSgJzwa1uzXHvWr4ZyliNoHhn7k2kxUzR9X4JeXuiPXMzXPG/Aa7zeI34W03DO4H+GZWAwpkDuABsrMhILbzwEeS0lCFAj9I1ILfK/l387Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGlh/qRS5lh8mqqnBQ7cYyKCCXDI6l2gLN7uBJX9DlU=;
 b=RrdY45QOZpERwafPKtuq328Y3kNdbWyoVUfNyXTgJqiSyo8/aNOw/SAVBRD2uognhy8t/2uqJJTjYyVm+OKZvrfKU+18tBFePB3QlebOpZIqFzb5P/9HRfOFAs8kLrFDvk9EHgxaHps6E1InxTCeXtJNmPCs0zNsJCFGGvu/hJJpc8rPD9cyJPe7kX6EVs532pMKUH0+WVhlzd6WV8ecU6QFeAhfK41xdLoF5ztpS9Dv9PwjBra+k7Gx0n/G3IoSf1B3/nzqxsBBThMd3H8XUD2sBbVqZJYVlcHn9emeY/rdobUyTwvlWrTvvOLNBRJGdfc7cRDWNShi8Xtpl9ZJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGlh/qRS5lh8mqqnBQ7cYyKCCXDI6l2gLN7uBJX9DlU=;
 b=ow0Z99pbaomksLzDgROga3gBgQJIet8SMOAcRrZ9jVnNOnYFKMwicaMhFBO0qIIUG9tGmIWgxgygznQeMom3CKiv7dbq3yzmeCTzIi5En1cjaNpP09wk6wh76EXMfizTFB5EQCVwcLKQNP7A5QYkrUOnWKvx0Wmv7ueZoubd7KTBkWjcJsx7af6Wm3p1FyRKA5aia2Zl/pjXfmNqvJlR57TocWPQtittd8tOi2cf4+b5Nwab/Lkj8hxyu7ceZ/qvnaG4G57nk2WOPKv5cCUQ34kW5rRcU+rwtTFD5972xSz1SM2nT+crxkdcfu+fAq2DRrd8bmX6Zk5+8bvWM1aoCw==
Received: from BY5PR04CA0015.namprd04.prod.outlook.com (2603:10b6:a03:1d0::25)
 by BY5PR10MB4371.namprd10.prod.outlook.com (2603:10b6:a03:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Sun, 26 Apr
 2026 22:34:57 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::f) by BY5PR04CA0015.outlook.office365.com
 (2603:10b6:a03:1d0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.25 via Frontend Transport; Sun,
 26 Apr 2026 22:34:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Sun, 26 Apr 2026 22:34:57 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Apr
 2026 17:34:55 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Apr
 2026 17:34:55 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 26 Apr 2026 17:34:55 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63QMYt2R653273;
	Sun, 26 Apr 2026 17:34:55 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 91EE32A54; Sun, 26 Apr 2026 17:34:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] arago.conf: update DISTRO_FEATURES handling
Date: Sun, 26 Apr 2026 17:34:55 -0500
Message-ID: <20260426223455.3577239-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260426221846.2594764-1-denis@denix.org>
References: <20260426221846.2594764-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|BY5PR10MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: dade2acb-84e2-4b8b-a4c2-08dea3e40b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	GoWfsxqmg+BiNp5Lj4YKF52GeqdR1iYvVZyogBuiIZN+J6gA56H3lYXpruAxkeNOSw+ppl7UhECIbspSDrdn6PJ7rB8MSsZajVwY/+XGPdr6guGKMWKAFElABkqphyhgpUpr79Goz8KkknV47wK+OKfO0zMeJ9bQYrWtY9+Be2NOp50rbXAGfwvkPsNzxIJRKugSOzCHSA68VHXCQARiogrsKiKaCYvca9cJ/Qs0RZgM3h35DOPBG6huku+j5egHgdhkDnf1Oa87YG3Zf78QQLC8+VtnwSNihs67bCCGovr4oDqUlsKTOVSSmgOOZdc/EPBpShQ8qrJ3eEdUeC0lM93G6avW6r2mUm3eGWGZ4U0MZ8pfHQejMCxRyloZDrpmSeTwc0UyvmBmbgBeRusTpkdIfnx9EyDQn7YbL6sfRceMBrIJvi6G9wJS7GB0JgSBLnCkl/vVrrQG03kzn3zYI602JhbQalDOfG76I2kKcw2S2lFWCSJb0NBxFqztjEomfCarN+QuAq96aOTPj6QtgvG8pa3J7UCw6h3OmGe1dLb1MXaxxmNUC5TUW7j515sQG2KnMZTfTuvfTFNiMHVcWi1iAO0Y1QGGxCorSl9zHEcChP5fsE4nmM2kmzlgyGkpfXNBWG/j1rPA4+PtZvUeBoRusg5Z+wyo1VUH6TfP2LG9ySXKof4tM9OL5PCeuMZ0ex7GO8wnVveAhJLqfK4tmslya755MMYpDtug61PYY1w=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0i+mkhukpKsF3fuYQVgBFsiUEe7//HS4sIBIZw1Y5sHlwQiMPzD3fQdA051y2csQyiBR78ZBjx9qwDjv5rVDGAp6/F0JANpBNMyqLMZ4bYhNbvjpoxDJKHkDOzSkC++PeftCAiJqP5WWDXOHMCNCn4I2wjfCIUBVlHg2Sc///D+S16f7dwZ877rgglrcFVDuSW6DIRlIKSRjmk9HeLbDm1fJCiZUTnKOML9zhYNpQQNyc15Iv6xHwIY+e8/BDnMTIfhgaRBwVRztzdwGdjWwruKBED6MfEvNwCudtivdQ72AN75Eei6iicUvY31sO9X4NrzrkOlhOPJ5HR3qeaodihnfjmq6EfvsOWzi1/osVf++nFdKiH2znWymxGEBq9eGSak788FnF/wZhxR9hipyLWCEaSpzJyz+teaJpd6j9aL05h0n0qzKn21vl7BI51g9
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 22:34:57.2066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dade2acb-84e2-4b8b-a4c2-08dea3e40b75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4371
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 26 Apr 2026 22:35:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17492

meta-arago / na / 20260426221846.2594764-1-denis

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
WARN - [master][PATCH] arago.conf: update DISTRO_FEATURES handling
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
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
- Patch Series: [master][PATCH] arago.conf: update DISTRO_FEATURES handling
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Sun, 26 Apr 2026 18:18:46 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ecb988cfeabf187b36e36a45015950456=
268e9d5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Pratham Deshmukh <p-deshmukh@ti.com>
- Commit Subject: tensorflow-lite: Fix file packaging for headers and symli=
nks
- Commit SHA: 480b57f06af61bc5ba01af73fc6d94463124e318

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
ERROR: ExpansionError during parsing <build-dir>/sources/oe-core/meta/recip=
es-bsp/gnu-efi/gnu-efi_4.0.4.bb




