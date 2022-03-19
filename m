Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08A3C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:33:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6566.1647693203840449762
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 05:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gJGi1SwJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXH07040642;
	Sat, 19 Mar 2022 07:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647693197;
	bh=cRUdYOJrwlJEcvKZ7H/VM4h7Z3Sh5gMISB8cyJkqUZc=;
	h=From:To:CC:Subject:Date;
	b=gJGi1SwJUKaE+pFMnJVg+lF+vDJO1+BYJUqWLVbcTmZJemTGZptBwf04PDQVt4pUh
	 dkKMLXB/Qgqa46dtRHXJtAmcquEbO0rC9zuLBDy7b2nSGgGZlkf1H9+9TCCqxcJCjJ
	 DwBNapt9NPmtvWVAypk6FKQPq7L+0LXz6f38utDA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22JCXHWB075115
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Mar 2022 07:33:17 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 19
 Mar 2022 07:33:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 19 Mar 2022 07:33:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXGpq115890;
	Sat, 19 Mar 2022 07:33:16 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V4 00/12] recipes-core: Add a bootstrap Linux
 image
Date: Sat, 19 Mar 2022 07:32:58 -0500
Message-ID: <20220319123310.8546-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 19 Mar 2022 12:33:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13689

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

Changes since V3:
* Fixes a typo that crept back in

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
 .../recipes-core/images/tisdk-tiny-image.bb   | 21 ++++----
 .../packagegroup-arago-bootstrap.bb           | 53 +++++++++++++++++++
 11 files changed, 160 insertions(+), 15 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.inc
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb

-- 
2.31.1


