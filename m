Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 078A752A48
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 01:51:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I00CUKIHO1561@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 20:51:24 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 035B9204E2; Wed,
	23 Apr 2014 21:51:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 21:51:16 -0400
Message-id: <1398304280-15426-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398304280-15426-1-git-send-email-denis@denix.org>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/8] wpa-gui-e: fix recipe permissions
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
X-List-Received-Date: Thu, 24 Apr 2014 01:51:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bbappend            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bbappend b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bbappend
old mode 100755
new mode 100644
-- 
1.9.2


