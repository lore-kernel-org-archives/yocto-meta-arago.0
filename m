Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 31BB65299B
	for <meta-arago@arago-project.org>;
	Mon, 15 Oct 2018 01:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A6CD20CF0;
	Mon, 15 Oct 2018 01:44:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uvPvfo7130dD; Mon, 15 Oct 2018 01:44:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EC0E20CE5;
	Mon, 15 Oct 2018 01:44:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8CDE6164772;
	Sun, 14 Oct 2018 21:44:14 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 14 Oct 2018 21:44:11 -0400
Message-Id: <1539567851-28246-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539567851-28246-1-git-send-email-denys@ti.com>
References: <1539567851-28246-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/2] wpa-supplicant: inherit pkgconfig and depend on openssl10
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
X-List-Received-Date: Mon, 15 Oct 2018 01:44:26 -0000

1. build calls pkg-config, so need to inherit pkgconfig
2. upstream migrated to OpenSSL 1.1, so depend on openssl10 for now

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 8ca40ae..5fc3e58 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -7,7 +7,9 @@ BUGTRACKER = "http://hostap.epitest.fi/bugz/"
 SECTION = "network"
 LICENSE = "GPLv2 | BSD"
 
-DEPENDS = "gnutls dbus libnl openssl libgcrypt"
+inherit pkgconfig
+
+DEPENDS = "gnutls dbus libnl openssl10 libgcrypt"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 # To prevent users from accidently picking up this customized version of
-- 
2.7.4


