Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6D22C529DD
	for <meta-arago@arago-project.org>;
	Tue, 13 Jan 2015 21:26:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0DLQWu3004426
	for <meta-arago@arago-project.org>; Tue, 13 Jan 2015 15:26:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0DLQWif001451
	for <meta-arago@arago-project.org>; Tue, 13 Jan 2015 15:26:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 13 Jan 2015 15:26:32 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0DLQVoE016029;	Tue, 13 Jan 2015 15:26:31 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0DLQRbk027265;	Wed, 14 Jan 2015 02:56:30 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 13 Jan 2015 15:26:23 -0600
Message-ID: <1421184385-21751-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421184385-21751-1-git-send-email-fcooper@ti.com>
References: <1421184385-21751-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] arago.conf: Allow QT_PROVIDER to be overridden in branding files
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
X-List-Received-Date: Tue, 13 Jan 2015 21:26:33 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 12f29a5..387667b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -23,7 +23,7 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbh
 DISTRO_FEATURES += "pam"
 
 # Set preferred Qt version
-QT_PROVIDER = "qt5"
+QT_PROVIDER ?= "qt5"
 #QT5_VERSION = "5.4.0%"
 
 # Distro-specific package configuration
-- 
1.7.9.5


