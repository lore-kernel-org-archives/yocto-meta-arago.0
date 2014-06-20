Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 5F588529C3
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 17:57:23 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H00JY8B7CY640@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 12:57:12 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 753AF24A78; Fri,
	20 Jun 2014 13:57:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:39 -0400
Message-id: <1403287009-11256-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 09/19] recipes: update bbappends to match newer versions in lower layers
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
X-List-Received-Date: Fri, 20 Jun 2014 17:57:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../openssh/{openssh_6.2p2.bbappend => openssh_6.5p1.bbappend}            | 0
 .../busybox/{busybox_1.21.1.bbappend => busybox_1.22.1.bbappend}          | 0
 .../recipes-core/dbus/{dbus_1.6.10.bbappend => dbus_1.6.18.bbappend}      | 0
 .../dropbear/{dropbear_2013.58.bbappend => dropbear_2014.63.bbappend}     | 0
 .../freetype/{freetype_2.4.12.bbappend => freetype_2.5.2.bbappend}        | 0
 .../libav/{libav_0.8.8.bbappend => libav_0.8.9.bbappend}                  | 0
 .../pulseaudio/{pulseaudio_4.0.bbappend => pulseaudio_5.0.bbappend}       | 0
 .../recipes-support/curl/{curl_7.32.0.bbappend => curl_7.35.0.bbappend}   | 0
 .../recipes-devtools/opkg/{opkg_svn.bbappend => opkg_0.2.1.bbappend}      | 0
 9 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/openssh/{openssh_6.2p2.bbappend => openssh_6.5p1.bbappend} (100%)
 rename meta-arago-distro/recipes-core/busybox/{busybox_1.21.1.bbappend => busybox_1.22.1.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dbus/{dbus_1.6.10.bbappend => dbus_1.6.18.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dropbear/{dropbear_2013.58.bbappend => dropbear_2014.63.bbappend} (100%)
 rename meta-arago-distro/recipes-graphics/freetype/{freetype_2.4.12.bbappend => freetype_2.5.2.bbappend} (100%)
 rename meta-arago-distro/recipes-multimedia/libav/{libav_0.8.8.bbappend => libav_0.8.9.bbappend} (100%)
 rename meta-arago-distro/recipes-multimedia/pulseaudio/{pulseaudio_4.0.bbappend => pulseaudio_5.0.bbappend} (100%)
 rename meta-arago-distro/recipes-support/curl/{curl_7.32.0.bbappend => curl_7.35.0.bbappend} (100%)
 rename meta-arago-extras/recipes-devtools/opkg/{opkg_svn.bbappend => opkg_0.2.1.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/openssh/openssh_6.2p2.bbappend b/meta-arago-distro/recipes-connectivity/openssh/openssh_6.5p1.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssh/openssh_6.2p2.bbappend
rename to meta-arago-distro/recipes-connectivity/openssh/openssh_6.5p1.bbappend
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-core/busybox/busybox_1.21.1.bbappend
rename to meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
diff --git a/meta-arago-distro/recipes-core/dbus/dbus_1.6.10.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_1.6.18.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-core/dbus/dbus_1.6.10.bbappend
rename to meta-arago-distro/recipes-core/dbus/dbus_1.6.18.bbappend
diff --git a/meta-arago-distro/recipes-core/dropbear/dropbear_2013.58.bbappend b/meta-arago-distro/recipes-core/dropbear/dropbear_2014.63.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-core/dropbear/dropbear_2013.58.bbappend
rename to meta-arago-distro/recipes-core/dropbear/dropbear_2014.63.bbappend
diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_2.4.12.bbappend b/meta-arago-distro/recipes-graphics/freetype/freetype_2.5.2.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/freetype/freetype_2.4.12.bbappend
rename to meta-arago-distro/recipes-graphics/freetype/freetype_2.5.2.bbappend
diff --git a/meta-arago-distro/recipes-multimedia/libav/libav_0.8.8.bbappend b/meta-arago-distro/recipes-multimedia/libav/libav_0.8.9.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-multimedia/libav/libav_0.8.8.bbappend
rename to meta-arago-distro/recipes-multimedia/libav/libav_0.8.9.bbappend
diff --git a/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_4.0.bbappend b/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_5.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_4.0.bbappend
rename to meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_5.0.bbappend
diff --git a/meta-arago-distro/recipes-support/curl/curl_7.32.0.bbappend b/meta-arago-distro/recipes-support/curl/curl_7.35.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-support/curl/curl_7.32.0.bbappend
rename to meta-arago-distro/recipes-support/curl/curl_7.35.0.bbappend
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg_svn.bbappend b/meta-arago-extras/recipes-devtools/opkg/opkg_0.2.1.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-devtools/opkg/opkg_svn.bbappend
rename to meta-arago-extras/recipes-devtools/opkg/opkg_0.2.1.bbappend
-- 
2.0.0


