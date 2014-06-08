Return-Path: <ta@taydin.org>
Received: from mail.taydin.org (mail.taydin.org [94.23.38.220])
	by arago-project.org (Postfix) with ESMTP id 9C4A452A31
	for <meta-arago@arago-project.org>;
	Sun,  8 Jun 2014 20:44:46 +0000 (UTC)
Received: from [176.42.186.54] (unknown [176.42.186.54])
	by mail.taydin.org (Postfix) with ESMTPSA id A1D8A9F650
	for <meta-arago@arago-project.org>;
	Sun,  8 Jun 2014 22:44:30 +0200 (CEST)
Message-ID: <5394CB3C.5090408@taydin.org>
Date: Sun, 08 Jun 2014 23:44:44 +0300
From: Timur Aydin <ta@taydin.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: meta-arago@arago-project.org
Subject: [PATCH] mpd: Fix download URL
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
X-List-Received-Date: Sun, 08 Jun 2014 20:44:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
index 6f2a912..1bc609f 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
@@ -5,10 +5,10 @@ HOMEPAGE ="http://sourceforge.net/projects/musicpd"

 DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2
ffmpeg curl sqlite bzip2 pulseaudio"

-PR = "r4"
+PR = "r5"

 SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
+    http://www.musicpd.org/download/mpd/0.17/${PN}-${PV}.tar.bz2 \
     file://mpd.conf.in \
 "


