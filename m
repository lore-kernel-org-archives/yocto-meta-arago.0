Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE81ACA0EF2
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10026.1755127540979912772
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dgzeKcUJ;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPe9a1750848
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127540; i=@ti.com;
	bh=HjJgPtx/dIT6o/+GOZlAcAyrO/lU+LqIt50wFD8JzXs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dgzeKcUJWdemaitsti1uXQRmpVLjzBTrVBSO8pQirdPx2Vi2xx8TWrPNwERUTwg/p
	 zGagg48NXisewAKna20LhRg10pr3j20guo49mbQ4k2ouQoUUi1Dyavp02G4HvLMlBH
	 ziMu6W+oK1nMOVVrNWIZAS2h2ayTs1sY7ER4fyzY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPeSE727120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:40 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:40 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:40 -0500
Received: from fllvdckhpci089.itg.ti.com (fllvdckhpci089.itg.ti.com [10.64.72.40])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPeWO3610996;
	Wed, 13 Aug 2025 18:25:40 -0500
Received: by fllvdckhpci089.itg.ti.com (Postfix, from userid 60899)
	id EAD229B; Wed, 13 Aug 2025 18:25:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <nikhil.nd@ti.com>,
        <nsekhar@ti.com>
Subject: Re: [meta-arago][tisdk-setup-scripts][master][PATCH] setup-tftp-fit: Add support for HS EVMs
Date: Wed, 13 Aug 2025 18:25:39 -0500
Message-ID: <20250813232539.4162277-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220216083503.16632-1-a-m1@ti.com>
References: <20220216083503.16632-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16380

meta-arago / na / 20220216083503.16632-1-a-m1

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
FAIL - [meta-arago][tisdk-setup-scripts][master][PATCH] setup-tftp-fit: Add=
 support for HS EVMs
    ERROR: Invalid branch specifier: "tisdk-setup-scripts". (META-3)
        patch:36
            Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] setup=
-tftp-fit: Add support for HS EVMs=0D
=20=20=20=20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch




