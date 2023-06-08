Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D10C7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 19:41:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3681.1686253266909978948
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 12:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bGpo+nVc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358Jf6W9018416
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 14:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686253266;
	bh=Pk9xrZKeLT/LiorjhSnABHHol/DuMeHP4Ti7ZAKT7dw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bGpo+nVckFF2mSaiuAwaPudFjFHUcFw3a9LZAl7eneMopiuRbTlPG7FlJSG1GX6Jf
	 HKfB5M574X3QO+vVHM/1+6PODWJMM1dcnF7KQ2tZChXjfXiA8GbAL9388mZA5IbApf
	 BTKQw2s5lXeP3JyO+MqdPxGTRXSq01pJEttdZyHw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358Jf67F090392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 14:41:06 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 14:41:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 14:41:05 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358JewG7082933;
	Thu, 8 Jun 2023 14:41:03 -0500
From: <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>,
        <praneeth@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 2/2] unshallow-repositories: Remove from meta-arago
Date: Fri, 9 Jun 2023 01:10:36 +0530
Message-ID: <20230608194036.906437-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608194036.906437-1-a-limaye@ti.com>
References: <20230608194036.906437-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 19:41:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14555

From: Aniket Limaye <a-limaye@ti.com>

- This was used to un-shallow-clone linux source package in the SDK.
  Since the srcipk class and relevant stuff is now removed, remove this
  as well... to be maintained by respective SDK layers.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../unshallow-repositories.sh                 | 110 ------------------
 .../unshallow-repositories_1.0.bb             |  16 ---
 2 files changed, 126 deletions(-)
 delete mode 100755 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb

diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
deleted file mode 100755
index 7e578be5..00000000
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
+++ /dev/null
@@ -1,110 +0,0 @@
-#!/bin/bash
-
-# Authors:
-#    Franklin Cooper Jr.
-# This distribution contains contributions or derivatives under copyright
-# as follows:
-#
-# Copyright (c) 2015, Texas Instruments Incorporated
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
-install_dir="__SDK_INSTALL_DIR__"
-
-# Find git binary within the host native bin directory
-sdk_git_bin="$install_dir/linux-devkit/sysroots/*86*-linux/usr/bin/git"
-sdk_git_bin=`which $sdk_git_bin`
-
-if [ "$sdk_git_bin" = "" ]
-then
-    echo
-    echo "Couldn't find the git command within linux-devkit"
-    echo "Unable to automatically unshallow git repository"
-    echo "If you have git installed and a version higher than 1.8.0.3 ( git --version)"
-    echo "You can manually unshallow the Linux git repository by running the below"
-    echo "command within the SDK's Linux git repository"
-    echo "git fetch --unshallow"
-    echo
-    exit 1
-fi
-
-linux_dir=`find $install_dir/board-support -maxdepth 1 -name "linux*"`
-linux=`basename $linux_dir`
-
-if [ -f $linux_dir/.git/shallow ]
-then
-    echo
-    echo "The kernel git repository has been trimmed to reduce the size of the SDK installer"
-    echo "in a process called \"shallowing\". This process causes the repository to include"
-    echo "only a small fraction of the entire git history. To retrieve the entire git history"
-    echo "you must unshallow the repository. This will require internet access and if applicable"
-    echo "proper git proxy settings to access the original remote repository. This script will"
-    echo "automatically unshallow the Linux repository for you and retrieve its full history."
-    echo "Depending on your internet speed this process can take 5+ minutes."
-    echo "Would you like to continue (y/n)?"
-    echo
-
-    read -p "[ y ] " continueunshallow
-    echo
-
-    if [ ! -n "$continueunshallow" ]; then
-       continueunshallow="y"
-    fi
-
-    if [ "$continueunshallow" != "y" ]; then
-        echo "You selected no. Please run script the again when your ready to unshallow the"
-        echo "repository."
-        exit 0
-    fi
-
-    echo "The unshallowing process has begun. For the first couple of minutes you may not see"
-    echo "any additional output. This is normal."
-
-    cd $linux_dir
-
-    $sdk_git_bin fetch --unshallow
-
-    if [ "$?" = "0" ]
-    then
-        echo
-        echo "The unshallowing process has been completed. The Linux git repository has been"
-        echo "fully restored."
-    else
-        echo
-        echo "Error unshallowing git repository. Please check your internet connection and"
-        echo "your git proxy settings."
-    fi
-
-    echo
-
-    cd -
-else
-    echo
-    echo "Kernel git repository is not shallow."
-    echo "The repository has the full commit history and can be treated as a normal"
-    echo "git repository."
-    echo
-fi
diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
deleted file mode 100644
index c6ed07ab..00000000
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Contains script to unshallow git repositories"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://../unshallow-repositories.sh;beginline=3;endline=19;md5=234309914fd2cc17f3187bdb2d64553b"
-
-SRC_URI = "file://unshallow-repositories.sh"
-
-PR = "r1"
-
-do_install () {
-    install -d ${D}/
-    install -d ${D}/bin
-    install -m 0755 ${WORKDIR}/unshallow-repositories.sh ${D}/bin
-}
-
-FILES:${PN} = "/*"
-RDEPENDS:${PN} += "bash"
-- 
2.34.1


