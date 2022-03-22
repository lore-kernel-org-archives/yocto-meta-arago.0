Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18D2C35274
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:48:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.13255.1647971299602455202
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=u4fXzo4X;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmAjf116231;
	Tue, 22 Mar 2022 12:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647971290;
	bh=2E6WajOv3mb/RojmrPvWppe4NJ4IqhrMTZBLCIfzstQ=;
	h=From:To:CC:Subject:Date;
	b=u4fXzo4XsS+wAh2L1y0Vyv9oyb9qe1V281iIh0RZBXjXr78InsSPoiRT/PniGSYxY
	 GebuMtotoINUsoicoCJ7ybMhvpoX3q1MqLsQ+b9R2dXZdt+9m/4+xbNlp/INKGbsV7
	 t3v6YYRjNkbIHH+ZCGf6UaqZBSF+eYhDI7tQEBWk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MHmAJi072514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 12:48:10 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 12:48:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 12:48:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmADL113946;
	Tue, 22 Mar 2022 12:48:10 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V5 00/12] recipes-core: Add a bootstrap Linux
 image
Date: Tue, 22 Mar 2022 12:47:56 -0500
Message-ID: <20220322174808.16341-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 17:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13709

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

Changes since V4:
* Fixes formatting EoL in Documentation in tisdk-core-bundle (patch #7)
* Fixes build breakage for tisdk-core-image (patch #2)

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


