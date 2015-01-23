Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BB5FD52A72
	for <meta-arago@arago-project.org>;
	Fri, 23 Jan 2015 03:37:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0N3bpif022483
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:51 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0N3bnKk022003
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:50 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 21:37:49 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0N3bmoC021861;	Thu, 22 Jan 2015 21:37:49 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 22:37:40 -0500
Message-ID: <1421984265-11173-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
References: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/7] lighttpd: Add handling of .cgi & .out files in conf.matrix
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
X-List-Received-Date: Fri, 23 Jan 2015 03:37:52 -0000
Content-Type: text/plain

- Add into .cgi & .out into static-file.exclude-exception list
- Add cgi assignment for .cgi & .out

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../matrix-lighttpd-config/lighttpd.conf.matrix    |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
index 82a9fb8..062f9c1 100755
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
@@ -134,10 +134,11 @@ $HTTP["url"] =~ "\.pdf$" {
 }
 
 ##
-# which extensions should not be handle via static-file transfer
+# which extensions should not be handled via static-file transfer
 #
-# .php, .pl, .fcgi are most often handled by mod_fastcgi or mod_cgi
-static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
+# .php, .pl, .fcgi, are most often handled by mod_fastcgi or mod_cgi
+# Also exclude .cgi and .out files not be handled via static-file transfer
+static-file.exclude-extensions = ( ".php", ".pl", ".fcgi", ".cgi", ".out" )
 
 ######### Options that are good to be but not neccesary to be changed #######
 
@@ -225,7 +226,7 @@ compress.filetype          = ("text/plain", "text/html","text/javascript","text/
 #                            )
 
 #### CGI module
-cgi.assign                 = ( ".php"  => "/usr/bin/php-cgi")
+cgi.assign                 = ( ".php"  => "/usr/bin/php-cgi", ".cgi" =>	"/bin/sh", ".out" => "" )
 #cgi.assign                 = ( ".pl"  => "/usr/bin/perl",
 #                               ".cgi" => "/usr/bin/perl" )
 #
-- 
1.7.9.5


