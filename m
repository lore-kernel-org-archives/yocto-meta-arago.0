Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 0941552AB0
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 00:35:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM00E82UZ6BE80@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 13 Oct 2013 19:35:33 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id ACA2020087; Sun,
	13 Oct 2013 20:35:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 13 Oct 2013 20:35:14 -0400
Message-id: <1381710923-22471-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/9] recipes: cruft removal and seasonal cleanup
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
X-List-Received-Date: Mon, 14 Oct 2013 00:35:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Remove no longer needed locally overlaid files and bbappend modifications when
corresponding changes were merged upstream.
Update the README files to the current dylan setup and dependencies.

Denys Dmytriyenko (9):
  ti-crypto-examples: remove empty no longer used bbappend
  chrpath.bbclass: remove local copy, as dylan now has all the fixes
  relocate_sdk.py: remove local copy, as dylan now has all the fixes
  init-ifupdown: move init and interfaces files from netbase to new
    init-ifupdown
  gst-ffmpeg: move to gstreamer directory to match upstream location
  gettext: remove local bbappend that got merged upstream
  libjpeg-turbo: update local bbappend with upstreamed fixes removed
  python-m2crypto: remove since upstream meta-oe has newer version
  README: update dependency information for dylan base

 meta-arago-distro/README                           |  17 +-
 meta-arago-distro/classes/chrpath.bbclass          |  97 ---
 .../netbase => init-ifupdown/init-ifupdown}/init   |   0
 .../init-ifupdown}/interfaces                      |   0
 .../init-ifupdown_1.0.bbappend}                    |   2 +-
 .../ti-crypto-examples_git.bbappend                |   1 -
 .../gst-ffmpeg_0.10.13.bbappend                    |   0
 meta-arago-extras/README                           |  17 +-
 .../recipes-core/gettext/gettext_0.16.1.bbappend   |   3 -
 .../recipes-core/jpeg/libjpeg-turbo_svn.bbappend   |  10 +-
 .../python/python-m2crypto/install.patch           |  24 -
 .../m2crypto-0.20.2-openssl-1.0.0.patch            | 713 ---------------------
 .../python/python-m2crypto_0.20.2.bb               |  27 -
 scripts/relocate_sdk.py                            | 219 -------
 14 files changed, 24 insertions(+), 1106 deletions(-)
 delete mode 100644 meta-arago-distro/classes/chrpath.bbclass
 rename meta-arago-distro/recipes-core/{netbase/netbase => init-ifupdown/init-ifupdown}/init (100%)
 rename meta-arago-distro/recipes-core/{netbase/netbase => init-ifupdown/init-ifupdown}/interfaces (100%)
 rename meta-arago-distro/recipes-core/{netbase/netbase_5.0.bbappend => init-ifupdown/init-ifupdown_1.0.bbappend} (79%)
 delete mode 100644 meta-arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbappend
 rename meta-arago-distro/recipes-multimedia/{gst-ffmpeg => gstreamer}/gst-ffmpeg_0.10.13.bbappend (100%)
 delete mode 100644 meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-m2crypto/install.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-m2crypto/m2crypto-0.20.2-openssl-1.0.0.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-m2crypto_0.20.2.bb
 delete mode 100755 scripts/relocate_sdk.py

-- 
1.8.3.2


