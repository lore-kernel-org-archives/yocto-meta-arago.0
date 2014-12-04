Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 6AFFF52994
	for <meta-arago@arago-project.org>;
	Thu,  4 Dec 2014 23:29:17 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NG200785ZW1OF30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 04 Dec 2014 17:28:50 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MJ3XQ3dg c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=kcsDxNRCKZGIifk8SU4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EC908200DD;	Thu,
	4 Dec 2014 18:28:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 04 Dec 2014 18:28:48 -0500
Message-id: <1417735728-28253-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] openssl: update bbappend from 1.0.1g to 1.0.1j to match the change in oe-core
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
X-List-Received-Date: Thu, 04 Dec 2014 23:29:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../openssl/{openssl_1.0.1g.bbappend => openssl_1.0.1j.bbappend}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl_1.0.1g.bbappend => openssl_1.0.1j.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1g.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1j.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1g.bbappend
rename to meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1j.bbappend
-- 
2.1.2


