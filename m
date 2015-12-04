Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C790D52AC3
	for <meta-arago@arago-project.org>;
	Fri,  4 Dec 2015 15:01:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB4F1Eta008500
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:14 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1EPK001132
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:14 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Dec 2015 09:01:13 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1DQE012965;
	Fri, 4 Dec 2015 09:01:13 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1a4rrF-0001eD-IK; Fri, 04 Dec 2015 10:01:13 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 4 Dec 2015 10:01:06 -0500
Message-ID: <1449241270-6294-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
References: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 1/5] setup-minicom: Update list of auto-detected EVMs
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
X-List-Received-Date: Fri, 04 Dec 2015 15:01:15 -0000
Content-Type: text/plain

* Add K2H, K2E, and K2L EVMs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-minicom.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/setup-minicom.sh b/setup-minicom.sh
index aa18dd4..7ec0ec6 100644
--- a/setup-minicom.sh
+++ b/setup-minicom.sh
@@ -47,7 +47,8 @@ For boards that contain a USB-to-Serial converter on the board such as:
 	* BeagleBone
 	* Beaglebone Black
 	* AM335x EVM-SK
-        * AM57xx EVM
+	* AM57xx EVM
+	* K2H, K2L, and K2E EVMs
 
 the port used for minicom will be automatically detected. By default Ubuntu
 will not recognize this device. Setup will add a udev rule to
-- 
1.9.1


