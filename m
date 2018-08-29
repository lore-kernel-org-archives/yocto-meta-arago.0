Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1581452A51
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 00:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5B73220C65;
	Wed, 29 Aug 2018 00:14:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LlM88T0kNrgV; Wed, 29 Aug 2018 00:14:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4178420C68;
	Wed, 29 Aug 2018 00:14:05 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 908651635E3;
	Tue, 28 Aug 2018 20:14:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 28 Aug 2018 20:13:59 -0400
Message-Id: <1535501640-23640-6-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535501640-23640-1-git-send-email-denys@ti.com>
References: <1535501640-23640-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 6/7] gstreamer1.0-plugins-bad: update bbappend, whitelist faad2 as commerical
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
X-List-Received-Date: Wed, 29 Aug 2018 00:14:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                                | 2 +-
 ...ins-bad_1.14.1.bbappend => gstreamer1.0-plugins-bad_1.14.2.bbappend} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.14.1.bbappend => gstreamer1.0-plugins-bad_1.14.2.bbappend} (100%)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 773a1b6..51a57a3 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -179,7 +179,7 @@ ENTERPRISE_DISTRO = "1"
 # disable by default the codecs in libav that causes issues with shipping an
 # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
 # disable troublesome software.
-LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav"
+LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav commercial_faad2"
 
 # Do not package own copy of perl into devkit, rely on host one
 ASSUME_PROVIDED += "nativesdk-perl"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bbappend
-- 
2.7.4


