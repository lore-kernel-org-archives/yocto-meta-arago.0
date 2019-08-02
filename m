Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id F223452A05
	for <meta-arago@arago-project.org>;
	Fri,  2 Aug 2019 21:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B23C140BDE;
	Fri,  2 Aug 2019 21:56:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mIRDwD2Tu-Qf; Fri,  2 Aug 2019 21:56:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C25C40B7B;
	Fri,  2 Aug 2019 21:55:59 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4319B171ED0;
	Fri,  2 Aug 2019 17:55:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Aug 2019 17:55:59 -0400
Message-Id: <1564782959-14398-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] arago-thud: rename arago-core-tisdk-image -> arago-core-tisdk-bundle
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
X-List-Received-Date: Fri, 02 Aug 2019 21:56:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/arago-thud.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/farm/arago-thud.txt b/configs/farm/arago-thud.txt
index 7e904e3..5696cf6 100644
--- a/configs/farm/arago-thud.txt
+++ b/configs/farm/arago-thud.txt
@@ -98,7 +98,7 @@ FS_IMAGE_TYPE="tar.xz"
 # This variable contains the "filter" string to look for inside of the
 # OE build directory to find the SDK image.  Since the image name can
 # vary based on the recipe settings this string will account for that.
-SDK_FILTER="arago-core-tisdk-image-"
+SDK_FILTER="arago-core-tisdk-bundle-"
 
 # This variable indicates the type of SDK images being generated.  By default
 # this is tar.gz images.  This should match what you set in your recipes
@@ -245,7 +245,7 @@ PRODUCTIZE_SDK="false"
 
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
-BITBAKE_COMMAND="-k arago-core-tisdk-image"
+BITBAKE_COMMAND="-k arago-core-tisdk-bundle"
 
 # This variable controls whether the build configuration included at the bottom
 # of the results file includes comments or not. The default is "false" to filter
-- 
2.7.4


