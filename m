Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EFE2852A4C
	for <meta-arago@arago-project.org>;
	Tue,  9 May 2017 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1358620BE4;
	Tue,  9 May 2017 18:07:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vAqvQADwYrgn; Tue,  9 May 2017 18:07:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF240208FB;
	Tue,  9 May 2017 18:06:58 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 928171624B3;
	Tue,  9 May 2017 14:06:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  9 May 2017 14:06:51 -0400
Message-Id: <1494353215-51061-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494353215-51061-1-git-send-email-denis@denix.org>
References: <1494353215-51061-1-git-send-email-denis@denix.org>
Subject: [master/morty][PATCH 2/6] wayland-ivi-extension: depend on wayland-native for wayland-scanner
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
X-List-Received-Date: Tue, 09 May 2017 18:07:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
index 157e1ee..75e284f 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "weston virtual/libgles2 pixman"
+DEPENDS = "weston virtual/libgles2 pixman wayland-native"
 
 inherit cmake
 
-- 
2.7.4


