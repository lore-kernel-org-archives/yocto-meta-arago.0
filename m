Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.10389.1645009450739179363
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 03:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=I/Acj0CM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-m1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21GB4AVO011652
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 05:04:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645009450;
	bh=XdZYZNKtwda+Jy1arORikwGR2JlBoVFma2l2rECm724=;
	h=From:To:CC:Subject:Date;
	b=I/Acj0CMJ+0WIt4rpxdhdxGcZ/GEW3vrgxYl2+JxFLYwlBYuvb2qC4vq6ysrWuuTO
	 iCTGcxVP+cuJmqsKuOKshS0uQQueXtv1eL7qpdN1yk7y69qHMN9Qf2lbGU7sJHm461
	 O34+SDeYMZOSREEEy777GaBlH9+Ff+hDDON+B60Y=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21GB4AYZ059676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 05:04:10 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 05:04:09 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 05:04:09 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21GB47oE084540;
	Wed, 16 Feb 2022 05:04:08 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH v3 0/4] setup-uboot-env: Add u-boot env setup for HS devices
Date: Wed, 16 Feb 2022 16:33:57 +0530
Message-ID: <20220216110401.9082-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Hi all,

Fixing commits from the last series which included patch files.

Aparna M (4):
  setup-uboot-env-am43x-hs: Add u-boot env setup support for am43x-hs
  setup-uboot-env-am335x-hs: Add u-boot env setup support for am335x-hs
  setup-uboot-env-am57xx-hs: Add u-boot env setup support for am57xx-hs
  setup-uboot-env-keystone-hs: Add u-boot env setup support for keystone
    hs devices

 setup-uboot-env-am335x-hs.sh     | 401 +++++++++++++++++++++++++++
 setup-uboot-env-am43x-hs.sh      | 230 ++++++++++++++++
 setup-uboot-env-am57xx-hs-evm.sh | 303 +++++++++++++++++++++
 setup-uboot-env-keystone-hs.sh   | 449 +++++++++++++++++++++++++++++++
 4 files changed, 1383 insertions(+)
 create mode 100644 setup-uboot-env-am335x-hs.sh
 create mode 100644 setup-uboot-env-am43x-hs.sh
 create mode 100644 setup-uboot-env-am57xx-hs-evm.sh
 create mode 100755 setup-uboot-env-keystone-hs.sh

-- 
2.17.1

