Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 68C1052093
	for <meta-arago@arago-project.org>;
	Mon, 11 Dec 2017 22:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDF862087C;
	Mon, 11 Dec 2017 22:03:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id D291Kr9dlhXs; Mon, 11 Dec 2017 22:03:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CE92C2086C;
	Mon, 11 Dec 2017 22:03:03 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 67753162752;
	Mon, 11 Dec 2017 17:03:03 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 11 Dec 2017 17:03:03 -0500
Message-Id: <1513029783-20763-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] classes/qt*.bbclass: move Qt-related helper classes from distro to extras
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
X-List-Received-Date: Mon, 11 Dec 2017 22:03:05 -0000

Several recipes in meta-arago-extras use qt-provider and other helper classes.
Since meta-arago-extras is meant to be used independently, it does not depend
on meta-arago-distro, but the other way around, hence move those classes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 {meta-arago-distro => meta-arago-extras}/classes/qt-provider.bbclass | 0
 {meta-arago-distro => meta-arago-extras}/classes/qt-vars.bbclass     | 0
 {meta-arago-distro => meta-arago-extras}/classes/qt5.bbclass         | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arago-distro => meta-arago-extras}/classes/qt-provider.bbclass (100%)
 rename {meta-arago-distro => meta-arago-extras}/classes/qt-vars.bbclass (100%)
 rename {meta-arago-distro => meta-arago-extras}/classes/qt5.bbclass (100%)

diff --git a/meta-arago-distro/classes/qt-provider.bbclass b/meta-arago-extras/classes/qt-provider.bbclass
similarity index 100%
rename from meta-arago-distro/classes/qt-provider.bbclass
rename to meta-arago-extras/classes/qt-provider.bbclass
diff --git a/meta-arago-distro/classes/qt-vars.bbclass b/meta-arago-extras/classes/qt-vars.bbclass
similarity index 100%
rename from meta-arago-distro/classes/qt-vars.bbclass
rename to meta-arago-extras/classes/qt-vars.bbclass
diff --git a/meta-arago-distro/classes/qt5.bbclass b/meta-arago-extras/classes/qt5.bbclass
similarity index 100%
rename from meta-arago-distro/classes/qt5.bbclass
rename to meta-arago-extras/classes/qt5.bbclass
-- 
2.7.4


