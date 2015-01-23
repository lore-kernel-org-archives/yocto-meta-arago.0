Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7763452A72
	for <meta-arago@arago-project.org>;
	Fri, 23 Jan 2015 03:37:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0N3bq85025910
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:52 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0N3bpuZ022026
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:51 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 21:37:51 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0N3bmoD021861;	Thu, 22 Jan 2015 21:37:51 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 22:37:41 -0500
Message-ID: <1421984265-11173-3-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
References: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/7] lighttpd: Updated lighttpd.conf to accept larger file uploads
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
X-List-Received-Date: Fri, 23 Jan 2015 03:37:53 -0000
Content-Type: text/plain

- Added server parameter to accept larger file uploads

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../matrix-lighttpd-config/lighttpd.conf.matrix    |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
index 062f9c1..8525956 100755
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
@@ -343,3 +343,8 @@ etag.use-inode = "enable"
 etag.use-mtime = "enable"
 etag.use-size = "enable"
 static-file.etags = "enable"
+
+### Server parameters
+server.upload-dirs = ( "/dev/shm" )
+server.max-request-size = 1000000
+server.network-backend = "writev"
-- 
1.7.9.5


