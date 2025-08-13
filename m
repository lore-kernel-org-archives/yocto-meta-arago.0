Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C20CA0FF1
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10184.1755127546128645377
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LRi0HhAY;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPis82177558;
	Wed, 13 Aug 2025 18:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127544; i=@ti.com;
	bh=tj5lsAlOVJjKo9GySf0o0uXCIwEGA8tNQefV9QnQy4U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LRi0HhAYRThiKyIv+DaTj7A++W+X1mpB5rplq29z+fraHL0f1IxS/OHfeoXgjgTBw
	 MlSqtxvnZdfnfIK6EfeVzDbTHPtle0fuInCobWcaPMXZngVyce7mWga/kKchmky35A
	 zB8TNu8o/36lt+eGRGjU2rfq4We5ckJxrFyE2jis=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPiol1300282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:44 -0500
Received: from fllvdckhpci027.itg.ti.com (fllvdckhpci027.itg.ti.com [10.64.72.35])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPigF3016367;
	Wed, 13 Aug 2025 18:25:44 -0500
Received: by fllvdckhpci027.itg.ti.com (Postfix, from userid 60899)
	id E5BB11B5511; Wed, 13 Aug 2025 18:25:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <devarsht@ti.com>, <nikhil.nd@ti.com>
Subject: Re: [meta-arago][tisdk-setup-scripts][master][PATCH] create-sdcard: Modify condition to check for boot images
Date: Wed, 13 Aug 2025 18:25:43 -0500
Message-ID: <20250813232543.1787194-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220225103851.7294-1-a-m1@ti.com>
References: <20220225103851.7294-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16406

meta-arago / na / 20220225103851.7294-1-a-m1

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
FAIL - [meta-arago][tisdk-setup-scripts][master][PATCH] create-sdcard: Modi=
fy condition to check for boot images
    ERROR: Invalid branch specifier: "tisdk-setup-scripts". (META-3)
        patch:37
            Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] creat=
e-sdcard: Modify condition to check for boot images=0D
=20=20=20=20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch




