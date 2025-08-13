Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8FACA0EE4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:26:07 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10220.1755127558424659788
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W5VagQjK;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPwC42177638
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127558; i=@ti.com;
	bh=8O5ex58MXBYcFsJ+QpOmMtU6foGPNLKHVpw1d3/eXN4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=W5VagQjK59/1IiBIgBENZlXRT+0sLD5VFNMqCgVvt7qXWlzw7OaKyf5/5flHeZ+Dj
	 ct++0wZPjYIqnyXq0+KlGhEXmuX7sPNZ5BffWmB9t7Xg2NwGBsg9F80iq84/SYiGem
	 IRIerk3fXpWGQz1P8XhaRQnM0C7iPSYIaTin5VLQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPvPJ727226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:58 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:57 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:57 -0500
Received: from fllvdckhpci019.itg.ti.com (fllvdckhpci019.itg.ti.com [10.64.72.31])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPv4X3678322;
	Wed, 13 Aug 2025 18:25:57 -0500
Received: by fllvdckhpci019.itg.ti.com (Postfix, from userid 60899)
	id 797FF1F391A; Wed, 13 Aug 2025 18:25:57 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <nikhil.nd@ti.com>,
        <nsekhar@ti.com>
Subject: Re: [meta-arago][tisdk-setup-scripts][master][PATCH v3 0/4] setup-uboot-env: Add u-boot env setup for HS devices
Date: Wed, 13 Aug 2025 18:25:57 -0500
Message-ID: <20250813232557.3036763-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220216110401.9082-1-a-m1@ti.com>
References: <20220216110401.9082-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:26:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16467

meta-arago / na / 20220216110401.9082-1-a-m1

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-arago][tisdk-setup-scripts][master][PATCH v3 1/4] setup-uboot-=
env-am43x-hs: Add u-boot env setup support for am43x-hs
    ERROR: Invalid branch specifier: "tisdk-setup-scripts". (META-3)
        patch:36
            Subject: [meta-arago][tisdk-setup-scripts][master][PATCH v3 1/4=
] setup-uboot-env-am43x-hs: Add u-boot env setup support for am43x-hs=0D
=20=20=20=20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
=20=20=20=20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch




