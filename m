Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640F9CA0FE5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10038.1755127544776115687
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PYiD1g6r;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPgEJ1803009;
	Wed, 13 Aug 2025 18:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127542; i=@ti.com;
	bh=mEiE8WGrf8tbhRs6I4w2F4KZRDq/Ako5tR6InoocuJs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PYiD1g6r7NqE0d5cICMCLwekV2GXYKZrmbLe7MdF1qrGwh9EggLAQPxxvfLR8bsvM
	 cFRRfTX0SrjutP/qJfzjsJV4U1JD1Ih9q0kro7FDzLtScrwIfjh7csgeJ1SPddc3MX
	 DX5IbZihk8MfJwNkRwq493C8bUB2xXB4R/51vHK0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPg151300258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:42 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:41 -0500
Received: from fllvdckhpci001.itg.ti.com (fllvdckhpci001.itg.ti.com [10.64.72.15])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPfhv3016336;
	Wed, 13 Aug 2025 18:25:41 -0500
Received: by fllvdckhpci001.itg.ti.com (Postfix, from userid 60899)
	id 9822C39DDC; Wed, 13 Aug 2025 18:25:41 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Sinthu Raja <sinthu.raja@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denis@denix.org>,
        Minas Hambardzumyan <minas@ti.com>
Subject: Re: [meta-arago][dunfell/master][PATCH V2] ltp-ddt: Update to latest srcrev for 08.01.00.001
Date: Wed, 13 Aug 2025 18:25:41 -0500
Message-ID: <20250813232541.3527401-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20211025070346.5934-1-sinthu.raja@ti.com>
References: <20211025070346.5934-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16400

meta-arago / na / 20211025070346.5934-1-sinthu.raja

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
- Patch Series: [meta-arago][dunfell/master][PATCH V2] ltp-ddt: Update to l=
atest srcrev for 08.01.00.001
- Submitter: From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>=0D
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>=0D
From: Sinthu Raja <sinthu.raja@ti.com>=0D
- Date: Date: Mon, 25 Oct 2021 12:33:46 +0530=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7e5303ae3aa67d5f5b2e341b65f2011d8=
889a112

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell/master][PATCH V2] ltp-ddt: Update to latest src=
rev for 08.01.00.001
    error: patch failed: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt=
_20210524.bb:11
    error: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb: =
patch does not apply
    Applying: ltp-ddt: Update to latest srcrev for 08.01.00.001
    Patch failed at 0001 ltp-ddt: Update to latest srcrev for 08.01.00.001

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][dunfell/master][PATCH V2] ltp-ddt: Update to l=
atest srcrev for 08.01.00.001
- Submitter: From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>=0D
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>=0D
From: Sinthu Raja <sinthu.raja@ti.com>=0D
- Date: Date: Mon, 25 Oct 2021 12:33:46 +0530=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7e5303ae3aa67d5f5b2e341b65f2011d8=
889a112

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][dunfell/master][PATCH V2] ltp-ddt: Update to latest src=
rev for 08.01.00.001
    error: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb: =
does not exist in index
    Applying: ltp-ddt: Update to latest srcrev for 08.01.00.001
    Patch failed at 0001 ltp-ddt: Update to latest srcrev for 08.01.00.001




