Return-Path: <jake@udc0866934>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9F6D852B01
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 14:25:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBMEPash009001
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPaR3012541
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPawO005199;
	Thu, 22 Dec 2016 08:25:36 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cK4JL-00044P-Qg; Thu, 22 Dec 2016 09:25:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Dec 2016 09:25:28 -0500
Message-ID: <1482416729-15556-8-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
References: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 7/8] setup-package-install: Add screen and lrzsz packages
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
X-List-Received-Date: Thu, 22 Dec 2016 14:25:43 -0000
Content-Type: text/plain

* screen is used by these scripts to background processes which
  require a terminal connection (e.g. minicom).
* lrzsz provides an XMODEM implmentation which is used for UART boot.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-package-install.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-package-install.sh b/setup-package-install.sh
index ddddecd..1ef94f9 100644
--- a/setup-package-install.sh
+++ b/setup-package-install.sh
@@ -56,7 +56,7 @@ cwd=`dirname $0`
 
 entry_header
 
-packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix"
+packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz"
 
 get_host_type host
 
-- 
1.9.1


