Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A397DCA0FED
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.10044.1755127549189465295
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KbjfXBMl;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPmpu2252525;
	Wed, 13 Aug 2025 18:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127548; i=@ti.com;
	bh=9BwCLzryS5zUB5/sgd5fDzNaDHED0UKoHjtm7Bf5GvI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KbjfXBMlRsuAyXTkjumhbBwK0/L4gipzqtOexUTAq1j0xfmVAnB0CqIOJ7GevikFH
	 WciHYGCYCt6aBv499rlXXvjixaidcn3feUgoH+acgcXZz0a7/OKunhk0KjAs4WktLE
	 t4zzCA8bCIdA+Liah9nWzjtsRTduGUksxdCpn4Sc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPm6x727159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:48 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:47 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:47 -0500
Received: from fllvdckhpci098.itg.ti.com (fllvdckhpci098.itg.ti.com [10.64.72.64])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPluB3611050;
	Wed, 13 Aug 2025 18:25:47 -0500
Received: by fllvdckhpci098.itg.ti.com (Postfix, from userid 60899)
	id AE2642C3B; Wed, 13 Aug 2025 18:25:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] ti-tisdk-makefile: adding uboot r5 config variable for j721s2
Date: Wed, 13 Aug 2025 18:25:47 -0500
Message-ID: <20250813232547.1387332-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220124151858.4850-1-reatmon@ti.com>
References: <20220124151858.4850-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16414

meta-arago / na / 20220124151858.4850-1-reatmon

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
- Patch Series: [meta-arago][master/dunfell][PATCH] ti-tisdk-makefile: addi=
ng uboot r5 config variable for j721s2
- Submitter: From: "Ryan Eatmon" <reatmon@ti.com>=0D
From: Nishanth Menon <nm@ti.com>=0D
- Date: Date: Mon, 24 Jan 2022 09:18:58 -0600=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a30809184f88340bfd71adaeaa51918bf=
a2d7d96

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] ti-tisdk-makefile: adding uboot =
r5 config variable for j721s2
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef=
ile_1.0.bb: does not exist in index
    Applying: ti-tisdk-makefile: adding uboot r5 config variable for j721s2
    Patch failed at 0001 ti-tisdk-makefile: adding uboot r5 config variable=
 for j721s2

dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] ti-tisdk-makefile: addi=
ng uboot r5 config variable for j721s2
- Submitter: From: "Ryan Eatmon" <reatmon@ti.com>=0D
From: Nishanth Menon <nm@ti.com>=0D
- Date: Date: Mon, 24 Jan 2022 09:18:58 -0600=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a30809184f88340bfd71adaeaa51918bf=
a2d7d96

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] ti-tisdk-makefile: adding uboot =
r5 config variable for j721s2
    Applying: ti-tisdk-makefile: adding uboot r5 config variable for j721s2
    Patch failed at 0001 ti-tisdk-makefile: adding uboot r5 config variable=
 for j721s2
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/=
ti-tisdk-makefile_1.0.bb:359
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef=
ile_1.0.bb: patch does not apply




