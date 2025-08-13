Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A652CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:55 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.10205.1755127553852500909
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=O3sFkoYH;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPqZw1750960;
	Wed, 13 Aug 2025 18:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127552; i=@ti.com;
	bh=6/TPY0PEZBQUOTGUwaEFmAV/W+r1Dvi+t9RzC2sYgCg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O3sFkoYH8QWrdta7EucPmO7yF+80kmEHetcQWGBhejmopa/EdptP9OA4/ONBhbVpW
	 uQ7aBlcCHcBpqVh6Dx7ZR2Bu5azm3bLKvJUYW1zh+oJHhifVHO6cCT9CcDuUD+Jj3Q
	 Q2IbCyDWB8cZFej/Xh0hAZ3fbhzalGhmR4uzBxY4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPqRc1300430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:52 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:52 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:52 -0500
Received: from fllvdckhpci077.itg.ti.com (fllvdckhpci077.itg.ti.com [10.64.72.14])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPqcH3678256;
	Wed, 13 Aug 2025 18:25:52 -0500
Received: by fllvdckhpci077.itg.ti.com (Postfix, from userid 60899)
	id 37DF766D5C; Wed, 13 Aug 2025 18:25:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] branding-bleeding: Add AUTOREV for K3 Image Gen
Date: Wed, 13 Aug 2025 18:25:52 -0500
Message-ID: <20250813232552.3827494-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20211112114519.59963-1-yogeshs@ti.com>
References: <20211112114519.59963-1-yogeshs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16440

meta-arago / na / 20211112114519.59963-1-yogeshs

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
AUTOREV for K3 Image Gen
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Fri, 12 Nov 2021 11:45:19 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5f49b42960fd9d86e08f11e6542db1911=
405d741

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] branding-bleeding: Add AUTOREV f=
or K3 Image Gen
    Applying: branding-bleeding: Add AUTOREV for K3 Image Gen
    Patch failed at 0001 branding-bleeding: Add AUTOREV for K3 Image Gen
    error: patch failed: meta-arago-distro/conf/distro/include/branding-ble=
eding.inc:16
    error: meta-arago-distro/conf/distro/include/branding-bleeding.inc: pat=
ch does not apply

dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] branding-bleeding: Add =
AUTOREV for K3 Image Gen
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Fri, 12 Nov 2021 11:45:19 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5f49b42960fd9d86e08f11e6542db1911=
405d741

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] branding-bleeding: Add AUTOREV f=
or K3 Image Gen
    Applying: branding-bleeding: Add AUTOREV for K3 Image Gen
    Patch failed at 0001 branding-bleeding: Add AUTOREV for K3 Image Gen
    error: patch failed: meta-arago-distro/conf/distro/include/branding-ble=
eding.inc:16
    error: meta-arago-distro/conf/distro/include/branding-bleeding.inc: pat=
ch does not apply




