Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D11C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:32:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1052.1675899161433132158
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R7s/HxV+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NWefm086387;
	Wed, 8 Feb 2023 17:32:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899160;
	bh=VywslZw0zHg3j1BrEmPQaTcoSLuvCEEto8zEcvoXf7Q=;
	h=From:To:CC:Subject:Date;
	b=R7s/HxV+/yt1hjNZbhW2uoVqX6KMCnAIdItNVAEU02mAT7qpRfq98WEtYM+VDUfmg
	 KoWCbbex2R7OE/cACY+c8zIPbqTwZ9YXkMhF2KxELdjbcMbqES72KIw99+G9KTli5Q
	 abpMIoaOdOcIctWFCilJKz7Hrcnp3Tm1H8+Tx5kI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NWeOE024289
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:32:40 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:32:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:32:34 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NWXO8001221;
	Wed, 8 Feb 2023 17:32:34 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] parse-ip: Remove parse-ip init scripts
Date: Wed, 8 Feb 2023 17:32:33 -0600
Message-ID: <20230208233233.19511-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:32:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14206

These make several assumptions about the location and availability of
an SD card. The usefulness of this script outside of the removed
K2x context is not clear. Remove this script.

This also was the last included package in arago-tisdk-amsdk so
remove that packagegroup as well.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../images/tisdk-default-image.bb             |  1 -
 .../packagegroup-arago-tisdk-amsdk.bb         | 22 --------
 .../recipes-core/packagegroups/ti-world.bb    |  1 -
 .../recipes-tisdk/parse-ip/parse-ip.bb        | 24 ---------
 .../recipes-tisdk/parse-ip/parse-ip/init      | 46 ----------------
 .../recipes-tisdk/parse-ip/parse-ip/k2g/init  | 52 -------------------
 .../parse-ip/parse-ip/keystone/init           | 49 -----------------
 7 files changed, 195 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
 delete mode 100644 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g/init
 delete mode 100644 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 8cd10429..10bf33fa 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -21,7 +21,6 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-matrix \
     packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-tisdk-multimedia \
-    packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
deleted file mode 100644
index 4e913077..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
-LICENSE = "MIT"
-PR = "r11"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-# Out of Box Experience (OOBE)
-OOBE = ""
-
-OOBE:ti33x += "\
-    parse-ip \
-"
-
-OOBE:ti43x += "\
-    parse-ip \
-"
-
-RDEPENDS:${PN} = "\
-    ${OOBE} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 323d88ae..05423a87 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -52,7 +52,6 @@ RDEPENDS:${PN} = "\
     packagegroup-arago-tisdk-matrix \
     packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-tisdk-multimedia \
-    packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
deleted file mode 100644
index 4e3f9443..00000000
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Script to parse ip address during boot and make it available to the host system using shared partitions"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://init;beginline=3;endline=31;md5=f82ddb19a87f97193d08feacfd0e4903"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "file://init"
-
-PR = "r6"
-
-S = "${WORKDIR}"
-
-INITSCRIPT_NAME = "parse-ip"
-INITSCRIPT_PARAMS = "defaults 98"
-
-inherit update-rc.d
-
-do_install() {
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/parse-ip
-}
-
-FILES:${PN} = "${sysconfdir}"
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
deleted file mode 100644
index eb6c7580..00000000
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
+++ /dev/null
@@ -1,46 +0,0 @@
-#!/bin/sh
-
-# This distribution contains contributions or derivatives under copyright
-# as follows:
-#
-# Copyright (c) 2010-2016, Texas Instruments Incorporated
-# All rights reserved.
-#
-# Redistribution and use in source and binary forms, with or without
-# modification, are permitted provided that the following conditions
-# are met:
-# - Redistributions of source code must retain the above copyright notice,
-#   this list of conditions and the following disclaimer.
-# - Redistributions in binary form must reproduce the above copyright
-#   notice, this list of conditions and the following disclaimer in the
-#   documentation and/or other materials provided with the distribution.
-# - Neither the name of Texas Instruments nor the names of its
-#   contributors may be used to endorse or promote products derived
-#   from this software without specific prior written permission.
-#
-# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
-# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
-# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
-# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-
-case "$1" in
-    start )
-        if [ -e /run/media/mmcblk0p1 ]
-        then
-            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > /run/media/mmcblk0p1/.ipaddr
-            sync
-	    sync
-	fi
-    ;;
-    stop )
-        exit 0;;
-esac
-
-exit 0
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g/init
deleted file mode 100644
index eaeec150..00000000
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g/init
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/bin/sh
-
-# This distribution contains contributions or derivatives under copyright
-# as follows:
-#
-# Copyright (c) 2010-2016, Texas Instruments Incorporated
-# All rights reserved.
-#
-# Redistribution and use in source and binary forms, with or without
-# modification, are permitted provided that the following conditions
-# are met:
-# - Redistributions of source code must retain the above copyright notice,
-#   this list of conditions and the following disclaimer.
-# - Redistributions in binary form must reproduce the above copyright
-#   notice, this list of conditions and the following disclaimer in the
-#   documentation and/or other materials provided with the distribution.
-# - Neither the name of Texas Instruments nor the names of its
-#   contributors may be used to endorse or promote products derived
-#   from this software without specific prior written permission.
-#
-# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
-# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
-# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
-# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-
-case "$1" in
-    start )
-        /bin/stty -F /dev/ttyS2 115200
-
-	echo ' ' > ipaddr
-	echo ' ' >> ipaddr
-        echo '#>>>>> LCD 12' >> ipaddr
-        echo 'IP Address:' >> ipaddr
-        cat ipaddr > /dev/ttyS2
-        wait
-        sleep 1
-
-        echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > ipaddr
-        cat ipaddr > /dev/ttyS2
-        wait
-        sleep 1
-    ;;
-    stop )
-        exit 0;;
-esac
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
deleted file mode 100644
index 7d42d434..00000000
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/keystone/init
+++ /dev/null
@@ -1,49 +0,0 @@
-#!/bin/sh
-
-# This distribution contains contributions or derivatives under copyright
-# as follows:
-#
-# Copyright (c) 2010-2016, Texas Instruments Incorporated
-# All rights reserved.
-#
-# Redistribution and use in source and binary forms, with or without
-# modification, are permitted provided that the following conditions
-# are met:
-# - Redistributions of source code must retain the above copyright notice,
-#   this list of conditions and the following disclaimer.
-# - Redistributions in binary form must reproduce the above copyright
-#   notice, this list of conditions and the following disclaimer in the
-#   documentation and/or other materials provided with the distribution.
-# - Neither the name of Texas Instruments nor the names of its
-#   contributors may be used to endorse or promote products derived
-#   from this software without specific prior written permission.
-#
-# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
-# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
-# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
-# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-
-case "$1" in
-    start )
-	echo ' ' > ipaddr
-	echo ' ' >> ipaddr
-        echo '#>>>>> LCD 12' >> ipaddr
-        echo 'IP Address:' >> ipaddr
-        wait
-        sleep 1
-
-        echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` >> ipaddr
-        cat ipaddr > /dev/ttyS0
-        wait
-        sleep 1
-    ;;
-    stop )
-        exit 0;;
-esac
-- 
2.39.1


