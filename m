Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 8A8E752A7E
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 00:35:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM0041OUZ7EZ70@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 13 Oct 2013 19:35:32 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CF58221413; Sun,
	13 Oct 2013 20:35:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 13 Oct 2013 20:35:19 -0400
Message-id: <1381710923-22471-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381710923-22471-1-git-send-email-denis@denix.org>
References: <1381710923-22471-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/9] gst-ffmpeg: move to gstreamer directory to match upstream location
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
X-List-Received-Date: Mon, 14 Oct 2013 00:35:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{gst-ffmpeg => gstreamer}/gst-ffmpeg_0.10.13.bbappend                 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-multimedia/{gst-ffmpeg => gstreamer}/gst-ffmpeg_0.10.13.bbappend (100%)

diff --git a/meta-arago-distro/recipes-multimedia/gst-ffmpeg/gst-ffmpeg_0.10.13.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-multimedia/gst-ffmpeg/gst-ffmpeg_0.10.13.bbappend
rename to meta-arago-distro/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
-- 
1.8.3.2


