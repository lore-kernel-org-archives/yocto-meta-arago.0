Return-Path: <hzhang@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id EF2545298C
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2013 18:29:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3OITJdt004821
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 13:29:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3OITJRj003747
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 13:29:19 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 24 Apr 2013 13:29:19 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r3OITJZv032522;	Wed, 24 Apr 2013 13:29:19 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1UV4RS-0005Oi-Ru; Wed, 24 Apr 2013
	14:29:18 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Apr 2013 14:29:14 -0400
Message-ID: <1366828154-17755-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-lighttpd-config: add static cgi and .out support in Matrix PHP
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
X-List-Received-Date: Wed, 24 Apr 2013 18:29:21 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

---
 .../matrix-lighttpd-config/lighttpd.conf.matrix    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
index 82a9fb8..2dce736 100755
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
@@ -137,7 +137,7 @@ $HTTP["url"] =~ "\.pdf$" {
 # which extensions should not be handle via static-file transfer
 #
 # .php, .pl, .fcgi are most often handled by mod_fastcgi or mod_cgi
-static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
+static-file.exclude-extensions = ( ".php", ".pl", ".fcgi", ".cgi", ".o" )
 
 ######### Options that are good to be but not neccesary to be changed #######
 
@@ -225,7 +225,7 @@ compress.filetype          = ("text/plain", "text/html","text/javascript","text/
 #                            )
 
 #### CGI module
-cgi.assign                 = ( ".php"  => "/usr/bin/php-cgi")
+cgi.assign                 = ( ".php"  => "/usr/bin/php-cgi", ".cgi" =>	"/bin/sh", ".o" => "" )
 #cgi.assign                 = ( ".pl"  => "/usr/bin/perl",
 #                               ".cgi" => "/usr/bin/perl" )
 #
-- 
1.7.9.5


