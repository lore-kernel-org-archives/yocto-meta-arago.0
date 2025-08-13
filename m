Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D359CA0EF8
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10177.1755127541542610168
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GXHkt4i8;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPenh1803003;
	Wed, 13 Aug 2025 18:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127540; i=@ti.com;
	bh=HUIjF5dJbO0pFyokXeCpgm3gg0grK5JFY1AyahyKkyQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GXHkt4i8zFYjQeUJw21Ufk89riv/O0MdshJObqwq4eAy/5WZLOc1AmO+RYUu9c0L6
	 JGXM7OMKSF4B3Mb//RhVv1ld9hA9zbR/FdKw2Hwy4ZHDFmbpmjOCV5mBYFjVtq+sgp
	 yCpQpp+gjzC5a75PM+2XysXeGkbpvtkIFSzoO51I=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPeAo1300250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:40 -0500
Received: from fllvdckhpci092.itg.ti.com (fllvdckhpci092.itg.ti.com [10.64.72.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPe5M2710090;
	Wed, 13 Aug 2025 18:25:40 -0500
Received: by fllvdckhpci092.itg.ti.com (Postfix, from userid 60899)
	id 35F059E4EE; Wed, 13 Aug 2025 18:25:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH] arago.conf: bump distro version
Date: Wed, 13 Aug 2025 18:25:40 -0500
Message-ID: <20250813232540.2835126-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20211021071535.37698-1-yogeshs@ti.com>
References: <20211021071535.37698-1-yogeshs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16390

meta-arago / na / 20211021071535.37698-1-yogeshs

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
- Patch Series: [meta-arago][dunfell][PATCH] arago.conf: bump distro version
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Thu, 21 Oct 2021 07:15:35 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bc00ddfd45b257c97395f885bfa9b8c78=
b0eac9a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] arago.conf: bump distro version
    error: patch failed: meta-arago-distro/conf/distro/arago.conf:1
    error: meta-arago-distro/conf/distro/arago.conf: patch does not apply
    Applying: arago.conf: bump distro version
    Patch failed at 0001 arago.conf: bump distro version




