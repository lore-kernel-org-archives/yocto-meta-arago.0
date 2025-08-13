Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EE2CA0EFA
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10174.1755127541132518503
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KQX/nU4K;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPe0u1802997
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127540; i=@ti.com;
	bh=ElID4yl4R7mIH/dzH6Z/zDMWSqOx+4FJ6iLJ1i3jXvM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KQX/nU4KY0yd6zfE3ndRmj1FRkBlQ0WfXjGGQBhZ/GSrSEqdrJRhlqRTBUILltSvS
	 eX/ZXhW2ci2xoBoLWuecLEKveUeW1dbQ7lbvGiOiLMLBrSD5KGZIjq3NaK0An2xSOR
	 xT+Jhb/METHWohjk2AaZ00N9rJFUDArNuW/jxcM4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPeAl1300250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:39 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:40 -0500
Received: from fllvdckhpci089.itg.ti.com (fllvdckhpci089.itg.ti.com [10.64.72.40])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPehf3678159;
	Wed, 13 Aug 2025 18:25:40 -0500
Received: by fllvdckhpci089.itg.ti.com (Postfix, from userid 60899)
	id ED97714354B; Wed, 13 Aug 2025 18:25:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <nikhil.nd@ti.com>,
        <nsekhar@ti.com>
Subject: Re: [meta-arago][tisdk-setup-scripts][master][PATCH 0/4] setup-uboot-env: Add u-boot env setup for HS devices
Date: Wed, 13 Aug 2025 18:25:39 -0500
Message-ID: <20250813232539.4162327-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220216093414.5085-1-a-m1@ti.com>
References: <20220216093414.5085-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16384

meta-arago / na / 20220216093414.5085-1-a-m1

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
FAIL - [meta-arago][tisdk-setup-scripts][master][PATCH 1/4] setup-uboot-env=
-am43x-hs: Add u-boot env setup support for am43x-hs
    ERROR: Invalid branch specifier: "tisdk-setup-scripts". (META-3)
        patch:36
            Subject: [meta-arago][tisdk-setup-scripts][master][PATCH 1/4] s=
etup-uboot-env-am43x-hs: Add u-boot env setup support for am43x-hs=0D
=20=20=20=20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch




