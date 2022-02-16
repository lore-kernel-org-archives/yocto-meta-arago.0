Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.9830.1645004065975504148
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 01:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Pnjj8kCC;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21G9YOcG011141
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 03:34:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645004064;
	bh=7icV+O3dI6ZwaBSH+HTaw6e7bW04RHURXdf0GMuIh34=;
	h=From:To:CC:Subject:Date;
	b=Pnjj8kCCwHSU8sNkIyujfzCjXPvTwVirzh/7ljKflXEtH94/K6oMQes35wf7r5rLV
	 CLWubPrNUhPwC1yOSGvmXDoItcD+d2CzzF7aTUmFmjAw9kJdd2ldxcmucnIp0rxl7v
	 QijFIXzjlSbCiv0f/yN58H4w2V53WJ0NzNXCW/Ng=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21G9YOQE118506
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 03:34:24 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 03:34:24 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 03:34:23 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21G9YLmF120916;
	Wed, 16 Feb 2022 03:34:22 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH 0/4] setup-uboot-env: Add u-boot env setup for HS devices
Date: Wed, 16 Feb 2022 15:04:10 +0530
Message-ID: <20220216093414.5085-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Hi all,

This is a series of patches to add support for u-boot env setup for
am335x, am43x, am57xx and keystone HS devices.


Aparna M (4):
  setup-uboot-env-am43x-hs: Add u-boot env setup support for am43x-hs
  setup-uboot-env-am335x-hs: Add u-boot env setup support for am335x-hs
  setup-uboot-env-am57xx-hs-evm: Add u-boot env setup support for
    am57xx-hs
  setup-uboot-env-keystone-hs: Add u-boot env setup support for keystone
    hs devices

 setup-uboot-env-am335x-hs.sh     | 339 +++++++++++++++++++++++
 setup-uboot-env-am43x-hs.sh      | 165 +++++++++++
 setup-uboot-env-am57xx-hs-evm.sh | 242 ++++++++++++++++
 setup-uboot-env-keystone-hs.sh   | 456 +++++++++++++++++++++++++++++++
 4 files changed, 1202 insertions(+)
 create mode 100644 setup-uboot-env-am335x-hs.sh
 create mode 100644 setup-uboot-env-am43x-hs.sh
 create mode 100644 setup-uboot-env-am57xx-hs-evm.sh
 create mode 100755 setup-uboot-env-keystone-hs.sh

-- 
2.17.1

