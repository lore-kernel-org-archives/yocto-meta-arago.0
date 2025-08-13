Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE908CA0EF4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.10027.1755127540980868857
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eaKhdGvx;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPeRC2177538
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127540; i=@ti.com;
	bh=uZtluq8UMUnvMYSBXCjaHaVXKhAEsnxJOs3e2Iuvf0g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eaKhdGvxxtMtO4kMQfiQRO3npDjLV3nPwMl7ZsJScKzpy0gFoQnHeDOm2oz8SwsSn
	 KymRxsHf4ZgIiodGPSYldlRbT/ykcpdie9/8I+bNNVf7MbIggE0bhu33ezf8BfZCkj
	 DZf1Gm2+sylhfFdgdinKX1jvMqcfQifdOLN/pU/Y=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPe4P727119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:40 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:40 -0500
Received: from fllvdckhpci098.itg.ti.com (fllvdckhpci098.itg.ti.com [10.64.72.64])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPeD82710087;
	Wed, 13 Aug 2025 18:25:40 -0500
Received: by fllvdckhpci098.itg.ti.com (Postfix, from userid 60899)
	id 192E018540F; Wed, 13 Aug 2025 18:25:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <yogeshs@ti.com>, <praneeth@ti.com>,
        <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: Re: [meta-arago][tisdk-setup-scripts][master][PATCH] setup-targetfs-nfs: Modify script to search for tisdk-default-image
Date: Wed, 13 Aug 2025 18:25:40 -0500
Message-ID: <20250813232540.1375202-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220216073539.25993-1-a-m1@ti.com>
References: <20220216073539.25993-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16381

meta-arago / na / 20220216073539.25993-1-a-m1

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
FAIL - [meta-arago][tisdk-setup-scripts][master][PATCH] setup-targetfs-nfs:=
 Modify script to search for tisdk-default-image
    ERROR: Invalid branch specifier: "tisdk-setup-scripts". (META-3)
        patch:36
            Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] setup=
-targetfs-nfs: Modify script to search for tisdk-default-image=0D
=20=20=20=20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch




