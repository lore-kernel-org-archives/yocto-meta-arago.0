Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB83CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 18:56:07 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3262.1781031366968264949
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 11:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Qz7jGFee;
 spf=pass (domain: list.ti.com, ip: 40.93.201.30, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm7ObCk+2cb3L1s6aZQrLgzqf/oG/xqhdVz7n6T/4oY1RidVAgLx+sL+Ke5PUOtVpzjBiql/p2S/PqVj5fJtyFBJ4JzuWgbTZwGcvX8uBOXiluWXfttgzoAAI8jmbdTp37vGGoR5+hr0MmNgGpRSWZjYsdmZo+jQKxZoEoWAN+69kh5GBxd4tFOfCu1HvaNfSFbBVHX6rKbmwE7fqdLWPjBz5AKtsWrGNizHCsKJLLu/aioR28nrDaL+COALlG7LmsbW6wDKkzRlNx+05vLMnejPrtnYCVSolM+HGxTsR0PKimSWfcuvMyA29qK88jP29M8RHabssStn3UlfNqu2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXQKyxsRFJTgz1gzcWDLu3+7X2PpM5rAWcHrDHro4gw=;
 b=CTK7CJLaZuAAQvsDHV4feiPYChmcq+DsBtJ+EjAp+UsXybXb7T1qNszS/b+orIFRTIN/LAkxscea8blDgE2iG0jqaXYfZkmXoKHfP1k0ccrBUr/kbjup5rV6WLgiIEL1F43H55S5GTskVElU/3vmNsUSqOGmEfh+haw6dSUdqj1DCS5S47TeVPBWNB9A6JFeEQNSyZJC+WZ/cItN5shkjkwHn9WOUcmipDPF1IWAzs/jaQRfHq3J8t7oCLxgqSu96blXlZmu7VugXIEE2idcC3nBYR2/N7gmGwTuuSRZqJGE/gM1a7SPrn7s0Q9UzmZ61jycznWNr1ng9C38xXApwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXQKyxsRFJTgz1gzcWDLu3+7X2PpM5rAWcHrDHro4gw=;
 b=Qz7jGFeez1WRoWXCdz8FEKRP4o1fcwxHYnXV4xeV4h1WD/4KEYDmMTNy7xm/bFJOcDtS5AU+6IADvOKuTPbRPoCHXyJGvgK2K4h6QsKSdYqS1W1MOXFETdXQB2sBJ5apfVy83MN45oEl84UtlDCZt4Xh0ygtq6J801BrYF2mH/2NlNlph3IM71vG6EzspChWhAW7Ap0gr7HFvPmBaLjXPkYTVTjGYTaLdvUcDLNDVozZXKhrsNAkv6QrfhFA3okzMCXOoXRMny/hS1P2jTxobBTqtZY0d9cdaalmO4bcRBnGHpLGgR+Vakp9Bfx8V68Txu5LPN1daDNYk7qvQ1KC2A==
Received: from BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::9)
 by PH0PR10MB997619.namprd10.prod.outlook.com (2603:10b6:510:380::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 18:56:05 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::8d) by BY1P220CA0024.outlook.office365.com
 (2603:10b6:a03:5c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 18:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 18:56:04 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 13:56:04 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 13:56:03 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 13:56:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659Iu3Js1830833;
	Tue, 9 Jun 2026 13:56:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C0A199ACF4; Tue,  9 Jun 2026 13:56:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [wrynose][PATCH] README: update and clean up
Date: Tue, 9 Jun 2026 13:56:03 -0500
Message-ID: <20260609185603.2960380-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260609185230.2659682-1-denis@denix.org>
References: <20260609185230.2659682-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|PH0PR10MB997619:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c67575f-8767-4306-d821-08dec658c1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	fCPXVBfzqoEcUOeSmlxE5qmoZFzQRcZQp8/hM/SRl+ItPmaJy5ACo3DtKbxa/vjhB57AKhtlabifoqHZUFLDZ0y8YdJ4f5+firjsLR97ZaXtOloV/SLsaWbJTUofLlBn9jbpwaGgt2Dni1Y/JleUWWaI4GUYe1UAz10qsrZ1WnOnk56BX57vMZg4Jvs7za7v2MIOFRIesr6FgysiEvUAT7xIzVCFyCaabu/Qv5jhH8v49/glNR0ZKggFj7JWoY45+clISf3GCX+LE+N1CIHROtws6VHaGBNCfmiNKneQsOQmYJiadXC4zx2lQLu7933DOI/0dvHdt03nvoB8CH+P3FCrRlzonsxphrTkYkeuwXx54XW5gO+MFSx/Pt2nc4dUT60sMGAqUhEWO2L7dCnOSFSAIubo/LFO9RssdqPKqfYwznD+8Qh9k4iaTnCbZWtHszTGmg8dLJ00IWY7BRTcrFvSWIudVwTnufVWYsZwISO2/W7ilBSXEmOjfZYgaH2gyGTda+6em2lKMdBEpCfZ5IKHnKAjAsqSfGyqFVb/e8C+aaslfwaSFlWWwZQqFDuSTAuW6+3BZmm+R1A6+58EWthKLY0IjQ//BiJJaTSJIh+4tAxXpVkGyqD2YkGEE24DB6wPNufnfRIZ3SOGijB8V2YieO7gwcspDgSxlDDfjXj7pO3QfF1qkH4dKvfDshgWrJlL92mKkVURq63Xsxny52sowZyNpqupaPC/KKPb/Cs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mys0WTI/Pr/VCCd+fHowf8DvH30O9/yISzGurg9EP2fTIeOC78cJZrY4j5mApx/vbyyhDmPuvlB5xLVGhGBUmfYa5ACt65mB50iZufJGabzGSINxgAk3ZTxY119OZfHOCk4xp4btYClJPnnf+iv+9O8tUX7vGEo9sMIf/p+MDy8Se7CbhjQBKqLsP3TIOlaB4NInh/0RMYudMPoLAIsyVpV7kzMJltp8a6G4fNNpep96Do+/7iGfeNmmaoBDQ06PZ/OBHbX3ObQqOieLpptedUv+gOH+bSlSBYhcGBkGFfO19n06elTO27eOfzTVp7lIWHe6ybxMeyNNTbGo7qi4l43Ay5WqUm9IcXf4hDjIRdaUNfWXsbNT+Yj8KJ+ctuZx3coRua7i6XudfWPh0cSdx1VOlZI5F3DrPNa4TrqvHsMOPoj0TFgsuJxkCQJ7YYdc
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 18:56:04.5686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c67575f-8767-4306-d821-08dec658c1fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997619
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 18:56:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17566

meta-arago / na / 20260609185230.2659682-1-denis

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [wrynose][PATCH] README: update and clean up
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
wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [wrynose][PATCH] README: update and clean up
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue,  9 Jun 2026 14:52:30 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ceb661bf8de91c1b76cd1eec0800d8deb=
20b7ded

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago-distro: chromium: add force-h264-youtube exten=
sion
- Commit SHA: 829367ab4c8b3ba2f30935f0e57889c57afebb5f

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
wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




