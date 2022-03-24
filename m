Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABBDC4167B
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:25:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.10613.1648128332760321548
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VYknMTJt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSns022715;
	Thu, 24 Mar 2022 08:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648128328;
	bh=Nnw8Io01+2gM3P4LhbQaCQJCRI+0VybUmlKEzKeRJJo=;
	h=From:To:CC:Subject:Date;
	b=VYknMTJtZgWIQakem/fukjsfuCrXScbsVgfXvbe0Xr52sBh7/vd/W28KxoIoWNdJl
	 +NUoug4wHS51byjgruK3vS6fkftPHI7QchzfMvxl033Ud7ROoVUQUA107tm/zndy1p
	 K+mgrpzEiW4Pf5nV+nZcVAG+AczFc19DwiOnbsBA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODPS1B016928
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:25:28 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:25:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:25:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPRsN008890;
	Thu, 24 Mar 2022 08:25:27 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V6 00/12] recipes-core: Add a bootstrap Linux
 image
Date: Thu, 24 Mar 2022 08:25:14 -0500
Message-ID: <20220324132526.26497-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13749

Board bringups are typically painful. however, over the years, folks
know of minimal debug tools that are pretty effective in helping debug
basic peripherals. Lets create a reusable packagegroup balancing the
tools from wisdom from various folks vs the size of the resultant
package.

We would like to base such a system on more simplistic sysvinit (no
offence systemd, you are still our fav), as it has a much smaller
footprint.

The board startup is best done with a minimal u-boot and kernel device
tree configurations.

Dependency (for patch #12, depends on https://lore.kernel.org/all/20220314202840.18904-1-reatmon@ti.com/ )

Changes since V5:
* Patch #10 - switch from GPLv2 to MIT to stick with standard licensing.

V5: https://lore.kernel.org/all/20220322174808.16341-1-nm@ti.com/
V4: https://lore.kernel.org/all/20220319123310.8546-1-nm@ti.com/
V3: https://lore.kernel.org/all/20220318184045.11246-1-nm@ti.com/
V2: https://lore.kernel.org/all/20220318143735.17642-1-nm@ti.com/
V1: https://lore.kernel.org/all/20220309021316.28370-1-nm@ti.com/


Nishanth Menon (12):
  Revert "tisdk-tiny-image: remove packagedata task breaking initramfs
    packaging"
  tisdk-tiny-image: Split common components into include file
  tisdk-tiny-image: Add some usability notes
  tisdk-base-image: Reformat documentation and clarify usage
  tisdk-default-image: Reformat documentation and clarify usage
  tisdk-thinlinux-image: Reformat documentation
  tisdk-core-bundle: Add documentation to clarify usage
  packagegroups: Add a new bootstrap package group
  recipes-core: images: Add a basic bootstrap base image
  recipes-bsp: Create a bootstrap-initrd package
  recipes-core: images: Introduce tisdk-bootstrap-image
  images: Build tisdk-bootstrap-image with tisdk-core-bundle

 .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 ++++++++
 .../recipes-core/images/arago-tiny-image.inc  |  9 ++++
 .../recipes-core/images/tisdk-base-image.bb   |  6 ++-
 .../images/tisdk-bootstrap-base-image.bb      | 22 ++++++++
 .../images/tisdk-bootstrap-image.bb           | 22 ++++++++
 .../recipes-core/images/tisdk-core-bundle.bb  |  7 +++
 .../recipes-core/images/tisdk-core-bundle.inc |  2 +-
 .../images/tisdk-default-image.bb             |  5 +-
 .../images/tisdk-thinlinux-image.bb           |  6 ++-
 .../recipes-core/images/tisdk-tiny-image.bb   | 23 ++++----
 .../packagegroup-arago-bootstrap.bb           | 53 +++++++++++++++++++
 11 files changed, 162 insertions(+), 15 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.inc
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb

-- 
2.31.1


