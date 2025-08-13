Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC91CA0FF0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.10046.1755127549287278420
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j8rnJimw;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPmIH2177578;
	Wed, 13 Aug 2025 18:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127548; i=@ti.com;
	bh=k2C82rCYK1vvoka5c7V4KH8HJXp6ZgCongaIB60bTng=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=j8rnJimw5xIpdPdFnp2HJzxhQ499G0N3le7y4vQ+peYZdy21StIjDnZE6fspV+Ahz
	 B9SP4voltGyQrC+zlnVT2r3UILJCVrm0Tu6QPXAXDVlD6gF/zwBvffO8ImLHsTwgmR
	 ydaV4M7qd9C/wCfYQ4e1kR1kcwHot85s1zwNMOSs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPmhV1412334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:48 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:47 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:47 -0500
Received: from fllvdckhpci098.itg.ti.com (fllvdckhpci098.itg.ti.com [10.64.72.64])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPlb73611053;
	Wed, 13 Aug 2025 18:25:47 -0500
Received: by fllvdckhpci098.itg.ti.com (Postfix, from userid 60899)
	id B3CE8143A55; Wed, 13 Aug 2025 18:25:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH v2] ltp-ddt: Bump to 08.02.00.001 release
Date: Wed, 13 Aug 2025 18:25:47 -0500
Message-ID: <20250813232547.1387340-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220207180541.28964-1-reatmon@ti.com>
References: <20220207180541.28964-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16416

meta-arago / na / 20220207180541.28964-1-reatmon

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
- Patch Series: [meta-arago][master/dunfell][PATCH v2] ltp-ddt: Bump to 08.=
02.00.001 release
- Submitter: From: "Ryan Eatmon" <reatmon@ti.com>=0D
- Date: Date: Mon, 7 Feb 2022 12:05:41 -0600=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4984e742061c1923de6b10031889808d0=
167c9b0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH v2] ltp-ddt: Bump to 08.02.00.001=
 release
    error: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb: =
does not exist in index
    Applying: ltp-ddt: Bump to 08.02.00.001 release
    Patch failed at 0001 ltp-ddt: Bump to 08.02.00.001 release

dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH v2] ltp-ddt: Bump to 08.=
02.00.001 release
- Submitter: From: "Ryan Eatmon" <reatmon@ti.com>=0D
- Date: Date: Mon, 7 Feb 2022 12:05:41 -0600=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4984e742061c1923de6b10031889808d0=
167c9b0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH v2] ltp-ddt: Bump to 08.02.00.001=
 release
    Applying: ltp-ddt: Bump to 08.02.00.001 release
    Patch failed at 0001 ltp-ddt: Bump to 08.02.00.001 release
    error: patch failed: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt=
_20210524.bb:14
    error: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb: =
patch does not apply




