Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B51CC36009
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:20:44 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2146.1742494842933591559
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pNLiveLW;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKgi8686028
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494842;
	bh=FAlE9SpawRonpuS29bV1OonueWCLZB8JqfU0/n/KSto=;
	h=From:To:Subject:Date;
	b=pNLiveLWHv7hUEJkpwTIHuUvKGkksihW0tkn1jMNZoIa2SLblA6Pq6YgWVBEaTdVy
	 TkJQEcprlAjFFDHlGu8KWGKBvnKma2zsxN1TazPtCcFZBhX93Z437cn7qumziDThfC
	 /QscISnO9PLG+zEMxYCcs/a1pOfcv5buQgtXqYkc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKgI5025631
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:20:42 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:20:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:20:41 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIKfYA005987;
	Thu, 20 Mar 2025 13:20:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKVV-0000cl-J8; Thu, 20 Mar 2025 13:20:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 0/8] Wrap various packages in a compliant manner
Date: Thu, 20 Mar 2025 13:20:33 -0500
Message-ID: <20250320182041.2349-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:20:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16132

We are moving to make the meta-arago layers Yocto Project Compatible.

https://www.yoctoproject.org/development/yocto-project-compatible-layers/

We have been cleaning up the layer according to the yocto-check-layer
tool.  This series addresses any packages that were defined by wrapping
the bbappend behind a guard (see other series), or that a commercial
license is defined for a recipe and LICENSE_FLAGS_ACCEPTED is required
in the distro to be able to use them.

In order for a packagegroup to use these recipes, we can only include
them if we are building arago and applying the conf/distro/arago.conf
settings.

Ryan Eatmon (8):
  packagegroup-arago-base: Wrap various packages in a compliant manner
  packagegroup-arago-bootstrap: Wrap various packages in a compliant
    manner
  packagegroup-arago-tisdk-addons: Wrap various packages in a compliant
    manner
  nativesdk-packagegroup-arago-tisdk-host: Wrap various packages in a
    compliant manner
  ti-test: Wrap various packages in a compliant manner
  packagegroup-arago-gst-sdk-target: Wrap various packages in a
    compliant manner
  packagegroup-arago-gst: Wrap various packages in a compliant manner
  packagegroup-arago-tisdk-multimedia: Wrap various packages in a
    compliant manner

 .../recipes-core/packagegroups/packagegroup-arago-base.bb  | 5 ++++-
 .../packagegroups/packagegroup-arago-bootstrap.bb          | 5 ++++-
 .../packagegroups/packagegroup-arago-gst-sdk-target.bb     | 3 ++-
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb   | 3 ++-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb       | 7 +++++--
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb   | 4 ++--
 .../nativesdk-packagegroup-arago-tisdk-host.bb             | 5 ++++-
 meta-arago-test/recipes-core/packagegroups/ti-test.bb      | 2 +-
 8 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.17.1


