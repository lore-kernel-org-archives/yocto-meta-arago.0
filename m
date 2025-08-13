Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582DDCA0FE4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10181.1755127544669173259
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TIIaBAhG;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPgTa2177550;
	Wed, 13 Aug 2025 18:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127542; i=@ti.com;
	bh=3uiNze/81BwrnXit1+SBmehc1iqkhB4m+TG6t/9fH2Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TIIaBAhGRYNAS80DhtS69ZcHUPkU2brVobBVqt5h9JaV2SR4vSrf+ymfGpFMI0/QR
	 J7Xg+NoCcFYRdvNxVgffZ97fvzdU888F5Pk9QgfbGgptqgdrANBy++95OxIoVyNobH
	 nVBhl9iS2hJVzb44BXBli0Y6Z9Ryas1/oTE4ATow=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPgNe403372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:42 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:41 -0500
Received: from fllvdckhpci092.itg.ti.com (fllvdckhpci092.itg.ti.com [10.64.72.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPfDC2710115;
	Wed, 13 Aug 2025 18:25:41 -0500
Received: by fllvdckhpci092.itg.ti.com (Postfix, from userid 60899)
	id D882A9E4CA; Wed, 13 Aug 2025 18:25:41 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Sinthu Raja <sinthu.raja@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denis@denix.org>
Subject: Re: [meta-arago][dunfell/master][PATCH V4 0/2] Package intel 9260 WiFi and BT firmware
Date: Wed, 13 Aug 2025 18:25:41 -0500
Message-ID: <20250813232541.2838624-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20211021131559.16817-1-sinthu.raja@ti.com>
References: <20211021131559.16817-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16399

meta-arago / na / 20211021131559.16817-1-sinthu.raja

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
dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][dunfell/master][PATCH V4 0/2] Package intel 92=
60 WiFi and BT firmware
- Submitter: From: Sinthu Raja <sinthu.raja@mistralsolutions.com>=0D
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>=0D
From: Sinthu Raja <sinthu.raja@ti.com>=0D
- Date: Date: Thu, 21 Oct 2021 18:45:57 +0530=0D
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 14cf8ecd21b3dfea09af7fe95755b0237=
38c4ec0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell/master][PATCH V4 1/2] linux-firmware: Package i=
ntel 9260 WiFi and BT firmware
    error: patch failed: meta-arago-distro/recipes-kernel/linux-firmware/li=
nux-firmware_%.bbappend:1
    error: meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%=
.bbappend: patch does not apply
    Applying: linux-firmware: Package intel 9260 WiFi and BT firmware
    Patch failed at 0001 linux-firmware: Package intel 9260 WiFi and BT fir=
mware

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][dunfell/master][PATCH V4 0/2] Package intel 92=
60 WiFi and BT firmware
- Submitter: From: Sinthu Raja <sinthu.raja@mistralsolutions.com>=0D
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>=0D
From: Sinthu Raja <sinthu.raja@ti.com>=0D
- Date: Date: Thu, 21 Oct 2021 18:45:57 +0530=0D
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 14cf8ecd21b3dfea09af7fe95755b0237=
38c4ec0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][dunfell/master][PATCH V4 1/2] linux-firmware: Package i=
ntel 9260 WiFi and BT firmware
    error: patch failed: meta-arago-distro/recipes-kernel/linux-firmware/li=
nux-firmware_%.bbappend:1
    error: meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%=
.bbappend: patch does not apply
    Applying: linux-firmware: Package intel 9260 WiFi and BT firmware
    Patch failed at 0001 linux-firmware: Package intel 9260 WiFi and BT fir=
mware




