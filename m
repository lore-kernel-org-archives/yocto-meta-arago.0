Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E758BCA0FEF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.10051.1755127551518858801
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=u7MA7TUl;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPo0F2177586;
	Wed, 13 Aug 2025 18:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127550; i=@ti.com;
	bh=dourhN/+s8+ZTeDbUitsqUDbvd5XllyourCQy3mHGPk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=u7MA7TUlzwo3xY8ujVJEFEknTNY6LwpTAu4JxVhWWqGX81tYfNHU2DcpDKvH0kjG6
	 qFDI82IgA9wBvNwzfz5bYAJJ7uTFnR/f9hsm5f0d8CuMV3HJJN04isgb4ms9JHLHMp
	 to6sikr/tPLlchfXca8cCRmNGMspyI7LKmVGSeK8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPos91300415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:50 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:50 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:50 -0500
Received: from fllvdckhpci094.itg.ti.com (fllvdckhpci094.itg.ti.com [10.64.72.50])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPoFD3611074;
	Wed, 13 Aug 2025 18:25:50 -0500
Received: by fllvdckhpci094.itg.ti.com (Postfix, from userid 60899)
	id E914D4E68; Wed, 13 Aug 2025 18:25:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH] ltp-ddt: Bump ltp-ddt version for 08.01.00.002
Date: Wed, 13 Aug 2025 18:25:49 -0500
Message-ID: <20250813232549.3026024-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20211101211139.32542-1-yogeshs@ti.com>
References: <20211101211139.32542-1-yogeshs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16424

meta-arago / na / 20211101211139.32542-1-yogeshs

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
- Patch Series: [meta-arago][dunfell][PATCH] ltp-ddt: Bump ltp-ddt version =
for 08.01.00.002
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Mon, 1 Nov 2021 21:11:39 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c915babbb6f8cab3f664b6be7887c4817=
475cfb2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] ltp-ddt: Bump ltp-ddt version for 08.01=
.00.002
    Applying: ltp-ddt: Bump ltp-ddt version for 08.01.00.002
    Patch failed at 0001 ltp-ddt: Bump ltp-ddt version for 08.01.00.002
    error: patch failed: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt=
_20210524.bb:11
    error: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb: =
patch does not apply




