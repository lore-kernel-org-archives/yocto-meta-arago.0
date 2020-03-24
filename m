Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D100052A15
	for <meta-arago@arago-project.org>;
	Tue, 24 Mar 2020 15:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 298AB40BAC;
	Tue, 24 Mar 2020 15:47:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id S_LdiLEwz8zE; Tue, 24 Mar 2020 15:47:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F36E740BEF;
	Tue, 24 Mar 2020 15:47:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B7E2F1718E9;
	Tue, 24 Mar 2020 11:47:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 24 Mar 2020 11:47:00 -0400
Message-Id: <1585064820-39907-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585064820-39907-1-git-send-email-denys@ti.com>
References: <1585064820-39907-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 4/4] opencv_3.1: do not depend on python for now
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
X-List-Received-Date: Tue, 24 Mar 2020 15:49:12 -0000

Python2 is deprecated

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
index c9670fc..4d66551 100644
--- a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-DEPENDS = "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp protobuf protobuf-native"
+DEPENDS = "libtool swig swig-native bzip2 zlib glib-2.0 libwebp protobuf protobuf-native"
 
 SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
-- 
2.7.4


