Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A03AD52A9B
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYese022515
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:40 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYeQ0002537
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:40 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJOO003617;	Thu, 30 Jan 2014 12:34:39 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:13 -0600
Message-ID: <1391106857-17112-8-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] arago.conf: Add libav to LICENSE_FLAGS_WHITELIST
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:41 -0000
Content-Type: text/plain

* The libav bbappend removes the commerial license SW so we
  can add it to the whitelist.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 76254f2..bf1c601 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -62,7 +62,7 @@ ENTERPRISE_DISTRO = "1"
 # disable by default the codecs in libav that causes issues with shipping an
 # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
 # disable troublesome software.
-LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg"
+LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg commercial_libav"
 
 # Some machines with the same architecture use different kernel versions.
 # Set PACKAGE_ARCH to allow packages to be seperated by both architecture and
-- 
1.7.9.5


