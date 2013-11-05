Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id A057A52A4C
	for <meta-arago@arago-project.org>;
	Tue,  5 Nov 2013 00:36:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MVR000LILNJ9ZW2@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 04 Nov 2013 18:35:44 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 74F9E2004C; Mon,
	04 Nov 2013 19:35:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 04 Nov 2013 19:35:42 -0500
Message-id: <1383611742-5343-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: update bbappend for the final 3.12 version
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
X-List-Received-Date: Tue, 05 Nov 2013 00:36:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{linux-ti-staging_git.bbappend => linux-ti-staging_3.12.bbappend}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux/{linux-ti-staging_git.bbappend => linux-ti-staging_3.12.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend
rename to meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
-- 
1.8.3.2


