Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 65B7E520DD
	for <meta-arago@arago-project.org>;
	Wed, 12 Aug 2020 22:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D38E640BFD;
	Wed, 12 Aug 2020 22:39:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eqTB9sd35_fN; Wed, 12 Aug 2020 22:39:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6F1D40BAD;
	Wed, 12 Aug 2020 22:39:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7076F172DF3;
	Wed, 12 Aug 2020 18:39:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 12 Aug 2020 18:39:09 -0400
Message-Id: <1597271951-32491-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/3] iproute: make 5.5+ bbappend version-agnostic
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
X-List-Received-Date: Wed, 12 Aug 2020 22:42:02 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../iproute2/{iproute2_5.5.0.bbappend => iproute2_%.bbappend}             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/iproute2/{iproute2_5.5.0.bbappend => iproute2_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbappend
rename to meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
-- 
2.7.4


