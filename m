Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2221.1643826393509124391
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UgbRxaRa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IQVmN089065;
	Wed, 2 Feb 2022 12:26:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826391;
	bh=l5477F7XiBUzLsnrHIce3eKaIgfpI1R/xmQEkpqDRLM=;
	h=From:To:Subject:Date;
	b=UgbRxaRa3PP9M6R8TkF/qlV3eY2nTltZgoxMW/R74jcAFak4hZocAVhrnC4M+BbfU
	 gYCMKgoKgpg2tetU/pBJSwNqcQXO3FC6GVSyng5nDX4RIEGNBG4RtQHkF42J6ZhglH
	 CRTvxSGnGmNYP0MUSt+GUC0jtsPEtDFFaLoD9+DM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IQVVg018403
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:26:31 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:26:30 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:26:30 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IQUdh078977;
	Wed, 2 Feb 2022 12:26:30 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKKs-0007XY-8Q; Wed, 02 Feb 2022 12:26:30 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 00/12] Adding support for j721s2
Date: Wed, 2 Feb 2022 12:26:18 -0600
Message-ID: <20220202182630.28943-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

*** BLURB HERE ***

Hari Nagalla (1):
  recipes-ti/ti-rtos-bin: Fix unavailable binary path

Nishanth Menon (8):
  machine: Add j721s2 evm configuration
  optee-os: Add support for alternate console
  trusted-firmware-a: Add support for alternate console
  recipes-bsp/ti-rtos: Use target_c7x_0 instead of just c7x
  ti-rtos-bin: Add j721s2
  recipes-bsp/ti-rtos: Define the TARGET and ALTERNATE_TARGET as well.
  recipies-ti: ti-rtos-firmware: Fixup typo for rtos firmware
  recipes-bsp: Add cnm-wave-fw firmware recipe

Praneeth Bajjuri (2):
  ti-linux-fw: Bump up TIFS and DM to v2022.01
  Revert "ti-sci-fw: Fix for k3-image-gen issue for combined boot
    images"

Ryan Eatmon (1):
  cnm-wave-fw: Fix name of firmware for j721s2

 conf/machine/j721s2-evm-k3r5.conf             | 11 ++++
 conf/machine/j721s2-evm.conf                  | 22 +++++++
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    | 42 ++++++++++++
 .../ipc-lld/ipc-lld-examples-rtos_git.bb      |  4 +-
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb         |  4 +-
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  9 +--
 ...gning-of-binaries-for-combined-boot-.patch | 64 -------------------
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 28 ++++++--
 .../trusted-firmware-a_%.bbappend             |  2 +
 recipes-bsp/u-boot/u-boot-ti.inc              |  6 ++
 recipes-kernel/linux/kernel-rdepends.inc      |  3 +
 recipes-security/optee/optee-os_%.bbappend    |  2 +
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 59 ++++++++++++++++-
 13 files changed, 175 insertions(+), 81 deletions(-)
 create mode 100644 conf/machine/j721s2-evm-k3r5.conf
 create mode 100644 conf/machine/j721s2-evm.conf
 create mode 100644 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
 delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch

-- 
2.17.1

