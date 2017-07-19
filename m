Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id D9A6352A60
	for <meta-arago@arago-project.org>;
	Wed, 19 Jul 2017 17:50:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6JHofZ7014266
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 12:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500486641;
	bh=k0MxQQUYc91ca//HIPa++bT+bwEV6nnw0IdDJ8iQoyY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eS9MbHaS2ATftcb/NM8m0ZmHG0sXn3Y0z4h7EMF3kXoWQpwQMyU21ySZ5i2pgMGpy
	3dHFZ+lPuDUlzkvOsLqVKSoTqFDp9/UqlESP5dVS3qfvp9AN709wptgkLwlzKe9av7
	jzQMfzmL/mYutU26YavlL8U3VoI07Ltl5WylZEQk=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6JHofVb027558
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 12:50:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Jul 2017 12:50:41 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6JHodvt032055;	Wed, 19 Jul 2017 12:50:41 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jul 2017 13:50:25 -0400
Message-ID: <1500486625-24181-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1500486625-24181-1-git-send-email-denys@ti.com>
References: <1500486625-24181-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH 2/2] arago-morty-next-rel: add config for "morty-next-rel" branch
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
X-List-Received-Date: Wed, 19 Jul 2017 17:50:42 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...-config.txt => arago-morty-next-rel-config.txt} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 copy configs/{arago-morty-next-config.txt => arago-morty-next-rel-config.txt} (87%)

diff --git a/configs/arago-morty-next-config.txt b/configs/arago-morty-next-rel-config.txt
similarity index 87%
copy from configs/arago-morty-next-config.txt
copy to configs/arago-morty-next-rel-config.txt
index 46485ba..26ee079 100644
--- a/configs/arago-morty-next-config.txt
+++ b/configs/arago-morty-next-rel-config.txt
@@ -2,12 +2,12 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty-next,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/meta-arago.git,morty-next-rel,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
 meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty-next,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,morty-next-rel,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
1.7.9.5


