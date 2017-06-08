Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 563DD529B6
	for <meta-arago@arago-project.org>;
	Thu,  8 Jun 2017 17:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 792A0204E0;
	Thu,  8 Jun 2017 17:57:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xx0V7Qb7GRus; Thu,  8 Jun 2017 17:57:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4AA5320C04;
	Thu,  8 Jun 2017 17:57:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BDC231624EB;
	Thu,  8 Jun 2017 13:57:52 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  8 Jun 2017 13:57:41 -0400
Message-Id: <1496944662-54767-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496944662-54767-1-git-send-email-denys@ti.com>
References: <1496944662-54767-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 3/4] systemd/sync-clocks: load towards end of boot, so rtc is ready
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
X-List-Received-Date: Thu, 08 Jun 2017 17:57:55 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service b/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service
index 3d506a3..b11d05a 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service
+++ b/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service
@@ -3,14 +3,12 @@ Description=Synchronize System and HW clocks
 DefaultDependencies=no
 Wants=sysinit.target
 Conflicts=shutdown.target
-After=systemd-timesyncd.service
-Before=sysinit.target shutdown.target
+After=getty.target
 
 [Service]
 Type=oneshot
-RemainAfterExit=yes
 ExecStart=/sbin/hwclock --systohc
 StandardOutput=syslog
 
 [Install]
-WantedBy=sysinit.target
+WantedBy=multi-user.target
-- 
2.7.4


