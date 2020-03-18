Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BCD7C5298B
	for <meta-arago@arago-project.org>;
	Wed, 18 Mar 2020 23:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AD17040C34;
	Wed, 18 Mar 2020 23:44:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4E2cmyzRVCak; Wed, 18 Mar 2020 23:44:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C67E40C0A;
	Wed, 18 Mar 2020 23:44:43 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 763821712A7;
	Wed, 18 Mar 2020 19:44:42 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 18 Mar 2020 19:44:42 -0400
Message-Id: <1584575082-6702-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584575082-6702-1-git-send-email-denys@ti.com>
References: <1584575082-6702-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/2] weston: update bbappends to 8.0.0
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
X-List-Received-Date: Wed, 18 Mar 2020 23:46:53 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{weston-conf_7.0.0.bb => weston-conf_8.0.0.bb}                | 0
 .../wayland/{weston_7.0.0.bbappend => weston_8.0.0.bbappend}              | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston-conf_7.0.0.bb => weston-conf_8.0.0.bb} (100%)
 rename meta-arago-distro/recipes-graphics/wayland/{weston_7.0.0.bbappend => weston_8.0.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_7.0.0.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_8.0.0.bb
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-conf_7.0.0.bb
rename to meta-arago-distro/recipes-graphics/wayland/weston-conf_8.0.0.bb
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_8.0.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston_8.0.0.bbappend
-- 
2.7.4


