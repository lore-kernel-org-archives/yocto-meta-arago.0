Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05641CA0EF6
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10173.1755127541026078178
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fldRPF5R;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPeIE2177542
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127540; i=@ti.com;
	bh=vR5bW5/5kInvx7/TgKTZx06oCA9k45hLf7JsP3oKbgg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fldRPF5RrEMQDRh3tBHbc0zY68dmPvpFM6GDqUfLtPObOVsTndF2xeT6N8eK4JSlD
	 2eGLmSEH2kLRoPmce6UEB3cg2Pz6IZ63/r1cb7/qddty3PvohHRC5P8oLIvf2mfE8/
	 fe+M4aGbkxCCMiadhQplmUVNuGwguoWcrGM3+Woo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPeSG727120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:40 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:40 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:40 -0500
Received: from fllvdckhpci089.itg.ti.com (fllvdckhpci089.itg.ti.com [10.64.72.40])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPe9X3678162;
	Wed, 13 Aug 2025 18:25:40 -0500
Received: by fllvdckhpci089.itg.ti.com (Postfix, from userid 60899)
	id 05DB69A; Wed, 13 Aug 2025 18:25:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <nikhil.nd@ti.com>,
        <nsekhar@ti.com>
Subject: Re: [meta-arago][tisdk-setup-scripts][master][PATCH v2 0/4] setup-uboot-env: Add u-boot env setup for HS devices
Date: Wed, 13 Aug 2025 18:25:40 -0500
Message-ID: <20250813232540.4162583-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220216105301.13863-1-a-m1@ti.com>
References: <20220216105301.13863-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16382

meta-arago / na / 20220216105301.13863-1-a-m1

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
FAIL - [meta-arago][tisdk-setup-scripts][master][PATCH v2 1/4] setup-uboot-=
env-am335x-hs: Add u-boot env setup support for am335x-hs
    ERROR: Invalid branch specifier: "tisdk-setup-scripts". (META-3)
        patch:36
            Subject: [meta-arago][tisdk-setup-scripts][master][PATCH v2 1/4=
] setup-uboot-env-am335x-hs: Add u-boot env setup support for am335x-hs=0D
=20=20=20=20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
=20=20=20=20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch




