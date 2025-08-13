Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53B9CA0EEA
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.10035.1755127543354687082
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lDDFlyM8;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPgkO2177546;
	Wed, 13 Aug 2025 18:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127542; i=@ti.com;
	bh=gihz4ueRqe6AfOAW8ubZqFywLjG96b49dR31MooTW7g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lDDFlyM8/S5iUXdZSlBVMUkz+Pt+DLWrdP7y3UOhF6PJ5sNICzluw9BznpogOSxbl
	 zno1nkuJJjnTtSdUC5gG0OfUT6vVz6HHCbJLaVYS1FiKzxjbok8zec0PiEamNMMTaX
	 dEKVOTsHQM8/A4w6ypObIHq+TUgUzyPQ6YQOw208=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPg2w1412309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:41 -0500
Received: from fllvdckhpci092.itg.ti.com (fllvdckhpci092.itg.ti.com [10.64.72.46])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPfmJ3016342;
	Wed, 13 Aug 2025 18:25:41 -0500
Received: by fllvdckhpci092.itg.ti.com (Postfix, from userid 60899)
	id E282A9E4EE; Wed, 13 Aug 2025 18:25:41 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] branding-bleeding: Add AUTOREV support for ti-linux-fw
Date: Wed, 13 Aug 2025 18:25:41 -0500
Message-ID: <20250813232541.2838705-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20211019144931.48650-1-yogeshs@ti.com>
References: <20211019144931.48650-1-yogeshs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16394

meta-arago / na / 20211019144931.48650-1-yogeshs

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
- Patch Series: [meta-arago][master/dunfell][PATCH] branding-bleeding: Add =
AUTOREV support for ti-linux-fw
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Tue, 19 Oct 2021 14:49:31 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 949c565a2dc735a9e90c1924d25789de4=
21ec683

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] branding-bleeding: Add AUTOREV s=
upport for ti-linux-fw
    error: patch failed: meta-arago-distro/conf/distro/include/branding-ble=
eding.inc:13
    error: meta-arago-distro/conf/distro/include/branding-bleeding.inc: pat=
ch does not apply
    Applying: branding-bleeding: Add AUTOREV support for ti-linux-fw
    Patch failed at 0001 branding-bleeding: Add AUTOREV support for ti-linu=
x-fw

dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] branding-bleeding: Add =
AUTOREV support for ti-linux-fw
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Tue, 19 Oct 2021 14:49:31 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 949c565a2dc735a9e90c1924d25789de4=
21ec683

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] branding-bleeding: Add AUTOREV s=
upport for ti-linux-fw
    error: patch failed: meta-arago-distro/conf/distro/include/branding-ble=
eding.inc:13
    error: meta-arago-distro/conf/distro/include/branding-bleeding.inc: pat=
ch does not apply
    Applying: branding-bleeding: Add AUTOREV support for ti-linux-fw
    Patch failed at 0001 branding-bleeding: Add AUTOREV support for ti-linu=
x-fw




