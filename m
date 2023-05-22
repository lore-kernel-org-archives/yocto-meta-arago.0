Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2116C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 18:38:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3160.1684780734376178180
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 11:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a8J6B+45;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MIcolB118077;
	Mon, 22 May 2023 13:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684780730;
	bh=sT+Vfi1d6APadNumOnxA4YnawYlLeOclI/5SgYx8wdY=;
	h=From:To:CC:Subject:Date;
	b=a8J6B+450Z6OYBEo7KTK5GT/6284bEJseROCYyy+C4r3/e6jSgn2FiBS7pdKMgyRv
	 ZBlGaXPIJuwZJkh39z7M5ckDrKiYvVs7Blws02ot+GhiwvC5O2Gs7oSQHYTksG0Vdw
	 Q2WBdWLCW5DCtcdpUHof2RFJL8gowUlhFvB2crWk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MIcoOT016548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 13:38:50 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 13:38:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 13:38:49 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MIcnoC092240;
	Mon, 22 May 2023 13:38:49 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master][PATCH 0/3] Move to the Yocto SDK target
Date: Mon, 22 May 2023 13:38:44 -0500
Message-ID: <20230522183847.3663294-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 18:38:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14432

From: Randolph Sapp <rs@ti.com>

The old arago-sdk build target has been broken and unloved for far too
long. Let's drop it in favor of the Yocto Standard SDK build target.

This cleans up an awful lot of dead logic and fixes a rather annoying
warning that's been bothering me for a while now.

More info about the Standard SDK target can be found here:
https://docs.yoctoproject.org/sdk-manual/appendix-obtain.html#building-an-sdk-installer

There's probably some unreachable recipes in this layer and meta-ti now.
I did not take the time to check that. I believe a full recipe audit is
in order anyway.

Randolph Sapp (3):
  all: remove all external toolchain stuff
  all: remove all external toolchain logic
  all: remove all legacy arago-sdk build recipes

 .../classes/tisdk-bundle.bbclass              | 928 ------------------
 meta-arago-distro/conf/distro/arago.conf      |  13 -
 .../distro/include/branding-processor-sdk.inc |   2 -
 .../conf/distro/include/toolchain-arm.inc     | 118 ---
 .../distro/include/toolchain-external.inc     |   4 -
 .../conf/distro/include/toolchain-gcc.inc     |  41 -
 .../distro/include/toolchain-internal.inc     |   4 -
 .../recipes-core/images/arago-image.inc       |   1 -
 .../recipes-core/images/tisdk-core-bundle.bb  |  19 -
 .../recipes-core/images/tisdk-core-bundle.inc |  39 -
 .../external-arm-secondary-sdk-toolchain.bb   |   4 -
 .../meta/external-arm-toolchain.bbappend      |  36 -
 .../meta/meta-toolchain-arago-tisdk-server.bb |   7 -
 .../meta/meta-toolchain-arago-tisdk.bb        |   6 -
 .../meta/meta-toolchain-arago-tisdk.inc       |   8 -
 .../packagegroup-arago-gst-sdk-target.bb      |  28 -
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  76 --
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  18 -
 ...oup-arago-tisdk-connectivity-sdk-target.bb |  27 -
 ...kagegroup-arago-tisdk-crypto-sdk-target.bb |  14 -
 ...gegroup-arago-tisdk-graphics-sdk-target.bb |  15 -
 ...packagegroup-arago-tisdk-gtk-sdk-target.bb |  11 -
 ...group-arago-tisdk-multimedia-sdk-target.bb |  30 -
 ...kagegroup-arago-tisdk-opencl-sdk-target.bb |  22 -
 ...ckagegroup-arago-toolchain-tisdk-target.bb |  28 -
 .../packagegroup-cross-canadian.bbappend      |  10 -
 .../opencl-examples-rtos_git.bbappend         |   6 -
 .../oe-layersetup/oe-layersetup.bb            |  13 -
 .../ti-tisdk-setup/ti-tisdk-setup.bb          |  59 --
 .../tisdk-install/sdk-install.sh              | 129 ---
 .../tisdk-install/tisdk-install_1.0.bb        |  15 -
 .../tisdk-readme/tisdk-readme.bb              |  22 -
 .../tisdk-readme/tisdk-readme/README          |  22 -
 .../tisdk-readme/tisdk-readme/k3/README       |  26 -
 .../unshallow-repositories.sh                 | 110 ---
 .../unshallow-repositories_1.0.bb             |  16 -
 .../meta/external-arm-bfd-version.inc         |   8 -
 .../meta/external-arm-sdk-toolchain.bb        | 131 ---
 .../meta/external-arm-toolchain.bbappend      |  73 --
 .../meta/meta-toolchain-arago-qte.bb          |  54 -
 .../recipes-core/meta/meta-toolchain-arago.bb | 360 -------
 .../nativesdk-buildtools-perl-dummy.bbappend  |  23 -
 ...k-packagegroup-arago-qte-toolchain-host.bb |  11 -
 ...nativesdk-packagegroup-arago-tisdk-host.bb |  39 -
 44 files changed, 2626 deletions(-)
 delete mode 100644 meta-arago-distro/classes/tisdk-bundle.bbclass
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-arm.inc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-external.inc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-gcc.inc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-internal.inc
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
 delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
 delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
 delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
 delete mode 100644 meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.bbappend
 delete mode 100644 meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README
 delete mode 100755 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb

-- 
2.40.1


