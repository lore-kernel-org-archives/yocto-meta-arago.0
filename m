Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BBCF7529D0
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2018 19:52:55 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wARJqjNA106777
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 13:52:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543348365;
	bh=oIYU2kPu7AkN/WLt/zi2BJzeXcq5shIykf5g/9QF/B4=;
	h=From:To:CC:Subject:Date;
	b=WwPKg4TDnDa0HmDK8mnGuS8HbaXGTXdZEDSWfcNEWunbrLGsLa6JSLcQ2IASZyBGA
	sHUfeoGI7i8mmlnwbqi4LptQn9cJlpgI/egNpHoupsy0v9iS+v3IkhEn+imW5GASto
	UjhiaPX0lL2BK0owTUonrlDc2k5XbdfyXgLoXk3k=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wARJqj8m089067
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 13:52:45 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 27 Nov 2018 13:52:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 27 Nov 2018 13:52:44 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wARJqiQB008744;
	Tue, 27 Nov 2018 13:52:44 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1gRjPY-0002Dp-7t; Tue, 27 Nov 2018 14:52:44 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Nov 2018 14:52:43 -0500
Message-ID: <1543348363-8509-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env-am65x: enable reboot for clean env
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
X-List-Received-Date: Tue, 27 Nov 2018 19:52:56 -0000
Content-Type: text/plain

* Now that SW reset is functional, resetting the board for a clean
  environment can be enabled.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am65x.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
index beb7713..6335ce4 100644
--- a/setup-uboot-env-am65x.sh
+++ b/setup-uboot-env-am65x.sh
@@ -137,11 +137,11 @@ echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
-# SW reboot not currently supported
-#do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
-#do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-#do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
-#do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+# Reboot with clean environment
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
 # Configurable settings
 do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-- 
1.9.1


