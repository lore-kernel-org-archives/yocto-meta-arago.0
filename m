Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 67C5F52A45
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6624C40C16;
	Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id aCOSWGxFPSFF; Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3FBDD40C07;
	Thu, 12 Sep 2019 15:38:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 335EC174202;
	Thu, 12 Sep 2019 11:38:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:21 -0400
Message-Id: <1568302717-46518-17-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 16/32] weston-conf: rename 5.0.0 -> 7.0.0 to match main weston version
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
X-List-Received-Date: Thu, 12 Sep 2019 15:40:06 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{weston-conf_5.0.0.bb => weston-conf_7.0.0.bb}                | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston-conf_5.0.0.bb => weston-conf_7.0.0.bb} (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_5.0.0.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_7.0.0.bb
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-conf_5.0.0.bb
rename to meta-arago-distro/recipes-graphics/wayland/weston-conf_7.0.0.bb
-- 
2.7.4


