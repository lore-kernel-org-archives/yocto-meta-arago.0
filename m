Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE26AC3527B
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:37:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.10533.1647614262450694424
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U3VBvwur;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbT8110647;
	Fri, 18 Mar 2022 09:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647614257;
	bh=ksNJfYsKEN4dCB7B0j1xC2I+RzRbsTJI3Ro9gkn2+l8=;
	h=From:To:CC:Subject:Date;
	b=U3VBvwuruapzgWxrKkJ3qemOsLS6S4OF3ylpQmeAeSYeIPEOz6INKey6jw23bcvnj
	 /C2WD6XlrcGI2b8YWnFQRwogiwpAO30wry4eYxILhnNTwJ40IMITvEhwM0hJ/vByot
	 b4GFdlHkpMSQnMAlOLyrQZxmKx7DFiqmjhf0anGc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEbbbR013332
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 09:37:37 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:37:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:37:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbUf094323;
	Fri, 18 Mar 2022 09:37:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2 00/12] recipes-core: Add a bootstrap Linux
 image
Date: Fri, 18 Mar 2022 09:37:23 -0500
Message-ID: <20220318143735.17642-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13651

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

Changes since V1:
* Additional documentation patches
* Cleanups for review comments

V1: https://lore.kernel.org/all/20220309021316.28370-1-nm@ti.com/

Nishanth Menon (12):
  Revert "tisdk-tiny-image: remove packagedata task breaking initramfs
    packaging"
  tisdk-tiny-image: Split common components into include file
  tisdk-tiny-image: Add some usability notes
  tisdk-base-image: Reformat documentation and clarify usage
  tisdk-default-image: Reformat documentation and clarify usage
  tisdk-thinlinux-image: Reformat documentation
  packagegroups: Add a new bootstrap package group
  recipes-core: images: Add a basic bootstrap base image
  recipes-bsp: Create a bootstrap-initrd package
  recipes-core: images: Introduce tisdk-bootstrap-image
  tisdk-core-bundle: Add documentation to clarify usage
  images: Build tisdk-bootstrap-image with tisdk-core-bundle

 .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 ++++++++
 .../recipes-core/images/arago-tiny-image.inc  |  9 ++++
 .../recipes-core/images/tisdk-base-image.bb   |  4 +-
 .../images/tisdk-bootstrap-base-image.bb      | 21 ++++++++
 .../images/tisdk-bootstrap-image.bb           | 20 +++++++
 .../recipes-core/images/tisdk-core-bundle.bb  |  6 +++
 .../recipes-core/images/tisdk-core-bundle.inc |  2 +-
 .../images/tisdk-default-image.bb             |  3 ++
 .../images/tisdk-thinlinux-image.bb           |  1 +
 .../recipes-core/images/tisdk-tiny-image.bb   | 20 +++----
 .../packagegroup-arago-bootstrap.bb           | 53 +++++++++++++++++++
 11 files changed, 150 insertions(+), 11 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.inc
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb

-- 
2.31.1


