Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1291.1646792003915805688
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wtuyRKBB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2292DKLY093630;
	Tue, 8 Mar 2022 20:13:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646792000;
	bh=aWUHZAY4eXtvvyg7o8I1SK1e0Ukdq4u1AawG/tCBVlA=;
	h=From:To:CC:Subject:Date;
	b=wtuyRKBBn+2z90gxN5FgjCc49jazu5tKNsQ9q935UqWMFT9FfTEN8a1ojg7UvtulZ
	 eqcsftHsujczqHqLMyd1u44mTUV1spNapsWtkSjhnP1umVVcajHUbM2qf8bMstJhWZ
	 AWM5Z/nqsRr4EtWBy+cDZP/0dP3QOHnS6tC7BZf4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2292DKWj106093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 20:13:20 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 20:13:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 20:13:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2292DJj0042809;
	Tue, 8 Mar 2022 20:13:19 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>, <praneeth@ti.com>,
        <minas@ti.com>, "Hilman, Kevin"
	<khilman@ti.com>,
        "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil"
	<nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master PATCH 0/6] recipes-core: Lets add a bootstrap Linux image
Date: Tue, 8 Mar 2022 20:13:10 -0600
Message-ID: <20220309021316.28370-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi,

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

Nishanth Menon (6):
  tisdk-tiny-image: Split common components into include file
  tisdk-tiny-image: Add some usability notes
  packagegroups: Add a new bootstrap package group
  recipes-core: images: Add a basic bootstrap base image
  recipes-bsp: Create a k3-bootstrap-initrd package
  recipes-core: images: Introduce tisdk-bootstrap-image

 .../k3-bootstrap-initrd_1.0.bb                | 22 ++++++++
 .../recipes-core/images/arago-tiny-image.inc  |  9 +++
 .../images/tisdk-bootstrap-base-image.bb      | 20 +++++++
 .../images/tisdk-bootstrap-image.bb           | 17 ++++++
 .../recipes-core/images/tisdk-tiny-image.bb   | 14 ++---
 .../packagegroup-arago-bootstrap.bb           | 55 +++++++++++++++++++
 6 files changed, 130 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/k3-bootstrap-initrd/k3-bootstrap-initrd_1.0.bb
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.inc
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb

-- 
2.31.1

