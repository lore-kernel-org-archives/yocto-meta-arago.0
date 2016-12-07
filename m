Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2558D5298D
	for <meta-arago@arago-project.org>;
	Wed,  7 Dec 2016 20:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3E15220A48;
	Wed,  7 Dec 2016 20:09:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ReDi6u1B_tX0; Wed,  7 Dec 2016 20:09:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1DA232017D;
	Wed,  7 Dec 2016 20:09:10 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 6FD391621C8;
	Wed,  7 Dec 2016 15:09:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  7 Dec 2016 15:09:09 -0500
Message-Id: <1481141349-24399-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] configs/farm: update SECDEV path to match AUTO/CAT separation
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
X-List-Received-Date: Wed, 07 Dec 2016 20:09:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/arago-krogoth.txt | 4 ++--
 configs/farm/arago-master.txt  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/farm/arago-krogoth.txt b/configs/farm/arago-krogoth.txt
index 68443e3..c9ffc8a 100644
--- a/configs/farm/arago-krogoth.txt
+++ b/configs/farm/arago-krogoth.txt
@@ -37,8 +37,8 @@ TOOLCHAIN_ROOT_ARM9=""
 TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2016.02/bin/"
 
 # SECDEV variables for CAT and AUTO
-TI_SECURE_DEV_PKG_CAT="/opt/secdev-am"
-TI_SECURE_DEV_PKG_AUTO="/opt/secdev-dra7"
+TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
+TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
 
 # This variable holds the unique ID for the build that will be used to
 # identify the build.
diff --git a/configs/farm/arago-master.txt b/configs/farm/arago-master.txt
index 4d40cf3..b077139 100644
--- a/configs/farm/arago-master.txt
+++ b/configs/farm/arago-master.txt
@@ -37,8 +37,8 @@ TOOLCHAIN_ROOT_ARM9=""
 TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2016.02/bin/"
 
 # SECDEV variables for CAT and AUTO
-TI_SECURE_DEV_PKG_CAT="/opt/secdev-am"
-TI_SECURE_DEV_PKG_AUTO="/opt/secdev-dra7"
+TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
+TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
 
 # This variable holds the unique ID for the build that will be used to
 # identify the build.
-- 
2.7.4


