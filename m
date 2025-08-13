Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E209CA0FE8
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10056.1755127553523847811
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jwWBTqXC;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPqN41750956;
	Wed, 13 Aug 2025 18:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127552; i=@ti.com;
	bh=ZJzs4dn1jtBQge03sgfn9ZG5Snh5o6gnZCvQ+3agDTA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jwWBTqXCsx1eey+8xXc0L/rrxkUBWQverqcFkPQsyOHp2S5ZIkmLwn6cdKQ+c7kWB
	 7of66sLTDjnQtYJEIDf4Axs7FrWH33zkw0bvx/POFYU4BpfaOfXZTwk9Vtlfe7vmxh
	 vBjUBmRVfB6DvB5xK4zLIr6KdDgn8wzv8eXdYhCI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPqp91412365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:51 -0500
Received: from fllvdckhpci094.itg.ti.com (fllvdckhpci094.itg.ti.com [10.64.72.50])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPpio2710328;
	Wed, 13 Aug 2025 18:25:51 -0500
Received: by fllvdckhpci094.itg.ti.com (Postfix, from userid 60899)
	id B2E7E417D; Wed, 13 Aug 2025 18:25:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] packagegroups: pru-icss: Add support for am64xx
Date: Wed, 13 Aug 2025 18:25:51 -0500
Message-ID: <20250813232551.3030036-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20211029050616.12440-1-yogeshs@ti.com>
References: <20211029050616.12440-1-yogeshs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16436

meta-arago / na / 20211029050616.12440-1-yogeshs

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
- Patch Series: [meta-arago][master/dunfell][PATCH] packagegroups: pru-icss=
: Add support for am64xx
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Fri, 29 Oct 2021 05:06:16 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 91481ecf4d68e79cc7c4b2a5098effb0b=
5d29b40

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] packagegroups: pru-icss: Add sup=
port for am64xx
    Applying: packagegroups: pru-icss: Add support for am64xx
    Patch failed at 0001 packagegroups: pru-icss: Add support for am64xx
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
tisdk-addons-sdk-host.bb: does not exist in index
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-tisdk-addons.bb:1
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
tisdk-addons.bb: patch does not apply
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef=
ile_1.0.bb: does not exist in index

dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] packagegroups: pru-icss=
: Add support for am64xx
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Fri, 29 Oct 2021 05:06:16 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 91481ecf4d68e79cc7c4b2a5098effb0b=
5d29b40

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] packagegroups: pru-icss: Add sup=
port for am64xx
    Applying: packagegroups: pru-icss: Add support for am64xx
    Patch failed at 0001 packagegroups: pru-icss: Add support for am64xx
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-tisdk-addons-sdk-host.bb:1
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
tisdk-addons-sdk-host.bb: patch does not apply
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-tisdk-addons.bb:1
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
tisdk-addons.bb: patch does not apply
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/=
ti-tisdk-makefile_1.0.bb:56
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef=
ile_1.0.bb: patch does not apply




