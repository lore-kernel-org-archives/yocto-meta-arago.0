Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 02EC452988
	for <meta-arago@arago-project.org>;
	Mon, 28 Oct 2019 15:27:54 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SFQZuJ081010
	for <meta-arago@arago-project.org>; Mon, 28 Oct 2019 10:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572276395;
	bh=U2vtBplkUo8tmSfoHITGVJ5N3KLS2SBGegnWl9F1eMs=;
	h=From:To:CC:Subject:Date;
	b=WJCC83w8VAvu9+zjYql1ysJEmA7D5b3MkxZ2GT3eiHda2RH5y7RxzdXHHAXaFgHJD
	zJULyJmm+c3azYP6a1fnXcSseDqDBV2GFsD3ANAijGmPZIgwh3FkEORr8RsuRc6/Cc
	LwrU69XT5IQYT8MFvhKD9/T0Hx1Se92HFFppHop8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SFQZnK069523
	for <meta-arago@arago-project.org>; Mon, 28 Oct 2019 10:26:35 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 28 Oct 2019 10:26:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 28 Oct 2019 10:26:23 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SFQYEI027512;
	Mon, 28 Oct 2019 10:26:34 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1iP6ug-0004CF-Bx; Mon, 28 Oct 2019 11:26:34 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 28 Oct 2019 11:26:30 -0400
Message-ID: <1572276390-16100-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH v2] openssl_perf: add sha2 algorithms
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
X-List-Received-Date: Mon, 28 Oct 2019 15:27:55 -0000
Content-Type: text/plain

* Measure performance for sha224, sha256, sha384, and sha512

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes
* Add "-elapsed" flag to new tests

 .../openssl_perf_scripts/openssl_perf.sh               | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh b/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh
index 5a2a2fd..c389567 100644
--- a/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh
+++ b/cryptos_apps_program/openssl_perf_scripts/openssl_perf.sh
@@ -20,7 +20,7 @@ fi
 
 echo "################################"
 echo "Running OpenSSL Speed tests.  "
-echo "There are 7 tests and each takes 15 seconds..."
+echo "There are 11 tests and each takes 15 seconds..."
 echo
 
 TEMP=/home/root/temp
@@ -49,6 +49,22 @@ echo "Running sha1 test.  Please Wait..."
 time -v $OPENSSL speed -evp sha1 -engine cryptodev -elapsed > $TEMP 2>&1
 egrep 'Doing|User|System|Percent|Elapsed' $TEMP
 
+echo "Running sha224 test.  Please Wait..."
+time -v $OPENSSL speed -evp sha224 -engine cryptodev -elapsed > $TEMP 2>&1
+egrep 'Doing|User|System|Percent|Elapsed' $TEMP
+
+echo "Running sha256 test.  Please Wait..."
+time -v $OPENSSL speed -evp sha256 -engine cryptodev -elapsed > $TEMP 2>&1
+egrep 'Doing|User|System|Percent|Elapsed' $TEMP
+
+echo "Running sha384 test.  Please Wait..."
+time -v $OPENSSL speed -evp sha384 -engine cryptodev -elapsed > $TEMP 2>&1
+egrep 'Doing|User|System|Percent|Elapsed' $TEMP
+
+echo "Running sha512 test.  Please Wait..."
+time -v $OPENSSL speed -evp sha512 -engine cryptodev -elapsed > $TEMP 2>&1
+egrep 'Doing|User|System|Percent|Elapsed' $TEMP
+
 echo "Running md5 test.  Please Wait..."
 time -v $OPENSSL speed -evp md5 -engine cryptodev -elapsed > $TEMP 2>&1
 egrep 'Doing|User|System|Percent|Elapsed' $TEMP
-- 
1.9.1


