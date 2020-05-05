Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 84431529AD
	for <meta-arago@arago-project.org>;
	Wed,  6 May 2020 00:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BFC8940C20;
	Tue,  5 May 2020 23:59:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AXQAbjsqp5r0; Tue,  5 May 2020 23:59:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A5AA340ADE;
	Tue,  5 May 2020 23:59:36 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DC9E716ECE4;
	Tue,  5 May 2020 19:59:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  5 May 2020 19:59:35 -0400
Message-Id: <1588723175-52373-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] arago-dunfell/master: adjust to new bundle/image names in meta-arago
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
X-List-Received-Date: Wed, 06 May 2020 00:02:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/arago-dunfell.txt | 4 ++--
 configs/farm/arago-master.txt  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/farm/arago-dunfell.txt b/configs/farm/arago-dunfell.txt
index 883e247..6e6e19f 100644
--- a/configs/farm/arago-dunfell.txt
+++ b/configs/farm/arago-dunfell.txt
@@ -95,7 +95,7 @@ FS_IMAGE_TYPE="tar.xz"
 # This variable contains the "filter" string to look for inside of the
 # OE build directory to find the SDK image.  Since the image name can
 # vary based on the recipe settings this string will account for that.
-SDK_FILTER="arago-core-tisdk-bundle-"
+SDK_FILTER="tisdk-core-bundle-"
 
 # This variable indicates the type of SDK images being generated.  By default
 # this is tar.gz images.  This should match what you set in your recipes
@@ -242,7 +242,7 @@ PRODUCTIZE_SDK="false"
 
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
-BITBAKE_COMMAND="-k arago-core-tisdk-bundle arago-tiny-image ti-world"
+BITBAKE_COMMAND="-k tisdk-core-bundle tisdk-tiny-image ti-world"
 
 # This variable controls whether the build configuration included at the bottom
 # of the results file includes comments or not. The default is "false" to filter
diff --git a/configs/farm/arago-master.txt b/configs/farm/arago-master.txt
index b4e75ce..e2f0f00 100644
--- a/configs/farm/arago-master.txt
+++ b/configs/farm/arago-master.txt
@@ -95,7 +95,7 @@ FS_IMAGE_TYPE="tar.xz"
 # This variable contains the "filter" string to look for inside of the
 # OE build directory to find the SDK image.  Since the image name can
 # vary based on the recipe settings this string will account for that.
-SDK_FILTER="arago-core-tisdk-bundle-"
+SDK_FILTER="tisdk-core-bundle-"
 
 # This variable indicates the type of SDK images being generated.  By default
 # this is tar.gz images.  This should match what you set in your recipes
@@ -242,7 +242,7 @@ PRODUCTIZE_SDK="false"
 
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
-BITBAKE_COMMAND="-k arago-core-tisdk-bundle"
+BITBAKE_COMMAND="-k tisdk-core-bundle tisdk-tiny-image"
 
 # This variable controls whether the build configuration included at the bottom
 # of the results file includes comments or not. The default is "false" to filter
-- 
2.7.4


