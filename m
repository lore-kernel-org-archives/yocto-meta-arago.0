Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 71EFB52A93
	for <meta-arago@arago-project.org>;
	Fri, 10 Nov 2017 20:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D4EB20A40;
	Fri, 10 Nov 2017 20:28:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bGQe7hO1IfNe; Fri, 10 Nov 2017 20:28:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D473204B1;
	Fri, 10 Nov 2017 20:28:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B3FB4162717;
	Fri, 10 Nov 2017 15:28:56 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 10 Nov 2017 15:28:56 -0500
Message-Id: <1510345736-10936-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] syslog-ng: make bbappend version agnostic
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
X-List-Received-Date: Fri, 10 Nov 2017 20:28:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../syslog-ng/{syslog-ng_3.6.4.bbappend => syslog-ng_%.bbappend}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-support/syslog-ng/{syslog-ng_3.6.4.bbappend => syslog-ng_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_3.6.4.bbappend b/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-support/syslog-ng/syslog-ng_3.6.4.bbappend
rename to meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
-- 
2.7.4


