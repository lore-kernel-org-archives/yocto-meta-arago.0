Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7FB8052AA4
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2210640BE9;
	Sat,  3 Apr 2021 00:11:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id u8ryKQzCx8YG; Sat,  3 Apr 2021 00:11:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0290940C93;
	Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 179B917458C;
	Fri,  2 Apr 2021 20:11:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:35 -0400
Message-Id: <1617408644-2675-21-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 20/29] php: suppress installed-vs-shipped QA error
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
X-List-Received-Date: Sat, 03 Apr 2021 00:11:01 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

This used to be a warning and recently became an error.
Need to be cleaned up later.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-devtools/php/php_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-devtools/php/php_%.bbappend b/meta-arago-distro/recipes-devtools/php/php_%.bbappend
index ab402f7..79b95dc 100644
--- a/meta-arago-distro/recipes-devtools/php/php_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/php/php_%.bbappend
@@ -21,3 +21,5 @@ do_install_prepend_pn-php() {
     mkdir -p ${B}/sapi/fpm/
     touch ${B}/sapi/fpm/init.d.php-fpm
 }
+
+INSANE_SKIP_${PN} += "installed-vs-shipped"
-- 
2.7.4


