Return-Path: <dannenberg@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335A8C6FA9D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:32:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.23686.1677681125017535862
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 06:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Qi6o/rgi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: dannenberg@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 321EW2cW120956;
	Wed, 1 Mar 2023 08:32:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677681122;
	bh=ZlO7aXjv0TGo2D09WXSyjIHTixczVci4o5bFWWyon54=;
	h=From:To:CC:Subject:Date;
	b=Qi6o/rgiYftG85DWF2LoxMI+AtwChfVPSyBkx8VDxHjxsjHR7DpA1O0s1cu5Wtw1Y
	 Lc4XzkjcRU2uZqMIwdCztq6POtIT4c6vPHf6lhDGgHU5+konX2p92p7CEfL/PesOXM
	 sTU/T/tKBmKcyZESO7LUfwzh12GeAkRNhQPYTOl4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 321EW200005971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Mar 2023 08:32:02 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 1
 Mar 2023 08:32:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 1 Mar 2023 08:32:02 -0600
Received: from dasso.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 321EW2jn117791;
	Wed, 1 Mar 2023 08:32:02 -0600
From: Andreas Dannenberg <dannenberg@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denys@konsulko.com>, <afd@ti.com>,
        <reatmon@ti.com>
CC: Andreas Dannenberg <dannenberg@ti.com>
Subject: [meta-arago][kirkstone/master] meta-toolchain-arago: fix internal toolchain installer install issue
Date: Wed, 1 Mar 2023 08:31:59 -0600
Message-ID: <20230301143159.752566-1-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Mar 2023 14:32:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14240

When building the toolchain installer via 'bitbake -c populate_sdk ...'
the resulting toolchain installer throws an error complaining about it
can't find an 'environment-setup-*' file and hangs. The issue is caused
by how the TOOLCHAIN_HOST_TASK variable is populated by the Arago distro
layer, which must be extended via ':append', and not via '+='. See [1]
and [2] for more background on this.

[1] https://www.openembedded.org/pipermail/openembedded-core/2015-July/106931.html
[2] https://community.toradex.com/t/problem-with-angstrom-sdk-installer/5810/8

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---

After this patch is applied the toolchain installer installs without
issue. It even works when doing a multilib, generating two
toolschains/installers as part of the package, which is pretty cool.
I also tested that both cross toolchains actually work using a simple
file I/O test program.


$ arago-tmp-default-glibc/deploy/sdk/arago-2022.02-toolchain-2022.02.sh
-d /home/a0797059/tmp/arago-kirkstone
Arago SDK installer version 2022.02
===================================
You are about to install the SDK to
"/home/a0797059/tmp/arago-kirkstone". Proceed [Y/n]?
Extracting
SDK.....................................................................................................................................................................................................
.......................................................................................................................................................done
Setting it up...done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to
source the environment setup script e.g.
 $ . /home/a0797059/tmp/arago-kirkstone/environment-setup-aarch64-oe-linux
 $ . /home/a0797059/tmp/arago-kirkstone/environment-setup-armv7at2hf-neon-oemllib32-linux-gnueabi


 meta-arago-distro/recipes-core/images/arago-image.inc       | 2 +-
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 923bc84f..d00c1f70 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -19,7 +19,7 @@ export IMAGE_BASENAME = "arago-image"
 
 IMAGE_LINGUAS = ""
 
-TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
+TOOLCHAIN_HOST_TASK:append = " nativesdk-buildtools-perl-dummy"
 SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
 
 BAD_RECOMMENDATIONS += " \
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 81affa16..5c1c3ad0 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,6 +1,6 @@
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host"
-TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
-TOOLCHAIN_HOST_TASK += "packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK:append = " nativesdk-buildtools-perl-dummy"
+TOOLCHAIN_HOST_TASK:append = " packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
 TOOLCHAIN_SUFFIX ?= "-sdk"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}"
-- 
2.34.1


