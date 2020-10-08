Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4F0D0520E5
	for <meta-arago@arago-project.org>;
	Thu,  8 Oct 2020 23:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDF5340BD6;
	Thu,  8 Oct 2020 23:46:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IqGzmg-P3bWy; Thu,  8 Oct 2020 23:46:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D2C3140020;
	Thu,  8 Oct 2020 23:46:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 307A5174480;
	Thu,  8 Oct 2020 19:46:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  8 Oct 2020 19:46:14 -0400
Message-Id: <1602200774-36217-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] distroless/poky: also define TI_SECURE_DEV_PKG variables for HS devices
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
X-List-Received-Date: Thu, 08 Oct 2020 23:49:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/distroless-dunfell.txt | 5 +++--
 configs/farm/distroless-master.txt  | 5 +++--
 configs/farm/poky-dunfell.txt       | 5 +++--
 configs/farm/poky-master.txt        | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/configs/farm/distroless-dunfell.txt b/configs/farm/distroless-dunfell.txt
index f60c654..93ce26b 100644
--- a/configs/farm/distroless-dunfell.txt
+++ b/configs/farm/distroless-dunfell.txt
@@ -39,8 +39,9 @@ TOOLCHAIN_ROOT_CORTEX=""
 TOOLCHAIN_ROOT_AARCH64=""
 
 # SECDEV variables for CAT and AUTO
-#TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
-#TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
+TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
 
 # This variable holds the unique ID for the build that will be used to
 # identify the build.
diff --git a/configs/farm/distroless-master.txt b/configs/farm/distroless-master.txt
index be00bf7..ac3e80f 100644
--- a/configs/farm/distroless-master.txt
+++ b/configs/farm/distroless-master.txt
@@ -39,8 +39,9 @@ TOOLCHAIN_ROOT_CORTEX=""
 TOOLCHAIN_ROOT_AARCH64=""
 
 # SECDEV variables for CAT and AUTO
-#TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
-#TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
+TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
 
 # This variable holds the unique ID for the build that will be used to
 # identify the build.
diff --git a/configs/farm/poky-dunfell.txt b/configs/farm/poky-dunfell.txt
index f09f8d2..4ee2ff9 100644
--- a/configs/farm/poky-dunfell.txt
+++ b/configs/farm/poky-dunfell.txt
@@ -39,8 +39,9 @@ TOOLCHAIN_ROOT_CORTEX=""
 TOOLCHAIN_ROOT_AARCH64=""
 
 # SECDEV variables for CAT and AUTO
-#TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
-#TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
+TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
 
 # This variable holds the unique ID for the build that will be used to
 # identify the build.
diff --git a/configs/farm/poky-master.txt b/configs/farm/poky-master.txt
index 760d567..0db3bab 100644
--- a/configs/farm/poky-master.txt
+++ b/configs/farm/poky-master.txt
@@ -39,8 +39,9 @@ TOOLCHAIN_ROOT_CORTEX=""
 TOOLCHAIN_ROOT_AARCH64=""
 
 # SECDEV variables for CAT and AUTO
-#TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
-#TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
+TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
 
 # This variable holds the unique ID for the build that will be used to
 # identify the build.
-- 
2.7.4


