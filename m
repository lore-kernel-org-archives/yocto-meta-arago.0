Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6C2DC52A20
	for <meta-arago@arago-project.org>;
	Wed, 21 Dec 2016 02:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C44420A39;
	Wed, 21 Dec 2016 02:19:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pmbdCnEtz0Tz; Wed, 21 Dec 2016 02:19:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2C648207BD;
	Wed, 21 Dec 2016 02:19:21 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 9CBF91621D8;
	Tue, 20 Dec 2016 21:19:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 20 Dec 2016 21:19:19 -0500
Message-Id: <1482286759-31862-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] weston: rename bbappend to 1.11.1
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
X-List-Received-Date: Wed, 21 Dec 2016 02:19:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{weston-conf_1.11.0.bb => weston-conf_1.11.1.bb}              | 0
 .../wayland/{weston_1.11.0.bbappend => weston_1.11.1.bbappend}            | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston-conf_1.11.0.bb => weston-conf_1.11.1.bb} (100%)
 rename meta-arago-distro/recipes-graphics/wayland/{weston_1.11.0.bbappend => weston_1.11.1.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.0.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.1.bb
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.0.bb
rename to meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.1.bb
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.1.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston_1.11.1.bbappend
-- 
2.7.4


