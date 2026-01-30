Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8C0D61037
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 11:10:49 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8073.1769771442933756507
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 03:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=kPj5Plky;
 spf=pass (domain: list.ti.com, ip: 40.93.196.13, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1iFkVpou8rhlyrP8HTF2V66ApdCBAFgtM9DFcDJ/xp1NtewcvbK1w2Yo2SIPFnVy6MFSKDKpIPBSIsYh7CdAvMB+oH96kRVlEJKplcE58Q1ndnaPRfn+cvdyKz6Xu04Tw4AYFAGsuNT11o8jKyL2QvYB6oIUHechwwZldk6Pjg53kIzm2PZz+3Iw2wLDcwknmmDJsvcRiPiCLQ44oo0t9r5+mH51GWwMbVO7A3nJmA8ANgKQNpkQ/cWcfVodqP73eY44K5BaVHMFyqn5g0W/cpgAnOORLITBKpmrwWw/pfYpBuIO8S1/QXO7O22IsxBR0ziMUmQRUo+s0wI8paLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCD13yqD0DcfIpcIcBTxY/G9q+hXerMjp3gcS9gMmco=;
 b=TCbgzG1a3xSYz26O9QEEYZ8xV/qnImbF5+4ovL3leuwAXjumKE3L2bGm20sSQb6AhG4KbdZhLO+Bqg7XRq7xELtTbNbSm4mTYMdJPMBlYCQSOuXNX51UXbK1a6o7Zd258g+ZeW28SEwFjoih3EgAmaPd43v1UlLkICvFk2IaBhdZptWSIDdpbCeyYkCsMQVXAMEJZ9EXLvHlGkung2IHiiqq8y1nVVszQphjQ/eqsdVN/E2P8KVwEA6bJQz7gqK5PsBqn52sqQi2xxCQPEaMi8TpmicbfWaWZCMQR09nUrc6v/SusbCol2+v+h9P3HUC+ZUyWB4YSnVUdz3mrMUeWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCD13yqD0DcfIpcIcBTxY/G9q+hXerMjp3gcS9gMmco=;
 b=kPj5PlkyJFUUr4d6QKqytlt3OcZZETrpfOdhGh9EDghGS3Tdp7e2iNWat7JjEOiBWt3GuI0ZNMOO64jzAadEN1ZSX6AyYQUlmC5qjr7v68qyhvdYiGLs48b7lYg0SP3kLtmRN3WuCe4QwngII9fhztF13G/G7myUsiOCExbjoPghG03GCrqM8WhDpGr7oBlNpmxTlR66tNSQl52/4G9mMw+1uB9kE59I71Qi3hx13PhMXolMVtrQ5tGf95K08C+Uys7xcsfFDs2FBtZ7isF9UQFDWokHorO0d69RwzHZbZvRAjVmOWtA3RTn1MgshacTnxaaIYCuAKveNuC3hlziJA==
Received: from BN9PR03CA0320.namprd03.prod.outlook.com (2603:10b6:408:112::25)
 by DM3PPFA09EE1970.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 11:10:39 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:112:cafe::73) by BN9PR03CA0320.outlook.office365.com
 (2603:10b6:408:112::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 11:10:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 11:10:38 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:10:38 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:10:37 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 05:10:37 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UBAbDg2723283;
	Fri, 30 Jan 2026 05:10:37 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AA3BE9ACF4; Fri, 30 Jan 2026 05:10:37 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Anurag Dutta <a-dutta@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <gehariprasath@ti.com>,
	<a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] meta-arago-distro: recipes-core: udev: Remove MCAN rules from meta-arago-distro
Date: Fri, 30 Jan 2026 05:10:37 -0600
Message-ID: <20260130111037.1779276-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260130110637.2338476-1-a-dutta@ti.com>
References: <20260130110637.2338476-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DM3PPFA09EE1970:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd9422f-91f5-49af-6069-08de5ff03303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ii1EH4r/GCZSc7FkYt4WV8nTU25PbjAJjWeZb+NLFjyd6hZg38ladPeL5y05?=
 =?us-ascii?Q?bnC/CSMe/wIv0JPxhGNa1g+VFig5xGntd4ZinUsIfgFV1NNdE44DissRCJTR?=
 =?us-ascii?Q?wb/zPyKnYdIXWmyh/dfBgdpol0CDknPl9KCYGRgtR6WwD6VUuDP+d+7+1ZSX?=
 =?us-ascii?Q?gy+/m5f9DVAXU3+ZpGxQuMcTPIZpLC7w0z8AFKgvqD0hCfZ3z0JV3sGBPwRv?=
 =?us-ascii?Q?WFAXI19DV1Dqd70rJXkjcK11TbckOKd1WAgvWTJDvVAIL55hxF5m8LvWAzG9?=
 =?us-ascii?Q?skQx6Mvx2kCCYhS7rmTUP3fIQ3P63SMbYtYiMTmvt2aWJm58UWmaPBTNQ81Q?=
 =?us-ascii?Q?FbeAxMfwUZWeJIfZuoGKXL6aewi7dMjb+lL8TvotkMssAjcrsoxNteDzXWDJ?=
 =?us-ascii?Q?n1jWsGvyZgkM9ktHfQcTCIt6Y2Mr5JKUYFMRn8qzucqLkWP/AXxesuVBZW45?=
 =?us-ascii?Q?iLsM4ABaVJG/dl7OPusA5VUVqRQtgT6w2S9K14pbaoG9kxNQnpp7iiAy7gZO?=
 =?us-ascii?Q?gMnEjyfffpHME8dhRBhD3nKsmUrDeytOrovJZpvtEySgesi/CpLKO3eEVtXC?=
 =?us-ascii?Q?w2Z59G16GvsVtw3mrQbK8y7vKTeRqN1Xlp8gdywl2paGf/P14d7OiS8NLdvn?=
 =?us-ascii?Q?aivRBR47GOaCwsZ/bHNIx2sWxnWf+3Sb9cF6S6jiLJfW2QmbsHKnuEzYvfGm?=
 =?us-ascii?Q?kDqGshaMsiiakPciIrJ7pxLTCixlfs144C3pK4Syokzf481WSNkWGSCB56LH?=
 =?us-ascii?Q?rKme+a1B4mFtT/kmo6pIjGfTFX8L7K/GBkmoYEXxBYpHo58Lx5fzFC8r6gWq?=
 =?us-ascii?Q?tPK5+0Lgj4WaafnqQvAHXP5pkuOgTYxjhdDMGb5XJYiXaV1GWgUv5xgNQb9X?=
 =?us-ascii?Q?Zlbd1gHEt1zKZl9B63bRY51fZuFQNGpptbPzJmiOm+P3TSQQSZ0hKSJ5/dE+?=
 =?us-ascii?Q?LrGP6w2wuPj6vX9MYEdaKFOZhhyLSdUm4ErH0o8U4PNmp8IBQa086NPtHXw6?=
 =?us-ascii?Q?kK4qMLn0CnJh09gmOeEjopHg0UN2oaGqfUiOi5zzv6Vz1nEnMpn2asL3x/Hb?=
 =?us-ascii?Q?k1EKJbKv1Ge2sTR6J9afYgQTl/SdmQ4JM3789ZvpLZKaxHEfmeJISMZ1xHG3?=
 =?us-ascii?Q?wGQ3k7OmEXbnZIhUSA4QuY2Yl58GSC7qi8Y2XanvYJgy/DxkBB+2mi7qGEAv?=
 =?us-ascii?Q?Eg++Pc0Gy2Am1vj7XTrXrxlLf+z0hQc/7QRkOLcqBkgCmnBNTLBUvo1cHoSf?=
 =?us-ascii?Q?LuwDS/RFwWVocZQ6O1VeDV1vbEPOLvfKu0Ldypn2HMM7O7GVvjkt5uv8jAm2?=
 =?us-ascii?Q?edNIE0t6MkxqGEx0poJUF8iwv+U2br891Hw+x4dMVgbekSKLUy69bLq0dXa9?=
 =?us-ascii?Q?jkPA502ZyXqELXadZsqEpv6OZFKv31hNOqdN8g3UGXBb5hoP+rwfaY4MKkqz?=
 =?us-ascii?Q?mpbNCjSGag46/SpSPZmftRNeaFm0o4qnQK1J/W7bNQiYnhpDSaYfj9/eu/xk?=
 =?us-ascii?Q?bhQ2FEeXlKdUCqg+YucChs3QwOVhNpiW25XJ1EVUskF/cFtTHyoWF0zltbJ8?=
 =?us-ascii?Q?lg3DpKK2JoKBjvykuKFTNs5gk58p0PCRxR58bcsmqKzNj9YiPrdSk01sV6T4?=
 =?us-ascii?Q?jsZ/2ZOgicTOJqckvRb8InQcQ9177gBWW6taHgD5lkXbUqluEbIAr+LHdJzi?=
 =?us-ascii?Q?7/0eIw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7EB7XgWXv9KtS7fIZwmCNx4AusdaEaD/XjJDkHfE9VlVqNOkIvRB4u4m1RdL3+MZPSblfVz+ipL6viX8XQR88raMVNAJ+px0cNfAHJPM4ZtcFzkMTxXfmsYC2H4p5O6e4g1ntFRWlNYB0zm7t1ny2LWMfkpMPUelqljRZ0fBtc9G9RtqeErCk0/7mrHxd1ZAowbDhOAa2dKXCe5RZO6SsPUoX9oRyo4opuPDfSLdoOtD4pOx8d0+XxLfRrbLKBmptP1/MnXKqNfk8AVbwxgon3yxjy1TUYUMuOAyH682E24RNyVVLaxjzvVT89gqfX/uIJA34djDDrKqP9DGuCZk8vIrI4gFwEd66p/H/V8kZuhMjJr841nKPYElTQkCVVgze8M3jiJMVGB1QOVQeKhAEaScqOkeS8y9XoD7iT9M5gidLRFP/MDuDsmIlh0ft+/K
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:10:38.4599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd9422f-91f5-49af-6069-08de5ff03303
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA09EE1970
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 11:10:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17046

meta-arago / na / 20260130110637.2338476-1-a-dutta

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
WARN - [meta-arago][master][PATCH] meta-arago-distro: recipes-core: udev: R=
emove MCAN rules from meta-arago-distro
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: recipes-core: udev: Remove MCAN rules from meta-arago-distro.
              meta-arago-distro
              recipes-core (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH] meta-arago-distro: recipes-core=
: udev: Remove MCAN rules from meta-arago-distro
- Submitter: From: Anurag Dutta <a-dutta@ti.com>
- Date: Date: Fri, 30 Jan 2026 16:36:37 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c29bdcdf6d49748b6f95a6be20d05be20=
ad310a3

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: shadow-securetty: Remove unneeded recipe
- Commit SHA: ec59a3b33249af3f91b45428a35bca8cd1141fc6

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] meta-arago-distro: recipes-core: udev: R=
emove MCAN rules from meta-arago-distro
    error: patch failed: meta-arago-distro/recipes-core/udev/udev-aragoconf=
_1.bb:6
    error: meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb: patch d=
oes not apply
    Applying: meta-arago-distro: recipes-core: udev: Remove MCAN rules from=
 meta-arago-distro
    Patch failed at 0001 meta-arago-distro: recipes-core: udev: Remove MCAN=
 rules from meta-arago-distro




