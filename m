Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3A28F529E1
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2012 21:39:27 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB5LdPIA027661
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:39:25 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB5LdP2Y028764
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:39:25 -0600
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 5 Dec 2012 15:39:25 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qB5LdPh0015841	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:39:25 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qB5LdPw10543	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:39:25 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id 3FFDB110604A	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 16:39:25 -0500 (EST)
Message-ID: <50BFBF0D.1020702@ti.com>
Date: Wed, 5 Dec 2012 16:39:25 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
Subject: [PATCH] AUTOREV Recipe for linux-am335x-next
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
X-List-Received-Date: Wed, 05 Dec 2012 21:39:27 -0000
X-Groupsio-MsgNum: 648
Content-Type: multipart/mixed; boundary="------------040101040704090407060300"

--------------040101040704090407060300
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

AUTOREV recipe for github.com/hvaibhav/am335x-linux.git
am335x-linux-next-master branch

Please consider for meta-arago. Thanks,
Carlos

--------------040101040704090407060300
Content-Type: text/x-patch;
	name="0006-AUTOREV-Recipe-for-linux-am335x-next.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0006-AUTOREV-Recipe-for-linux-am335x-next.patch"

From 7175d2dcf279704c834287fc8f1bfee49edc60b8 Mon Sep 17 00:00:00 2001
From: Carlos Hernandez <ceh@ti.com>
Date: Tue, 4 Dec 2012 17:39:51 -0500
Subject: [PATCH 06/12] AUTOREV Recipe for linux-am335x-next

This is also based on Vaibhav H github repo but it tracks
am335x-linux-next-master branch

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-kernel/linux/linux-am335x-next_git.bb  |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-next_git.bb

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-next_git.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x-next_git.bb
new file mode 100644
index 0000000..def9fe3
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-next_git.bb
@@ -0,0 +1,3 @@
+require linux-am335x-upstream-staging_git.bb
+
+BRANCH = "am335x-linux-next-master"
-- 
1.7.0.4


--------------040101040704090407060300--
