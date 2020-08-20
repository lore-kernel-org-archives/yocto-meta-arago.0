Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 309CA52978
	for <meta-arago@arago-project.org>;
	Thu, 20 Aug 2020 03:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B8BF40B2D;
	Thu, 20 Aug 2020 03:48:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sxOBOvhQJpTR; Thu, 20 Aug 2020 03:48:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 862C740C28;
	Thu, 20 Aug 2020 03:48:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4A4D6174463;
	Wed, 19 Aug 2020 23:48:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Aug 2020 23:48:43 -0400
Message-Id: <1597895323-29279-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597895323-29279-1-git-send-email-denis@denix.org>
References: <1597895323-29279-1-git-send-email-denis@denix.org>
Subject: [dunfell/master][PATCH 2/2] branding-bleeding: setup nightly CI builds
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
X-List-Received-Date: Thu, 20 Aug 2020 03:51:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 28c6247..9a62d2d 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -14,5 +14,16 @@ SRCREV_pn-optee-os = "${AUTOREV}"
 #SRCREV_pn-optee-test = "${AUTOREV}"
 SRCREV_pn-arm-trusted-firmware = "${AUTOREV}"
 
+#TI_RTOS_METADATA_URI = "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
+#TI_RTOS_METADATA_PROTOCOL = "git"
+TI_RTOS_METADATA_SRCREV = "${AUTOREV}"
+TI_RTOS_METADATA_BRANCH = "next"
+
+DATEH := "${@time.strftime('%Y%m%d%H',time.gmtime())}"
+
+CORESDK_RTOS_WEBLINK_NIGHTLY ?= "file://empty"
+CORESDK_RTOS_WEBLINK = "${CORESDK_RTOS_WEBLINK_NIGHTLY}"
+CORESDK_RTOS_FILE_SUFFIX = ";downloadfilename=${DATEH}-${DEFAULT_FIRMWARE_FILE}"
+
 # Build and assemble TI-SDK, but don't package it
 IMAGE_FSTYPES_pn-tisdk-core-bundle = ""
-- 
2.7.4


