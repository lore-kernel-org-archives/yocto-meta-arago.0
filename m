Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CF73A52961
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:05:47 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K25jRU023806
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:05:46 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25jEJ022900
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:35:45 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:35:45 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epF026167;
	Wed, 20 Mar 2013 07:35:44 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:23 -0500
Message-ID: <1363745138-10288-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/17] wl12xx-firmware: Update recipe name.
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
X-List-Received-Date: Wed, 20 Mar 2013 02:05:48 -0000
Content-Type: text/plain

* Update recipe to have a distinct name.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../Makefile                                       |    0
 ...irmware_git.bb => wl12xx-firmware_r5.sp4.01.bb} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/recipes-bsp/wl12xx-firmware/{wl12xx-firmware => wl12xx-firmware-r5.sp4.01}/Makefile (100%)
 rename meta-arago-extras/recipes-bsp/wl12xx-firmware/{wl12xx-firmware_git.bb => wl12xx-firmware_r5.sp4.01.bb} (100%)

diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware/Makefile b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/Makefile
similarity index 100%
rename from meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware/Makefile
rename to meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/Makefile
diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
similarity index 100%
rename from meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
rename to meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
-- 
1.7.0.4


