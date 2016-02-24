Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2EAE152A57
	for <meta-arago@arago-project.org>;
	Wed, 24 Feb 2016 20:12:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1OKC1Tt012572
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2016 14:12:01 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1OKC17c029829
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2016 14:12:01 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Feb 2016 14:12:00 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1OKC0g4025444;
	Wed, 24 Feb 2016 14:12:00 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aYfmy-0003Nh-6l; Wed, 24 Feb 2016 15:12:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Feb 2016 15:11:56 -0500
Message-ID: <1456344717-12958-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456344717-12958-1-git-send-email-j-stiffler@ti.com>
References: <1456344717-12958-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] mtd-utils: Extend to include the nativesdk class
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
X-List-Received-Date: Wed, 24 Feb 2016 20:12:02 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend

diff --git a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
new file mode 100644
index 0000000..9988fdc
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".arago0"
+
+BBCLASSEXTEND += "nativesdk"
-- 
1.9.1


