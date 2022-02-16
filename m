Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.10424.1645008789282006256
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 02:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ygPUHTza;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-m1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21GAr8C7008766
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 04:53:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645008788;
	bh=czVwlZxb8Hs14iF4qtqx3w6ry0cweM0hKbznA4XokP4=;
	h=From:To:CC:Subject:Date;
	b=ygPUHTzaavBMZQj19/I9VqkB3j3g/Su7D+bWjIDo9a2tDymxR7wlvyFABGpHJedn8
	 IjsT20RRvWTJeUkAjGtxqgbfckt0nR+0yfMjyjdacVr7DsZsY8AXl1V3bozxFYTkqo
	 1BDP4Dz3rg29Bm/piXwohiYovZlV8BJ/evj7bM9Q=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21GAr7Vw042888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 04:53:07 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 04:53:07 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 04:53:07 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21GAr5Hu000822;
	Wed, 16 Feb 2022 04:53:05 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH v2 0/4] setup-uboot-env: Add u-boot env setup for HS devices
Date: Wed, 16 Feb 2022 16:22:57 +0530
Message-ID: <20220216105301.13863-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Hi all,

Changes from the previous version:

1] Use default env for net boot for keystone hs devices
2] Use fitImage wihtout ramfs
3] Add support for rootfs over NFS since ramfs is not required for
fitImages

Aparna M (4):
  setup-uboot-env-am335x-hs: Add u-boot env setup support for am335x-hs
  setup-uboot-env-am57xx-hs-evm: Add u-boot env setup support for
    am57xx-hs
  setup-uboot-env-keystone-hs: Add u-boot env setup support for keystone
    hs devices
  setup-uboot-env-k2g-hs-evm: Add u-boot env setup support for k2g hs
    devices

 0001-setup-add-support-for-HS-EVMs.patch      | 1402 +++++++++++++++++
 ...fs-Modify-script-to-search-for-tisdk.patch |   47 +
 ...-Support-only-Ubunut-18.04-as-host-O.patch |   33 +
 ...keystone-hs-use-default-env-for-net-.patch |   53 +
 ...-Modify-script-to-support-only-Ubunu.patch |   34 +
 ...fs-Modify-script-to-search-for-tisdk.patch |   47 +
 ...x-condition-for-printing-Boot-image-.patch |   30 +
 setup-uboot-env-am335x-hs.sh                  |  401 +++++
 setup-uboot-env-am57xx-hs-evm.sh              |  303 ++++
 setup-uboot-env-k2g-hs-evm.sh                 |  242 +++
 setup-uboot-env-keystone-hs.sh                |  449 ++++++
 11 files changed, 3041 insertions(+)
 create mode 100644 0001-setup-add-support-for-HS-EVMs.patch
 create mode 100644 0001-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch
 create mode 100644 0002-setup-host-check-Support-only-Ubunut-18.04-as-host-O.patch
 create mode 100644 0006-setup-uboot-env-keystone-hs-use-default-env-for-net-.patch
 create mode 100644 0014-setup-host-check-Modify-script-to-support-only-Ubunu.patch
 create mode 100644 0014-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch
 create mode 100644 0015-create-sdcard-Fix-condition-for-printing-Boot-image-.patch
 create mode 100644 setup-uboot-env-am335x-hs.sh
 create mode 100644 setup-uboot-env-am57xx-hs-evm.sh
 create mode 100755 setup-uboot-env-k2g-hs-evm.sh
 create mode 100755 setup-uboot-env-keystone-hs.sh

-- 
2.17.1

