Return-Path: <jake@udc0866934>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id BD2B352B13
	for <meta-arago@arago-project.org>;
	Mon, 31 Jul 2017 16:01:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VG1AU4017350
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 11:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501516870;
	bh=fUsORk6z3WlWeJrEtuBJuovr9qzzA04VTjnCxIe2AEQ=;
	h=From:To:CC:Subject:Date;
	b=J1oD2LsFKBVX5bVWMTUazmJEfygebaddCkponmG5pebLCafxpI5PgTjq20VrnId3y
	zqQk0wzw9kL6EDs151OOa8lekqJepCv8hn5F/m1uuEUgzNiUq9emzC9YAxBzZwv831
	GXYmnQxbONAoYwvPMutq1NKHAaEcHRlBOe1GowwA=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VG1Aoh010016
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 11:01:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 11:01:05 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VG15qd003587;
	Mon, 31 Jul 2017 11:01:05 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1dcD7w-0006iW-Jl; Mon, 31 Jul 2017 12:01:04 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 31 Jul 2017 12:01:02 -0400
Message-ID: <1501516862-25787-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH] local-processor-sdk-64.cond.sample: weakly set ARAGO_BRAND
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
X-List-Received-Date: Mon, 31 Jul 2017 16:01:11 -0000
Content-Type: text/plain

* This will allow the ARAGO_BRAND to be overriden by the environment.
* This will still override the value weakly assigned in the distro
  config as the local.conf is parsed before the distro config.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 sample-files/local-processor-sdk-64.conf.sample | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sample-files/local-processor-sdk-64.conf.sample b/sample-files/local-processor-sdk-64.conf.sample
index 726b1ba..75e59f1 100644
--- a/sample-files/local-processor-sdk-64.conf.sample
+++ b/sample-files/local-processor-sdk-64.conf.sample
@@ -147,8 +147,8 @@ PARALLEL_MAKE = "-j 1"
 
 DISTRO   = "arago"
 
-# Set branding policy for AM-SDK
-ARAGO_BRAND = "processor-sdk"
+# Set branding policy for Processor SDK
+ARAGO_BRAND ?= "processor-sdk"
 
 # Set terminal types by default it expects gnome-terminal
 # but we chose xterm
-- 
1.9.1


