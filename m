Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2C4CA1007
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.10214.1755127557411082836
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hLAkAmVm;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPuAi2252545;
	Wed, 13 Aug 2025 18:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127556; i=@ti.com;
	bh=r7tf1/BIUSyuVmaSQStqK5URkeuZASvuYgRGN2mGpAg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hLAkAmVmoXUa7VEHPksc8QjHxkbH9LDJyP6DYeNHYCUUH6RIA7Hby3o3C9JYYKgXZ
	 t4970eIp70g5VGXdLD9ur3DM0z6QMA4sfILhrUzrVTzagRe7ueAyv/AWx9A0yzSNXf
	 wgEofVjZHok9ilTjMNs4Feb3M4ARif+k2CedG8iA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPuTv727216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:56 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:56 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:56 -0500
Received: from fllvdckhpci086.itg.ti.com (fllvdckhpci086.itg.ti.com [10.64.72.34])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPu0o3611139;
	Wed, 13 Aug 2025 18:25:56 -0500
Received: by fllvdckhpci086.itg.ti.com (Postfix, from userid 60899)
	id 2F98DC517; Wed, 13 Aug 2025 18:25:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] qtwayland: Bump version to v5.15.7-lts-lgpl
Date: Wed, 13 Aug 2025 18:25:56 -0500
Message-ID: <20250813232556.1591035-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20221130221723.9018-1-reatmon@ti.com>
References: <20221130221723.9018-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16459

meta-arago / na / 20221130221723.9018-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] qtwayland: Bump version to v5.15.7-lts-lgpl
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 30 Nov 2022 16:17:23 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b1550315ef6b677a5c69da9e463ac1c081e0303f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] qtwayland: Bump version to v5.15.7-lts-lgpl
    Applying: qtwayland: Bump version to v5.15.7-lts-lgpl
    Patch failed at 0001 qtwayland: Bump version to v5.15.7-lts-lgpl
    error: meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend: does not exist in index




