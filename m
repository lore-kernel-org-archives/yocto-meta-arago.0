Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 59DBB52978
	for <meta-arago@arago-project.org>;
	Tue, 17 Jul 2018 13:13:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6HDDbot116975
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 08:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531833217;
	bh=Lm5CjvveSRaW8oL+crELBvMVPiWmqHreFQ0eWnfWafU=;
	h=From:To:CC:Subject:Date;
	b=N6ymujAqRekD3WHTejgwFgZhDy8Q3zz+Zs694vUq2IDK/xiC9tafXQyqkXV/sxqs4
	0iP0oxPQ3zzJbOQC1VXJ/kSRT7/9YCb5yABUYeaXSN3ygU+QXBS5F/8UdhP2dtJ8nc
	7Hy2gmCMDHv2jYUUOAQilqPG9WOurv6/AQxexgaE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HDDbt0007262
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 08:13:37 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 17 Jul 2018 08:13:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 17 Jul 2018 08:13:34 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HDDYaQ000903;
	Tue, 17 Jul 2018 08:13:34 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1ffPnJ-0000xJ-Jl; Tue, 17 Jul 2018 09:13:33 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Jul 2018 09:13:31 -0400
Message-ID: <1531833211-3641-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env-am335x: update atop autoboot prompt
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
X-List-Received-Date: Tue, 17 Jul 2018 13:13:44 -0000
Content-Type: text/plain

* The prompt to stop autoboot has changed to the default

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am335x.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index ba75b14..6950caf 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -174,11 +174,11 @@ check_for_beaglebone() {
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 
-do_expect "\"abort autoboot\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
-do_expect "\"abort autoboot\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
-- 
1.9.1


