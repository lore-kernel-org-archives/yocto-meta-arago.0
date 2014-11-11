Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id A7B2352A74
	for <meta-arago@arago-project.org>;
	Tue, 11 Nov 2014 01:09:08 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEU004OMOIK90C0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Nov 2014 19:08:45 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=GYGgRrTO c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=ZdNWHygJxSoZJbQyR8IA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9F0E220099;	Mon,
	10 Nov 2014 20:08:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 10 Nov 2014 20:08:42 -0500
Message-id: <1415668123-31862-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH 1/2] weston-init: move from extras to distro location
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
X-List-Received-Date: Tue, 11 Nov 2014 01:09:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend                         | 0
 .../recipes-graphics/wayland/weston-init/init                             | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arago-extras => meta-arago-distro}/recipes-graphics/wayland/weston-init.bbappend (100%)
 rename {meta-arago-extras => meta-arago-distro}/recipes-graphics/wayland/weston-init/init (100%)

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-graphics/wayland/weston-init.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
similarity index 100%
rename from meta-arago-extras/recipes-graphics/wayland/weston-init/init
rename to meta-arago-distro/recipes-graphics/wayland/weston-init/init
-- 
2.1.2


