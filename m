Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 21EA75296D
	for <meta-arago@arago-project.org>;
	Sun, 14 Oct 2018 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 80F2420CEE;
	Sun, 14 Oct 2018 20:03:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id n_DKqaBn5vL8; Sun, 14 Oct 2018 20:03:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F6E120CBC;
	Sun, 14 Oct 2018 20:03:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1AE071646D9;
	Sun, 14 Oct 2018 16:03:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 14 Oct 2018 16:03:04 -0400
Message-Id: <1539547389-5881-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/6] weston: update bbappends 4.0.0 -> 5.0.0
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
X-List-Received-Date: Sun, 14 Oct 2018 20:03:22 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{weston-conf_4.0.0.bb => weston-conf_5.0.0.bb}                | 0
 .../wayland/{weston_4.0.0.bbappend => weston_5.0.0.bbappend}              | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston-conf_4.0.0.bb => weston-conf_5.0.0.bb} (100%)
 rename meta-arago-distro/recipes-graphics/wayland/{weston_4.0.0.bbappend => weston_5.0.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_4.0.0.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_5.0.0.bb
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-conf_4.0.0.bb
rename to meta-arago-distro/recipes-graphics/wayland/weston-conf_5.0.0.bb
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_4.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston_4.0.0.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
-- 
2.7.4


