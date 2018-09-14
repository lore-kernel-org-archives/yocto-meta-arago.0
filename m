Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1CEDC52993
	for <meta-arago@arago-project.org>;
	Fri, 14 Sep 2018 17:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D7B820BC0;
	Fri, 14 Sep 2018 17:45:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YwkmkdY5uzgQ; Fri, 14 Sep 2018 17:45:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DA8EC20063;
	Fri, 14 Sep 2018 17:45:40 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2B0211635CA;
	Fri, 14 Sep 2018 13:45:38 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 14 Sep 2018 13:45:37 -0400
Message-Id: <1536947137-4713-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] switch-config: add support for AM65x
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2018 17:45:51 -0000

Use aarch64 override for now to avoid making packages machine-specific.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb    | 1 +
 meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb     | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 289136b..b0a9a50 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -65,6 +65,7 @@ UTILS_append_omap-a15 = " mmc-utils \
 
 UTILS_append_k3 = " mmc-utils \
                     parted \
+                    switch-config \
                     pru-icss \
                     ti-ipc-rtos-fw \
 "
diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
index 2975c2f..6b61916 100644
--- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -3,10 +3,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://switch-config.c;beginline=1;endline=14;md5=659ff9658cbaba3110b81804af60de75"
 
 PV = "2.0"
-PR = "r3"
+PR = "r4"
 
 BRANCH ?= "v4.1"
+BRANCH_aarch64 ?= "am65x-v1.0"
+
 SRCREV = "7efabd92177199205808ebd993267b04e8c2fb6a"
+SRCREV_aarch64 = "3b31ce5fe8bd5a3560b89f2a709fb3e3b877326d"
 
 SRC_URI = "git://git.ti.com/switch-config/switch-config.git;protocol=git;branch=${BRANCH}"
 
-- 
2.7.4


